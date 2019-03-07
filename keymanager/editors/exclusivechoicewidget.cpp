// Qt
#include <QRadioButton>

// Application
#include "exclusivechoicewidget.h"
#include "ui_exclusivechoicewidget.h"
#include "constants.h"
#include "parameter.h"

//-------------------------------------------------------------------------------------------------

ExclusiveChoiceWidget::ExclusiveChoiceWidget(Parameter *pParameter, QWidget *parent) :
    BaseWidget(pParameter, parent), m_pUI(new Ui::ExclusiveChoiceWidget)
{
    m_pUI->setupUi(this);

    // Set default value
    setDefaultValue(m_pParameter->getAttributeValue(PROPERTY_DEFAULT));

    // Set auto script
    setAutoScript(m_pParameter->getAttributeValue(PROPERTY_AUTO));

    // Set enabled condition
    setEnabledCondition(m_pParameter->getAttributeValue(PROPERTY_ENABLED));

    // Setup
    QString sLabels = m_pParameter->getAttributeValue(PROPERTY_LABELS);
    QString sValues = m_pParameter->getAttributeValue(PROPERTY_VALUES);

    setup(m_pParameter->getAttributeValue(PROPERTY_NAME), sLabels.split(","), sValues.split(","));
}

//-------------------------------------------------------------------------------------------------

ExclusiveChoiceWidget::~ExclusiveChoiceWidget()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void ExclusiveChoiceWidget::setup(const QString &sLabel, const QStringList &lLabels, const QStringList &lValues)
{
    m_pUI->labelArea->setVisible(!sLabel.isEmpty());
    m_pUI->labelArea->setText(sLabel);

    int nItems = qMin(lLabels.size(), lValues.size());
    for (int i=0; i<nItems; i++)
    {
        QRadioButton *pRadioButton = new QRadioButton(lLabels[i], this);
        pRadioButton->setAutoExclusive(true);
        pRadioButton->setProperty(PROPERTY_USER_VALUE, lValues[i]);
        connect(pRadioButton, &QRadioButton::toggled, this, &ExclusiveChoiceWidget::onRadioButtonToggled, Qt::UniqueConnection);
        m_pUI->radioButtonArea->addWidget(pRadioButton);
        m_vRadioButtons << pRadioButton;
    }
}

//-------------------------------------------------------------------------------------------------

void ExclusiveChoiceWidget::applyDefaultValue()
{
    applyValue(defaultValue());
}

//-------------------------------------------------------------------------------------------------

void ExclusiveChoiceWidget::applyValue(const QString &sValue)
{
    if (!sValue.isEmpty())
    {
        bool bMatch = false;
        foreach (QRadioButton *pRadioButton, m_vRadioButtons)
        {
            QString sUserValue = pRadioButton->property(PROPERTY_USER_VALUE).toString();
            if (sUserValue == sValue)
            {
                bMatch = true;
                pRadioButton->setChecked(true);
                break;
            }
        }
        if (!bMatch && !m_vRadioButtons.isEmpty())
            m_vRadioButtons.first()->setChecked(true);
    }
    else
    if (!m_vRadioButtons.isEmpty())
        m_vRadioButtons.first()->setChecked(true);
}

//-------------------------------------------------------------------------------------------------

void ExclusiveChoiceWidget::onRadioButtonToggled(bool bClicked)
{
    QRadioButton *pSender = dynamic_cast<QRadioButton *>(sender());
    if (pSender && bClicked)
    {
        QString sUserValue = pSender->property(PROPERTY_USER_VALUE).toString();
        m_pParameter->setValue(sUserValue);
    }
}
