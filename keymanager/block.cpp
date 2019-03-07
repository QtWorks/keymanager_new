// Qt
#include <QDebug>

// Application
#include "key.h"
#include "block.h"
#include "constants.h"
#include "parameter.h"
#include "helper.h"
#include "keyparser.h"

//-------------------------------------------------------------------------------------------------

Block::Block(Block *pParentBlock, const CXMLNode &xBlockNode, QObject *pParent) : QObject(pParent),
    m_pParentBlock(pParentBlock)
{
    // Set attributes
    m_hAttributes = xBlockNode.attributes();

    // Check SET_VARIABLE
    QString sSetVariable = getAttributeValue(PROPERTY_SET_VARIABLE);
    if (!sSetVariable.isEmpty())
    {
        // Type of key
        if (sSetVariable == VARIABLE_TYPE_OF_KEY)
        {
            Parameter *pParameter = Parameter::createParameter(this, sSetVariable);
            if (pParameter != nullptr)
            {
                pParameter->setValue(getAttributeValue(PROPERTY_VALUE));
                KeyParser::addParameter(getParentKey(), pParameter);
            }
            else
            {
                QString sError = QString("Block::Block COULD NOT CREATE A PARAMETER FOR VARIABLE %1").arg(sSetVariable);
                Helper::error(sError);
            }
        }
        else
        // _use_qt type of variable
        if (sSetVariable.contains(USE_QT))
        {
            Parameter *pParameter = Parameter::createParameter(this, sSetVariable);
            if (pParameter != nullptr)
            {
                pParameter->setAttributeValue(PROPERTY_TYPE, PROPERTY_BOOLEAN);
                pParameter->setValue(VALUE_NO);
                KeyParser::addParameter(getParentKey(), pParameter);
            }
            else
            {
                QString sError = QString("Block::Block COULD NOT CREATE A PARAMETER FOR VARIABLE %1").arg(sSetVariable);
                Helper::error(sError);
            }
        }
    }

    // Parse parameters
    parseParameters(xBlockNode);
    
    // Parse child blocks
    parseBlocks(xBlockNode);
}

//-------------------------------------------------------------------------------------------------

Block::~Block()
{
    QString sInfo = QString("Block::~Block DESTROYING BLOCK %1").arg(getAttributeValue(PROPERTY_NAME));
    Helper::info(sInfo);
    qDeleteAll(m_vBlocks);
    qDeleteAll(m_vParameters);
}

//-------------------------------------------------------------------------------------------------

void Block::parseParameters(const CXMLNode &xBlockNode)
{
    // Retrieve other parameters
    QVector<CXMLNode> vParameterNodes = xBlockNode.getNodesByTagName(TAG_PARAMETER);
    foreach (CXMLNode xParameterNode, vParameterNodes) 
    {
        Parameter *pParameter = Parameter::createParameter(this, xParameterNode);
        if (pParameter != nullptr)
        {
            m_vParameters << pParameter;
            KeyParser::addParameter(getParentKey(), pParameter);
        }
    }
}

//-------------------------------------------------------------------------------------------------

void Block::parseBlocks(const CXMLNode &xBlockNode)
{
    QVector<CXMLNode> vBlockNodes = xBlockNode.getNodesByTagName(TAG_BLOCK);
    foreach (CXMLNode xBlockNode, vBlockNodes) 
    {
        Block *pBlock = new Block(this, xBlockNode);
        m_vBlocks << pBlock;
    }
}

//-------------------------------------------------------------------------------------------------

QString Block::getAttributeValue(const QString &sAttributeName) const
{
    return m_hAttributes[sAttributeName];
}

//-------------------------------------------------------------------------------------------------

const QVector<Parameter *> &Block::getParameters() const
{
    return m_vParameters;
}

//-------------------------------------------------------------------------------------------------

const QVector<Block *> &Block::getBlocks() const
{
    return m_vBlocks;
}

//-------------------------------------------------------------------------------------------------

void Block::setParentBlock(Block *pBlock)
{
    m_pParentBlock = pBlock;
}

//-------------------------------------------------------------------------------------------------

Block *Block::getParentBlock() const
{
    return m_pParentBlock;
}

//-------------------------------------------------------------------------------------------------

Key *Block::getParentKey()
{
    if (dynamic_cast<Key *>(this))
        return dynamic_cast<Key *>(this);
    Block *pParentBlock = m_pParentBlock;
    while (pParentBlock != nullptr)
    {
        Key *pKey = dynamic_cast<Key *>(pParentBlock);
        if (pKey != nullptr)
            return pKey;
        pParentBlock = pParentBlock->getParentBlock();
    }
    return nullptr;
}

//-------------------------------------------------------------------------------------------------

void Block::addParameter(Parameter *pParameter)
{
    if (pParameter != nullptr)
        m_vParameters << pParameter;
}
