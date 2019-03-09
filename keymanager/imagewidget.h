#ifndef IMAGEWIDGET_H
#define IMAGEWIDGET_H

// Qt
#include <QWidget>
#include <QImage>

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
    virtual void load(const QString &sImagePath);

protected:
    //! Handle paint event
    virtual void paintEvent(QPaintEvent *event);

    //! Compute scale factor
    double computeScaleFactor(const QRect &srcRect, const QRect &dstRect);

protected:
    //! Image
    QImage m_image;
};

#endif // IMAGEWIDGET_H
