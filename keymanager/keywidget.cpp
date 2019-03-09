// Qt
#include <QFileDialog>

// Application
#include "keymanager.h"
#include "keywidget.h"
#include "ui_keywidget.h"
#include "key.h"
#include "constants.h"
#include "scriptmanager.h"
#include <src/stlwindow.h>

//-------------------------------------------------------------------------------------------------

KeyWidget::KeyWidget(KeyManager *pKeyManager, Key *pKey, QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::KeyWidget), m_pKeyManager(pKeyManager), m_pKey(pKey), m_pSTLWindow(new STLWindow)
{
    m_pUI->setupUi(this);
    m_pUI->tabWidget->addTab(m_pSTLWindow, tr("STL Viewer"));
    m_pUI->layoutMgr->setKeyManager(pKeyManager);
    connect(m_pUI->openAllButton, &QPushButton::clicked, m_pUI->layoutMgr, &LayoutMgr::onOpenAll);
    connect(m_pUI->closeAllButton, &QPushButton::clicked, m_pUI->layoutMgr, &LayoutMgr::onCloseAll);
    connect(m_pUI->clearAllButton, &QPushButton::clicked, m_pUI->layoutMgr, &LayoutMgr::onClearAll);
    connect(m_pUI->saveKeyParametersButton, &QPushButton::clicked, this, &KeyWidget::onGenerateSTL);
}

//-------------------------------------------------------------------------------------------------

KeyWidget::~KeyWidget()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void KeyWidget::buildMenu()
{
    m_pUI->layoutMgr->buildMenu(m_pKey);
}

//-------------------------------------------------------------------------------------------------

void KeyWidget::onGenerateSTL()
{
    m_pKeyManager->scriptManager().generateScriptForKey(m_pKey);
}
