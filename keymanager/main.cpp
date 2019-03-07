// Qt
#include <QApplication>

// Application
#include "keymanager.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Return an instance of the application
    KeyManager *pKeyMgr = KeyManager::instance();

    // Startup
    pKeyMgr->startup();

    // Event loop
    int res = app.exec();

    // Shutdown
    pKeyMgr->shutdown();

    // Release
    delete pKeyMgr;

    return res;
}
