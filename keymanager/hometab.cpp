// Qt
#include <QPainter>
#include <QPen>
#include <QDebug>

// Application
#include "hometab.h"
#include "ui_hometab.h"
#include "cxmlnode.h"
#include "constants.h"

//-------------------------------------------------------------------------------------------------

HomeTab::HomeTab(QWidget *pParent) : DescriptionTaggedWidget(pParent),
    m_pUI(new Ui::HomeTab)
{
    m_pUI->setupUi(this);
}

//-------------------------------------------------------------------------------------------------

HomeTab::~HomeTab()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void HomeTab::paintEvent(QPaintEvent *pEvent)
{
    DescriptionTaggedWidget::paintEvent(pEvent);
    QPainter painter(this);
    QPixmap pixmap(":/images/marque-3001-px.jpg");
    int iSrcWidth = pixmap.width();
    int iSrcHeight = pixmap.height();
    int iTargetWidth = 200;
    int iTargetHeight = 200;
    int iMargin = 8;
    painter.drawPixmap(width()-(iTargetWidth+iMargin), height()-(iTargetHeight+iMargin), iTargetWidth, iTargetHeight, pixmap, 0, 0, iSrcWidth, iSrcHeight);
}
