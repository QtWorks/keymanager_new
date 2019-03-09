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
    setWindowFlags(Qt::FramelessWindowHint|Qt::WindowStaysOnTopHint);
    load(":/images/splashscreen.jpg");
}

//-------------------------------------------------------------------------------------------------

SplashScreen::~SplashScreen()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void SplashScreen::load(const QString &sSplashImage)
{
    m_pUI->imageWidget->load(sSplashImage);
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
