#ifndef LINEEDITWIDGET_H
#define LINEEDITWIDGET_H

// Qt
class QValidator;

// Application
#include "basewidget.h"
namespace Ui {
class LineEditWidget;
}

class LineEditWidget : public BaseWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit LineEditWidget(Parameter *pParameter, QWidget *pParent=nullptr);

    //! Destructor
    virtual ~LineEditWidget();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Set validator
    void setValidator(QValidator *pValidator);

    //! Set label
    void setLabel(const QString &sLabel);

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Apply default value
    virtual void applyDefaultValue();

    //! Apply value
    virtual void applyValue(const QString &sValue);

private:
    //! UI
    Ui::LineEditWidget *m_pUI=nullptr;

public slots:
    //! Text changed
    void onTextChanged();

    //! Evaluate auto script
    virtual void onEvaluateAutoScript();
};

#endif // LINEEDITWIDGET_H
