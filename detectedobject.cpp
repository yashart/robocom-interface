#include "detectedobject.h"

DetectedObject::DetectedObject()
{
    this->id = -1;
    this->x = 0;
    this->y = 0;
    this->height = 0;
    this->width = 0;
    this->type = "";
}

DetectedObject::DetectedObject(int id, int x, int y,
                        int width, int height,
                        QString type)
{
    this->id = id;
    this->x = x;
    this->y = y;
    this->height = height;
    this->width = width;
    this->type = type;
}

int DetectedObject::getId() {
    return this->id;
}

int DetectedObject::getX() {
    return this->x;
}

int DetectedObject::getY() {
    return this->y;
}

int DetectedObject::getWidth() {
    return this->width;
}

int DetectedObject::getHeight() {
    return this->height;
}

QString DetectedObject::getType() {
    return this->type;
}
