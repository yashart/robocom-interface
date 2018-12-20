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
    Q_PROPERTY(int eyeX
               READ getEyeX
               NOTIFY eyePosChanged)
    Q_PROPERTY(int eyeY
               READ getEyeY
               NOTIFY eyePosChanged)

public:
    explicit NetworkInterface(QObject *parent = nullptr);
    Q_INVOKABLE void start_request_main_cam_img();
    Q_INVOKABLE void start_request_take_by_coordinate(int x, int y);
    Q_INVOKABLE void start_request_take_object_by_id(int id, int x, int y);
    Q_INVOKABLE void start_request_take_full_g_coordinates(int g1, int g2, int g3, int g4,
                                                         int g5, int g6, int g7);
    Q_INVOKABLE void start_request_take_full_x_coordinates(int g7, float x, float y, float z);


    QString getFrontCamImgData();
    int getServerJsonId();
    QAbstractItemModel* getObjectsModel();
    int getEyeX();
    int getEyeY();

signals:
    void frontCamImgDataChanged();
    void serverJsonIdChanged();
    void objectsModelChanged();
    void eyePosChanged();

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
    QUrl url;
    int eyeX;
    int eyeY;
};

#endif // NETWORKINTERFACE_H
