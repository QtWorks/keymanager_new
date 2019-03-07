// Qt
#include <QRadioButton>

// Application
#include "yesnowidget.h"
#include "ui_yesnowidget.h"
#include "constants.h"
#include "parameter.h"

//-------------------------------------------------------------------------------------------------

YesNoWidget::YesNoWidget(Parameter *pParameter, QWidget *pParent) :
    BaseWidget(pParameter, pParent), m_pUI(new Ui::YesNoWidget)
{
    m_pUI->setupUi(this);

    // Set default value
    setDefaultValue(m_pParameter->getAttributeValue(PROPERTY_DEFAULT));

    // Set auto script
    setAutoScript(m_pParameter->getAttributeValue(PROPERTY_AUTO));

    // Set enabled condition
    setEnabledCondition(m_pParameter->getAttributeValue(PROPERTY_ENABLED));

    m_pUI->label->setText(m_pParameter->getAttributeValue(PROPERTY_NAME));
    connect(m_pUI->yesRadioButton, &QRadioButton::toggled, this, &YesNoWidget::onRadioButtonToggled, Qt::UniqueConnection);
    m_pUI->yesRadioButton->setProperty(PROPERTY_USER_VALUE, VALUE_YES);
    connect(m_pUI->noRadioButton, &QRadioButton::toggled, this, &YesNoWidget::onRadioButtonToggled, Qt::UniqueConnection);
    m_pUI->noRadioButton->setProperty(PROPERTY_USER_VALUE, VALUE_NO);
}

//-------------------------------------------------------------------------------------------------

YesNoWidget::~YesNoWidget()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void YesNoWidget::applyDefaultValue()
{
    applyValue(defaultValue());
}

//-------------------------------------------------------------------------------------------------

void YesNoWidget::applyValue(const QString &sValue)
{
    if (sValue == VALUE_YES)
        m_pUI->yesRadioButton->setChecked(true);
    else
        m_pUI->noRadioButton->setChecked(true);
}

//-------------------------------------------------------------------------------------------------

void YesNoWidget::onRadioButtonToggled(bool bClicked)
{
    QRadioButton *pSender = dynamic_cast<QRadioButton *>(sender());
    if (pSender && bClicked)
    {
        QString sUserValue = pSender->property(PROPERTY_USER_VALUE).toString();
        m_pParameter->setValue(sUserValue);
    }
}
