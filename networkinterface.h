#ifndef NETWORKINTERFACE_H
#define NETWORKINTERFACE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>


class NetworkInterface : public QObject
{
    Q_OBJECT
public:
    explicit NetworkInterface(QObject *parent = nullptr);
    void start_request(const QUrl &requestedUrl);

signals:

public slots:
    void http_finished();
    void http_ready_read();
    void ready_to_http_slot(QString host, int port);


private:
    QNetworkAccessManager qnam;
    QNetworkReply *reply;
};

#endif // NETWORKINTERFACE_H
