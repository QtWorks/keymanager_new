#ifndef DOUBLETRIPLETWIDGET_H
#define DOUBLETRIPLETWIDGET_H

// Application
#include "basewidget.h"
namespace Ui {
class DoubleTripletWidget;
}

class DoubleTripletWidget : public BaseWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit DoubleTripletWidget(Parameter *pParameter, QWidget *pParent=nullptr);

    //! Destructor
    virtual ~DoubleTripletWidget();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Set label
    void setLabel(const QString &sLabel);

    //! Return value
    QString value() const;

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Apply default value
    virtual void applyDefaultValue();

    //! Apply value
    virtual void applyValue(const QString &sValue);

private:
    //! UI
    Ui::DoubleTripletWidget *m_pUI=nullptr;

public slots:
    //! Text changed
    void onTextChanged();
};

#endif // DOUBLETRIPLETWIDGET_H
