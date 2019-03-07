#ifndef PARAMETERBLOCK_H
#define PARAMETERBLOCK_H

// Qt
#include <QWidget>

// Application
class KeyManager;
class Block;
class Parameter;
class BaseWidget;
class CollapsibleBlock;
class LayoutMgr;

namespace Ui {
class ParameterBlock;
}

class ParameterBlock : public QWidget
{
    Q_OBJECT

public:
    friend class CollapsibleBlock;

    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Destructor
    ~ParameterBlock();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Return name
    const QString &name() const;

    //! Set name
    void setName(const QString &sName);

    //! Return key preview image
    const QString &keyPreviewImage() const;

    //! Return key preview label
    const QString &keyPreviewLabel() const;

    //! Set key preview image
    void setKeyPreviewImage(const QString &sKeyPreviewImage);

    //! Return selection variable
    const QString &selectionVariable() const;

    //! Set variable
    void setSelectionVariable(const QString &sParameterVariable);

    //! Return value
    const QString &value() const;

    //! Set value
    void setValue(const QString &sValue);

    //! Is empty?
    bool isEmpty() const;

    //! Set enabled
    void setEnabled(bool bEnabled);

    //! Is enabled
    bool isEnabled() const;

    //! Set exclusive
    void setExclusive(bool bIsExclusive);

    //! Exclusive?
    bool isExclusive() const;

    //! Return owner collapsible block
    CollapsibleBlock *ownerCollapsibleBlock() const;

    //! Block always opened?
    bool blockAlwaysOpened() const;

    //! Can clear block?
    bool canClearBlock() const;

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Set watched parameters
    void setWatchedParameters(const QHash<QString, Parameter *> &hParameters);

    //! Clear all
    void clearAll();

    //! Add child recursively
    void addChildRecursively(Block *pBlock);

    //! Add widget
    void addWidget(BaseWidget *pWidget);

    //! Return number of parents
    int nParents() const;

protected:
    //! Handle paint events
    void paintEvent(QPaintEvent *e);

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! Evaluate enabled condition
    void onEvaluateEnabledCondition();

private:
    //! Constructor
    explicit ParameterBlock(KeyManager *pKeyManager, LayoutMgr *pLayoutManager, Block *pBlock, CollapsibleBlock *pOwner, bool bIsClosed=true, QWidget *pParent=nullptr);

    //! Populate parameter block
    void populateParameterBlock();

    //! Add collapsible block
    void addCollapsibleBlock(CollapsibleBlock *pBlock);

    //! Process enabled condition
    void processEnabledCondition();

private:
    //! UI
    Ui::ParameterBlock *m_pUI=nullptr;

    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Layout manager
    LayoutMgr *m_pLayoutManager=nullptr;

    //! Block
    Block *m_pBlock=nullptr;

    //! Name
    QString m_sName="";

    //! Key preview image
    QString m_sKeyPreviewImage="";

    //! Is empty?
    bool m_bIsEmpty=false;

    //! Enabled condition
    QString m_sEnabledCondition="";

    //! Watched parameters
    QHash<QString, Parameter *> m_hWatchedParameters;

    //! Variable name
    QString m_sSelectionVariable="";

    //! Variable value
    QString m_sValue="";

    //! Exclusive?
    bool m_bIsExclusive=true;

    //! Enabled
    bool m_bIsEnabled=true;

    //! Owner collapsible block
    CollapsibleBlock *m_pOwnerCollapsibleBlock=nullptr;

    //! Widgets
    QVector<BaseWidget *> m_vWidgets;

    //! Always opened?
    bool m_bBlockAlwaysOpened=false;

    //! Can clear block?
    bool m_bCanClearBlock=true;

signals:
    //! Key preview image ready
    void keyPreviewImageReady(const QString &sKeyPreviewImage);

    //! Parameter value changed
    void parameterValueChanged(const QString &sParameterName, const QString &sParameterValue);
};

#endif // PARAMETERBLOCK_H
