#ifndef XYZMIRRORWIDGET_H
#define XYZMIRRORWIDGET_H

// Qt
#include <QWidget>

// Application
#include "basewidget.h"
class Parameter;
namespace Ui {
class XYZMirrorWidget;
}

class XYZMirrorWidget : public BaseWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit XYZMirrorWidget(Parameter *pParameter, QWidget *pParent=nullptr);

    //! Destructor
    ~XYZMirrorWidget();

    //! Apply default value
    virtual void applyDefaultValue();

    //! Apply value
    virtual void applyValue(const QString &sValue);

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Return value
    QString value() const;

private:
    //! UI
    Ui::XYZMirrorWidget *m_pUI=nullptr;

public slots:
    //! Listen to checkbox selection
    void onXCheckedChanged(bool bChecked);
    void onYCheckedChanged(bool bChecked);
    void onZCheckedChanged(bool bChecked);
};

#endif // XYZMIRRORWIDGET_H
