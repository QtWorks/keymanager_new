// Qt
#include <QDebug>
#include <QPushButton>
#include <QLineEdit>
#include <QDebug>
#include <QScriptEngine>
#include <QScriptValue>

// Application
#include "genericparametertable.h"
#include "ui_genericparametertable.h"
#include "constants.h"
#include "intvalidator.h"
#include "helper.h"
#include "customheaderview.h"
#include "doublevalidator.h"
#include "parameter.h"
#include "keyparser.h"

//-------------------------------------------------------------------------------------------------

GenericParameterTableModel::GenericParameterTableModel(KeyManager *pKeyManager, Block *pParentBlock, Parameter *pRootParameter, int iColumnCount, QObject *pParent) :
    QAbstractItemModel(pParent), m_pKeyManager(pKeyManager), m_pParentBlock(pParentBlock), m_pRootParameter(pRootParameter), m_iColumnCount(iColumnCount)
{
    // Set ALL parameters
    for (int i=0; i<iColumnCount; i++)
    {
        QString sParameterVariable = QString("ALL_VALUES_FOR_COLUMN_%1").arg(i);
        Parameter *pParameter = Parameter::createParameter(pParentBlock, sParameterVariable);
        m_vParameters << pParameter;
    }

    // Add other parameters
    m_vParameters << pRootParameter->getChildParameters();

    // Number of visible rows
    m_iVisibleRowCount = m_vParameters.size()/m_iColumnCount;

    // Check unset values
    QString sUnsetValue = pRootParameter->getAttributeValue(PROPERTY_UNSET);
    QStringList lUnsetValues;
    if (sUnsetValue.isEmpty())
    {
        for (int i=0; i<iColumnCount; i++)
            lUnsetValues << ERASE_VALUE;
    }
    else
    {
        lUnsetValues = sUnsetValue.split(",");
        if (lUnsetValues.size() < iColumnCount)
            for (int i=lUnsetValues.size(); i<iColumnCount; i++)
                lUnsetValues << ERASE_VALUE;
    }

    // Check we have the right number of default values
    QString sDefaultValue = pRootParameter->getAttributeValue(PROPERTY_DEFAULT);
    QStringList lDefaultValues;
    if (sDefaultValue.isEmpty())
    {
        for (int i=0; i<iColumnCount; i++)
            lDefaultValues << VALUE_DEFAULT_VALUE;
    }
    else
    if (sDefaultValue.contains(","))
    {
        lDefaultValues = sDefaultValue.split(",");
        if (lDefaultValues.size() != iColumnCount)
        {
            lDefaultValues.clear();
            for (int i=0; i<iColumnCount; i++)
                lDefaultValues << VALUE_DEFAULT_VALUE;
        }
    }
    else lDefaultValues << sDefaultValue;

    for (int i=0; i<iColumnCount; i++)
    {
        if (i < m_vParameters.size())
        {
            Parameter *pParameter = m_vParameters[i];
            if (pParameter != nullptr)
                pParameter->setValue(lDefaultValues[i]);
        }
    }

    if (iColumnCount > 0)
    {
        // Set default values
        m_lDefaultValues = lDefaultValues;

        QString sActionSetNumberOfRows = pRootParameter->getAttributeValue(ACTION_SET_NUMBER_OF_ROWS);
        if (!sActionSetNumberOfRows.isEmpty())
            processActionSetNumberOfRows(sActionSetNumberOfRows);
    }

    // Listen to updateAll signal
    connect(this, &GenericParameterTableModel::updateAll, this, &GenericParameterTableModel::onUpdateAll);
}

//-------------------------------------------------------------------------------------------------

GenericParameterTableModel::~GenericParameterTableModel()
{

}

//-------------------------------------------------------------------------------------------------

QModelIndex GenericParameterTableModel::index(int iRow, int iCol, const QModelIndex &parent) const
{
    if (!parent.isValid())
        return createIndex(iRow, iCol);
    return QModelIndex();
}

//-------------------------------------------------------------------------------------------------

QModelIndex GenericParameterTableModel::parent(const QModelIndex &) const
{
    return QModelIndex();
}

//-------------------------------------------------------------------------------------------------

int GenericParameterTableModel::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return m_iVisibleRowCount;
    return 0;
}

//-------------------------------------------------------------------------------------------------

int GenericParameterTableModel::columnCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return m_iColumnCount;
    return 0;
}

//-------------------------------------------------------------------------------------------------

QVariant GenericParameterTableModel::data(const QModelIndex &index, int iRole) const
{
    if (index.isValid())
    {
        // Display
        if (iRole == Qt::DisplayRole)
        {
            // Retrieve target parameter
            Parameter *pTargetParameter = nullptr;
            int iIndex = index.row()*m_iColumnCount+index.column();
            if ((iIndex >= 0) && (iIndex < m_vParameters.size()))
                pTargetParameter = m_vParameters[iIndex];

            // Got a parameter
            if (pTargetParameter != nullptr)
            {
                // Retrieve target data
                QString sTargetData = "";
                if (pTargetParameter != nullptr)
                    sTargetData = pTargetParameter->getValue();

                // Make it double
                double d = sTargetData.toDouble();
                return sTargetData.isEmpty() ? sTargetData : QString::number(d, 'f', 4);
            }
        }
        else
            // Background
            if (iRole == Qt::BackgroundColorRole)
                return (index.row()%2 == 0) ? QColor(Qt::white) : QColor(Qt::lightGray);
    }
    return QVariant();
}

//-------------------------------------------------------------------------------------------------

bool GenericParameterTableModel::setData(const QModelIndex &index, const QVariant &vData, int iRole)
{
    if (index.isValid() && (iRole == Qt::EditRole))
    {
        // Retrieve value
        QString sValue = vData.toString();

        // Retrieve target parameter
        Parameter *pTargetParameter = nullptr;
        int iIndex = index.row()*m_iColumnCount+index.column();
        if ((iIndex >= 0) && (iIndex < m_vParameters.size()))
            pTargetParameter = m_vParameters[iIndex];

        if (pTargetParameter != nullptr)
        {
            // Special parameter (first row)?
            bool bIsSpecialParameter = iIndex < m_iColumnCount;
            if (bIsSpecialParameter)
            {
                pTargetParameter->setValue(sValue);
                emit dataChanged(index, index, QVector<int>() << Qt::DisplayRole);
                emit updateAll(index.column());
            }
            else
            {
                pTargetParameter->setValue(sValue);
                emit dataChanged(index, index, QVector<int>() << Qt::DisplayRole);
            }

            return true;
        }
    }

    return false;
}

//-------------------------------------------------------------------------------------------------

QVariant GenericParameterTableModel::headerData(int iSection, Qt::Orientation eOrientation, int iRole) const
{
    if (m_pRootParameter != nullptr)
    {
        QString sColumnLabels = m_pRootParameter->getAttributeValue(PROPERTY_COLUMN_LABELS);
        QStringList lColumnLabels = sColumnLabels.split(",");
        if ((lColumnLabels.size() == m_iColumnCount) && (iSection < m_iColumnCount))
        {
            if (iRole == Qt::DisplayRole)
            {
                if (eOrientation == Qt::Horizontal)
                    return lColumnLabels[iSection];
                else
                if (eOrientation == Qt::Vertical)
                {
                    if (iSection == 0)
                        return QString("ALL");
                    else
                        return iSection;
                }
            }
        }
    }

    return QAbstractItemModel::headerData(iSection, eOrientation, iRole);
}

//-------------------------------------------------------------------------------------------------

Qt::ItemFlags GenericParameterTableModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QAbstractItemModel::flags(index);
    return flags|Qt::ItemIsEditable;
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::clearAll()
{
    beginResetModel();

    // Reset first row to default values
    for (int i=0; i<m_iColumnCount; i++)
    {
        if (i < m_vParameters.size())
        {
            Parameter *pParameter = m_vParameters[i];
            if (pParameter != nullptr)
                pParameter->setValue(m_lDefaultValues[i]);
        }
    }

    // Clear other rows
    for (int i=m_iColumnCount; i<m_vParameters.size(); i++)
    {
        if (i < m_vParameters.size())
        {
            Parameter *pParameter = m_vParameters[i];
            if (pParameter != nullptr)
                pParameter->setValue(QString(""));
        }
    }

    endResetModel();
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::applyValue(const QString &sValue, int iTargetColumn)
{
    QStringList lValues;
    if (sValue.contains(","))
        lValues = sValue.split(",");
    else
        lValues << sValue;

    if (!lValues.isEmpty())
    {
        for (int i=0; i<rowCount(); i++)
        {
            for (int j=0; j<lValues.size(); j++)
            {
                QModelIndex targetIndex = index(i, j, QModelIndex());
                if (targetIndex.isValid())
                    setData(targetIndex, lValues[j], Qt::EditRole);
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::clearColumn(int iTargetColumn)
{
    if ((iTargetColumn >= 0) && (iTargetColumn < columnCount()))
    {
        Parameter *pParameter = m_vParameters[iTargetColumn];
        if (pParameter != nullptr)
        {
            // Clear all but row 1
            for (int i=1; i<rowCount(); i++)
            {
                QModelIndex targetIndex = index(i, iTargetColumn, QModelIndex());
                if (targetIndex.isValid())
                    setData(targetIndex, QString(""), Qt::EditRole);
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::setValue(Parameter *pParameter, const QString &sVariableValue)
{
    if (pParameter != nullptr)
    {
        int iParameterIndex = m_vParameters.indexOf(pParameter);
        if (iParameterIndex >= 0)
        {
            int iRowIndex = iParameterIndex/columnCount();
            int iColIndex = iParameterIndex%columnCount();
            QModelIndex targetIndex = index(iRowIndex, iColIndex, QModelIndex());
            if (targetIndex.isValid())
            {
                QString sMsg = QString("SETTING VALUE: %1 FOR VARIABLE: %2").arg(sVariableValue).arg(pParameter->getAttributeValue(PROPERTY_VARIABLE));
                Helper::info(sMsg);
                setData(targetIndex, sVariableValue, Qt::EditRole);
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::evaluateAutoScript(const QString &sFullScript)
{
    QStringList lSingleScripts = sFullScript.split(";");
    foreach (QString sSingleScript, lSingleScripts)
        evaluateSingleScript(sSingleScript);
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::evaluateSingleScript(const QString &sSingleScript)
{
    QStringList lSplitted = sSingleScript.split("=");
    if (lSplitted.size() == 2)
    {
        QString sColumnVariable = lSplitted.first();
        QString sLogicalExpression = lSplitted[1];

        // Identify column index
        QString sColumnVariables = m_pRootParameter->getAttributeValue(PROPERTY_COLUMN_VARIABLES);
        QStringList lColumnVariables = sColumnVariables.split(",");
        int iTargetColumn = lColumnVariables.indexOf(sColumnVariable);
        if (iTargetColumn >= 0)
        {
            // Retrieve variable names
            QVector<QString> vVariableNames = Helper::extractVariableNames(sSingleScript);
            QString sMatchedScript = sLogicalExpression;
            bool bSuccess = true;
            foreach (QString sParameterVariable, vVariableNames)
            {
                Parameter *pParameter = KeyParser::getParameterByVariableName(m_pParentBlock->getParentKey(), sParameterVariable);
                if (pParameter == nullptr)
                {
                    QString sMsg = QString("CAN'T EVALUATE: %1 SINCE VARIABLE: %2 DOES NOT EXIST").arg(sSingleScript).arg(sParameterVariable);
                    Helper::error(sMsg);
                    bSuccess = false;
                    break;
                }
                sMatchedScript.replace(sParameterVariable, pParameter->getValue());
            }
            if (bSuccess)
            {
                // Indexed to row
                if (sMatchedScript.contains(PROPERTY_CURRENT_ROW))
                {
                    for (int i=1; i<rowCount(); i++)
                    {
                        QString sIndexedScript = sMatchedScript;
                        sIndexedScript.replace(PROPERTY_CURRENT_ROW, QString::number(i));
                        QScriptEngine expression;
                        QScriptValue xResult = expression.evaluate(sIndexedScript);
                        if (xResult.isNumber())
                            setData(index(i, iTargetColumn, QModelIndex()), xResult.toString(), Qt::EditRole);
                    }
                }
                // Not indexed to row
                else
                {
                    for (int i=1; i<rowCount(); i++)
                    {
                        QScriptEngine expression;
                        QScriptValue xResult = expression.evaluate(sMatchedScript);
                        if (xResult.isNumber())
                            setData(index(i, iTargetColumn, QModelIndex()), xResult.toString(), Qt::EditRole);
                    }
                }
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::processActionSetNumberOfRows(const QString &sActionSetNumberOfRows)
{
    // Retrieve parameter
    Parameter *pParameter = KeyParser::getParameterByVariableName(m_pParentBlock->getParentKey(), sActionSetNumberOfRows);
    if (pParameter != nullptr)
    {
        connect(pParameter, &Parameter::parameterValueChanged, this, &GenericParameterTableModel::onSetRowCount, Qt::UniqueConnection);
    }
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::onSetRowCount(const QString &sParameterValue)
{
    bool bOK = true;
    int nRows = sParameterValue.toInt(&bOK);
    if (bOK)
    {
        // Make copy of current
        QVector<QString> vData;
        foreach (Parameter *pParameter, m_vParameters)
            if (pParameter != nullptr)
                vData << pParameter->getValue();

        beginResetModel();
        m_iVisibleRowCount = nRows+1;
        clearAll();

        // Write own data
        int iDataSize = qMin(vData.size(), m_iVisibleRowCount*m_iColumnCount);
        for (int i=0; i<iDataSize; i++)
        {
            if (i < m_iVisibleRowCount*m_iColumnCount)
            {
                Parameter *pParameter = m_vParameters[i];
                if (pParameter != nullptr)
                    pParameter->setValue(vData[i]);
            }
        }

        endResetModel();
        emit rowCountChanged(m_iVisibleRowCount);
    }
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::onUpdateAll(int iTargetColumn)
{
    Parameter *pParameter = m_vParameters[iTargetColumn];
    if (pParameter != nullptr)
    {
        for (int i=1; i<rowCount(); i++)
        {
            QModelIndex targetIndex = index(i, iTargetColumn, QModelIndex());
            if (targetIndex.isValid())
                if (iTargetColumn < m_iColumnCount)
                    setData(targetIndex, pParameter->getValue(), Qt::EditRole);
        }
    }
}

//-------------------------------------------------------------------------------------------------

ItemDelegate::ItemDelegate(QObject *parent) : QItemDelegate(parent)
{
}

//-------------------------------------------------------------------------------------------------

ItemDelegate::~ItemDelegate()
{
}

//-------------------------------------------------------------------------------------------------

QWidget *ItemDelegate::createEditor(QWidget *pParent, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    Q_UNUSED(option);
    Q_UNUSED(index);
    QLineEdit *pEditor = new QLineEdit(pParent);
    pEditor->setValidator(new DoubleValidator(-1000., 1000., 3));
    return pEditor;
}

//-------------------------------------------------------------------------------------------------

void ItemDelegate::setEditorData(QWidget *pEditor, const QModelIndex &index) const
{
    QString sValue = index.model()->data(index, Qt::EditRole).toString();
    QLineEdit *pLineEdit = static_cast<QLineEdit *>(pEditor);
    pLineEdit->setText(sValue);
}

//-------------------------------------------------------------------------------------------------


void ItemDelegate::setModelData(QWidget *pEditor, QAbstractItemModel *pModel, const QModelIndex &index) const
{
    QLineEdit *pLineEdit = static_cast<QLineEdit *>(pEditor);
    QString sValue = pLineEdit->text();
    pModel->setData(index, sValue);
}

//-------------------------------------------------------------------------------------------------

void ItemDelegate::updateEditorGeometry(QWidget *pEditor, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    Q_UNUSED(index);
    pEditor->setGeometry(option.rect);
}

//-------------------------------------------------------------------------------------------------

GenericParameterTable::GenericParameterTable(KeyManager *pKeyManager, Parameter *pParameter, QWidget *pParent) :
    BaseWidget(pParameter, pParent),
    m_pUI(new Ui::GenericParameterTable),
    m_pKeyManager(pKeyManager)
{
    // Get parent block
    Block *pParentBlock = pParameter->getParentBlock();

    // Retrieve parameter info
    QString sAutoScript = m_pParameter->getAttributeValue(PROPERTY_AUTO);
    QString sDefaultValue = m_pParameter->getAttributeValue(PROPERTY_DEFAULT);
    QString sColumnLabels = m_pParameter->getAttributeValue(PROPERTY_COLUMN_LABELS);
    QString sColumnVariables = m_pParameter->getAttributeValue(PROPERTY_COLUMN_VARIABLES);

    // Setup UI
    m_pUI->setupUi(this);
    m_pUI->tableView->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);

    // Set default value
    setDefaultValue(sDefaultValue);

    // Set auto script
    setAutoScript(sAutoScript);

    // Build item delegate
    ItemDelegate *pItemDelegate = new  ItemDelegate;
    m_pUI->tableView->setItemDelegate(pItemDelegate);

    // Stretch columns
    QStringList lColumnLabels = sColumnLabels.split(",");
    CustomHeaderView *pHeaderView = new CustomHeaderView(lColumnLabels.toVector());
    m_pUI->tableView->setHorizontalHeader(pHeaderView);
    m_pUI->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);

    // Set model
    QStringList lColumnVariables = sColumnVariables.split(",");
    m_pModel = new GenericParameterTableModel(m_pKeyManager, pParentBlock, pParameter, lColumnLabels.size(), this);

    m_pUI->tableView->setModel(m_pModel);
    m_pUI->tableView->onRowCountChanged();
    connect(m_pModel, &GenericParameterTableModel::rowCountChanged, m_pUI->tableView, &CustomTableView::onRowCountChanged);

    // Populate button area
    connect(pHeaderView, &CustomHeaderView::clearClicked, this, &GenericParameterTable::onClearColumn, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

GenericParameterTable::GenericParameterTable(KeyManager *pKeyManager, Parameter *pRootParameter, const QVector<Parameter *> &vParameters, QWidget *pParent) : BaseWidget(pRootParameter, pParent),
    m_pUI(new Ui::GenericParameterTable),
    m_pKeyManager(pKeyManager)
{
    // Setup UI
    m_pUI->setupUi(this);
    m_pUI->tableView->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);

    // Set default value
    setDefaultValue(pRootParameter->getAttributeValue(PROPERTY_DEFAULT));

    // Set auto script
    setAutoScript(pRootParameter->getAttributeValue(PROPERTY_AUTO));

    // Build item delegate
    ItemDelegate *pItemDelegate = new  ItemDelegate;
    m_pUI->tableView->setItemDelegate(pItemDelegate);

    // Stretch columns
    QString sColumnLabels = pRootParameter->getAttributeValue(PROPERTY_COLUMN_LABELS);
    QStringList lColumnLabels = sColumnLabels.split(",");
    CustomHeaderView *pHeaderView = new CustomHeaderView(lColumnLabels.toVector());
    m_pUI->tableView->setHorizontalHeader(pHeaderView);
    m_pUI->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);

    // Create model
    m_pModel = new GenericParameterTableModel(m_pKeyManager, pRootParameter->getParentBlock(), pRootParameter, lColumnLabels.size(), this);
    m_pUI->tableView->setModel(m_pModel);
    m_pUI->tableView->onRowCountChanged();
    connect(m_pModel, &GenericParameterTableModel::rowCountChanged, m_pUI->tableView, &CustomTableView::onRowCountChanged);

    // Populate button area
    connect(pHeaderView, &CustomHeaderView::clearClicked, this, &GenericParameterTable::onClearColumn, Qt::UniqueConnection);

}

//-------------------------------------------------------------------------------------------------

GenericParameterTable::~GenericParameterTable()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTable::applyDefaultValue()
{
    applyValue(defaultValue());
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTable::clearAll()
{
    m_pModel->clearAll();
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTable::applyValue(const QString &sValue)
{
    m_pModel->applyValue(sValue);
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTable::setValue(Parameter *pParameter, const QString &sVariableValue)
{
    m_pModel->setValue(pParameter, sVariableValue);
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTable::onEvaluateAutoScript()
{
    m_pModel->evaluateAutoScript(autoScript());
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTable::onClearColumn(int iTargetColumn)
{
    m_pModel->clearColumn(iTargetColumn);
}


