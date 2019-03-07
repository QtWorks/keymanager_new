#ifndef SELECTIONMGR_H
#define SELECTIONMGR_H

// Qt
#include <QObject>

// Application
class KeyManager;
class CollapsibleBlock;

class SelectionMgr : public QObject
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit SelectionMgr(QObject *pParent=nullptr);

    //! Destructor
    ~SelectionMgr();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Set key manager
    void setKeyManager(KeyManager *pKeyManager);

private:
    //! Unselect block
    void unselectBlock(CollapsibleBlock *pBlock);

    //! Select block
    void selectBlock(CollapsibleBlock *pBlock);

private:
    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! A block was selected
    void onSelectBlock();

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! Block selection status changed
    void blockSelectionStatusChanged(CollapsibleBlock *pBlock);
};

#endif // SELECTIONMGR_H
