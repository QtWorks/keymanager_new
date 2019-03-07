#ifndef BLOCKMODEL_H
#define BLOCKMODEL_H

// Qt
#include <QAbstractItemModel>
#include <QModelIndex>

// Application
class CollapsibleBlock;

class BlockModel : public QAbstractItemModel
{
    Q_OBJECT

public:
    enum Roles {UidRole = Qt::UserRole+1};

    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit BlockModel(QObject *parent=nullptr);

    //! Destructor
    ~BlockModel();

    //! Get block
    CollapsibleBlock *getBlock(const QModelIndex &index) const;

    //! Data
    virtual QVariant data(const QModelIndex &index, int role) const;

    //! Return flags
    virtual Qt::ItemFlags flags(const QModelIndex &index) const;

    //! Index
    virtual QModelIndex index(int iRow, int iColumn, const QModelIndex &parent=QModelIndex()) const;

    //! Parent
    virtual QModelIndex parent(const QModelIndex &index) const;

    //! Row count
    virtual int rowCount(const QModelIndex &parent=QModelIndex()) const;

    //! Column count
    virtual int columnCount(const QModelIndex &parent=QModelIndex()) const;

    // Set root block
    void setRootBlock(CollapsibleBlock *pRootBlock);

    //! Update index
    void updateIndex(const QModelIndex &index);

    //! Return a block index
    QModelIndex getBlockIndex(const QString &sBlockUID) const;

protected:
    //: Root block
    CollapsibleBlock *m_pRootBlock;

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! Block status changed
    void onBlockSelectionStatusChanged(CollapsibleBlock *pBlock);

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! Highlight item
    void highlightItem(const QModelIndex &index, CollapsibleBlock *pBlock);
};

#endif // BLOCKMODEL_H
