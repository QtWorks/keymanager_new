#ifndef SCRIPTMANAGER_H
#define SCRIPTMANAGER_H

// Qt
#include <QObject>

// Application
#include "iservice.h"
class KeyManager;
class Key;

class ScriptManager : public QObject, public IService
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit ScriptManager(KeyManager *pParent=nullptr);

    //! Destructor
    ~ScriptManager();

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

    //! Generate script
    bool generateOutputSCADForKey(Key *pTargetKey);

private:
    //! Replace variables in script for key
    void replaceVariablesInScriptForKey(Key *pTargetKey, QString &sScriptText, bool bErase=false);

private:
    //! Key manager
    KeyManager *m_pKeyManager=nullptr;
};

#endif // SCRIPTMANAGER_H
