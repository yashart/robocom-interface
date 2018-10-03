#include "networkinterface.h"
#include "QDebug"

NetworkInterface::NetworkInterface(QObject *parent) : QObject(parent)
{

}

void NetworkInterface::start_request(const QUrl &requestedUrl)
{
    reply = qnam.get(QNetworkRequest(requestedUrl));

    connect(reply, &QNetworkReply::finished, this, &NetworkInterface::http_finished);
    connect(reply, &QIODevice::readyRead, this, &NetworkInterface::http_ready_read);
}

void NetworkInterface::http_finished()
{
    const QVariant redirectionTarget = reply->attribute(QNetworkRequest::RedirectionTargetAttribute);
    if (!redirectionTarget.isNull()) {
        qDebug() << redirectionTarget.toUrl();

        start_request(redirectionTarget.toUrl());
        return;
    }
    reply->deleteLater();
    reply = nullptr;

}

void NetworkInterface::http_ready_read()
{
    qDebug() << reply->readAll();
}