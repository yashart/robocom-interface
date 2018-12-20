#include "startconnection.h"
#include "QDebug"
#include <QJsonObject>
#include <QJsonDocument>
#include <QTcpServer>


StartConnection::StartConnection(QObject *parent) : QObject(parent)
{
    foreach (const QHostAddress &address, QNetworkInterface::allAddresses()) {
        if (address.protocol() == QAbstractSocket::IPv4Protocol && address != QHostAddress(QHostAddress::LocalHost))
        {
            this->host = address.toString();
            emit hostChanged();
            break;
        }
    }
    this->udpSocket = new QUdpSocket(this);
    tcpServer = new QTcpServer(this);
    if (!tcpServer->listen(QHostAddress::Any, 5200)) {
        qDebug() << "Critical error: cann't start tcp Server";
        return;
    }
    connect(tcpServer, &QTcpServer::newConnection, this, &StartConnection::listen_host);
}

void StartConnection::brodcast_my_host()
{
    QJsonObject broadcastJson;
    broadcastJson.insert("id", QJsonValue::fromVariant(0));
    broadcastJson.insert("app", QJsonValue::fromVariant("c2p"));
    broadcastJson.insert("address", QJsonValue::fromVariant(this->host));
    broadcastJson.insert("port", QJsonValue::fromVariant(this->port));
    QJsonDocument brodcastJsonDoc(broadcastJson);
    QByteArray datagram = QByteArray(brodcastJsonDoc.toJson(QJsonDocument::Compact));
    udpSocket->writeDatagram(datagram, QHostAddress::Broadcast, 45454);
}

void StartConnection::listen_host()
{
    this->serverSocket = tcpServer->nextPendingConnection();
    connect(this->serverSocket, &QAbstractSocket::readyRead,
            this, &StartConnection::read_host_info);
    connect(this->serverSocket, &QAbstractSocket::disconnected,
            this->serverSocket, &QObject::deleteLater);
}

void StartConnection::read_host_info()
{
    if (this->serverSocket->state() != QAbstractSocket::ConnectedState) {
        qDebug() << "state: " << this->serverSocket->state();
        this->serverSocket->abort();
        return;
    }
    QString hostData = this->serverSocket->readAll();

    QJsonDocument doc = QJsonDocument::fromJson(hostData.toUtf8());
    QJsonObject obj;
    if(!doc.isNull())
    {
        if(doc.isObject())
        {
            obj = doc.object();
        }
        else
        {
            qDebug() << "Document is not an object" << endl;
        }
    }
    else
    {
        qDebug() << "Invalid JSON...\n" << endl;
    }
    if(obj["id"] != 1) {
        qDebug() << "Error command";
    }

    this->computerHost = obj["address"].toString();
    this->computerPort = quint16(obj["port"].toInt());

    this->serverSocket->disconnectFromHost();
    emit ready_to_http(this->computerHost, this->computerPort);
    emit computerHostChanged();
    emit computerPortChanged();
}

QString StartConnection::getHost()
{
    return this->host;
}
quint16 StartConnection::getPort()
{
    return this->port;
}
QString StartConnection::getComputerHost()
{
    return this->computerHost;
}
quint16 StartConnection::getComputerPort()
{
    return this->computerPort;
}
