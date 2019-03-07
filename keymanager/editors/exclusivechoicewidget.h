#ifndef EXCLUSIVECHOICEWIDGET_H
#define EXCLUSIVECHOICEWIDGET_H

// Application
#include "basewidget.h"
class QRadioButton;
namespace Ui {
class ExclusiveChoiceWidget;
}

class ExclusiveChoiceWidget : public BaseWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit ExclusiveChoiceWidget(Parameter *pParameter, QWidget *pParent=nullptr);

    //! Destructor
    virtual ~ExclusiveChoiceWidget();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Setup
    void setup(const QString &sLabel, const QStringList &lLabels, const QStringList &lValues);

    //! Apply default value
    virtual void applyDefaultValue();

    //! Apply value
    virtual void applyValue(const QString &sValue);

private:
    //! UI
    Ui::ExclusiveChoiceWidget *m_pUI=nullptr;

    //! Radio buttons
    QVector<QRadioButton *> m_vRadioButtons;

public slots:
    //! Radio button clicked
    void onRadioButtonToggled(bool bClicked);

signals:
    //! Selection changed
    void selectionChanged(const QString &sSelection);
};

#endif // EXCLUSIVECHOICEWIDGET_H
