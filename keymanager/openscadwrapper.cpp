// Qt
#include <QFileInfo>
#include <QProcess>
#include <QDateTime>
#include <QTimer>
#include <QDebug>

// Application
#include "openscadwrapper.h"
#include "helper.h"
#include "constants.h"

//-------------------------------------------------------------------------------------------------

OpenSCADWrapper::OpenSCADWrapper(const QString &sOpenSCADPath, QObject *pParent) : QObject(pParent),
    m_sOpenSCADPath(sOpenSCADPath), m_pProcess(new QProcess(this))
{
    connect(m_pProcess, SIGNAL(finished(int, QProcess::ExitStatus)), this, SLOT(onOpenSCADProcessComplete(int, QProcess::ExitStatus)), Qt::UniqueConnection);
    connect(m_pProcess, &QProcess::readyReadStandardOutput, this, &OpenSCADWrapper::onOpenSCADreadyReadStandardOutput, Qt::UniqueConnection);
    connect(m_pProcess, &QProcess::readyReadStandardError, this, &OpenSCADWrapper::onOpenSCADreadyReadStandardError, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

OpenSCADWrapper::~OpenSCADWrapper()
{

}

//-------------------------------------------------------------------------------------------------

bool OpenSCADWrapper::generateSTL(const QString &sInputSCAD)
{
    m_sNextOutputSTLFile.clear();
    QFileInfo fi(sInputSCAD);
    if (fi.exists())
    {
        // Compute output filename
        QDateTime currentDateTime = QDateTime::currentDateTime();
        QString sOutputFileName = QString("output_stl_%1_%2_%3_%4_%5_%6.stl").arg(currentDateTime.date().day()).
            arg(currentDateTime.date().month()).arg(currentDateTime.date().year()).
                arg(currentDateTime.time().hour()).arg(currentDateTime.time().minute()).arg(currentDateTime.time().second());

        // Compute out STL file name
        m_sNextOutputSTLFile = Helper::outputDir().absoluteFilePath(sOutputFileName);
        QString sProgram = QString("\"%1\" -o \"%2\" \"%3\"").arg(m_sOpenSCADPath).arg(m_sNextOutputSTLFile).arg(sInputSCAD);
        Helper::info(sProgram);

        // Setup process
        QStringList lArgs;
        m_pProcess->start(sProgram, lArgs);
        return true;
    }

    QString sMsg = QString("%1 DOES NOT EXIST").arg(sInputSCAD);
    Helper::error(sMsg);
    return false;
}

//-------------------------------------------------------------------------------------------------

void OpenSCADWrapper::stopSTLGeneration()
{
    if ((m_pProcess->state() == QProcess::Starting) || (m_pProcess->state() == QProcess::Running))
    {
        m_pProcess->kill();
    }
}

//-------------------------------------------------------------------------------------------------

const QString &OpenSCADWrapper::nextOutputSTLFile() const
{
    return m_sNextOutputSTLFile;
}

//-------------------------------------------------------------------------------------------------

void OpenSCADWrapper::onOpenSCADProcessComplete(int iExitCode, QProcess::ExitStatus exitStatus)
{
    m_iOpenSCADExitCode = iExitCode;
    m_eExitStatus = exitStatus;
    QTimer::singleShot(3000, this, SLOT(onWriteTimerDone()));
}

//-------------------------------------------------------------------------------------------------

void OpenSCADWrapper::onWriteTimerDone()
{
    QString sMsg = QString("STLCompiler PROCESS TERMINATED WITH CODE: %1 AND EXIT STATUS: %2").arg(m_iOpenSCADExitCode).arg(m_eExitStatus);
    emit openSCADProcessComplete(sMsg);

    // Process completed, check if file exists
    QFileInfo fi(m_sNextOutputSTLFile);
    if (fi.exists())
    {
        QString sMsg("STL FILE SUCCESSFULLY GENERATED");
        Helper::info(sMsg);
        Helper::replaceInFile(m_sNextOutputSTLFile, TARGET_STRING, OUTPUT_STRING);
        emit STLFileReady(m_sNextOutputSTLFile);
    }
    else
    {
        QString sMsg = QString("COULD NOT GENERATE STL FILE");
        emit STLFileError(sMsg);
    }
}

//-------------------------------------------------------------------------------------------------

void OpenSCADWrapper::onOpenSCADreadyReadStandardOutput()
{
    QProcess *pSender = dynamic_cast<QProcess *>(sender());
    if (pSender != nullptr)
    {
        QByteArray bBuffer = pSender->readAllStandardOutput();
        QString sMsg = QString("STLCompiler OUTPUT: %1").arg(QString(bBuffer));
        emit openSCADStandardOutputReady(sMsg);
    }
}

//-------------------------------------------------------------------------------------------------

void OpenSCADWrapper::onOpenSCADreadyReadStandardError()
{
    QProcess *pSender = dynamic_cast<QProcess *>(sender());
    if (pSender != nullptr)
    {
        QByteArray bBuffer = pSender->readAllStandardError();
        QString sMsg = QString("STLCompiler ERROR: %1").arg(QString(bBuffer));
        emit openSCADStandardErrorReady(sMsg);
    }
}
