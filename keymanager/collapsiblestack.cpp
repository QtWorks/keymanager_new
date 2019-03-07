// Qt
#include <QVBoxLayout>
#include <QDebug>

// Application
#include "collapsiblestack.h"
#include "collapsibleblock.h"
#include "parameterblock.h"
#include "constants.h"
#include "helper.h"

//-------------------------------------------------------------------------------------------------

CollapsibleStack::CollapsibleStack(QWidget *parent) : QWidget(parent)
{
    setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
    m_pLayout = new QVBoxLayout(this);
    m_pLayout->setSpacing(0);
    setLayout(m_pLayout);
}

//-------------------------------------------------------------------------------------------------

CollapsibleStack::~CollapsibleStack()
{
    Helper::info("DESTROY COLLAPSIBLE STACK");
}

//-------------------------------------------------------------------------------------------------

QVector<CollapsibleBlock *> CollapsibleStack::childBlocks() const
{
    return m_vBlocks;
}

//-------------------------------------------------------------------------------------------------

void CollapsibleStack::addBlock(CollapsibleBlock *pBlock)
{
    if (pBlock != nullptr)
    {
        m_vBlocks << pBlock;
        m_pLayout->addWidget(pBlock);
        m_pLayout->setAlignment(pBlock, Qt::AlignTop);
    }
}

//-------------------------------------------------------------------------------------------------

void CollapsibleStack::openAll()
{
    foreach (CollapsibleBlock *pBlock, m_vBlocks)
        if (pBlock != nullptr)
            pBlock->onOpenOrClose(false);
}

//-------------------------------------------------------------------------------------------------

void CollapsibleStack::closeAll()
{
    foreach (CollapsibleBlock *pBlock, m_vBlocks)
        if (pBlock != nullptr)
            pBlock->onOpenOrClose(true);
}


