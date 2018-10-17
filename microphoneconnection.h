#ifndef MICROPHONECONNECTION_H
#define MICROPHONECONNECTION_H

#include <QObject>
#include <QTcpSocket>
#include <QTcpServer>


class MicrophoneConnection : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int commandId
               READ getCommandId
               NOTIFY commandIdChanged)
    Q_PROPERTY(int number
               READ getNumber
               NOTIFY numberChanged)

public:
    explicit MicrophoneConnection(QObject *parent = nullptr);
    int getCommandId();
    int getNumber();

signals:
    void commandIdChanged();
    void numberChanged();

public slots:
    void listen_host();
    void read_host_info();

private:
    QTcpServer *tcpServer = nullptr;
    QTcpSocket *microphoneSocket = nullptr;

    quint16 port = 5005;
    int commandId = 0;
    int number = 0;
};

#endif // MICROPHONECONNECTION_H
