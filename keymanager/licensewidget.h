#ifndef LICENSEWIDGET_H
#define LICENSEWIDGET_H

// Qt
#include <QWidget>

// Application
namespace Ui {
class LicenseWidget;
}

class LicenseWidget : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit LicenseWidget(QWidget *pParent=nullptr);

    //! Destructor
    ~LicenseWidget();

private:
    //! User interface
    Ui::LicenseWidget *m_pUI=nullptr;
};

#endif // LICENSEWIDGET_H
