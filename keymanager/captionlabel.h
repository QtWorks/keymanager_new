#ifndef CAPTIONLABEL_H
#define CAPTIONLABEL_H

// Qt
#include <QWidget>

// Application
namespace Ui {
class CaptionLabel;
}

class CaptionLabel : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit CaptionLabel(QWidget *pParent=nullptr);

    //! Destructor
    ~CaptionLabel();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Set current
    void setCurrent(bool bCurrent);

    //! Set caption
    void setCaption(const QString &sCaption);

    //! Set button label
    void setButtonLabel(const QString &sButtonLabel);

    //! Set expandable
    void setExpandable(bool bExpandable);

    //! Update enabled state
    void updateEnabledState(bool bEnabled);

    //! Set block always opened
    void setBlockAlwaysOpened(bool bBlockAlwaysOpened);

    //! Set can clear block
    void setCanClearBlock(bool bCanClearBlock);

protected:
    //! Paint event
    void paintEvent(QPaintEvent *pEvent);

    //! Mouse press event
    virtual void mousePressEvent(QMouseEvent *pEvent);

    //! Mouse double click event
    virtual void mouseDoubleClickEvent(QMouseEvent *pEvent);

private:
    //! UI
    Ui::CaptionLabel *m_pUI=nullptr;

    //! Enabled?
    bool m_bIsEnabled=true;

    //! Expandable?
    bool m_bExpandable=true;

    //! Is current?
    bool m_bIsCurrent=false;

    //! Block always opened?
    bool m_bBlockAlwaysOpened=false;

    //! Can clear block?
    bool m_bCanClearBlock=true;

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! Open or close
    void onOpenOrClose();

    //! Clear all
    void onClearAll();

    //! State changed
    void onStateChanged(bool bIsClosed);

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! Open/Close
    void openOrClose();

    //! Clear all
    void clearAll();

    //! Select me
    void selectMe();
};

#endif // CAPTIONLABEL_H
