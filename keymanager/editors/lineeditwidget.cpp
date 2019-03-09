// Qt
#include "lineeditwidget.h"
#include "ui_lineeditwidget.h"
#include <QDebug>

// Application
#include "parameter.h"
#include "constants.h"
#include "key.h"
#include "helper.h"

//-------------------------------------------------------------------------------------------------

LineEditWidget::LineEditWidget(Parameter *pParameter, QWidget *pParent) :
    BaseWidget(pParameter, pParent), m_pUI(new Ui::LineEditWidget)
{
    m_pUI->setupUi(this);

    // Set default value
    setDefaultValue(m_pParameter->getAttributeValue(PROPERTY_DEFAULT));

    // Set auto script
    setAutoScript(m_pParameter->getAttributeValue(PROPERTY_AUTO));

    // Set enabled condition
    setEnabledCondition(m_pParameter->getAttributeValue(PROPERTY_ENABLED));

    bool bValidateOnReturnPressed = (m_pParameter->getAttributeValue(PROPERTY_UI) == WIDGET_LINE_EDIT_RETURN);
    if (bValidateOnReturnPressed)
        connect(m_pUI->lineEdit, &QLineEdit::returnPressed, this, &LineEditWidget::onTextChanged, Qt::UniqueConnection);
    else
        connect(m_pUI->lineEdit, &QLineEdit::textChanged, this, &LineEditWidget::onTextChanged, Qt::UniqueConnection);

    // Set label
    setLabel(m_pParameter->getAttributeValue(PROPERTY_NAME));
}

//-------------------------------------------------------------------------------------------------

LineEditWidget::~LineEditWidget()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void LineEditWidget::setValidator(QValidator *pValidator)
{
    m_pUI->lineEdit->setValidator(pValidator);
}

//-------------------------------------------------------------------------------------------------

void LineEditWidget::setLabel(const QString &sLabel)
{
    QFont font;
    font.setFamily("Segoe UI");
    font.setPixelSize(16);
    QFontMetrics fm(font);

    // Find max text width
    int iMaxTextWidth = fm.width(sLabel);
    m_pUI->label->setFixedWidth(qMax(172, iMaxTextWidth));
    m_pUI->label->setText(sLabel);
}

//-------------------------------------------------------------------------------------------------

void LineEditWidget::applyDefaultValue()
{
    m_pUI->lineEdit->setText(defaultValue());
    onTextChanged();
}

//-------------------------------------------------------------------------------------------------

void LineEditWidget::applyValue(const QString &sValue)
{
    m_pUI->lineEdit->setText(sValue);
    onTextChanged();
}

//-------------------------------------------------------------------------------------------------

void LineEditWidget::onTextChanged()
{
    m_pParameter->setValue(m_pUI->lineEdit->text());
}

//-------------------------------------------------------------------------------------------------

void LineEditWidget::onEvaluateAutoScript()
{
    bool bSuccess = false;
    QString sValue = Helper::evaluateAutoScript(m_pParameter->getParentBlock(), autoScript(), bSuccess);
    if (bSuccess)
        m_pUI->lineEdit->setText(sValue);
}

