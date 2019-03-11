// Qt
#include <QFileDialog>

// Application
#include "keymanager.h"
#include "keywidget.h"
#include "ui_keywidget.h"
#include "key.h"
#include "constants.h"
#include "scriptmanager.h"
#include "openscadwrapper.h"
#include <src/stlwindow.h>
#include "helper.h"
#define PARAMETER_TAB
#define STL_TAB

//-------------------------------------------------------------------------------------------------

KeyWidget::KeyWidget(KeyManager *pKeyManager, Key *pKey, QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::KeyWidget), m_pKeyManager(pKeyManager), m_pKey(pKey)
{
    m_pUI->setupUi(this);

    // Add STL player
    if (pKey->getAttributeValue(PROPERTY_STL_PLAYER) == VALUE_YES)
    {
        m_pSTLWindow = new STLWindow;
        m_pUI->tabWidget->addTab(m_pSTLWindow, tr("STL Viewer"));
    }

    m_pUI->layoutMgr->setKeyManager(pKeyManager);
    connect(m_pUI->openAllButton, &QPushButton::clicked, m_pUI->layoutMgr, [=] {
        m_pUI->layoutMgr->onOpenAll();
        m_pUI->openAllButton->setText(m_pUI->layoutMgr->allBlocksOpened() ? tr("Close All") : tr("Open All"));
    });

    connect(m_pUI->clearAllButton, &QPushButton::clicked, m_pUI->layoutMgr, &LayoutMgr::onClearAll);
    connect(m_pUI->generateOutputSCADButton, &QPushButton::clicked, this, &KeyWidget::onGenerateOutputSCAD);
    connect(m_pUI->generateSTLButton, &QPushButton::clicked, this, &KeyWidget::onGenerateSTL);
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

void KeyWidget::loadSTL(const QString &sSTLFilePath)
{
    if (m_pSTLWindow != nullptr)
    {
        m_pUI->tabWidget->setCurrentWidget(m_pSTLWindow);
        m_pSTLWindow->load_stl(sSTLFilePath);
    }
}

//-------------------------------------------------------------------------------------------------

void KeyWidget::onGenerateOutputSCAD()
{
    m_pKeyManager->scriptManager().generateOutputSCADForKey(m_pKey);
}

//-------------------------------------------------------------------------------------------------

void KeyWidget::onGenerateSTL()
{
    if (m_pKey != nullptr)
    {
        QString sOutputSCADFileName = m_pKey->getOutputSCADFileName();
        QFileInfo fi(sOutputSCADFileName );
        if (fi.exists())
        {
            // Notify
            m_pKeyManager->openSCADWrapper().generateSTL(m_pKey, sOutputSCADFileName ,  m_pKey->getOutputSTLFileName());
        }
        else
        {
            QString sError = QString("KeyWidget::onGenerateSTL COULD NOT GENERATE STL FOR KEY %1 SINCE %2 DOES NOT EXIST").arg(m_pKey->getAttributeValue(PROPERTY_NAME).arg(sOutputSCADFileName ));
            Helper::error(sError);
        }
    }
}
