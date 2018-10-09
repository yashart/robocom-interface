#include "networkinterface.h"
#include "QDebug"
#include <QJsonObject>
#include <QJsonDocument>

NetworkInterface::NetworkInterface(QObject *parent) : QObject(parent)
{

}

void NetworkInterface::start_request_main_cam_img(const QUrl &requestedUrl)
{
    qDebug() << "url: " << requestedUrl;
    QByteArray postData;
    postData.append("id=3");
    QNetworkRequest request = QNetworkRequest(requestedUrl);
    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));
    reply = qnam.post(request, postData);
    reply->setReadBufferSize(0);

    connect(reply, &QNetworkReply::finished, this, &NetworkInterface::http_finished);
    //connect(reply, &QIODevice::readyRead, this, &NetworkInterface::http_ready_read_img_cam);
}

void NetworkInterface::http_finished()
{
    const QVariant redirectionTarget = reply->attribute(QNetworkRequest::RedirectionTargetAttribute);
    if (!redirectionTarget.isNull()) {
        qDebug() << redirectionTarget.toUrl();

        start_request_main_cam_img(redirectionTarget.toUrl());
        return;
    }
    http_ready_read_img_cam();
    reply->deleteLater();
    reply = nullptr;
}

void NetworkInterface::http_ready_read_img_cam()
{
    QString data = reply->readAll();
    QJsonDocument doc = QJsonDocument::fromJson(data.toUtf8());
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
            return;
        }
    }
    else
    {
        qDebug() << "Invalid JSON...";
        return;
    }
    if(obj["id"].toInt() != 4) {
        qDebug() << "Error command";
        return;
    }

    qDebug() << obj["eyex"].toInt();

    this->frontCamImgData = obj["scene"].toString();
    emit frontCamImgDataChanged();
    this->serverJsonId = obj["id"].toInt();
    emit serverJsonIdChanged();
}

void NetworkInterface::ready_to_http_slot(QString host, int port)
{
    this->comphost = host;
    this->compport = port;
    QString url = "http://" + host + ":" + QString::number(port);
    start_request_main_cam_img(QUrl(url));
}

void NetworkInterface::ready_to_http_slot() {
    ready_to_http_slot(this->comphost, this->compport);
}

QString NetworkInterface::getFrontCamImgData() {
    return this->frontCamImgData;
}

int NetworkInterface::getServerJsonId() {
    return this->serverJsonId;
}
