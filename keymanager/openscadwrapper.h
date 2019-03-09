#ifndef OPENSCADWRAPPER_H
#define OPENSCADWRAPPER_H

// Qt
#include <QObject>
#include <QProcess>

class OpenSCADWrapper : public QObject
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    OpenSCADWrapper(const QString &sOpenSCADPath, QObject *parent=nullptr);

    //! Destructor
    ~OpenSCADWrapper();

    //! Generate STL
    bool generateSTL(const QString &sInputSCAD);

    //! Stop STL generation
    void stopSTLGeneration();

    //! Return next output STL file
    const QString &nextOutputSTLFile() const;

private:
    //! OpenSCAD path
    QString m_sOpenSCADPath;

    //! Own process
    QProcess *m_pProcess;

    //! Next output STL file
    QString m_sNextOutputSTLFile;

    //! OpenSCAD exit code
    int m_iOpenSCADExitCode = 0;

    //! OpenSCAD exit status
    int m_eExitStatus = QProcess::NormalExit;

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! OpenSCAD process completed
    void onOpenSCADProcessComplete(int iExitCode, QProcess::ExitStatus exitStatus);

    //! OpenSCAD standard output ready
    void onOpenSCADreadyReadStandardOutput();

    //! OpenSCAD standard error ready
    void onOpenSCADreadyReadStandardError();

    //! Write timer done
    void onWriteTimerDone();

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! STL file ready
    void STLFileReady(const QString &sPath);

    //! STL file error
    void STLFileError(const QString &sPath);

    //! OpenSCAD process complete
    void openSCADProcessComplete(const QString &sMsg);

    //! OpenSCAD standard output ready
    void openSCADStandardOutputReady(const QString &sMsg);

    //! OpenSCAD standard error ready
    void openSCADStandardErrorReady(const QString &sMsg);
};

#endif // OPENSCADWRAPPER_H
