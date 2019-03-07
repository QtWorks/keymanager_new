#ifndef WIDGETFACTORY_H
#define WIDGETFACTORY_H

// Qt
#include <QObject>
#include <QHash>

// Application
#include "iservice.h"
class KeyManager;
class BaseWidget;
class Parameter;

class WidgetFactory : public QObject, public IService
{
    Q_OBJECT

public:
    //-------------------------------------------------------------------------------------------------
    // Constructors and destructor
    //-------------------------------------------------------------------------------------------------

    //! Constructor
    explicit WidgetFactory(KeyManager *pParent);

    //! Destructor
    virtual ~WidgetFactory();

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

    //! Return widget for parameter
    BaseWidget *getWidgetForParameter(Parameter *pParameter) const;

    //-------------------------------------------------------------------------------------------------
    // Control methods
    //-------------------------------------------------------------------------------------------------

    //! Build widget
    BaseWidget *buildWidget(Parameter *pParameter, QWidget *pParentWidget=nullptr);

private:
    //! Key manager
    KeyManager *m_pKeyManager=nullptr;

    //! Widget hash
    QHash<Parameter *, BaseWidget *> m_hWidgetHash;
};

#endif // WIDGETFACTORY_H
