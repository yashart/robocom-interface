#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlContext>
#include "networkinterface.h"
#include "startconnection.h"
#include "microphoneconnection.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    StartConnection connectionInfo;
    MicrophoneConnection microphoneConnection;

    NetworkInterface httpInterface;
    QObject::connect(&connectionInfo, SIGNAL(ready_to_http(QString, int)),
                     &httpInterface, SLOT(ready_to_http_slot(QString, int)));

    QQmlApplicationEngine engine;
    QQmlContext * ctx = engine.rootContext();

    ctx->setContextProperty("microphoneConnection", &microphoneConnection);
    ctx->setContextProperty("connectionInfo", &connectionInfo);
    ctx->setContextProperty("httpInterface", &httpInterface);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
