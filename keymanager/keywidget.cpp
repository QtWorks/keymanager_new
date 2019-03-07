// Qt
#include <QFileDialog>

// Application
#include "keymanager.h"
#include "keywidget.h"
#include "ui_keywidget.h"
#include "key.h"
#include "constants.h"
#include "scriptmanager.h"

//-------------------------------------------------------------------------------------------------

KeyWidget::KeyWidget(KeyManager *pKeyManager, Key *pKey, QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::KeyWidget), m_pKeyManager(pKeyManager), m_pKey(pKey)
{
    m_pUI->setupUi(this);
    m_pUI->layoutMgr->setKeyManager(pKeyManager);
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
