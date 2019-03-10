#ifndef PARAMETER_H
#define PARAMETER_H

// Qt
#include <QString>
#include <QVariant>

// Application
class Block;
#include "cxmlnode.h"

// Application
class Key;

class Parameter : public QObject
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Factory
    static Parameter *createParameter(Block *pParentBlock, const CXMLNode &xParameterNode);
    static Parameter *createParameter(Block *pParentBlock, const QString &sParameterVariable);
    static QVector<Parameter *> createTableParameters(Block *pParentBlock, Parameter *pTableParameter);

    //! Destructor
    ~Parameter();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Return an attribute value
    QString getAttributeValue(const QString &sAttributeName) const;
    
    //! Set an attribute value
    void setAttributeValue(const QString &sAttributeName, const QString &sAttributeValue);
    
    //! Return parameter value
    const QString &getValue() const;
    
    //! Set value
    void setValue(const QString &sValue);
   
    //! Return unset value
    const QString &getUnsetValue() const;

    //! Set unset value
    void setUnsetValue(const QString &sUnsetValue);

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Set parent block
    void setParentBlock(Block *pBlock);

    //! Get parent block
    Block *getParentBlock() const;

    //! Return child parameter
    const QVector<Parameter *> &getChildParameters() const;

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Reset to default value
    void resetToDefaultValue();

    //! Add child parameter
    void addChildParameter(Parameter *pParameter);

private:
    //! Constructor
    Parameter(Block *pParentBlock, const CXMLNode &xParameterNode, QObject *pParent=nullptr);

    //! Constructor
    Parameter(Block *pParentBlock, const QString &sVariableName, QObject *pParent=nullptr);

private:
    //! Parent block
    Block *m_pParentBlock=nullptr;

    //! Parameter attributes
    QHash<QString, QString> m_hAttributes;
    
    //! Value
    QString m_sValue="";

    //! Default value
    QString m_sDefaultValue="";

    //! Unset value
    QString m_sUnsetValue="";

    //! Child parameters (used for table)
    QVector<Parameter *> m_vChildParameters;

signals:
    //-------------------------------------------------------------------------------------------------
    // Signals
    //-------------------------------------------------------------------------------------------------

    //! Parameter value changed
    void parameterValueChanged(const QString &sParameterValue);
};

#endif // PARAMETER_H
