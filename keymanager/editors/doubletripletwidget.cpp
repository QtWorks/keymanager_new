// Application
#include "doubletripletwidget.h"
#include "ui_doubletripletwidget.h"
#include "constants.h"
#include "doublevalidator.h"
#include "parameter.h"

//-------------------------------------------------------------------------------------------------

DoubleTripletWidget::DoubleTripletWidget(Parameter *pParameter, QWidget *parent) :
    BaseWidget(pParameter, parent), m_pUI(new Ui::DoubleTripletWidget)
{
    // Setup UI
    m_pUI->setupUi(this);
    m_pUI->label->setText(m_pParameter->getAttributeValue(PROPERTY_NAME));

    // Set default value
    setDefaultValue(m_pParameter->getAttributeValue(PROPERTY_DEFAULT));

    // Set auto script
    setAutoScript(m_pParameter->getAttributeValue(PROPERTY_AUTO));

    // Set enabled condition
    setEnabledCondition(m_pParameter->getAttributeValue(PROPERTY_ENABLED));

    // Set validator
    DoubleValidator *pValidator = new DoubleValidator(-1000, 1000, 3, this);
    m_pUI->lineEdit1->setValidator(pValidator);
    m_pUI->lineEdit2->setValidator(pValidator);
    m_pUI->lineEdit3->setValidator(pValidator);

    connect(m_pUI->lineEdit1, &QLineEdit::textChanged, this, &DoubleTripletWidget::onTextChanged, Qt::UniqueConnection);
    connect(m_pUI->lineEdit2, &QLineEdit::textChanged, this, &DoubleTripletWidget::onTextChanged, Qt::UniqueConnection);
    connect(m_pUI->lineEdit3, &QLineEdit::textChanged, this, &DoubleTripletWidget::onTextChanged, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

DoubleTripletWidget::~DoubleTripletWidget()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void DoubleTripletWidget::setLabel(const QString &sLabel)
{
    m_pUI->label->setText(sLabel);
}

//-------------------------------------------------------------------------------------------------

QString DoubleTripletWidget::value() const
{
    QString sFormattedValue = QString("[%1,%2,%3]").arg(m_pUI->lineEdit1->text()).arg(m_pUI->lineEdit2->text()).arg(m_pUI->lineEdit3->text());
    return sFormattedValue;
}

//-------------------------------------------------------------------------------------------------

void DoubleTripletWidget::applyDefaultValue()
{
    applyValue(defaultValue());
}

//-------------------------------------------------------------------------------------------------

void DoubleTripletWidget::applyValue(const QString &sValue)
{
    m_pUI->lineEdit1->blockSignals(true);
    m_pUI->lineEdit2->blockSignals(true);
    m_pUI->lineEdit3->blockSignals(true);

    QString sFormattedDefaultValue = sValue;
    sFormattedDefaultValue.replace("[", "");
    sFormattedDefaultValue.replace("]", "");
    QStringList lSplitted = sFormattedDefaultValue.split(",");
    if (lSplitted.size() != 3)
    {
        lSplitted.clear();
        lSplitted << "0" << "0" << "0";
    }
    bool bOK = true;
    lSplitted.first().toDouble(&bOK);
    if (bOK)
    {
        lSplitted[1].toDouble(&bOK);
        if (bOK) {
            lSplitted[2].toDouble(&bOK);
            if (bOK)
            {
                m_pUI->lineEdit1->setText(lSplitted.first());
                m_pUI->lineEdit2->setText(lSplitted[1]);
                m_pUI->lineEdit3->setText(lSplitted[2]);
            }
            else
            {
                m_pUI->lineEdit1->setText("0");
                m_pUI->lineEdit2->setText("0");
                m_pUI->lineEdit3->setText("0");
            }
        }
    }

    m_pUI->lineEdit1->blockSignals(false);
    m_pUI->lineEdit2->blockSignals(false);
    m_pUI->lineEdit3->blockSignals(false);
    onTextChanged();
}

//-------------------------------------------------------------------------------------------------

void DoubleTripletWidget::onTextChanged()
{
    m_pParameter->setValue(value());
}
