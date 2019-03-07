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

GenericParameterTableModel::GenericParameterTableModel(KeyManager *pKeyManager, Block *pParentBlock, const QStringList &lColumnLabels, const QStringList &lColumnVariables, const QString &sDefaultValue, const QString &sTargetRow,
    int nRows, const QString &sTargetVariable, const QString &sVariableMethod, const QString &sActionSetNumberOfRows, QObject *parent) : QAbstractItemModel(parent),
    m_pKeyManager(pKeyManager), m_pParentBlock(pParentBlock)
{
    int nColumns = qMin(lColumnLabels.size(), lColumnVariables.size());

    // Check we have the right number of default values:
    QStringList lDefaultValues;
    if (sDefaultValue.isEmpty())
    {
        for (int i=0; i<nColumns; i++)
            lDefaultValues << VALUE_DEFAULT_VALUE;
    }
    else
    if (sDefaultValue.contains(","))
    {
        lDefaultValues = sDefaultValue.split(",");
        if (lDefaultValues.size() != nColumns)
        {
            lDefaultValues.clear();
            for (int i=0; i<nColumns; i++)
                lDefaultValues << VALUE_DEFAULT_VALUE;
        }
    }
    else lDefaultValues << sDefaultValue;

    if (nColumns > 0)
    {
        // Set default values
        m_lDefaultValues = lDefaultValues;

        // Set own properties
        m_lColumnLabels = lColumnLabels.mid(0, nColumns);
        m_lColumnVariables = lColumnVariables.mid(0, nColumns);
        m_sTargetRow = sTargetRow;
        m_nMaxNumberOfRows = nRows;
        m_nRows = nRows;
        m_sTargetVariable = sTargetVariable;
        m_sVariableMethod = sVariableMethod;
        if (!sActionSetNumberOfRows.isEmpty())
            processActionSetNumberOfRows(sActionSetNumberOfRows);

        for (int i=0; i<nRows; i++)
        {
            for (int j=0; j<nColumns; j++)
            {
                // Build formatted variable name
                QString sFormattedVariableName = getFormattedVariableName(m_sVariableMethod, sTargetVariable, m_lColumnVariables, m_sTargetRow, j, i);
                if (!sFormattedVariableName.isEmpty())
                {
                    Parameter *pParameter = Parameter::createParameter(m_pParentBlock, sFormattedVariableName);
                    if (pParameter != nullptr)
                    {
                        pParameter->setAttributeValue(PROPERTY_TYPE, PROPERTY_DOUBLE);
                        m_vParameters << pParameter;
                        pParentBlock->addParameter(pParameter);
                        KeyParser::addParameter(pParentBlock->getParentKey(), pParameter);
                    }
                    else
                    {
                        QString sError = QString("GenericParameterTableModel::GenericParameterTableModel COULD NOT CREATE A PARAMETER FOR VARIABLE %1").arg(sFormattedVariableName);
                        Helper::error(sError);
                    }
                }
            }
        }
        m_iParameterSize = m_vParameters.size();

        // Write first row using default values
        for (int i=0; i<m_lDefaultValues.size(); i++)
            if (i < m_vParameters.size())
            {
                Parameter *pParameter = m_vParameters[i];
                if (pParameter != nullptr)
                    pParameter->setValue(m_lDefaultValues[i]);
            }
        connect(this, &GenericParameterTableModel::updateAll, this, &GenericParameterTableModel::onUpdateAll, Qt::UniqueConnection);
    }
    else Helper::error("CANNOT CREATE A TABLE WITH 0 COLUMN");
}

//-------------------------------------------------------------------------------------------------

GenericParameterTableModel::~GenericParameterTableModel()
{

}

//-------------------------------------------------------------------------------------------------

const QVector<Parameter *> &GenericParameterTableModel::getParameters() const
{
    return m_vParameters;
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
        return m_nRows+1;
    return 0;
}

//-------------------------------------------------------------------------------------------------

int GenericParameterTableModel::columnCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return m_lColumnLabels.size();
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
            int iTargetRow = index.row();
            QString sTargetData("");
            if (iTargetRow > 0)
            {
                int iIndex = index.column()+iTargetRow*m_lColumnVariables.size();
                if ((iIndex >= 0) && (iIndex < m_vParameters.size()))
                {
                    Parameter *pParameter = m_vParameters[iIndex];
                    if (pParameter != nullptr)
                        sTargetData = pParameter->getValue();
                }
            }
            else
            {
                if ((index.column() >= 0) && (index.column() < m_vParameters.size()))
                {
                    Parameter *pParameter = m_vParameters[index.column()];
                    if (pParameter != nullptr)
                        sTargetData = m_vParameters[index.column()]->getValue();
                }
            }
            double d = sTargetData.toDouble();
            return sTargetData.isEmpty() ? sTargetData : QString::number(d, 'f', 4);
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
        QString sValue = vData.toString();
        int iTargetRow = index.row();
        if (iTargetRow > 0)
        {
            int iTargetIndex = index.column()+iTargetRow*m_lColumnVariables.size();
            if ((iTargetIndex >= 0) && (iTargetIndex < m_vParameters.size()))
            {
                Parameter *pParameter = m_vParameters[iTargetIndex];
                if (pParameter != nullptr)
                {
                    pParameter->setValue(sValue);
                    QString sFormattedVariableName = getFormattedVariableName(m_sVariableMethod, m_sTargetVariable, m_lColumnVariables, m_sTargetRow, index.column(), iTargetRow-1);
                    emit dataChanged(index, index, QVector<int>() << Qt::DisplayRole);
                }
            }
        }
        else
        {
            if ((index.column() >= 0) && (index.column() < m_vParameters.size()))
            {
                Parameter *pParameter = m_vParameters[index.column()];
                if (pParameter != nullptr)
                {
                    pParameter->setValue(sValue);
                    emit dataChanged(index, index, QVector<int>() << Qt::DisplayRole);
                    emit updateAll(index.column());
                }
            }
        }
        return true;
    }

    return false;
}

//-------------------------------------------------------------------------------------------------

QVariant GenericParameterTableModel::headerData(int section, Qt::Orientation eOrientation, int role) const
{
    if (role == Qt::DisplayRole)
    {
        if (eOrientation == Qt::Horizontal)
        {
            return m_lColumnLabels[section];
        }
        else
        if (eOrientation == Qt::Vertical)
        {
            if (section == 0)
                return QString("ALL");
            else return section;
        }
    }

    return QAbstractItemModel::headerData(section, eOrientation, role);
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
    for (int i=0; i<m_lDefaultValues.size(); i++)
    {
        if (i < m_vParameters.size())
        {
            Parameter *pParameter = m_vParameters[i];
            if (pParameter != nullptr)
                pParameter->setValue(m_lDefaultValues[i]);
        }
    }

    // Clear other rows
    for (int i=m_lDefaultValues.size(); i<m_iParameterSize; i++)
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
        for (int i=0; i<m_nRows+1; i++)
        {
            if ((iTargetColumn >= 0) && (iTargetColumn < lValues.size()))
            {
                QModelIndex targetIndex = index(i, iTargetColumn, QModelIndex());
                if (targetIndex.isValid())
                    setData(targetIndex, lValues[iTargetColumn], Qt::EditRole);
            }
            else
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
            // Reset first row to default values
            pParameter->setValue(m_lDefaultValues[iTargetColumn]);
            emit dataChanged(index(0, iTargetColumn, QModelIndex()), index(0, iTargetColumn, QModelIndex()));

            // Clear others
            for (int i=1; i<m_nRows+1; i++)
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
        int iTargetColumn = m_lColumnVariables.indexOf(sColumnVariable);
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
                    for (int i=0; i<m_nRows; i++)
                    {
                        QString sIndexedScript = sMatchedScript;
                        sIndexedScript.replace(PROPERTY_CURRENT_ROW, QString::number(i));
                        QScriptEngine expression;
                        QScriptValue xResult = expression.evaluate(sIndexedScript);
                        if (xResult.isNumber())
                            setData(index(i+1, iTargetColumn, QModelIndex()), xResult.toString(), Qt::EditRole);
                    }
                }
                // Not indexed to row
                else
                {
                    for (int i=0; i<m_nRows; i++)
                    {
                        QScriptEngine expression;
                        QScriptValue xResult = expression.evaluate(sMatchedScript);
                        if (xResult.isNumber())
                            setData(index(i+1, iTargetColumn, QModelIndex()), xResult.toString(), Qt::EditRole);
                    }
                }
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------

QString GenericParameterTableModel::getFormattedVariableName(const QString &sVariableMethod, const QString &sTargetVariable, const QStringList &lColumnVariables, const QString &sTargetRow, int iColumn, int iRow)
{
    QString sFormattedVariable("");
    if (sVariableMethod == PROPERTY_VARIABLE_METHOD1)
    {
        sFormattedVariable = Helper::identifyTargetVariable_method1(sTargetVariable, lColumnVariables, sTargetRow, iColumn, iRow);
    }
    else
    if (sVariableMethod == PROPERTY_VARIABLE_METHOD2)
    {
        sFormattedVariable = Helper::identifyTargetVariable_method2(sTargetVariable, iRow);
    }
    return sFormattedVariable;
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

void GenericParameterTableModel::onSetRowCount(const QString &sParameterName, const QString &sParameterValue)
{
    Q_UNUSED(sParameterName);
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
        m_nRows = nRows;
        m_iParameterSize = (nRows+1)*m_lColumnLabels.size();
        clearAll();

        // Write own data
        int iDataSize = qMin(vData.size(), m_iParameterSize);
        for (int i=0; i<iDataSize; i++)
        {
            if (i < m_iParameterSize)
            {
                Parameter *pParameter = m_vParameters[i];
                if (pParameter != nullptr)
                    pParameter->setValue(vData[i]);
            }
        }

        // Update corresponding variables
        int nColumns = m_lColumnVariables.size();
        for (int i=nRows; i<m_nMaxNumberOfRows; i++)
        {
            for (int j=0; j<nColumns; j++)
            {
                QString sFormattedVariableName = getFormattedVariableName(m_sVariableMethod, m_sTargetVariable, m_lColumnVariables, m_sTargetRow, j, i);
                QString sMsg = QString("CLEARING: %1").arg(sFormattedVariableName);
                Helper::info(sMsg);
                emit parameterValueChanged(sFormattedVariableName, QString(""));
            }
        }

        endResetModel();
        emit rowCountChanged(m_nRows);
    }
}

//-------------------------------------------------------------------------------------------------

void GenericParameterTableModel::onUpdateAll(int iTargetColumn)
{
    for (int i=0; i<m_nRows; i++)
    {
        QModelIndex targetIndex = index(i+1, iTargetColumn, QModelIndex());
        if (targetIndex.isValid())
        {
            if (iTargetColumn < m_vParameters.size())
            {
                Parameter *pParameter = m_vParameters[iTargetColumn];
                if (pParameter != nullptr)
                    setData(targetIndex, pParameter->getValue(), Qt::EditRole);
            }
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

QWidget *ItemDelegate::createEditor(QWidget *parent, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    Q_UNUSED(option);
    Q_UNUSED(index);
    QLineEdit *pEditor = new QLineEdit(parent);
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
    QString sTargetRow = m_pParameter->getAttributeValue(PROPERTY_TARGET_ROW);
    int nRows = m_pParameter->getAttributeValue(PROPERTY_NROWS).toInt();
    QString sTargetVariable = m_pParameter->getAttributeValue(PROPERTY_TARGET_VARIABLE);
    QString sVariableMethod = m_pParameter->getAttributeValue(PROPERTY_VARIABLE_METHOD);
    QString sAutoScript = m_pParameter->getAttributeValue(PROPERTY_AUTO);
    QString sDefaultValue = m_pParameter->getAttributeValue(PROPERTY_DEFAULT);
    QString sColumnLabels = m_pParameter->getAttributeValue(PROPERTY_COLUMN_LABELS);
    QString sColumnVariables = m_pParameter->getAttributeValue(PROPERTY_COLUMN_VARIABLES);
    QString sActionSetNumberOfPins = m_pParameter->getAttributeValue(ACTION_SET_NUMBER_OF_ROWS);

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
    m_pModel = new GenericParameterTableModel(m_pKeyManager, pParentBlock, lColumnLabels, lColumnVariables, defaultValue(), sTargetRow, nRows, sTargetVariable, sVariableMethod, sActionSetNumberOfPins, this);
    m_pUI->tableView->setModel(m_pModel);
    m_pUI->tableView->onRowCountChanged();
    connect(m_pModel, &GenericParameterTableModel::rowCountChanged, m_pUI->tableView, &CustomTableView::onRowCountChanged);
    //connect(m_pModel, &GenericParameterTableModel::parameterValueChanged, this, &GenericParameterTable::parameterValueChanged, Qt::UniqueConnection);

    // Populate button area
    connect(pHeaderView, &CustomHeaderView::clearClicked, this, &GenericParameterTable::onClearColumn, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

GenericParameterTable::~GenericParameterTable()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

const QVector<Parameter *> &GenericParameterTable::getParameters() const
{
    return m_pModel->getParameters();
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


