// Application
#include "basewidget.h"
#include "parameter.h"
#include "helper.h"
#include "constants.h"

//-------------------------------------------------------------------------------------------------

BaseWidget::BaseWidget(Parameter *pParameter, QWidget *pParent) : QWidget(pParent),
    m_pParameter(pParameter)
{
}

//-------------------------------------------------------------------------------------------------

BaseWidget::~BaseWidget()
{

}

//-------------------------------------------------------------------------------------------------

const QString &BaseWidget::defaultValue() const
{
    return m_sDefaultValue;
}

//-------------------------------------------------------------------------------------------------

void BaseWidget::setDefaultValue(const QString &sDefaultValue)
{
    // Special cases

    // Retrieve name
    QString sParameterName = m_pParameter->getAttributeValue(PROPERTY_NAME);
    bool bIsKeyLabel = sParameterName.contains(TEXT_LINE);

    // Retrieve widget type
    QString sWidgetType = m_pParameter->getAttributeValue(PROPERTY_UI);
    bool bIsFilePicker = sWidgetType == WIDGET_FILE_PICKER;

    // Key label?
    if (bIsKeyLabel || bIsFilePicker)
        m_sDefaultValue = "";
    else
        m_sDefaultValue = sDefaultValue.isEmpty() ? VALUE_DEFAULT_VALUE : sDefaultValue;
}

//-------------------------------------------------------------------------------------------------

const QString &BaseWidget::autoScript() const
{
    return m_sAutoScript;
}

//-------------------------------------------------------------------------------------------------

void BaseWidget::setAutoScript(const QString &sAutoScript)
{
    m_sAutoScript = sAutoScript;
}

//-------------------------------------------------------------------------------------------------

const QString &BaseWidget::enabledCondition() const
{
    return m_sEnabledCondition;
}

//-------------------------------------------------------------------------------------------------

void BaseWidget::setEnabledCondition(const QString &sEnabledCondition)
{
    m_sEnabledCondition = sEnabledCondition;
}

//-------------------------------------------------------------------------------------------------

void BaseWidget::setWatchedParameters(const QHash<QString, Parameter *> &hParameters)
{
    for (QHash<QString, Parameter *>::const_iterator it=hParameters.begin(); it!=hParameters.end(); ++it)
    {
        connect(it.value(), &Parameter::parameterValueChanged, this, &BaseWidget::onEvaluateAutoScript, Qt::UniqueConnection);
        connect(it.value(), &Parameter::parameterValueChanged, this, &BaseWidget::onEvaluateEnabledCondition, Qt::UniqueConnection);
    }
}

//-------------------------------------------------------------------------------------------------

void BaseWidget::applyDefaultValue()
{

}

//-------------------------------------------------------------------------------------------------

void BaseWidget::clearAll()
{

}

//-------------------------------------------------------------------------------------------------

void BaseWidget::applyValue(const QString &sValue)
{
    Q_UNUSED(sValue);
}

//-------------------------------------------------------------------------------------------------

void BaseWidget::onEvaluateAutoScript()
{

}

//-------------------------------------------------------------------------------------------------

void BaseWidget::onEvaluateEnabledCondition()
{
    if (m_pParameter != nullptr)
    {
        if (!m_sEnabledCondition.isEmpty())
        {
            bool bSuccess = true;
            bool bValue = Helper::evaluateEnabledCondition(m_pParameter->getParentBlock(), m_sEnabledCondition, bSuccess);
            if (bSuccess)
                setEnabled(bValue);
        }
    }
}
