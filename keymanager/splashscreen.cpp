// Qt
#include <QImage>
#include <QPainter>

// Application
#include "splashscreen.h"
#include "ui_splashscreen.h"
#include "helper.h"

//-------------------------------------------------------------------------------------------------

SplashScreen::SplashScreen(QWidget *pParent) : QDialog(pParent),
    m_pUI(new Ui::SplashScreen)
{
    m_pUI->setupUi(this);
}

//-------------------------------------------------------------------------------------------------

SplashScreen::~SplashScreen()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void SplashScreen::setImage(const QString &sImagePath)
{
    QImage image(sImagePath);
    if (!image.isNull())
    {

    }
}

//-------------------------------------------------------------------------------------------------

void SplashScreen::setStatusText(const QString &sStatusText)
{
    m_pUI->loadingStatusLabel->setText(sStatusText);
}

//-------------------------------------------------------------------------------------------------

void SplashScreen::setProgress(int iProgress)
{
    m_pUI->progressBar->setValue(iProgress);
}
