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

            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                width: 640
                height: 480
                color: "transparent"
                //source: "qrc:/img/test_cam_img.jpg"
                Label {
                    anchors.centerIn: parent
                    text: qsTr("Подключитесь к тележке")
                }
                Image {
                    id: cameraImage
                    anchors.fill: parent
                    source: "data:image/png;base64," + httpInterface.frontCamImgData
                }

                Repeater {
                    model: httpInterface.objectsModel
                    delegate: Rectangle {
                        color: "transparent"
                        width: edit.width
                        height: edit.height
                        x: edit.x
                        y: edit.y
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
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 15
            spacing: 10

            ListView {
                width: 250
                height: 400
                model: httpInterface.objectsModel
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
                            text: edit.type
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
                }
            }
            Rectangle {
                Layout.fillHeight: true
            }
            Button {
                Layout.alignment: Qt.AlignLeft
                Material.background: Material.Green
                text: qsTr("Взять")
                font.pointSize: 40
                onClicked: {
                    var currElem = httpInterface.objectsModel.data(
                                httpInterface.objectsModel.index(
                                    objectsModel.activeElem, 0));
                    httpInterface.start_request_take_object_by_id(
                                currElem.id,
                                parseInt(currElem["x"]) + parseInt(currElem["width"])/2,
                                parseInt(currElem["y"]) + parseInt(currElem["height"])/2)
                }
            }
        }
    }
}
