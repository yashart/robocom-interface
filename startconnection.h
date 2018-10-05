#ifndef STARTCONNECTION_H
#define STARTCONNECTION_H

#include <QObject>
#include <QNetworkInterface>
#include <QUdpSocket>
#include <QTcpServer>
#include <QTcpSocket>


class StartConnection : public QObject
{
    Q_OBJECT
public:
    explicit StartConnection(QObject *parent = nullptr);
    void brodcast_my_host();
    QString getHost();
    QString getComputerHost();
    quint16 getPort();
    quint16 getComputerPort();

signals:

public slots:
    void listen_host();
    void read_host_info();

private:
    QUdpSocket *udpSocket = nullptr;
    QTcpServer *tcpServer = nullptr;
    QTcpSocket *serverSocket;
    QString host = "";
    quint16 port = 5200;

    QString computerHost = "";
    quint16 computerPort = 0;
};

#endif // STARTCONNECTION_H
