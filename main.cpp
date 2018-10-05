#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlContext>
#include "networkinterface.h"
#include "startconnection.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    StartConnection connectionInfo;
    //connectionInfo.brodcast_my_host();

    NetworkInterface httpInterface;
    QObject::connect(&connectionInfo, SIGNAL(ready_to_http(QString, int)),
                     &httpInterface, SLOT(ready_to_http_slot(QString, int)));
    //test.start_request(QUrl("http://ya.ru"));

    QQmlApplicationEngine engine;
    QQmlContext * ctx = engine.rootContext();

    ctx->setContextProperty("connectionInfo", &connectionInfo);
    ctx->setContextProperty("httpInterface", &httpInterface);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
