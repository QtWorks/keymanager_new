// Application
#include "licensewidget.h"
#include "ui_licensewidget.h"

//-------------------------------------------------------------------------------------------------

LicenseWidget::LicenseWidget(QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::LicenseWidget)
{
    m_pUI->setupUi(this);
}
//-------------------------------------------------------------------------------------------------

LicenseWidget::~LicenseWidget()
{
    delete m_pUI;
}
