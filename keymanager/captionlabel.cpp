// Qt
#include <QPainter>
#include <QPaintEvent>
#include <QDebug>

// Application
#include "captionlabel.h"
#include "ui_captionlabel.h"
#include "collapsibleblock.h"

//-------------------------------------------------------------------------------------------------

CaptionLabel::CaptionLabel(QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::CaptionLabel)
{
    m_pUI->setupUi(this);
    connect(m_pUI->openCloseButton, &QPushButton::clicked, this, &CaptionLabel::onOpenOrClose, Qt::UniqueConnection);
    connect(m_pUI->clearAllButton, &QPushButton::clicked, this, &CaptionLabel::onClearAll, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

CaptionLabel::~CaptionLabel()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::setCurrent(bool bCurrent)
{
    m_bIsCurrent = bCurrent;
    update();
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::setCaption(const QString &sCaption)
{
    m_pUI->label->setText(sCaption);
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::setButtonLabel(const QString &sButtonLabel)
{
    m_pUI->openCloseButton->setText(sButtonLabel);
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::setExpandable(bool bExpandable)
{
    m_bExpandable = bExpandable;
    m_pUI->openCloseButton->setVisible(!m_bBlockAlwaysOpened && bExpandable);
    m_pUI->clearAllButton->setVisible(m_bCanClearBlock);
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::updateEnabledState(bool bEnabled)
{
    m_bIsEnabled = bEnabled;
    m_pUI->openCloseButton->setVisible(!m_bBlockAlwaysOpened && m_bExpandable && bEnabled);
    m_pUI->clearAllButton->setVisible(m_bCanClearBlock && bEnabled);
    update();
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::setBlockAlwaysOpened(bool bBlockAlwaysOpened)
{
    m_bBlockAlwaysOpened = bBlockAlwaysOpened;
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::setCanClearBlock(bool bCanClearBlock)
{
    m_bCanClearBlock = bCanClearBlock;
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::paintEvent(QPaintEvent *pEvent)
{
    QWidget::paintEvent(pEvent);
    QPainter p(this);
    QColor paintColor("#EEEEEE");
    if (m_bIsEnabled)
    {
        if (m_bIsCurrent)
            paintColor.setNamedColor("orange");
        else
            paintColor.setNamedColor("#EEEEEE");
    }
    else
    {
        paintColor.setNamedColor("#B1B1B1");
    }
    p.fillRect(pEvent->rect(), paintColor);
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::mousePressEvent(QMouseEvent *pEvent)
{
    QWidget::mousePressEvent(pEvent);
    emit selectMe();
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::mouseDoubleClickEvent(QMouseEvent *pEvent)
{
    QWidget::mouseDoubleClickEvent(pEvent);
    if (m_bExpandable && !m_bBlockAlwaysOpened)
        emit openOrClose();
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::onStateChanged(bool bIsClosed)
{
    setButtonLabel(bIsClosed ? tr("OPEN") : tr("CLOSE"));
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::onOpenOrClose()
{
    emit openOrClose();
}

//-------------------------------------------------------------------------------------------------

void CaptionLabel::onClearAll()
{
    emit clearAll();
}
