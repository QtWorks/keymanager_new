// Qt
#include <QFileDialog>
#include <QSettings>

// Application
#include "filepickerwidget.h"
#include "ui_filepickerwidget.h"
#include "constants.h"
#include "helper.h"
#include "parameter.h"

//-------------------------------------------------------------------------------------------------

FilePickerWidget::FilePickerWidget(Parameter *pParameter, const QString &sExtension, QWidget *pParent) :
    BaseWidget(pParameter, pParent), m_pUI(new Ui::FilePickerWidget), m_sFileExtension(sExtension)
{
    // Setup UI
    m_pUI->setupUi(this);

    // Set label
    setLabel(m_pParameter->getAttributeValue(PROPERTY_NAME));

    // Set default value
    setDefaultValue(m_pParameter->getAttributeValue(PROPERTY_DEFAULT));

    // Set auto script
    setAutoScript(m_pParameter->getAttributeValue(PROPERTY_AUTO));

    // Set enabled condition
    setEnabledCondition(m_pParameter->getAttributeValue(PROPERTY_ENABLED));

    connect(m_pUI->openButton, &QPushButton::clicked, this, &FilePickerWidget::onOpenClicked, Qt::UniqueConnection);
    connect(m_pUI->lineEdit, &QLineEdit::textChanged, this, &FilePickerWidget::onFilePickerTextChanged, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

FilePickerWidget::~FilePickerWidget()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void FilePickerWidget::onOpenClicked()
{
    QString sFileName = QFileDialog::getOpenFileName(this,
        tr("Open File"), Helper::settingsValue(LAST_VISITED_DIR), m_sFileExtension);
    if (!sFileName.isEmpty())
    {
        Helper::updateSettings(sFileName);
        m_pUI->lineEdit->setText(sFileName);
    }
}

//-------------------------------------------------------------------------------------------------

void FilePickerWidget::setLabel(const QString &sLabel)
{
    m_pUI->label->setText(sLabel);
}

//-------------------------------------------------------------------------------------------------

void FilePickerWidget::setExtension(const QString &sExtension)
{
    m_sFileExtension = sExtension;
}

//-------------------------------------------------------------------------------------------------

void FilePickerWidget::applyDefaultValue()
{
    applyValue(defaultValue());
}

void FilePickerWidget::applyValue(const QString &sValue)
{
    m_pUI->lineEdit->setText(sValue);
}

//-------------------------------------------------------------------------------------------------

void FilePickerWidget::onFilePickerTextChanged()
{
    m_pParameter->setValue(m_pUI->lineEdit->text());
}
