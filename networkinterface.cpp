#include "networkinterface.h"
#include "QDebug"
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include "detectedobject.h"


NetworkInterface::NetworkInterface(QObject *parent) : QObject(parent)
{
    objectsModel=new QStandardItemModel(this);
    objectsModel->insertColumn(0);

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

    QJsonArray recognizedObjects = obj["objects"].toArray();
    clearObjectsModel();
    for (int i = 0; i < obj["count"].toInt(); i++) {
        QJsonObject currentObject = recognizedObjects[i].toObject();
        addDetectedObject(currentObject["id"].toInt(),
                currentObject["x"].toInt(),
                currentObject["y"].toInt(),
                currentObject["width"].toInt(),
                currentObject["height"].toInt(),
                currentObject["typename"].toString());
    }
    qDebug() << objectsModel->data(objectsModel->index(1, 0));
    emit objectsModelChanged();
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

QAbstractItemModel* NetworkInterface::getObjectsModel() {
    return this->objectsModel;
}

void NetworkInterface::addDetectedObject(int id, int x, int y,
                                   int width, int height,
                                   QString type) {
    int newRow = objectsModel->rowCount();
    DetectedObject newDetectedObject = DetectedObject(id, x, y,
                                     width, height,
                                     type);
    objectsModel->insertRow(newRow);
    objectsModel->setData(objectsModel->index(newRow, 0),
                          QVariant::fromValue(newDetectedObject),
                          Qt::EditRole);
}

void NetworkInterface::clearObjectsModel() {
    objectsModel->removeRows(0, objectsModel->rowCount());
}
