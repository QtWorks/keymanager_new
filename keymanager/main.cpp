// Qt
#include <QApplication>

// Application
#include "keymanager.h"
#include "splashscreen.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Return an instance of the application
    KeyManager *pKeyMgr = KeyManager::instance();

    // Startup
    pKeyMgr->startup();

    SplashScreen sc;
    sc.show();

    // Event loop
    int res = app.exec();

    // Shutdown
    pKeyMgr->shutdown();

    // Release
    delete pKeyMgr;

    return res;
}
