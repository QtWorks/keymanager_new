// Qt
#include <QDebug>

// Application
#include "keymanager.h"
#include "keyparser.h"
#include "widgetfactory.h"
#include "scriptmanager.h"
#include "openscadwrapper.h"
#include "helper.h"
#include "key.h"

// Instance
KeyManager *KeyManager::sInstance = nullptr;

//-------------------------------------------------------------------------------------------------

KeyManager::KeyManager(QObject *pParent) : QObject(pParent)
{
    // Setup main window
    m_pMainWindow = new MainWindow(this);

    // Build key parser
    m_pKeyParser = new KeyParser(this);

    // Build widget factory
    m_pWidgetFactory = new WidgetFactory(this);

    // Script manager
    m_pScriptManager = new ScriptManager(this);

    // OpenSCAD wrapper
    m_pOpenSCADWrapper = new OpenSCADWrapper(this, Helper::openSCADPath());
}

//-------------------------------------------------------------------------------------------------

KeyManager::~KeyManager()
{

}

//-------------------------------------------------------------------------------------------------

KeyManager *KeyManager::instance()
{
    if (sInstance == nullptr)
        sInstance = new KeyManager;
    return sInstance;
}

//-------------------------------------------------------------------------------------------------

bool KeyManager::startup(const QString &args)
{
    // Start key parser
    connect(m_pKeyParser, &KeyParser::keyParsingDone, m_pMainWindow, &MainWindow::onKeyParsingDone);
    if (!m_pKeyParser->startup(args))
        return false;

    // Start widget factory
    if (!m_pWidgetFactory->startup())
        return false;

    // Start script manager
    if (!m_pScriptManager->startup())
        return false;

    // Start openSCAD wrapper
    if (!m_pOpenSCADWrapper->startup())
        return false;
    connect(m_pOpenSCADWrapper, &OpenSCADWrapper::STLFileReady, m_pMainWindow, &MainWindow::onSTLFileReady);
    /*
    connect(m_pOpenSCADWrapper, &OpenSCADWrapper::STLFileError, this, &Controller::STLFileError, Qt::UniqueConnection);
    connect(m_pOpenSCADWrapper, &OpenSCADWrapper::openSCADProcessComplete, this, &Controller::openSCADProcessComplete, Qt::UniqueConnection);
    connect(m_pOpenSCADWrapper, &OpenSCADWrapper::openSCADStandardErrorReady, this, &Controller::openSCADStandardErrorReady, Qt::UniqueConnection);
    connect(m_pOpenSCADWrapper, &OpenSCADWrapper::openSCADStandardOutputReady, this, &Controller::openSCADStandardOutputReady, Qt::UniqueConnection);
    */

    // Show main window
    m_pMainWindow->showMaximized();

    return true;
}

//-------------------------------------------------------------------------------------------------

void KeyManager::shutdown()
{
    // Shutdown key parser
    m_pKeyParser->shutdown();

    // Shutdown widget factory
    m_pWidgetFactory->shutdown();

    // Shutdown script manager
    m_pScriptManager->shutdown();

    // Shutdown openSCAD wrapper
    m_pOpenSCADWrapper->shutdown();
}

//-------------------------------------------------------------------------------------------------

const KeyParser &KeyManager::keyParser() const
{
    return *m_pKeyParser;
}

//-------------------------------------------------------------------------------------------------

KeyParser &KeyManager::keyParser()
{
    return *m_pKeyParser;
}

//-------------------------------------------------------------------------------------------------

const WidgetFactory &KeyManager::widgetFactory() const
{
    return *m_pWidgetFactory;
}

//-------------------------------------------------------------------------------------------------

WidgetFactory &KeyManager::widgetFactory()
{
    return *m_pWidgetFactory;
}

//-------------------------------------------------------------------------------------------------

const ScriptManager &KeyManager::scriptManager() const
{
    return *m_pScriptManager;
}

//-------------------------------------------------------------------------------------------------

ScriptManager &KeyManager::scriptManager()
{
    return *m_pScriptManager;
}

//-------------------------------------------------------------------------------------------------

const OpenSCADWrapper &KeyManager::openSCADWrapper() const
{
    return *m_pOpenSCADWrapper;
}

//-------------------------------------------------------------------------------------------------

OpenSCADWrapper &KeyManager::openSCADWrapper()
{
    return *m_pOpenSCADWrapper;
}
