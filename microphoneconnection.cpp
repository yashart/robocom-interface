#include "microphoneconnection.h"
#include <QJsonObject>
#include <QJsonDocument>


MicrophoneConnection::MicrophoneConnection(QObject *parent) : QObject(parent) {
    tcpServer = new QTcpServer(this);
    if (!tcpServer->listen(QHostAddress::Any, this->port)) {
        qDebug() << "Critical error: cann't start tcp Server";
        return;
    }
    connect(tcpServer, &QTcpServer::newConnection,
            this, &MicrophoneConnection::listen_host);
}

void MicrophoneConnection::listen_host() {
    this->microphoneSocket = tcpServer->nextPendingConnection();
    connect(this->microphoneSocket, &QAbstractSocket::readyRead,
            this, &MicrophoneConnection::read_host_info);
    connect(this->microphoneSocket, &QAbstractSocket::disconnected,
            this->microphoneSocket, &QObject::deleteLater);
}

void MicrophoneConnection::read_host_info() {
    QString hostData = this->microphoneSocket->readAll();
    QJsonDocument doc = QJsonDocument::fromJson(hostData.toUtf8());
    QJsonObject obj;
    if(!doc.isNull()) {
        if(doc.isObject()) {
            obj = doc.object();
        }
        else {
            qDebug() << "Document is not an object" << endl;
        }
    }
    else {
        qDebug() << "Invalid JSON...\n" << endl;
    }
    if(obj["app"] != "m2p") {
        qDebug() << "Error command";
    }
    this->commandId = obj["id"].toInt();
    emit commandIdChanged();
    if (this->commandId == 4) {
        this->number = obj["number"].toInt();
        emit numberChanged();
    }
}

int MicrophoneConnection::getCommandId() {
    return this->commandId;
}

int MicrophoneConnection::getNumber() {
    return this->number;
}
