// Qt
#include <QFileInfo>
#include <QFileDialog>
#include <QDebug>

// Application
#include "key.h"
#include "constants.h"
#include "parameter.h"
#include "block.h"
#include "helper.h"
#include "constants.h"

//-------------------------------------------------------------------------------------------------

Key::Key(const CXMLNode &xKeyNode, QObject *pParent) : Block(nullptr, xKeyNode, pParent)
{   
    // Does key needs a STL player?
    if (!hasAttribute(PROPERTY_STL_PLAYER))
        m_hAttributes[PROPERTY_STL_PLAYER] = VALUE_YES;

    // Retrieve reference file
    QString sReferenceFile = m_hAttributes[PROPERTY_REFERENCE];
    QFileInfo fi(sReferenceFile);
    if (fi.exists())
    {
        // Parse
        CXMLNode xKeyData = CXMLNode::loadXMLFromFile(sReferenceFile);

        // Update attributes
        for (QHash<QString, QString>::iterator it=xKeyData.attributes().begin(); it!=xKeyData.attributes().end(); ++it)
            m_hAttributes[it.key()] = it.value();

        // Parse parameters
        parseParameters(xKeyData);

        // Parse child blocks
        parseBlocks(xKeyData);
    }

    // Parse keys
    parseKeys(xKeyNode);

    // Set path to ouput SCAD file
    m_sOutputSCADFileName = QString(SCAD_OUTPUT_FILE).arg(getAttributeValue(PROPERTY_NAME));

    // Set path to ouput STL file
    m_sOutputSTLFileName = QString(STL_OUTPUT_FILE).arg(getAttributeValue(PROPERTY_NAME));
}

//-------------------------------------------------------------------------------------------------

Key::~Key()
{
    
}

//-------------------------------------------------------------------------------------------------

const QVector<Key *> &Key::getChildKeys() const
{
    return m_vKeys;
}

//-------------------------------------------------------------------------------------------------

const QString &Key::getOutputSCADFileName() const
{
    return m_sOutputSCADFileName;
}

//-------------------------------------------------------------------------------------------------

const QString &Key::getOutputSTLFileName() const
{
    return m_sOutputSTLFileName;
}

//-------------------------------------------------------------------------------------------------

void Key::parseKeys(const CXMLNode &xKeyNode)
{
    QVector<CXMLNode> vKeyNodes = xKeyNode.getNodesByTagName(TAG_KEY);
    foreach (CXMLNode xKeyNode, vKeyNodes) 
        m_vKeys << new Key(xKeyNode);
}


