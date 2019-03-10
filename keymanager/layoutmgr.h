#ifndef LAYOUTMGR_H
#define LAYOUTMGR_H

// Qt
#include <QWidget>

// Application
#include "cxmlnode.h"
namespace Ui {
class LayoutMgr;
}
class KeyManager;
class CollapsibleStack;
class CollapsibleBlock;
class ParameterBlock;
class BlockModel;
class SelectionMgr;
class Block;
class Key;
#define NSTACKS 2

class LayoutMgr : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit LayoutMgr(QWidget *pParent=nullptr);

    //! Constructor
    explicit LayoutMgr(int nStacks=NSTACKS, QWidget *pParent=nullptr);

    //! Destructor
    virtual ~LayoutMgr();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Set key manager
    void setKeyManager(KeyManager *pKeyManager);

    //! Set number of stacks
    void setNumberOfStacks(int nStacks);

    //! Return all blocks
    QList<CollapsibleBlock *> blocks() const;

    //! Return true if all blocks are opened
    bool allBlocksOpened() const;

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Set size
    void setSize(int iSize);

    //! Build menu
    virtual void buildMenu(Block *pBlock);

protected:
    //! Vector of stacks
    QVector<CollapsibleStack *> m_vStacks;

private:
    //! Add block to stack
    void addBlockToStack(CollapsibleBlock *pBlock);

    //! Connect blocks to selection mgr
    void connectBlocksToSelectionMgr(CollapsibleBlock *pBlock);

    //! Evaluate enabled condition
    void evaluateEnabledCondition(CollapsibleBlock *pBlock);

private:
    //! UI
    Ui::LayoutMgr *m_pUI=nullptr;

    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Number of parameter blocks
    int m_nBlocks=0;

    //! Size
    int m_iSize=0;

    //! # columns
    int m_nCols=0;

    //! # block per stack
    int m_nBlockPerStack=0;

    //! # stacks
    int m_nStacks=NSTACKS;

    //! Root block
    CollapsibleBlock *m_pRootCollapsibleBlock=nullptr;

    //! Block model
    BlockModel *m_pBlockModel=nullptr;

    //! Selection manager
    SelectionMgr *m_pSelectionMgr=nullptr;

    //! Own blocks
    QList<CollapsibleBlock *> m_lBlocks;

    //! All opened?
    bool m_bAllBlocksOpened = false;

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! Show hide tree
    void onShowHideTree();

    //! Open or close all parameter blocks
    void onOpenAll();

    //! Clear all
    void onClearAll();

    //! Highlight item
    void onHighlightItem(const QModelIndex &index, CollapsibleBlock *pBlock);

    //! Block status changed
    void onBlockSelectionStatusChanged(CollapsibleBlock *pBlock);

    //! Closed state changed
    void onClosedStateChanged(bool bClosed);

    //! Key preview image ready
    void onKeyPreviewImageReady(const QString &sPreviewImage);

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! Tree visibility changed
    void treeVisibilityChanged(bool bTreeVisible);
};

#endif // LAYOUTMGR_H
