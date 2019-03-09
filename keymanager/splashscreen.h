#ifndef SPLASHSCREEN_H
#define SPLASHSCREEN_H

// Qt
#include <QDialog>

namespace Ui {
class SplashScreen;
}

class SplashScreen : public QDialog
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit SplashScreen(QWidget *pParent=nullptr);

    //! Destructor
    ~SplashScreen();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Set image
    void load(const QString &sSplashImage);

    //! Set status text
    void setStatusText(const QString &sStatusText);

    //! Set progress
    void setProgress(int iProgress);

private:
    //! User interface
    Ui::SplashScreen *m_pUI=nullptr;
};

#endif // SPLASHSCREEN_H
