#ifndef NETWORKINTERFACE_H
#define NETWORKINTERFACE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QImage>
#include <QStandardItemModel>


class NetworkInterface : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString frontCamImgData
               READ getFrontCamImgData
               NOTIFY frontCamImgDataChanged)
    Q_PROPERTY(int serverJsonId
               READ getServerJsonId
               NOTIFY serverJsonIdChanged)
    Q_PROPERTY(QAbstractItemModel* objectsModel
               READ getObjectsModel
               NOTIFY objectsModelChanged)

public:
    explicit NetworkInterface(QObject *parent = nullptr);
    Q_INVOKABLE void start_request_main_cam_img(const QUrl &requestedUrl);

    QString getFrontCamImgData();
    int getServerJsonId();

    QAbstractItemModel* getObjectsModel();

signals:
    void frontCamImgDataChanged();
    void serverJsonIdChanged();
    void objectsModelChanged();

public slots:
    void http_finished();
    void http_ready_read_img_cam();
    Q_INVOKABLE void ready_to_http_slot(QString host, int port);
    Q_INVOKABLE void ready_to_http_slot();
    Q_INVOKABLE void addDetectedObject(int id, int x, int y,
                                       int width, int height,
                                       QString type);
    Q_INVOKABLE void clearObjectsModel();

private:
    QNetworkAccessManager qnam;
    QNetworkReply *reply;
    QString frontCamImgData;
    QString comphost = "";
    int serverJsonId = -1;
    int compport = 0;
    QAbstractItemModel* objectsModel;
};

#endif // NETWORKINTERFACE_H
