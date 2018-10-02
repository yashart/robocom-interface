import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Item {
    RowLayout {
        anchors.fill: parent
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 15
            Image {
                Layout.alignment: Qt.AlignCenter
                source: "qrc:/img/009-video-camera.png"
                sourceSize.width: 64
                sourceSize.height: 64
            }
            Image {
                Layout.alignment: Qt.AlignCenter
                source: "qrc:/img/009-video-camera.png"
                sourceSize.width: 64
                sourceSize.height: 64
            }
        }
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 15
            spacing: 10
            Image {
                id: cameraImage
                Layout.alignment: Qt.AlignHCenter
                source: "qrc:/img/test_cam_img.jpg"
                Repeater {
                    model: objectsModel
                    delegate: Rectangle {
                        color: "transparent"
                        width: widthVal
                        height: heightVal
                        x: xpos
                        y: ypos
                        border.width: 2
                        border.color: (objectsModel.activeElem == index)?"red":"black"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                objectsModel.activeElem = index
                            }
                        }
                    }
                }
            }
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                Layout.topMargin: 15
                spacing: 30

                Button {
                    Layout.alignment: Qt.AlignLeft
                    Material.background: Material.Green
                    text: qsTr("Взять")
                    font.pointSize: 40
                }
                Rectangle {
                    Layout.fillWidth: true
                }

                Image {
                    source: "qrc:/img/002-up-arrow.png"
                    Layout.rightMargin: 100
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (objectsModel.activeElem != 0) {
                                objectsModel.activeElem -= 1;
                            }
                        }
                    }
                }

                Image {
                    source: "qrc:/img/001-chevron-sign-down.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (objectsModel.activeElem + 1 != objectsModel.count) {
                                objectsModel.activeElem += 1;
                            }
                        }
                    }
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 15
            spacing: 10

            Repeater {
                model: objectsModel
                delegate: RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    spacing: -1
                    Rectangle {
                        height: 50
                        width: 50
                        border.width: 2
                        border.color: "black"
                        color: (objectsModel.activeElem == index)?"red":"#B0BEC5"
                        radius: 25
                    }

                    Rectangle {
                        width: 200
                        height: 55
                        color: "transparent"
                        border.width: 2
                        border.color: (objectsModel.activeElem == index)?"red":"black"
                        Label {
                            anchors.centerIn: parent
                            text: name
                            font.pointSize: 20
                            color: (objectsModel.activeElem == index)?"red":"#B0BEC5"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                objectsModel.activeElem = index
                            }
                        }
                    }
                    /*
                    Image {
                        source: "qrc:/img/x-button.png"
                        sourceSize.height: 32
                        sourceSize.width: 32
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                objectsModel.remove(index)
                            }
                        }
                    }
                    */
                }
            }
            Rectangle {
                Layout.fillHeight: true
            }

            Button {
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                Material.background: Material.Green
                text: qsTr("Добавить объект")
                onClicked: {
                    objectsModel.append({
                                            "name": "Object " + objectsModel.counterWithoutRemoves,
                                            "xpos": Math.random() * 600,
                                            "ypos": Math.random() * 350,
                                            "widthVal": Math.random() * 100,
                                            "heightVal": Math.random() * 100,
                                        });
                    objectsModel.counterWithoutRemoves += 1;
                }
            }
            Button {
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                Material.background: Material.Red
                Layout.bottomMargin: 10
                text: qsTr("Удалить активный")
                onClicked: {
                    objectsModel.remove(objectsModel.activeElem);
                    if (objectsModel.activeElem == objectsModel.count) {
                        objectsModel.activeElem -= 1;
                    }
                }
            }
        }
    }
}
