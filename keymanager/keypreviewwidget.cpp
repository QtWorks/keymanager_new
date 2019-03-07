// Qt
#include <QPainter>

// Application
#include "keypreviewwidget.h"
#include "keymanager.h"
#include "constants.h"
#include "collapsibleblock.h"
#include "parameter.h"
#include "block.h"
#include "helper.h"
#include "keyparser.h"

//-------------------------------------------------------------------------------------------------

KeyPreviewWidget::KeyPreviewWidget(QWidget *pParent) : QWidget(pParent)
{
    m_pKeyImage = new QImage();
}

//-------------------------------------------------------------------------------------------------

KeyPreviewWidget::~KeyPreviewWidget()
{
    delete m_pKeyImage;
}

//-------------------------------------------------------------------------------------------------

void KeyPreviewWidget::setKeyManager(KeyManager *pKeyManager)
{
    m_pKeyManager = pKeyManager;
    connect(m_pKeyManager, &KeyManager::blockSelectionStatusChanged, this, &KeyPreviewWidget::onBlockSelectionStatusChanged, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

void KeyPreviewWidget::setNoCutSelected(bool bNoCutSelected)
{
    m_bNoCutSelected = bNoCutSelected;
    update();
}

//-------------------------------------------------------------------------------------------------

void KeyPreviewWidget::load(const QString &sPreviewImage)
{
    if (!m_pKeyImage->load(sPreviewImage))
    {
        QString sError = QString("KeyPreviewWidget::load COULD NOT LOAD %1").arg(sPreviewImage);
        Helper::error(sError);
    }
    else update();
}

//-------------------------------------------------------------------------------------------------

void KeyPreviewWidget::paintEvent(QPaintEvent *event)
{
    QWidget::paintEvent(event);
    QPainter painter(this);
    QPen pen;
    pen.setColor(Qt::red);
    QFont font;
    font.setFamily("Segoe UI");
    font.setPixelSize(24);

    QString sLabel = tr("NO KEY IMAGE");
    painter.setPen(pen);
    painter.setFont(font);
    painter.drawText(rect(), Qt::AlignCenter, sLabel);

    if (m_pKeyImage != nullptr)
    {
        QRect srcRect = m_pKeyImage->rect();
        QRect dstRect = rect();
        double dScaleFactor = computeScaleFactor(srcRect, dstRect);
        if (dScaleFactor > 0)
        {
            int iTargetHeight = qRound(srcRect.height()*dScaleFactor);
            int iTargetWidth = qRound(srcRect.width()*dScaleFactor);
            double x = (dstRect.width()-iTargetWidth)/2;
            double y = (dstRect.height()-iTargetHeight)/2;
            QRect targetRect(QPoint(x, y), QSize(iTargetWidth, iTargetHeight));
            painter.drawImage(targetRect, *m_pKeyImage, srcRect);
            if (m_bNoCutSelected)
            {
                pen.setColor("orange");
                painter.setPen(pen);
                painter.drawText(targetRect,  Qt::AlignCenter, QString("NO CUT SELECTED"));
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------

double KeyPreviewWidget::computeScaleFactor(const QRect &srcRect, const QRect &dstRect)
{
    double dScale = -1;
    if ((srcRect.width() > 0) && (srcRect.height() > 0))
        dScale = qMin((double)dstRect.width()/(double)srcRect.width(), (double)dstRect.height()/(double)srcRect.height());
    return dScale;
}

//-------------------------------------------------------------------------------------------------

void KeyPreviewWidget::onBlockSelectionStatusChanged(CollapsibleBlock *pBlock)
{
    Q_UNUSED(pBlock);
    QVector<QString> vWatchedParameters;
    vWatchedParameters << "qt_regular_cut_use_qt"
        << "qt_round_pump_cut_use_qt"
        << "qt_lever_lock_cut_use_qt"
        << "qt_abloy_classic_cut_use_qt"
        << "qt_abloy_disklock_cut_use_qt"
        << "qt_abloy_protec_cut_use_qt"
        << "qt_abus_plus_cut_qt"
        << "qt_axi_home_cut_use_qt"
        << "qt_fichet_787_cut_use_qt"
        << "qt_extra_cut_use_qt";
    bool bNoCutSelected = true;
    foreach (QString sParameterVariable, vWatchedParameters)
    {
        Parameter *pParameter = KeyParser::getParameterByVariableName(pBlock->getBlock()->getParentKey(), sParameterVariable);
        if (pParameter != nullptr)
        {
            QString sValue = pParameter->getValue();
            if (sValue == VALUE_YES)
            {
                bNoCutSelected = false;
                break;
            }
        }
    }
    setNoCutSelected(bNoCutSelected);
}
