#ifndef COLLAPSIBLEBLOCK_H
#define COLLAPSIBLEBLOCK_H

// Qt
#include <QWidget>
#include <QLabel>
class QVBoxLayout;

// Application
#include "cxmlnode.h"
class KeyManager;
class Key;
class Block;
class CaptionLabel;
class ParameterBlock;
class LayoutMgr;

class CollapsibleBlock : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit CollapsibleBlock(KeyManager *pKeyManager, LayoutMgr *pLayoutMgr, Block *pBlock, QWidget *parent=nullptr);

    //! Destructor
    ~CollapsibleBlock();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Return own parameter block
    ParameterBlock *parameterBlock() const;

    //! Is selected?
    bool isSelected() const;

    //! Select
    void select(bool bSelect);

    //! Return block
    Block *getBlock() const;

    //! Return child blocks
    const QVector<CollapsibleBlock *> &childBlocks() const;

    //! Return child block at index
    CollapsibleBlock *childBlock(int iRow) const;

    //! Return position within parent
    int row() const;

    //! Return parent block
    CollapsibleBlock *parentBlock() const;

    //! Set parent block
    void setParentBlock(CollapsibleBlock *pParentBlock);

    //! Return label
    CaptionLabel *captionLabel() const;

    //! Return uid
    const QString &uid() const;

    //! Set uid
    void setUID(const QString &sUID);

    //! Exclusive?
    bool isExclusive() const;

    //! Enabled?
    bool isEnabled() const;

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Return closed state
    bool isClosed() const;

    //! Add child block
    void addChildBlock(CollapsibleBlock *pBlock);

    //! Process block variable
    void setBlockVariable();

private:
    //! Set parameter block
    void setParameterBlock(ParameterBlock *pParameterBlock);

private:
    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Layout manager
    LayoutMgr *m_pLayoutManager=nullptr;

    //! Block
    Block *m_pBlock=nullptr;

    //! Own parameter block
    ParameterBlock *m_pParameterBlock=nullptr;

    //! Own layout
    QVBoxLayout *m_pLayout=nullptr;

    //! Caption
    CaptionLabel *m_pCaptionLabel=nullptr;

    //! Closed?
    bool m_bIsClosed=true;

    //! Is selected?
    bool m_bIsSelected=false;

    //! Child blocks
    QVector<CollapsibleBlock *> m_vChildBlocks;

    //! Parent block
    CollapsibleBlock *m_pParentBlock=nullptr;

    //! Block uid
    QString m_sUID="";

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! Close or open
    void onOpenOrClose(bool bClose, bool bRecurse=true);

    //! Toggle opened state
    void onToggleOpenedState();

    //! Update enabled state
    void onUpdateEnabledState(bool bEnabled);

    //! Clear all
    void onClearAll();

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! State changed (closed or opened)
    void closedStateChanged(bool bClosed);

    //! Select me
    void selectMe();

    //! Block selection status changed
    void blockSelectionStatusChanged(CollapsibleBlock *pBlock);
};

#endif /*COLLAPSIBLEBLOCK_H*/
