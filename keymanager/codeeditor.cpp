// Application
#include "codeeditor.h"
#include "ui_codeeditor.h"

//-------------------------------------------------------------------------------------------------

CodeEditor::CodeEditor(QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::CodeEditor)
{
    m_pUI->setupUi(this);
    connect(m_pUI->searchArea, &QLineEdit::returnPressed, this, &CodeEditor::onSearchTextChanged, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

CodeEditor::~CodeEditor()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void CodeEditor::load(const QString &sInputString)
{
    m_pUI->plainTextEdit->load(sInputString);
}

//-------------------------------------------------------------------------------------------------

void CodeEditor::onSearchTextChanged()
{
    m_pUI->plainTextEdit->doSearch(m_pUI->searchArea->text());
}
