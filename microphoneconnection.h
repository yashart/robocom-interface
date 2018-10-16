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
public:
    explicit MicrophoneConnection(QObject *parent = nullptr);
    int getCommandId();

signals:
    void commandIdChanged();

public slots:
    void listen_host();
    void read_host_info();

private:
    QTcpServer *tcpServer = nullptr;
    QTcpSocket *microphoneSocket = nullptr;

    quint16 port = 5005;
    int commandId;
};

#endif // MICROPHONECONNECTION_H
