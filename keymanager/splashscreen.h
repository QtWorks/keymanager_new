#ifndef SPLASHSCREEN_H
#define SPLASHSCREEN_H

// Qt
#include <QDialog>

namespace Ui {
class SplashScreen;
}

class ImageWidget : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit ImageWidget(QWidget *pParent=nullptr);

    //! Destructor
    virtual ~ImageWidget();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Load
    void load(const QString &sImagePath);

protected:
    //! Handle paint event
    virtual void paintEvent(QPaintEvent *event);

private:
    //! Compute scale factor
    double computeScaleFactor(const QRect &srcRect, const QRect &dstRect);

private:
    //! Image
    QImage m_image;
};

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
    void setImage(const QString &sImagePath);

    //! Set status text
    void setStatusText(const QString &sStatusText);

    //! Set progress
    void setProgress(int iProgress);

private:
    //! User interface
    Ui::SplashScreen *m_pUI=nullptr;
};

#endif // SPLASHSCREEN_H
