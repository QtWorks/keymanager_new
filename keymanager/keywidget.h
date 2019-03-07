#ifndef KEYWIDGET_H
#define KEYWIDGET_H

// Qt
#include <QWidget>

// Application
class KeyManager;
class Key;
namespace Ui {
class KeyWidget;
}

class KeyWidget : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit KeyWidget(KeyManager *pKeyManager, Key *pKey, QWidget *pParent=nullptr);

    //! Destructor
    ~KeyWidget();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Build menu
    void buildMenu();

private:
    //! User interface
    Ui::KeyWidget *m_pUI=nullptr;

    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Own key
    Key *m_pKey=nullptr;

public slots:
    //! Save key parameters
    void onGenerateSTL();

};

#endif // KEYWIDGET_H
