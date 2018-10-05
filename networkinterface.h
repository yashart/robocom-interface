#ifndef NETWORKINTERFACE_H
#define NETWORKINTERFACE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QImage>


class NetworkInterface : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString frontCamImgData
               READ getFrontCamImgData
               NOTIFY frontCamImgDataChanged)

public:
    explicit NetworkInterface(QObject *parent = nullptr);
    Q_INVOKABLE void start_request_main_cam_img(const QUrl &requestedUrl);

    QString getFrontCamImgData();

signals:
    void frontCamImgDataChanged();

public slots:
    void http_finished();
    void http_ready_read_img_cam();
    Q_INVOKABLE void ready_to_http_slot(QString host, int port);
    Q_INVOKABLE void ready_to_http_slot();

private:
    QNetworkAccessManager qnam;
    QNetworkReply *reply;
    QString frontCamImgData;
    QString comphost = "";
    int compport = 0;
};

#endif // NETWORKINTERFACE_H
