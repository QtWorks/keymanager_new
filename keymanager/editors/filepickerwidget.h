#ifndef FILEPICKERWIDGET_H
#define FILEPICKERWIDGET_H

// Application
#include "basewidget.h"
class QLineEdit;
namespace Ui {
class FilePickerWidget;
}

class FilePickerWidget : public BaseWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit FilePickerWidget(Parameter *pParameter, const QString &sExtension, QWidget *pParent=nullptr);

    //! Destructor
    virtual ~FilePickerWidget();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Set label
    void setLabel(const QString &sLabel);

    //! Set extension
    void setExtension(const QString &sExtenion);

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Apply default value
    virtual void applyDefaultValue();

    //! Apply value
    virtual void applyValue(const QString &sValue);

private:
    //! UI
    Ui::FilePickerWidget *m_pUI=nullptr;

    //! File extension
    QString m_sFileExtension="";

public slots:
    //! Open clicked
    void onOpenClicked();

    //! File picker text changed
    void onFilePickerTextChanged();
};

#endif // FILEPICKERWIDGET_H
