// Qt
#include "helper.h"
#include <QDebug>

// Application
#include "keymanager.h"
#include "keyparser.h"
#include "cxmlnode.h"
#include "constants.h"
#include "key.h"
#include "parameter.h"
QHash<Key *, QHash<QString, Parameter *> > KeyParser::sParameterHash;

//-------------------------------------------------------------------------------------------------

KeyParser::KeyParser(KeyManager *pKeyManager) : QObject(pKeyManager),
    m_pKeyManager(pKeyManager)
{

}

//-------------------------------------------------------------------------------------------------

KeyParser::~KeyParser()
{
    qDeleteAll(m_vKeys);
}

//-------------------------------------------------------------------------------------------------

bool KeyParser::startup(const QString &sArgs)
{
    int iKeyCount = 0;
    keyCount(":/data/keys.xml", iKeyCount);

    // Load keys
    if (!loadKeys(":/data/keys.xml"))
        return false;

    return true;
}

//-------------------------------------------------------------------------------------------------

void KeyParser::shutdown()
{

}

//-------------------------------------------------------------------------------------------------

const QVector<Key *> &KeyParser::getKeys() const
{
    return m_vKeys;
}

//-------------------------------------------------------------------------------------------------

Parameter *KeyParser::getParameterByVariableName(Key *pKey, const QString &sVariableName)
{
    if (pKey != nullptr)
    {
        if (!sVariableName.isEmpty())
            return sParameterHash[pKey][sVariableName];
    }
    else
    {
        QString sError = QString("KeyParser::getParameterByVariableName FOUND AN EMPTY VARIABLE NAME");
        Helper::error(sError);
    }

    return nullptr;
}

//-------------------------------------------------------------------------------------------------

QHash<QString, Parameter *> KeyParser::getParametersForKey(Key *pKey)
{
    if (pKey != nullptr)
        return sParameterHash[pKey];
    return QHash<QString, Parameter *>();
}

//-------------------------------------------------------------------------------------------------

Key *KeyParser::getKey(const QString &sKeyName)
{
    for (QHash<Key *, QHash<QString, Parameter *> >::iterator it=sParameterHash.begin(); it!=sParameterHash.end(); ++it)
    {
        Key *pKey = it.key();
        if ((pKey != nullptr) && (pKey->getAttributeValue(PROPERTY_NAME) == sKeyName))
            return pKey;
    }
    return nullptr;
}

//-------------------------------------------------------------------------------------------------

bool KeyParser::loadKeys(const QString &sKeySpecFilePath)
{
    if (Helper::fileExists(sKeySpecFilePath))
    {
        // Load key list
        CXMLNode xRootNode = CXMLNode::loadXMLFromFile(sKeySpecFilePath);
        if (!xRootNode.isEmpty())
        {
            // Retrieve key groups
            QVector<CXMLNode> vKeys = xRootNode.getNodesByTagName(TAG_KEY);
            foreach (CXMLNode xKey, vKeys)
            {
                // Retrieve reference file
                Key *pKey = new Key(xKey);
                m_vKeys << pKey;
            }

            // Notify
            emit keyParsingDone();

            return true;
        }
        else
        {
            QString sError = QString("KeyParser::loadKeys FILE %1 IS EMPTY").arg(sKeySpecFilePath);
            Helper::error(sError);
            return false;
        }
    }
    else
    {
        QString sError = QString("KeyParser::loadKeys FILE %1 DOES NOT EXIST").arg(sKeySpecFilePath);
        Helper::error(sError);
        return false;
    }
}

//-------------------------------------------------------------------------------------------------

void KeyParser::keyCount(const QString &sKeySpecFilePath, int &iKeyCount) const
{
    if (Helper::fileExists(sKeySpecFilePath))
    {
        // Load key list
        CXMLNode xRootNode = CXMLNode::loadXMLFromFile(sKeySpecFilePath);
        keyCount(xRootNode, iKeyCount);
    }
}

//-------------------------------------------------------------------------------------------------

void KeyParser::keyCount(const CXMLNode &xRootNode, int &iKeyCount) const
{
    // Retrieve key groups
    QVector<CXMLNode> vKeys = xRootNode.getNodesByTagName(TAG_KEY);
    iKeyCount += vKeys.size();
    foreach (CXMLNode xChildKeyNode, vKeys)
        keyCount(xChildKeyNode, iKeyCount);
}

//-------------------------------------------------------------------------------------------------

void KeyParser::addParameter(Key *pKey, Parameter *pParameter)
{
    if ((pKey != nullptr) && (pParameter != nullptr))
    {
        // Retrieve variable name
        QString sVariableName = pParameter->getAttributeValue(PROPERTY_VARIABLE);
        if (sVariableName.isEmpty())
        {
            QString sError = QString("KeyParser::addParameter A VARIABLE NAME CANNOT BE EMPTY");
            Helper::error(sError);
        }
        else
        {
            if (sParameterHash[pKey][sVariableName] == nullptr)
                sParameterHash[pKey][sVariableName] = pParameter;
            else
            {
                QString sError = QString("KeyParser::addParameter FOUND DOUBLON VARIABLE %1 IN KEY %2").arg(sVariableName).arg(pKey->getAttributeValue(PROPERTY_NAME));
                Helper::error(sError);
            }
        }
    }
}
