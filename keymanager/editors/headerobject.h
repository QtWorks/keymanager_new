#ifndef HEADEROBJECT_H
#define HEADEROBJECT_H

#include <QWidget>

namespace Ui {
class HeaderObject;
}

class HeaderObject : public QWidget
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit HeaderObject(QWidget *pParent=nullptr);

    //! Constructor
    HeaderObject(int iColumnIndex, const QString &sLabel, QWidget *pParent=nullptr);

    //! Destructor
    ~HeaderObject();

private:
    //! UI
    Ui::HeaderObject *m_pUI=nullptr;

    //! Column index
    int m_iColumnIndex=-1;

public slots:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! Button clicked
    void onButtonClicked();

signals:
    //-------------------------------------------------------------------------------------------------
    // Slots
    //-------------------------------------------------------------------------------------------------

    //! Button clicked
    void clearClicked(int iColumnIndex);
};

#endif // HEADEROBJECT_H
