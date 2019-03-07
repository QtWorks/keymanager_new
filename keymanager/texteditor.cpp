// Qt
#include <QtWidgets>

// Application
#include "texteditor.h"

//-------------------------------------------------------------------------------------------------

TextEditor::TextEditor(QWidget *parent) : QPlainTextEdit(parent)
{
    QFont font;
    font.setPixelSize(18);
    setFont(font);
    setReadOnly(true);
    m_pLineNumberArea = new LineNumberArea(this);

    connect(this, SIGNAL(blockCountChanged(int)), this, SLOT(updateLineNumberAreaWidth(int)), Qt::UniqueConnection);
    connect(this, SIGNAL(updateRequest(QRect,int)), this, SLOT(updateLineNumberArea(QRect,int)), Qt::UniqueConnection);
    connect(this, SIGNAL(cursorPositionChanged()), this, SLOT(highlightCurrentLine()), Qt::UniqueConnection);

    updateLineNumberAreaWidth(0);
    highlightCurrentLine();
    setFocus();
}

//-------------------------------------------------------------------------------------------------

TextEditor::~TextEditor()
{

}

//-------------------------------------------------------------------------------------------------

int TextEditor::lineNumberAreaWidth()
{
    int digits = 1;
    int max = qMax(1, blockCount());
    while (max >= 10) {
        max /= 10;
        ++digits;
    }

    int space = 3 + fontMetrics().width(QLatin1Char('9')) * digits;

    return space;
}

//-------------------------------------------------------------------------------------------------

void TextEditor::load(const QString &sText)
{
    document()->setPlainText(sText);
    int iLine = 1;
    QTextCursor cursor(document()->findBlockByLineNumber(iLine-1));
    setTextCursor(cursor);
}

//-------------------------------------------------------------------------------------------------

void TextEditor::updateLineNumberAreaWidth(int)
{
    setViewportMargins(lineNumberAreaWidth(), 0, 0, 0);
}

//-------------------------------------------------------------------------------------------------

void TextEditor::updateLineNumberArea(const QRect &rect, int dy)
{
    if (dy)
        m_pLineNumberArea->scroll(0, dy);
    else
        m_pLineNumberArea->update(0, rect.y(), m_pLineNumberArea->width(), rect.height());

    if (rect.contains(viewport()->rect()))
        updateLineNumberAreaWidth(0);
}

//-------------------------------------------------------------------------------------------------

void TextEditor::resizeEvent(QResizeEvent *e)
{
    QPlainTextEdit::resizeEvent(e);

    QRect cr = contentsRect();
    m_pLineNumberArea->setGeometry(QRect(cr.left(), cr.top(), lineNumberAreaWidth(), cr.height()));
}

//-------------------------------------------------------------------------------------------------

void TextEditor::highlightCurrentLine()
{
    QList<QTextEdit::ExtraSelection> extraSelections;

    if (!isReadOnly()) {
        QTextEdit::ExtraSelection selection;

        QColor lineColor = QColor(Qt::blue).lighter(160);

        selection.format.setBackground(lineColor);
        selection.format.setProperty(QTextFormat::FullWidthSelection, true);
        selection.cursor = textCursor();
        selection.cursor.clearSelection();
        extraSelections.append(selection);
    }

    setExtraSelections(extraSelections);
}

//-------------------------------------------------------------------------------------------------

void TextEditor::lineNumberAreaPaintEvent(QPaintEvent *event)
{
    QPainter painter(m_pLineNumberArea);
    painter.fillRect(event->rect(), Qt::lightGray);
    QTextBlock block = firstVisibleBlock();
    int blockNumber = block.blockNumber();
    int top = (int) blockBoundingGeometry(block).translated(contentOffset()).top();
    int bottom = top + (int) blockBoundingRect(block).height();

    while (block.isValid() && top <= event->rect().bottom()) {
        if (block.isVisible() && bottom >= event->rect().top()) {
            QString number = QString::number(blockNumber + 1);
            painter.setPen(Qt::black);
            painter.drawText(0, top, m_pLineNumberArea->width(), fontMetrics().height(),
                             Qt::AlignRight, number);
        }

        block = block.next();
        top = bottom;
        bottom = top + (int) blockBoundingRect(block).height();
        ++blockNumber;
    }
}

//-------------------------------------------------------------------------------------------------

void TextEditor::doSearch(const QString &sTargetString)
{
    if (m_bIsFirstTime == false)
        document()->undo();
    m_vSearchResults.clear();
    m_iSearchIndex = -1;
    if (!sTargetString.isEmpty())
    {
        QTextCursor highlightCursor(document());
        QTextCursor cursor(document());

        cursor.beginEditBlock();

        QTextCharFormat plainFormat(highlightCursor.charFormat());
        QTextCharFormat colorFormat = plainFormat;
        colorFormat.setForeground(QColor("black"));
        colorFormat.setBackground(QColor("orange"));
        while (!highlightCursor.isNull() && !highlightCursor.atEnd())
        {
            highlightCursor = document()->find(sTargetString, highlightCursor);
            if (!highlightCursor.isNull())
            {
                highlightCursor.movePosition(QTextCursor::WordRight, QTextCursor::KeepAnchor);
                highlightCursor.mergeCharFormat(colorFormat);
                m_vSearchResults << highlightCursor;
            }
        }

        cursor.endEditBlock();
        m_bIsFirstTime = false;
        if (!m_vSearchResults.isEmpty())
            onF3Pressed();
    }
}

//-------------------------------------------------------------------------------------------------

void TextEditor::keyPressEvent(QKeyEvent *event)
{
    QPlainTextEdit::keyPressEvent(event);
    if (!m_vSearchResults.isEmpty())
    {
        if (event->key() == Qt::Key_F3)
        {
            onF3Pressed();
            event->accept();
        }
        else
        if (event->key() == Qt::Key_F4)
        {
            onF4Pressed();
            event->accept();
        }
    }
}

//-------------------------------------------------------------------------------------------------

void TextEditor::onF3Pressed()
{
    m_iSearchIndex++;
    if (m_iSearchIndex > (m_vSearchResults.size()-1))
        m_iSearchIndex = 0;
    QTextCursor highlightCursor = m_vSearchResults[m_iSearchIndex];
    highlightCursor.select(QTextCursor::BlockUnderCursor);
    setTextCursor(highlightCursor);
}

//-------------------------------------------------------------------------------------------------

void TextEditor::onF4Pressed()
{
    m_iSearchIndex--;
    if (m_iSearchIndex < 0)
        m_iSearchIndex = m_vSearchResults.size()-1;
    QTextCursor highlightCursor = m_vSearchResults[m_iSearchIndex];
    highlightCursor.select(QTextCursor::BlockUnderCursor);
    setTextCursor(highlightCursor);
}
