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
    Q_PROPERTY(QString computerHost
               READ getComputerHost
               NOTIFY computerHostChanged)

    Q_PROPERTY(quint16 computerPort
               READ getComputerPort
               NOTIFY computerPortChanged)

    Q_PROPERTY(QString host
               READ getHost
               NOTIFY hostChanged)

    Q_PROPERTY(quint16 port
               READ getPort
               NOTIFY portChanged)

public:
    explicit StartConnection(QObject *parent = nullptr);
    Q_INVOKABLE void brodcast_my_host();

    QString getHost();
    QString getComputerHost();
    quint16 getPort();
    quint16 getComputerPort();

signals:
    void ready_to_http(QString host, int port);
    void computerHostChanged();
    void computerPortChanged();
    void hostChanged();
    void portChanged();

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
