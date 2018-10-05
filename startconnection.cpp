#include "startconnection.h"
#include "QDebug"
#include <QJsonObject>
#include <QJsonDocument>



StartConnection::StartConnection(QObject *parent) : QObject(parent)
{
    foreach (const QHostAddress &address, QNetworkInterface::allAddresses()) {
        if (address.protocol() == QAbstractSocket::IPv4Protocol && address != QHostAddress(QHostAddress::LocalHost))
        {
            this->host = address.toString();
            break;
        }
    }
    this->udpSocket = new QUdpSocket(this);
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

QString StartConnection::getHost() {
    return this->host;
}
quint16 StartConnection::getPort() {
    return this->port;
}
