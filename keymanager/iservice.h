#ifndef ISERVICE_H
#define ISERVICE_H

// Qt
#include <QString>

class IService
{
public:
    virtual bool startup(const QString &sArgs="") = 0;
    virtual void shutdown() = 0;
    virtual ~IService() {

    }
};

#endif // ISERVICE_H
