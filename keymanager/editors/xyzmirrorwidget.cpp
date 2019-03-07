// Qt
#include <QDebug>

// Application
#include "xyzmirrorwidget.h"
#include "ui_xyzmirrorwidget.h"
#include "constants.h"
#include "parameter.h"

//-------------------------------------------------------------------------------------------------

XYZMirrorWidget::XYZMirrorWidget(Parameter *pParameter, QWidget *pParent) :
    BaseWidget(pParameter, pParent), m_pUI(new Ui::XYZMirrorWidget)
{
    m_pUI->setupUi(this);

    // Set default value
    setDefaultValue(m_pParameter->getAttributeValue(PROPERTY_DEFAULT));

    // Set auto script
    setAutoScript(m_pParameter->getAttributeValue(PROPERTY_AUTO));

    // Set enabled condition
    setEnabledCondition(m_pParameter->getAttributeValue(PROPERTY_ENABLED));

    connect(m_pUI->xCheckBox, &QCheckBox::clicked, this, &XYZMirrorWidget::onXCheckedChanged, Qt::UniqueConnection);
    connect(m_pUI->yCheckBox, &QCheckBox::clicked, this, &XYZMirrorWidget::onYCheckedChanged, Qt::UniqueConnection);
    connect(m_pUI->zCheckBox, &QCheckBox::clicked, this, &XYZMirrorWidget::onZCheckedChanged, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

XYZMirrorWidget::~XYZMirrorWidget()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void XYZMirrorWidget::applyDefaultValue()
{
    applyValue(defaultValue());
}

//-------------------------------------------------------------------------------------------------

void XYZMirrorWidget::applyValue(const QString &sValue)
{
    m_pUI->xCheckBox->blockSignals(true);
    m_pUI->yCheckBox->blockSignals(true);
    m_pUI->zCheckBox->blockSignals(true);

    QString sFormattedDefaultValue = sValue;
    sFormattedDefaultValue.replace("[", "");
    sFormattedDefaultValue.replace("]", "");
    QStringList lSplitted = sFormattedDefaultValue.split(",");
    if (lSplitted.size() != 3)
    {
        lSplitted.clear();
        lSplitted << "0" << "0" << "0";
    }

    m_pUI->xCheckBox->setChecked(lSplitted.first() != "0");
    m_pUI->yCheckBox->setChecked(lSplitted[1] != "0");
    m_pUI->zCheckBox->setChecked(lSplitted[2] != "0");

    m_pUI->xCheckBox->blockSignals(false);
    m_pUI->yCheckBox->blockSignals(false);
    m_pUI->zCheckBox->blockSignals(false);
    m_pParameter->setValue(value());
}

//-------------------------------------------------------------------------------------------------

QString XYZMirrorWidget::value() const
{
    QString sFormattedValue = QString("[%1,%2,%3]").arg(m_pUI->xCheckBox->isChecked() ? "1" : "0").
            arg(m_pUI->yCheckBox->isChecked() ? "1" : "0").arg(m_pUI->zCheckBox->isChecked() ? "1" : "0");
    return sFormattedValue;
}

//-------------------------------------------------------------------------------------------------

void XYZMirrorWidget::onXCheckedChanged(bool bChecked)
{
    Q_UNUSED(bChecked);
    m_pParameter->setValue(value());
}

//-------------------------------------------------------------------------------------------------

void XYZMirrorWidget::onYCheckedChanged(bool bChecked)
{
    Q_UNUSED(bChecked);
    m_pParameter->setValue(value());
}

//-------------------------------------------------------------------------------------------------

void XYZMirrorWidget::onZCheckedChanged(bool bChecked)
{
    Q_UNUSED(bChecked);
    m_pParameter->setValue(value());
}
