// Qt
#include <QDebug>

// Application
#include "parameter.h"
#include "constants.h"
#include "cxmlnode.h"
#include "helper.h"
#include "key.h"
#include "keyparser.h"

//-------------------------------------------------------------------------------------------------

Parameter *Parameter::createParameter(Block *pParentBlock, const CXMLNode &xParameterNode, QObject *pParent)
{
    if (pParentBlock != nullptr)
    {
        // Parameter node
        if (xParameterNode.attributes().contains(PROPERTY_VARIABLE))
        {
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
                    Parameter *pParameter = new Parameter(pParentBlock, xParameterNode, pParent);
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
        else
        // Table case
        {
            QString sParameterType = xParameterNode.attributes()[PROPERTY_TYPE];
            if (sParameterType == PROPERTY_TABLE)
            {
                Parameter *pParameter = new Parameter(pParentBlock, xParameterNode, pParent);
                QString sMsg = QString("Parameter::createParameter CREATED PARAMETER VARIABLE %1").arg(pParameter->getAttributeValue(PROPERTY_VARIABLE));
                Helper::info(sMsg);
                return pParameter;
            }
        }
    }

    return nullptr;
}

//-------------------------------------------------------------------------------------------------

Parameter *Parameter::createParameter(Block *pParentBlock, const QString &sParameterVariable, QObject *pParent)
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
                Parameter *pParameter = new Parameter(pParentBlock, sParameterVariable, pParent);
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

Parameter::Parameter(Block *pParentBlock, const CXMLNode &xParameterNode, QObject *pParent) : QObject(pParent),
    m_pParentBlock(pParentBlock), m_sDefaultValue(VALUE_DEFAULT_VALUE)
{
    // Set attributes
    m_hAttributes = xParameterNode.attributes();

    // Set default value
    if (m_hAttributes.contains(PROPERTY_DEFAULT))
        m_sDefaultValue = getAttributeValue(PROPERTY_DEFAULT);
    if (m_sDefaultValue.isEmpty())
        m_sDefaultValue = VALUE_DEFAULT_VALUE;

    // Check type
    if (getAttributeValue(PROPERTY_TYPE) == PROPERTY_BOOLEAN)
        if ((m_sDefaultValue != VALUE_YES) && (m_sDefaultValue != VALUE_NO))
            m_sDefaultValue = VALUE_NO;
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
        emit parameterValueChanged(sVariable, sValue);
    }
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

void Parameter::resetToDefaultValue()
{
    setValue(m_sDefaultValue);
}



