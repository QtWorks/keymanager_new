#ifndef KEYPARSER_H
#define KEYPARSER_H

// Qt
#include <QObject>
#include <QHash>

// Application
#include "iservice.h"
#include "cxmlnode.h"
class KeyManager;
class Key;
class Parameter;

class KeyParser : public QObject, public IService
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit KeyParser(KeyManager *pKeyManager);

    //! Destructor
    virtual ~KeyParser();

    //-------------------------------------------------------------------------------------------------
    // IService interface
    //-------------------------------------------------------------------------------------------------

    //! Startup
    virtual bool startup(const QString &sArgs="");

    //! Shutdown
    virtual void shutdown();

    //-------------------------------------------------------------------------------------------------
    // Getters & setters
    //-------------------------------------------------------------------------------------------------

    //! Return keys
    const QVector<Key *> &getKeys() const;

    //! Get parameter by variable name
    static Parameter *getParameterByVariableName(Key *pKey, const QString &sVariableName);

    //! Get parameters for key
    static QHash<QString, Parameter *> getParametersForKey(Key *pKey);

    //! Get parameters for key
    static Key *getKey(const QString &sKeyName);

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Return key count
    void keyCount(const QString &sKeySpecFilePath, int &iKeyCount) const;

    //! Load keys
    bool loadKeys(const QString &sKeySpecFilePath);

    //! Add parameter
    static void addParameter(Key *pKey, Parameter *pParameter);

private:
    //! Return key count
    void keyCount(const CXMLNode &xRootNode, int &iKeyCount) const;

private:
    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Key list
    QVector<Key *> m_vKeys;

    //! Parameter hash
    static QHash<Key *, QHash<QString, Parameter *> > sParameterHash;

signals:
    //! Key parsed done
    void keyParsingDone();
};

#endif // KEYPARSER_H
