#ifndef MAINWINDOW_H
#define MAINWINDOW_H

// Qt
#include <QMainWindow>

// Application
class Key;
class KeyManager;

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit MainWindow(KeyManager *pKeyManager, QWidget *pParent=nullptr);

    //! Destructor
    ~MainWindow();

private:
    //! Load CSS
    void loadCSS();

    //! Add new tab for given key
    void addKeyTab(Key *pKey);

private:
    //! User interface
    Ui::MainWindow *m_pUI=nullptr;

    //! Keymanager
    KeyManager *m_pKeyManager=nullptr;

public slots:
    //! Build UI
    void onKeyParsingDone();
};

#endif // MAINWINDOW_H
