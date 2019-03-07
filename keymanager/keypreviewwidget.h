#ifndef KEYPREVIEWWIDGET_H
#define KEYPREVIEWWIDGET_H

// Qt
#include <QWidget>
#include <QImage>

// Application
class KeyManager;
class Controller;
class CollapsibleBlock;

class KeyPreviewWidget : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit KeyPreviewWidget(QWidget *pParent=nullptr);

    //! Destructor
    ~KeyPreviewWidget();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Set controller
    void setKeyManager(KeyManager *pKeyManager);

    //! Set no cut selected
    void setNoCutSelected(bool bNoCutSelected);

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Load
    void load(const QString &sPreviewImage);

protected:
    //! Handle paint event
    virtual void paintEvent(QPaintEvent *event);

private:
    //! Compute scale factor
    static double computeScaleFactor(const QRect &srcRect, const QRect &dstRect);

private:
    //! Own image
    QImage *m_pKeyImage=nullptr;

    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! No cut selected?
    bool m_bNoCutSelected=true;

public slots:
    //! Block selection status changed
    void onBlockSelectionStatusChanged(CollapsibleBlock *pBlock);
};

#endif // KEYPREVIEWWIDGET_H
