// Application
#include "headerobject.h"
#include "ui_headerobject.h"

//-------------------------------------------------------------------------------------------------

HeaderObject::HeaderObject(QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::HeaderObject)
{
    m_pUI->setupUi(this);
}

//-------------------------------------------------------------------------------------------------

HeaderObject::HeaderObject(int iColumnIndex, const QString &sLabel, QWidget *parent) : QWidget(parent),
    m_pUI(new Ui::HeaderObject), m_iColumnIndex(iColumnIndex)
{
    m_pUI->setupUi(this);
    m_pUI->label->setText(sLabel);
    connect(m_pUI->pushButton, &QPushButton::clicked, this, &HeaderObject::onButtonClicked, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

HeaderObject::~HeaderObject()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void HeaderObject::onButtonClicked()
{
    emit clearClicked(m_iColumnIndex);
}
