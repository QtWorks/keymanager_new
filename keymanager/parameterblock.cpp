// Qt
#include <QPainter>
#include <QPaintEvent>
#include <QDebug>

// Application
#include "keymanager.h"
#include "block.h"
#include "parameter.h"
#include "parameterblock.h"
#include "ui_parameterblock.h"
#include "constants.h"
#include "helper.h"
#include "collapsibleblock.h"
#include "widgetfactory.h"
#include "./editors/basewidget.h"
#include "./editors/genericparametertable.h"
#include "layoutmgr.h"
#include "keyparser.h"

//-------------------------------------------------------------------------------------------------

ParameterBlock::ParameterBlock(KeyManager *pKeyManager, LayoutMgr *pLayoutManager, Block *pBlock, CollapsibleBlock *pOwner, bool bIsClosed, QWidget *pParent) : QWidget(pParent),
    m_pUI(new Ui::ParameterBlock),
    m_pKeyManager(pKeyManager),
    m_pLayoutManager(pLayoutManager),
    m_pBlock(pBlock),
    m_pOwnerCollapsibleBlock(pOwner)
{
    m_pUI->setupUi(this);
    connect(this, &ParameterBlock::keyPreviewImageReady, m_pLayoutManager, &LayoutMgr::onKeyPreviewImageReady);
    setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
    setVisible(!bIsClosed);
    populateParameterBlock();
}

//-------------------------------------------------------------------------------------------------

ParameterBlock::~ParameterBlock()
{
    delete m_pUI;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::populateParameterBlock()
{
    if (m_pBlock != nullptr)
    {
        // Set name
        setName(m_pBlock->getAttributeValue(PROPERTY_NAME));

        // Set key preview image
        setKeyPreviewImage(m_pBlock->getAttributeValue(PROPERTY_KEY_PREVIEW_IMAGE));

        // Set variable
        setSelectionVariable(m_pBlock->getAttributeValue(PROPERTY_SET_VARIABLE));

        // Set value
        setValue(m_pBlock->getAttributeValue(PROPERTY_VALUE));

        // Block always opened?
        QString sBlockAlwaysOpened = m_pBlock->getAttributeValue(PROPERTY_ALWAYS_OPENED);
        if ((sBlockAlwaysOpened == VALUE_TRUE) || (sBlockAlwaysOpened == VALUE_FALSE))
            m_bBlockAlwaysOpened = (sBlockAlwaysOpened == VALUE_TRUE);

        // Can clear block?
        QString sCanClearBlock = m_pBlock->getAttributeValue(PROPERTY_CAN_CLEAR);
        if ((sCanClearBlock == VALUE_TRUE) || (sCanClearBlock == VALUE_FALSE))
            m_bCanClearBlock = (sCanClearBlock == VALUE_TRUE);

        // Set empty state
        const QVector<Parameter *> &vParameters = m_pBlock->getParameters();
        const QVector<Block *> &vChildBlocks = m_pBlock->getBlocks();
        m_bIsEmpty = (vParameters.isEmpty() && vChildBlocks.isEmpty());
        if (m_bIsEmpty)
        {
            setFixedSize(0, 0);
            setVisible(false);
        }

        // Set exclusive state
        QString sExclusive = m_pBlock->getAttributeValue(PROPERTY_EXCLUSIVE);
        setExclusive(sExclusive.isEmpty() ? true : (sExclusive == VALUE_TRUE));

        // Process enabled condition
        processEnabledCondition();

        // Add widgets
        foreach (Parameter *pParameter, vParameters)
        {
            BaseWidget *pWidget = m_pKeyManager->widgetFactory().buildWidget(pParameter, this);
            if (pWidget != nullptr)
            {
                addWidget(pWidget);
                m_vWidgets << pWidget;
            }
        }

        // Add child recursively
        addChildRecursively(m_pBlock);
    }
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::addWidget(BaseWidget *pWidget)
{
    if (pWidget != nullptr)
    {
        m_pUI->verticalLayout->addWidget(pWidget);
        m_pUI->verticalLayout->setAlignment(pWidget, Qt::AlignTop);
    }
}

//-------------------------------------------------------------------------------------------------

int ParameterBlock::nParents() const
{
    int nParents = 0;
    CollapsibleBlock *pOwnerCollapsibleBlock = m_pOwnerCollapsibleBlock;
    while (pOwnerCollapsibleBlock != nullptr)
    {
        nParents++;
        pOwnerCollapsibleBlock = pOwnerCollapsibleBlock->parentBlock();
    }
    return nParents;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::addCollapsibleBlock(CollapsibleBlock *pBlock)
{
    if (pBlock != nullptr)
    {
        m_pUI->verticalLayout->addWidget(pBlock);
        m_pUI->verticalLayout->setAlignment(pBlock, Qt::AlignTop);
    }
}

//-------------------------------------------------------------------------------------------------

const QString &ParameterBlock::name() const
{
    return m_sName;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::setName(const QString &sName)
{
    m_sName = sName;
}

//-------------------------------------------------------------------------------------------------

const QString &ParameterBlock::keyPreviewImage() const
{
    return m_sKeyPreviewImage;
}

//-------------------------------------------------------------------------------------------------

const QString &ParameterBlock::keyPreviewLabel() const
{
    return m_sKeyPreviewImage;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::setKeyPreviewImage(const QString &sKeyPreviewImage)
{
    if (m_sKeyPreviewImage.isEmpty() && !sKeyPreviewImage.isEmpty())
    {
        m_sKeyPreviewImage = sKeyPreviewImage;
        emit keyPreviewImageReady(sKeyPreviewImage);
    }
}

//-------------------------------------------------------------------------------------------------

const QString &ParameterBlock::selectionVariable() const
{
    return m_sSelectionVariable;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::setSelectionVariable(const QString &sParameterVariable)
{
    m_sSelectionVariable = sParameterVariable;
}

//-------------------------------------------------------------------------------------------------

const QString &ParameterBlock::value() const
{
    return m_sValue;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::setValue(const QString &sValue)
{
    m_sValue = sValue;
}

//-------------------------------------------------------------------------------------------------

bool ParameterBlock::isEmpty() const
{
    return m_bIsEmpty;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::setEnabled(bool bEnabled)
{
    m_bIsEnabled = bEnabled;
    QWidget::setEnabled(bEnabled);
    CollapsibleBlock *pOwnerCollapsibleBlock = dynamic_cast<CollapsibleBlock *>(parentWidget());
    if (pOwnerCollapsibleBlock != nullptr)
        pOwnerCollapsibleBlock->onUpdateEnabledState(bEnabled);
}

//-------------------------------------------------------------------------------------------------

bool ParameterBlock::isEnabled() const
{
    return m_bIsEnabled;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::setExclusive(bool bIsExclusive)
{
    m_bIsExclusive = bIsExclusive;
}

//-------------------------------------------------------------------------------------------------

bool ParameterBlock::isExclusive() const
{
    return m_bIsExclusive;
}

//-------------------------------------------------------------------------------------------------

CollapsibleBlock *ParameterBlock::ownerCollapsibleBlock() const
{
    return m_pOwnerCollapsibleBlock;
}

//-------------------------------------------------------------------------------------------------

bool ParameterBlock::blockAlwaysOpened() const
{
    return m_bBlockAlwaysOpened;
}

//-------------------------------------------------------------------------------------------------

bool ParameterBlock::canClearBlock() const
{
    return m_bCanClearBlock;
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::setWatchedParameters(const QHash<QString, Parameter *> &hParameters)
{
    m_hWatchedParameters = hParameters;
    for (QHash<QString, Parameter *>::iterator it=m_hWatchedParameters.begin(); it!=m_hWatchedParameters.end(); ++it)
        connect(it.value(), &Parameter::parameterValueChanged, this, &ParameterBlock::onEvaluateEnabledCondition, Qt::UniqueConnection);
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::onEvaluateEnabledCondition()
{
    bool bSuccess = true;
    bool bEnabled = Helper::evaluateEnabledCondition(m_pBlock, m_sEnabledCondition, bSuccess);
    if (bSuccess)
        setEnabled(bEnabled);
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::clearAll()
{
    foreach (BaseWidget *pWidget, m_vWidgets)
        if (pWidget != nullptr)
        {
            GenericParameterTable *pTable = dynamic_cast<GenericParameterTable *>(pWidget);
            if (pTable != nullptr)
                pTable->clearAll();
            else
                pWidget->applyDefaultValue();
        }
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::addChildRecursively(Block *pBlock)
{
    if (pBlock != nullptr)
    {
        // Parse child blocks
        const QVector<Block *> &vChildBlocks = pBlock->getBlocks();
        foreach (Block *pChildBlock, vChildBlocks)
        {
            // Create new collapsible block
            CollapsibleBlock *pNewBlock = new CollapsibleBlock(m_pKeyManager, m_pLayoutManager, pChildBlock, this);
            if (m_pOwnerCollapsibleBlock != nullptr)
                m_pOwnerCollapsibleBlock->addChildBlock(pNewBlock);

            // Add to own layout
            addCollapsibleBlock(pNewBlock);
        }
    }
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::processEnabledCondition()
{
    // Read enabled condition
    m_sEnabledCondition = m_pBlock->getAttributeValue(PROPERTY_ENABLED);

    if (!m_sEnabledCondition.isEmpty())
    {
        QVector<QString> vVariableNames = Helper::extractVariableNames(m_sEnabledCondition);
        QHash<QString, Parameter *> hParameters;
        foreach (QString sParameterVariable, vVariableNames)
        {
            Parameter *pParameter = KeyParser::getParameterByVariableName(m_pBlock->getParentKey(), sParameterVariable);
            if (pParameter != nullptr)
                hParameters[sParameterVariable] = pParameter;
        }
        if (!hParameters.isEmpty() && (hParameters.size() == vVariableNames.size()))
            setWatchedParameters(hParameters);
    }
}

//-------------------------------------------------------------------------------------------------

void ParameterBlock::paintEvent(QPaintEvent *e)
{
    QWidget::paintEvent(e);
    /* TEST ONLY
    QPainter p(this);
    QColor paintColor = sBlockColors[nParents()];
    p.fillRect(e->rect(), paintColor);
    */
}
