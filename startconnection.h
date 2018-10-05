#ifndef STARTCONNECTION_H
#define STARTCONNECTION_H

#include <QObject>
#include <QNetworkInterface>
#include <QUdpSocket>


class StartConnection : public QObject
{
    Q_OBJECT
public:
    explicit StartConnection(QObject *parent = nullptr);
    void brodcast_my_host();
    QString getHost();
    quint16 getPort();

signals:

public slots:

private:
    QUdpSocket *udpSocket = nullptr;
    QString host = "";
    quint16 port = 5200;
};

#endif // STARTCONNECTION_H
