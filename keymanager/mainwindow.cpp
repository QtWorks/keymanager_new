// Qt
#include <QDebug>

// Application
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "keymanager.h"
#include "keywidget.h"
#include "helper.h"
#include "keyparser.h"
#include "constants.h"
#include "parameter.h"
#include "key.h"

//-------------------------------------------------------------------------------------------------

MainWindow::MainWindow(KeyManager *pKeyManager, QWidget *pParent) : QMainWindow(pParent),
    m_pUI(new Ui::MainWindow), m_pKeyManager(pKeyManager)
{
    // Load CSS
    loadCSS();

    // Setup UI
    m_pUI->setupUi(this);
}

//-------------------------------------------------------------------------------------------------

MainWindow::~MainWindow()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void MainWindow::onKeyParsingDone()
{
    const QVector<Key *> &vKeys = m_pKeyManager->keyParser().getKeys();
    QString sMsg = QString("MainWindow::onParsingDone CREATED %1 KEYS").arg(vKeys.size());
    Helper::info(sMsg);
    foreach (Key *pKey, vKeys)
    {
        QString sMsg = QString("MainWindow::onParsingDone CREATED KEY %1").arg(pKey->getAttributeValue(PROPERTY_NAME));
        Helper::info(sMsg);
        if (pKey != nullptr)
            addKeyTab(pKey);
    }
}

//-------------------------------------------------------------------------------------------------

void MainWindow::onSTLFileReady(Key *pKey, const QString &sSTLFilePath)
{
    if (pKey != nullptr)
    {
        // Retrieve KeyWidget
        KeyWidget *pKeyWidget = m_hKeyWidgets[pKey];
        if (pKeyWidget != nullptr)
            pKeyWidget->loadSTL(sSTLFilePath);
    }
}

//-------------------------------------------------------------------------------------------------

void MainWindow::addKeyTab(Key *pKey)
{
    if (pKey != nullptr)
    {
        // Show info
        QString sMsg = QString("MainWindow::onNewKeyAvailable BUILDING TAB FOR KEY: %1").arg(pKey->getAttributeValue(PROPERTY_NAME));
        Helper::info(sMsg);

        // Add tab
        int iChildKeyCount = pKey->getChildKeys().size();

        // Create a new key widget
        if (iChildKeyCount == 0)
        {
            KeyWidget *pKeyWidget = new KeyWidget(m_pKeyManager, pKey);
            m_hKeyWidgets[pKey] = pKeyWidget;
            m_pUI->tabWidget->addTab(pKeyWidget, pKey->getAttributeValue(PROPERTY_NAME));
            pKeyWidget->buildMenu();
        }
        else
        {
            // Build a new tab widget for hosting childs
            QTabWidget *pChildTabWidget = new QTabWidget;
            pChildTabWidget->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
            m_pUI->tabWidget->addTab(pChildTabWidget, pKey->getAttributeValue(PROPERTY_NAME));
            foreach (Key *pChildKey, pKey->getChildKeys())
            {
                if (pChildKey != nullptr)
                {
                    KeyWidget *pChildKeyWidget = new KeyWidget(m_pKeyManager, pChildKey);
                    m_hKeyWidgets[pChildKey] = pChildKeyWidget;
                    pChildTabWidget->addTab(pChildKeyWidget, pChildKey->getAttributeValue(PROPERTY_NAME));
                    pChildKeyWidget->buildMenu();
                }
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------

void MainWindow::loadCSS()
{
    QString sStyle("");
    if (Helper::loadFile(":/css/main.css", sStyle))
        this->setStyleSheet(sStyle);
}
