// Qt
#include <QDebug>

// Application
#include "keymanager.h"
#include "keyparser.h"
#include "widgetfactory.h"
#include "scriptmanager.h"

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

    // Shutdown
    m_pScriptManager->shutdown();
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
