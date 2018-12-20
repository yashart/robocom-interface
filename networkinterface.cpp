#include "networkinterface.h"
#include "QDebug"
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QUrlQuery>
#include "detectedobject.h"


NetworkInterface::NetworkInterface(QObject *parent) : QObject(parent) {
    objectsModel=new QStandardItemModel(this);
    objectsModel->insertColumn(0);

}

void NetworkInterface::start_request_main_cam_img() {
    QByteArray postData;
    postData.append("id=3");
    QNetworkRequest request = QNetworkRequest(this->url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));
    reply = qnam.post(request, postData);
    //reply->setReadBufferSize(0);

    connect(reply, &QNetworkReply::finished, this, &NetworkInterface::http_finished);
    //connect(reply, &QIODevice::readyRead, this, &NetworkInterface::http_ready_read_img_cam);
}

void NetworkInterface::http_finished() {
    const QVariant redirectionTarget = reply->attribute(QNetworkRequest::RedirectionTargetAttribute);
    if (!redirectionTarget.isNull()) {
        this->url = redirectionTarget.toUrl();
        start_request_main_cam_img();
        return;
    }
    http_ready_read_img_cam();
    reply->deleteLater();
    reply = nullptr;
}

void NetworkInterface::http_ready_read_img_cam() {
    //reply = qobject_cast<QNetworkReply*>(sender());
    if (reply->error() != QNetworkReply::NoError) {
        qDebug() << "reply error " << reply->error();
        return;
    }
    QByteArray data = reply->readAll();
    qDebug() << reply->rawHeaderPairs();
    qDebug() << reply->error();

    QString str = QString::fromUtf8(data.data(), data.size());
    int statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
    qDebug() << QVariant(statusCode).toString();

    qDebug() << data;
    QJsonDocument doc = QJsonDocument::fromJson(str.toUtf8());
    QJsonObject obj;
    if(!doc.isNull()) {
        if(doc.isObject()) {
            obj = doc.object();
        }
        else {
            qDebug() << "Document is not an object" << endl;
            return;
        }
    }

    else {
        qDebug() << "Invalid JSON...";
        return;
    }

    if(obj["id"].toInt() != 4) {
        qDebug() << "Error command";
        return;
    }

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
    emit objectsModelChanged();
    this->eyeX = obj["eyex"].toInt();
    this->eyeY = obj["eyey"].toInt();
    emit eyePosChanged();
}

void NetworkInterface::ready_to_http_slot(QString host, int port) {
    this->comphost = host;
    this->compport = port;
    QString url = "http://" + host + ":" + QString::number(port);
    this->url = QUrl(url);
    start_request_main_cam_img();
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

void NetworkInterface::start_request_take_by_coordinate(int x, int y) {
    QUrlQuery postData;
    postData.addQueryItem("id", "5");
    postData.addQueryItem("x", QString::number(x));
    postData.addQueryItem("y", QString::number(y));
    postData.addQueryItem("scene", frontCamImgData);

    QNetworkRequest request = QNetworkRequest(this->url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));
    reply = qnam.post(request, postData.query(QUrl::FullyEncoded).toUtf8());
}

void NetworkInterface::start_request_take_object_by_id(int id, int x, int y) {
    QUrlQuery postData;
    postData.addQueryItem("id", "6");
    postData.addQueryItem("objectid", QString::number(id));
    postData.addQueryItem("scene", frontCamImgData);
    postData.addQueryItem("x", QString::number(x));
    postData.addQueryItem("y", QString::number(y));

    QNetworkRequest request = QNetworkRequest(this->url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));
    reply = qnam.post(request, postData.query(QUrl::FullyEncoded).toUtf8());
}

void NetworkInterface::start_request_take_full_g_coordinates(int g1, int g2, int g3, int g4,\
                                                           int g5, int g6, int g7) {
    QUrlQuery postData;
    postData.addQueryItem("id", "7");
    postData.addQueryItem("g1", QString::number(g1));
    postData.addQueryItem("g2", QString::number(g2));
    postData.addQueryItem("g3", QString::number(g3));
    postData.addQueryItem("g4", QString::number(g4));
    postData.addQueryItem("g5", QString::number(g5));
    postData.addQueryItem("g6", QString::number(g6));
    postData.addQueryItem("g7", QString::number(g7));

    QNetworkRequest request = QNetworkRequest(this->url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));
    reply = qnam.post(request, postData.query(QUrl::FullyEncoded).toUtf8());
}

void NetworkInterface::start_request_take_full_x_coordinates(int g7, float x, float y, float z) {
    QUrlQuery postData;
    postData.addQueryItem("id", "8");
    postData.addQueryItem("g7", QString::number(g7));
    postData.addQueryItem("x", QString::number(x));
    postData.addQueryItem("y", QString::number(y));
    postData.addQueryItem("z", QString::number(z));

    QNetworkRequest request = QNetworkRequest(this->url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));
    reply = qnam.post(request, postData.query(QUrl::FullyEncoded).toUtf8());
}


int NetworkInterface::getEyeX() {
    return this->eyeX;
}
int NetworkInterface::getEyeY() {
    return this->eyeY;
}

