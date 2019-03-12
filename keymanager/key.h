#ifndef KEY_H
#define KEY_H

// Qt
#include <QObject>

// Application
#include "cxmlnode.h"
#include "block.h"
class Parameter;

class Key : public Block
{
    Q_OBJECT
    
public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor    
    Key(const CXMLNode &xKeyNode, QObject *pParent=nullptr);
    
    //! Destructor
    virtual ~Key();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Get childs keys
    const QVector<Key *> &getChildKeys() const;

    //! Return path to output SCAD file
    QString getOutputSCADFileName() const;

    //! Return path to output STL file
    const QString &getOutputSTLFileName() const;

private:   
    //! Parse child keys
    void parseKeys(const CXMLNode &keyNode);
    
private:
    //! Child keys
    QVector<Key *> m_vKeys;

    //! Path to output SCAD file
    QString m_sOutputSCADFileName="";

    //! Path to output STL file
    QString m_sOutputSTLFileName="";
};

#endif // KEY_H
