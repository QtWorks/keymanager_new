#ifndef CODEEDITOR_H
#define CODEEDITOR_H

// Qt
#include <QWidget>

namespace Ui {
class CodeEditor;
}

class CodeEditor : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit CodeEditor(QWidget *pParent=nullptr);

    //! Destructor
    ~CodeEditor();

    //! Load
    void load(const QString &sInputString);

private:
    //! UI
    Ui::CodeEditor *m_pUI=nullptr;

public slots:
    //! Search text changed, highlight
    void onSearchTextChanged();
};

#endif // CODEEDITOR_H
