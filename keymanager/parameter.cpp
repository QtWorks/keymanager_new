// Qt
#include <QDebug>

// Application
#include "parameter.h"
#include "constants.h"
#include "cxmlnode.h"
#include "helper.h"
#include "key.h"
#include "keyparser.h"
#include "helper.h"

//-------------------------------------------------------------------------------------------------

Parameter *Parameter::createParameter(Block *pParentBlock, const CXMLNode &xParameterNode)
{
    if (pParentBlock != nullptr)
    {
        // Parameter node
        if (xParameterNode.attributes().contains(PROPERTY_VARIABLE))
        {
            // Retrieve parameter variable
            QString sParameterVariable = xParameterNode.attributes()[PROPERTY_VARIABLE];

            // Check parameter variable
            if (sParameterVariable.isEmpty())
            {
                QString sError = QString("Parameter::createParameter REQUIRES A VALID VARIABLE NAME");
                Helper::error(sError);
            }
            else
            {
                if (!KeyParser::getParameterByVariableName(pParentBlock->getParentKey(), sParameterVariable))
                {
                    Parameter *pParameter = new Parameter(pParentBlock, xParameterNode);
                    QString sMsg = QString("Parameter::createParameter CREATED PARAMETER VARIABLE %1").arg(pParameter->getAttributeValue(PROPERTY_VARIABLE));
                    Helper::info(sMsg);
                    return pParameter;
                }
                else
                {
                    QString sError = QString("Parameter::createParameter VARIABLE %1 WAS ALREADY CREATED IN KEY %2").arg(sParameterVariable).arg(pParentBlock->getParentKey()->getAttributeValue(PROPERTY_NAME));
                    Helper::error(sError);
                }
            }
        }
        else return new Parameter(pParentBlock, xParameterNode);
    }

    return nullptr;
}

//-------------------------------------------------------------------------------------------------

Parameter *Parameter::createParameter(Block *pParentBlock, const QString &sParameterVariable)
{
    if (pParentBlock != nullptr)
    {
        // Check parameter variable
        if (sParameterVariable.isEmpty())
        {
            QString sError = QString("Parameter::createParameter REQUIRES A VALID VARIABLE NAME");
            Helper::error(sError);
        }
        else
        {
            if (!KeyParser::getParameterByVariableName(pParentBlock->getParentKey(), sParameterVariable))
            {
                Parameter *pParameter = new Parameter(pParentBlock, sParameterVariable);
                QString sMsg = QString("Parameter::createParameter CREATED PARAMETER VARIABLE %1").arg(pParameter->getAttributeValue(PROPERTY_VARIABLE));
                Helper::info(sMsg);
                return pParameter;
            }
            else
            {
                QString sError = QString("Parameter::createParameter VARIABLE %1 WAS ALREADY CREATED IN KEY %2").arg(sParameterVariable).arg(pParentBlock->getParentKey()->getAttributeValue(PROPERTY_NAME));
                Helper::error(sError);
            }
        }
    }

    return nullptr;
}

//-------------------------------------------------------------------------------------------------

QVector<Parameter *> Parameter::createTableParameters(Block *pParentBlock, Parameter *pTableParameter)
{
    QVector<Parameter *> vParameters;
    if ((pParentBlock != nullptr) && (pTableParameter != nullptr))
    {
        QString sWidgetType = pTableParameter->getAttributeValue(PROPERTY_UI);
        if (sWidgetType == WIDGET_GENERIC_PARAMETER_TABLE)
        {
            // Retrieve parameter info
            QString sTargetRow = pTableParameter->getAttributeValue(PROPERTY_TARGET_ROW);
            int nRows = pTableParameter->getAttributeValue(PROPERTY_NROWS).toInt();
            QString sTargetVariable = pTableParameter->getAttributeValue(PROPERTY_TARGET_VARIABLE);
            QString sVariableMethod = pTableParameter->getAttributeValue(PROPERTY_VARIABLE_METHOD);
            QString sAutoScript = pTableParameter->getAttributeValue(PROPERTY_AUTO);
            QString sDefaultValue = pTableParameter->getAttributeValue(PROPERTY_DEFAULT);
            QString sColumnLabels = pTableParameter->getAttributeValue(PROPERTY_COLUMN_LABELS);
            QString sColumnVariables = pTableParameter->getAttributeValue(PROPERTY_COLUMN_VARIABLES);
            QString sActionSetNumberOfPins = pTableParameter->getAttributeValue(ACTION_SET_NUMBER_OF_ROWS);
            QString sUnsetValue = pTableParameter->getAttributeValue(PROPERTY_UNSET);

            // Retrive columns
            QStringList lColumns = sColumnLabels.split(",");
            QStringList lColumnVariables = sColumnVariables.split(",");

            // Check unset values
            QStringList lUnsetValues;
            int nColumns = qMin(lColumns.size(), lColumnVariables.size());
            if (sUnsetValue.isEmpty())
            {
                for (int i=0; i<nColumns; i++)
                    lUnsetValues << ERASE_VALUE;
            }
            else
            {
                lUnsetValues = sUnsetValue.split(",");
                if (lUnsetValues.size() < nColumns)
                    for (int i=lUnsetValues.size(); i<nColumns; i++)
                        lUnsetValues << ERASE_VALUE;
            }

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
                for (int i=0; i<nRows; i++)
                {
                    for (int j=0; j<nColumns; j++)
                    {
                        // Build formatted variable name
                        QString sFormattedVariableName = Helper::getFormattedVariableName(sVariableMethod, sTargetVariable, lColumnVariables, sTargetRow, j, i);
                        if (!sFormattedVariableName.isEmpty())
                        {
                            Parameter *pParameter = Parameter::createParameter(pParentBlock, sFormattedVariableName);
                            if (pParameter != nullptr)
                            {
                                pParameter->setAttributeValue(PROPERTY_TYPE, PROPERTY_DOUBLE);
                                pParameter->setUnsetValue(lUnsetValues[j]);
                                vParameters << pParameter;
                            }
                            else
                            {
                                QString sError = QString("Parameter::createTableParameter COULD NOT CREATE A PARAMETER FOR VARIABLE %1").arg(sFormattedVariableName);
                                Helper::error(sError);
                            }
                        }
                    }
                }
            }
            else Helper::error("CANNOT CREATE A TABLE WITH 0 COLUMN");
        }
    }

    return vParameters;
}

//-------------------------------------------------------------------------------------------------

Parameter::Parameter(Block *pParentBlock, const CXMLNode &xParameterNode, QObject *pParent) : QObject(pParent),
    m_pParentBlock(pParentBlock), m_sDefaultValue(VALUE_DEFAULT_VALUE)
{
    // Set attributes
    m_hAttributes = xParameterNode.attributes();

    // Retrieve parameter name
    QString sParameterName = m_hAttributes[PROPERTY_NAME];
    bool bIsKeyLabel = sParameterName.contains(TEXT_LINE);

    // Retrieve widget type
    QString sWidgetType = m_hAttributes[PROPERTY_UI];
    bool bIsFilePicker = sWidgetType == WIDGET_FILE_PICKER;

    // Set default value
    if (m_hAttributes.contains(PROPERTY_DEFAULT))
    {
        m_sDefaultValue = getAttributeValue(PROPERTY_DEFAULT);
        if (m_sDefaultValue.isEmpty())
            m_sDefaultValue = VALUE_DEFAULT_VALUE;
    }
    else
    // Key label of file picker
    if (bIsKeyLabel || bIsFilePicker)
        m_sDefaultValue = "";
    // Other cases
    else
    {
        // Check type
        if (getAttributeValue(PROPERTY_TYPE) == PROPERTY_BOOLEAN)
            if ((m_sDefaultValue != VALUE_YES) && (m_sDefaultValue != VALUE_NO))
                m_sDefaultValue = VALUE_NO;
    }

    // Set value as default value
    m_sValue = m_sDefaultValue;

    QString sInfo = QString("Parameter::Parameter CREATED PARAMETER %1").arg(getAttributeValue(PROPERTY_NAME));
    Helper::info(sInfo);
}

//-------------------------------------------------------------------------------------------------

Parameter::Parameter(Block *pParentBlock, const QString &sVariableName, QObject *pParent) : QObject(pParent),
    m_pParentBlock(pParentBlock)
{
    // Default type
    m_hAttributes[PROPERTY_VARIABLE] = sVariableName;
    m_hAttributes[PROPERTY_TYPE] = PROPERTY_STRING;
    QString sInfo = QString("Parameter::Parameter CREATED PARAMETER %1").arg(getAttributeValue(PROPERTY_NAME));
    Helper::info(sInfo);
}

//-------------------------------------------------------------------------------------------------

Parameter::~Parameter()
{
    Helper::info(QString("Parameter::~Parameter DESTROYING PARAMETER %1").arg(getAttributeValue(PROPERTY_NAME)));
    qDeleteAll(m_vChildParameters);
}

//-------------------------------------------------------------------------------------------------

QString Parameter::getAttributeValue(const QString &sAttributeName) const
{
    return m_hAttributes[sAttributeName];
}

//-------------------------------------------------------------------------------------------------

void Parameter::setAttributeValue(const QString &sAttributeName, const QString &sAttributeValue)
{
    if (m_hAttributes.contains(sAttributeName))
        m_hAttributes[sAttributeName] = sAttributeValue;
}

//-------------------------------------------------------------------------------------------------

const QString &Parameter::getValue() const
{
    return m_sValue;
}

//-------------------------------------------------------------------------------------------------

void Parameter::setValue(const QString &sValue)
{
    if (m_sValue != sValue)
    {
        // Retrieve variable
        QString sVariable = m_hAttributes[PROPERTY_VARIABLE];
        QString sMsg = QString("Parameter::setValue SETTING VALUE: %1 FOR VARIABLE: %2").arg(sValue).arg(sVariable);
        Helper::info(sMsg);
        m_sValue = sValue;
        emit parameterValueChanged(sValue);
    }
}

//-------------------------------------------------------------------------------------------------

const QString &Parameter::getUnsetValue() const
{
    return m_sUnsetValue;
}

//-------------------------------------------------------------------------------------------------

void Parameter::setUnsetValue(const QString &sUnsetValue)
{
    m_sUnsetValue = sUnsetValue;
}

//-------------------------------------------------------------------------------------------------

void Parameter::setParentBlock(Block *pBlock)
{
    m_pParentBlock = pBlock;
}

//-------------------------------------------------------------------------------------------------

Block *Parameter::getParentBlock() const
{
    return m_pParentBlock;
}

//-------------------------------------------------------------------------------------------------

const QVector<Parameter *> &Parameter::getChildParameters() const
{
    return m_vChildParameters;
}

//-------------------------------------------------------------------------------------------------

void Parameter::resetToDefaultValue()
{
    setValue(m_sDefaultValue);
}

//-------------------------------------------------------------------------------------------------

void Parameter::addChildParameter(Parameter *pParameter)
{
    if (pParameter != nullptr)
        m_vChildParameters << pParameter;
}

