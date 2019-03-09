// Qt
#include <QPainter>

// Application
#include "imagewidget.h"
#include "helper.h"

//-------------------------------------------------------------------------------------------------

ImageWidget::ImageWidget(QWidget *pParent) : QWidget(pParent)
{

}

//-------------------------------------------------------------------------------------------------

ImageWidget::~ImageWidget()
{

}

//-------------------------------------------------------------------------------------------------

void ImageWidget::load(const QString &sImagePath)
{
    if (!m_image.load(sImagePath))
    {
        QString sError = QString("ImageWidget::load COULD NOT LOAD %1").arg(sImagePath);
        Helper::error(sError);
    }
    else update();
}

//-------------------------------------------------------------------------------------------------

double ImageWidget::computeScaleFactor(const QRect &srcRect, const QRect &dstRect)
{
    double dScale = -1;
    if ((srcRect.width() > 0) && (srcRect.height() > 0))
        dScale = qMin((double)dstRect.width()/(double)srcRect.width(), (double)dstRect.height()/(double)srcRect.height());
    return dScale;
}

//-------------------------------------------------------------------------------------------------

void ImageWidget::paintEvent(QPaintEvent *event)
{
    QWidget::paintEvent(event);
    QPainter painter(this);

    if (!m_image.isNull())
    {
        QRect srcRect = m_image.rect();
        QRect dstRect = rect();
        double dScaleFactor = computeScaleFactor(srcRect, dstRect);
        if (dScaleFactor > 0)
        {
            int iTargetHeight = qRound(srcRect.height()*dScaleFactor);
            int iTargetWidth = qRound(srcRect.width()*dScaleFactor);
            double x = (dstRect.width()-iTargetWidth)/2;
            double y = (dstRect.height()-iTargetHeight)/2;
            QRect targetRect(QPoint(x, y), QSize(iTargetWidth, iTargetHeight));
            painter.drawImage(targetRect, m_image, srcRect);
        }
    }
}
