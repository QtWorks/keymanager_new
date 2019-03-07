#ifndef BLOCK_H
#define BLOCK_H

// Qt
#include <QObject>

// Application
#include "cxmlnode.h"
class Key;
class Parameter;

class Block : public QObject
{
    Q_OBJECT
    
public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    Block(Block *pParentBlock, const CXMLNode &xBlockNode, QObject *pParent=nullptr);
    
    //! Destructor
    virtual ~Block();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Return an attribute value
    QString getAttributeValue(const QString &sAttributeName) const;

    //! Get parameters
    const QVector<Parameter *> &getParameters() const;

    //! Get blocks
    const QVector<Block *> &getBlocks() const;

    //! Set parent
    void setParentBlock(Block *pBlock);

    //! Get parent block
    Block *getParentBlock() const;

    //! Get parent key
    Key *getParentKey();

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Add parameter
    void addParameter(Parameter *pParameter);

protected:
    //! Parse parameters
    void parseParameters(const CXMLNode &xBlockNode);
    
    //! Parse child blocks
    void parseBlocks(const CXMLNode &xBlockNode);
    
protected:
    //! Attributes
    QHash<QString, QString> m_hAttributes;
    
    //! Child blocks
    QVector<Block *> m_vBlocks;
    
    //! Parameters
    QVector<Parameter *> m_vParameters;

private:
    //! Parent block
    Block *m_pParentBlock=nullptr;
};

#endif // BLOCK_H
