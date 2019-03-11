// Qt
#include <QFileInfo>
#include <QProcess>
#include <QDateTime>
#include <QTimer>
#include <QDebug>

// Application
#include "keymanager.h"
#include "openscadwrapper.h"
#include "helper.h"
#include "constants.h"

//-------------------------------------------------------------------------------------------------

OpenSCADWrapper::OpenSCADWrapper(KeyManager *pKeyManager, const QString &sOpenSCADPath) : QObject(pKeyManager),
    m_pKeyManager(pKeyManager), m_sOpenSCADPath(sOpenSCADPath), m_pProcess(new QProcess(this))
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

bool OpenSCADWrapper::startup(const QString &sArgs)
{
    return true;
}

//-------------------------------------------------------------------------------------------------

void OpenSCADWrapper::shutdown()
{

}

//-------------------------------------------------------------------------------------------------

bool OpenSCADWrapper::generateSTL(Key *pKey, const QString &sInputSCADFileName, const QString &sOutputSTLFileName)
{
    if (pKey != nullptr)
    {
        // Set current key
        m_pCurrentKey = pKey;

        // Set current key
        m_sOutputSTLFilePath.clear();
        QFileInfo fi(sInputSCADFileName);
        if (fi.exists())
        {
            // Retrieve input dir
            QDir inputSCADFileDir = fi.dir();

            // Compute output filename
            m_sOutputSTLFilePath = inputSCADFileDir.absoluteFilePath(sOutputSTLFileName);

            // Compute out STL file name
            QString sProgram = QString("\"%1\" -o \"%2\" \"%3\"").arg(m_sOpenSCADPath).arg(m_sOutputSTLFilePath).arg(inputSCADFileDir.absoluteFilePath(sInputSCADFileName));
            qDebug() << sProgram;
            Helper::info(sProgram);

            // Setup process
            QStringList lArgs;
            m_pProcess->start(sProgram, lArgs);
            return true;
        }
        else
        {
            QString sMsg = QString("OpenSCADWrapper::generateSTL %1 DOES NOT EXIST").arg(sInputSCADFileName);
            Helper::error(sMsg);
            return false;
        }
    }

    return false;
}

//-------------------------------------------------------------------------------------------------

void OpenSCADWrapper::stopSTLGeneration()
{
    if ((m_pProcess->state() == QProcess::Starting) || (m_pProcess->state() == QProcess::Running))
        m_pProcess->kill();
}

//-------------------------------------------------------------------------------------------------

const QString &OpenSCADWrapper::nextOutputSTLFile() const
{
    return m_sOutputSTLFilePath;
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
    emit openSCADProcessComplete(m_pCurrentKey, sMsg);

    // Process completed, check if file exists
    QFileInfo fi(m_sOutputSTLFilePath);
    if (fi.exists())
    {
        QString sMsg("STL FILE SUCCESSFULLY GENERATED");
        Helper::info(sMsg);
        Helper::replaceInFile(m_sOutputSTLFilePath, TARGET_STRING, OUTPUT_STRING);
        emit STLFileReady(m_pCurrentKey, m_sOutputSTLFilePath);
    }
    else
    {
        QString sMsg = QString("COULD NOT GENERATE STL FILE");
        emit STLFileError(m_pCurrentKey, sMsg);
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
        emit openSCADStandardOutputReady(m_pCurrentKey, sMsg);
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
        emit openSCADStandardErrorReady(m_pCurrentKey, sMsg);
    }
}
