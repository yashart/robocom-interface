#ifndef DETECTEDOBJECT_H
#define DETECTEDOBJECT_H

#include <QObject>
#include <QString>

class DetectedObject
{
    Q_GADGET
    Q_PROPERTY(int id
               READ getId)
    Q_PROPERTY(int x
               READ getX)
    Q_PROPERTY(int y
               READ getY)
    Q_PROPERTY(int width
               READ getWidth)
    Q_PROPERTY(int height
               READ getHeight)
    Q_PROPERTY(QString type
               READ getType
               WRITE setType)

public:
    DetectedObject();
    DetectedObject(int id, int x, int y,
                   int width, int height,
                   QString type);
    //DetectedObject(const DetectedObject& other)=default;
    //DetectedObject& operator=(const DetectedObject& other)=default;
    int getId();
    int getX();
    int getY();
    int getWidth();
    int getHeight();
    QString getType();
    void setType(const QString &type) { this->type = type; }

private:
    int id;
    int x;
    int y;
    int width;
    int height;
    QString type;
};

#endif // DETECTEDOBJECT_H
