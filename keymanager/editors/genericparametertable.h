#ifndef GENERICPARAMETERTABLE_H
#define GENERICPARAMETERTABLE_H

// Qt
#include <QWidget>
#include <QAbstractItemModel>
#include <QVector>
#include <QItemDelegate>

// Application
#include "basewidget.h"
class KeyManager;

namespace Ui {
class GenericParameterTable;
}

class GenericParameterTableModel : public QAbstractItemModel
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    GenericParameterTableModel(KeyManager *pKeyManager, Block *pParentBlock, Parameter *pRootParameter, int iColumnCount, QObject *parent=nullptr);

    //! Destructor
    virtual ~GenericParameterTableModel();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Return index
    QModelIndex index(int iRow, int iCol, const QModelIndex & parent=QModelIndex()) const;

    //! Return index
    QModelIndex parent(const QModelIndex &) const;

    //! Return row count
    int rowCount(const QModelIndex &parent=QModelIndex()) const;

    //! Return column count
    int columnCount(const QModelIndex &parent=QModelIndex()) const;

    //! Return data
    QVariant data(const QModelIndex &index, int iRole=Qt::DisplayRole) const;

    //! Set data
    virtual bool setData(const QModelIndex &index, const QVariant &, int iRole=Qt::EditRole);

    //! Return header data
    virtual QVariant headerData(int iSection, Qt::Orientation eOrientation, int iRole=Qt::DisplayRole) const;

    //! Return flags
    virtual Qt::ItemFlags flags(const QModelIndex &index) const;

    //! Clear all
    void clearAll();

    //! Apply value
    void applyValue(const QString &sValue, int iTargetColumn=-1);

    //! Clear column
    void clearColumn(int iTargetColumn);

    //! Set value
    void setValue(Parameter *pParameter, const QString &sVariableValue);

    //! Evaluate full script
    void evaluateAutoScript(const QString &sFullScript);

    //! Evaluate auto script
    void evaluateSingleScript(const QString &sAutoScript);

private:
    //! Process action set number of pins
    void processActionSetNumberOfRows(const QString &sActionSetNumberOfRows);

private:
    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Parent block
    Block *m_pParentBlock=nullptr;

    //! Root parameter
    Parameter *m_pRootParameter=nullptr;

    //! Column count
    int m_iColumnCount = 0;

    //! Default values
    QStringList m_lDefaultValues;

    //! Data
    QVector<Parameter *> m_vParameters;

    //! Number of visible rows
    int m_iVisibleRowCount = 0;

public slots:
    //! Set number of rows
    void onSetRowCount(const QString &sParameterValue);

    //! Update all
    void onUpdateAll(int iTargetColumn);

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! Parameter value changed
    void parameterValueChanged(const QString &sParameterName, const QString &sParameterValue);

    //! Update all
    void updateAll(int iTargetColumn);

    //! # rows changed
    void rowCountChanged(int nRows);
};

class ItemDelegate : public QItemDelegate
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    ItemDelegate(QObject *parent=nullptr);

    //! Destructor
    ~ItemDelegate();

    //! Create editor
    QWidget *createEditor(QWidget *pParent, const QStyleOptionViewItem &option, const QModelIndex &index) const;

    //! Set editor data
    void setEditorData(QWidget *pEditor, const QModelIndex &index) const;

    //! Set model data
    void setModelData(QWidget *pEditor, QAbstractItemModel *pModel, const QModelIndex &index) const;

    //! Update editor geometry
    void updateEditorGeometry(QWidget *pEditor, const QStyleOptionViewItem &option, const QModelIndex &index) const;
};

class GenericParameterTable : public BaseWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit GenericParameterTable(KeyManager *pKeyManager, Parameter *pParameter, QWidget *pParent=nullptr);

    //! Constructor
    GenericParameterTable(KeyManager *pKeyManager, Parameter *pRootParameter, const QVector<Parameter *> &vChildParameters, QWidget *pParent=nullptr);

    //! Destructor
    ~GenericParameterTable();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Apply default values
    virtual void applyDefaultValue();

    //! Clear all
    virtual void clearAll();

    //! Apply value
    virtual void applyValue(const QString &sValue);

    //! Set value
    void setValue(Parameter *pParameter, const QString &sVariableValue);

private:
    //! UI
    Ui::GenericParameterTable *m_pUI=nullptr;

    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Model
    GenericParameterTableModel *m_pModel=nullptr;

public slots:
    //! Evaluate auto script
    virtual void onEvaluateAutoScript();

    //! Clear column
    void onClearColumn(int iTargetColumn);
};

#endif // GENERICPARAMETERTABLE_H
