#ifndef OPENSCADWRAPPER_H
#define OPENSCADWRAPPER_H

// Qt
#include <QObject>
#include <QProcess>

// Application
#include "iservice.h"
class KeyManager;
class Key;

class OpenSCADWrapper : public QObject, public IService
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    OpenSCADWrapper(KeyManager *pKeyManager, const QString &sOpenSCADPath);

    //! Destructor
    ~OpenSCADWrapper();

    //-------------------------------------------------------------------------------------------------
    // IService interface
    //-------------------------------------------------------------------------------------------------

    //! Startup
    virtual bool startup(const QString &sArgs="");

    //! Shutdown
    virtual void shutdown();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Generate STL
    bool generateSTL(Key *pKey, const QString &sInputSCADFileName, const QString &sOutputSTLFileName);

    //! Stop STL generation
    void stopSTLGeneration();

private:
    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Current key
    Key *m_pCurrentKey=nullptr;

    //! OpenSCAD path
    QString m_sOpenSCADPath="";

    //! Own process
    QProcess *m_pProcess=nullptr;

    //! Next output STL file
    QString m_sOutputSTLFilePath="";

    //! OpenSCAD exit code
    int m_iOpenSCADExitCode=0;

    //! OpenSCAD exit status
    int m_eExitStatus=QProcess::NormalExit;

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
    void STLFileReady(Key *pKey, const QString &sPath);

    //! STL file error
    void STLFileError(Key *pKey, const QString &sPath);

    //! OpenSCAD process complete
    void openSCADProcessComplete(Key *pKey, const QString &sMsg);

    //! OpenSCAD standard output ready
    void openSCADStandardOutputReady(Key *pKey, const QString &sMsg);

    //! OpenSCAD standard error ready
    void openSCADStandardErrorReady(Key *pKey, const QString &sMsg);
};

#endif // OPENSCADWRAPPER_H
