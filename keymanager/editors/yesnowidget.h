#ifndef YESNOWIDGET_H
#define YESNOWIDGET_H

// Application
#include "basewidget.h"
class QRadioButton;
namespace Ui {
class YesNoWidget;
}

class YesNoWidget : public BaseWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit YesNoWidget(Parameter *pParameter, QWidget *pParent);

    //! Destructor
    virtual ~YesNoWidget();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Apply default value
    virtual void applyDefaultValue();

    //! Apply value
    virtual void applyValue(const QString &sValue);

private:
    //! UI
    Ui::YesNoWidget *m_pUI=nullptr;

public slots:
    //! Radio button clicked
    void onRadioButtonToggled(bool bClicked);

signals:
    //! Selection changed
    void selectionChanged(const QString &sSelection);
};

#endif // YESNOWIDGET_H
