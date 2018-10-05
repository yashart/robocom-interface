#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "networkinterface.h"
#include "startconnection.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    StartConnection connectionInfo;
    connectionInfo.brodcast_my_host();

    //NetworkInterface test;
    //test.start_request(QUrl("http://ya.ru"));

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
