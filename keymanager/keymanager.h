#ifndef KEYMANAGER_H
#define KEYMANAGER_H

// Qt
#include <QObject>

// Application
#include "iservice.h"
#include "mainwindow.h"
class KeyParser;
class WidgetFactory;
class CollapsibleBlock;
class ScriptManager;
class OpenSCADWrapper;

class KeyManager : public QObject, public IService
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    KeyManager(QObject *pParent=nullptr);

    //! Destructor
    ~KeyManager();

    //! Return an instance of KeyManager
    static KeyManager *instance();

    //-------------------------------------------------------------------------------------------------
    // IService interface
    //-------------------------------------------------------------------------------------------------

    //! IService interface
    virtual bool startup(const QString &args="");

    //! Shutdown
    virtual void shutdown();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Return key parser
    const KeyParser &keyParser() const;

    //! Return key parser
    KeyParser &keyParser();

    //! Return widget factory
    const WidgetFactory &widgetFactory() const;

    //! Return widget factory
    WidgetFactory &widgetFactory();

    //! Return script manager
    const ScriptManager &scriptManager() const;

    //! Return script manager
    ScriptManager &scriptManager();

    //! Return openSCAD wrapper
    const OpenSCADWrapper &openSCADWrapper() const;

    //! Return openSCAD wrapper
    OpenSCADWrapper &openSCADWrapper();

private:
    //! KeyManager instance
    static KeyManager *sInstance;

    //! Key parser
    KeyParser *m_pKeyParser=nullptr;

    //! Widget factory
    WidgetFactory *m_pWidgetFactory=nullptr;

    //! Script manager
    ScriptManager *m_pScriptManager=nullptr;

    //! OpenSCAD wrapper
    OpenSCADWrapper *m_pOpenSCADWrapper=nullptr;

    //! Main window
    MainWindow *m_pMainWindow=nullptr;

signals:
    //! Block selection status changed
    void blockSelectionStatusChanged(CollapsibleBlock *pBlock);
};

#endif // KEYMANAGER_H
