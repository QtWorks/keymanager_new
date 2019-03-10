// Qt
#include <QDebug>

// Application
#include "keymanager.h"
#include "layoutmgr.h"
#include "ui_layoutmgr.h"
#include "parameterblock.h"
#include "collapsiblestack.h"
#include "collapsibleblock.h"
#include "./editors/filepickerwidget.h"
#include "constants.h"
#include "blockmodel.h"
#include "selectionmgr.h"

//-------------------------------------------------------------------------------------------------

LayoutMgr::LayoutMgr(QWidget *pParent) : QWidget(pParent), m_pUI(new Ui::LayoutMgr)
{
    m_pUI->setupUi(this);

    // Build selection mgr
    m_pSelectionMgr = new SelectionMgr(this);

    // Build block model
    m_pBlockModel = new BlockModel(this);
    m_pUI->treeView->setHeaderHidden(true);
    m_pUI->treeView->setModel(m_pBlockModel);
    connect(m_pBlockModel, &BlockModel::highlightItem, this, &LayoutMgr::onHighlightItem, Qt::UniqueConnection);

    // Listen to block status changed from selection mgr
    connect(m_pSelectionMgr, &SelectionMgr::blockSelectionStatusChanged, m_pBlockModel, &BlockModel::onBlockSelectionStatusChanged, Qt::UniqueConnection);
    connect(m_pSelectionMgr, &SelectionMgr::blockSelectionStatusChanged, this, &LayoutMgr::onBlockSelectionStatusChanged, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

LayoutMgr::~LayoutMgr()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::buildMenu(Block *pBlock)
{
    if (pBlock != nullptr)
    {
        // Process blocks
        m_pRootCollapsibleBlock = new CollapsibleBlock(m_pKeyManager, this, pBlock, this);
        m_pRootCollapsibleBlock->setVisible(false);

        // Retrieve childs
        QVector<CollapsibleBlock *> vRootChildBlocks = m_pRootCollapsibleBlock->childBlocks();
        setSize(vRootChildBlocks.size());
        foreach (CollapsibleBlock *pChildBlock, vRootChildBlocks)
        {
            // Add child block to stack
            if (pChildBlock != nullptr)
                addBlockToStack(pChildBlock);
        }
        connectBlocksToSelectionMgr(m_pRootCollapsibleBlock);
        evaluateEnabledCondition(m_pRootCollapsibleBlock);
        m_pBlockModel->setRootBlock(m_pRootCollapsibleBlock);
        m_pUI->treeView->collapseAll();

        // Store blocks
        m_lBlocks = findChildren<CollapsibleBlock *>();
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::setKeyManager(KeyManager *pKeyManager)
{
    m_pKeyManager = pKeyManager;
    m_pSelectionMgr->setKeyManager(pKeyManager);
    m_pUI->keyPreviewWidget->setKeyManager(pKeyManager);
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::setNumberOfStacks(int nStacks)
{
    m_nStacks = nStacks;
}

//-------------------------------------------------------------------------------------------------

QList<CollapsibleBlock *> LayoutMgr::blocks() const
{
    return m_lBlocks;
}

//-------------------------------------------------------------------------------------------------

bool LayoutMgr::allBlocksOpened() const
{
    return m_bAllBlocksOpened;
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::addBlockToStack(CollapsibleBlock *pBlock)
{
    if (pBlock != nullptr)
    {
        CollapsibleStack *pTargetStack = nullptr;
        int iStackIndex = m_nBlocks/m_nBlockPerStack;
        if (iStackIndex > (m_nStacks-1))
            iStackIndex = m_nStacks-1;
        if (iStackIndex < m_vStacks.size())
            pTargetStack = m_vStacks[iStackIndex];
        else
        {
            pTargetStack = new CollapsibleStack(this);
            m_vStacks << pTargetStack;
            m_pUI->horizontalLayout->addWidget(pTargetStack);
            m_pUI->horizontalLayout->setAlignment(pTargetStack, Qt::AlignTop);
        }
        if (pTargetStack != nullptr)
        {
            pTargetStack->addBlock(pBlock);
            m_nBlocks++;
        }
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::connectBlocksToSelectionMgr(CollapsibleBlock *pBlock)
{
    if (pBlock != nullptr)
    {
        connect(pBlock, &CollapsibleBlock::selectMe, m_pSelectionMgr, &SelectionMgr::onSelectBlock, Qt::UniqueConnection);
        connect(pBlock, &CollapsibleBlock::blockSelectionStatusChanged, m_pSelectionMgr, &SelectionMgr::blockSelectionStatusChanged);
        connect(pBlock, &CollapsibleBlock::closedStateChanged, this, &LayoutMgr::onClosedStateChanged, Qt::UniqueConnection);
        foreach (CollapsibleBlock *pChildBlock, pBlock->childBlocks())
            connectBlocksToSelectionMgr(pChildBlock);
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::evaluateEnabledCondition(CollapsibleBlock *pBlock)
{
    if (pBlock != nullptr)
    {
        if (pBlock->parameterBlock() != nullptr)
            pBlock->parameterBlock()->onEvaluateEnabledCondition();
        foreach (CollapsibleBlock *pChildBlock, pBlock->childBlocks())
            evaluateEnabledCondition(pChildBlock);
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::setSize(int iSize)
{
    if (iSize > 0)
    {
        m_iSize = iSize;
        m_nCols = (m_iSize < m_nStacks) ? 1 : m_nStacks;
        m_nBlockPerStack = qRound((double)m_iSize/(double)m_nCols);
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::onShowHideTree()
{
    if (m_pUI->treeView->isVisible())
    {
        m_pUI->treeView->hide();
        m_pUI->keyPreviewWidget->hide();
    }
    else
    {
        m_pUI->treeView->show();
        m_pUI->keyPreviewWidget->show();
    }
    emit treeVisibilityChanged(m_pUI->treeView->isVisible());
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::onOpenAll()
{
    if (m_bAllBlocksOpened)
    {
        foreach (CollapsibleStack *pStack, m_vStacks)
            pStack->closeAll();
        m_pUI->treeView->collapseAll();
        m_bAllBlocksOpened = false;
    }
    else
    {
        foreach (CollapsibleStack *pStack, m_vStacks)
            pStack->openAll();
        m_pUI->treeView->expandAll();
        m_bAllBlocksOpened = true;
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::onClearAll()
{
    m_pRootCollapsibleBlock->onClearAll();
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::onHighlightItem(const QModelIndex &index, CollapsibleBlock *pBlock)
{
    if (index.isValid() && (pBlock != nullptr))
    {
        m_pBlockModel->updateIndex(index);
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::onBlockSelectionStatusChanged(CollapsibleBlock *pBlock)
{
    if (pBlock != nullptr)
        pBlock->setBlockVariable();
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::onClosedStateChanged(bool bClosed)
{
    CollapsibleBlock *pSender = dynamic_cast<CollapsibleBlock *>(sender());
    if (pSender != nullptr)
    {
        QModelIndex blockIndex = m_pBlockModel->getBlockIndex(pSender->uid());
        if (blockIndex.isValid())
        {
            if (bClosed)
                m_pUI->treeView->collapse(blockIndex);
            else
                m_pUI->treeView->expand(blockIndex);
        }
    }
}

//-------------------------------------------------------------------------------------------------

void LayoutMgr::onKeyPreviewImageReady(const QString &sKeyPreviewImage)
{
    QImage image(sKeyPreviewImage);
    if (!image.isNull())
        m_pUI->keyPreviewWidget->load(sKeyPreviewImage);
}
