import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Item {
    RowLayout {
        anchors.fill: parent
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 100
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

        Image {
            id: cameraImage
            Layout.alignment: Qt.AlignCenter
            source: "qrc:/img/test_cam_img.jpg"
            Repeater {
                model: objectsModel
                delegate: Rectangle {
                    color: "transparent"
                    //color: colorVal
                    width: 50
                    height: 50
                    x: xpos
                    y: ypos
                    border.width: 2
                    border.color: colorVal
                }

            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 100


            Repeater {
                model: objectsModel
                delegate: RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    Label {
                        text: name
                        font.pointSize: 20
                        color: colorVal
                    }
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
                }
            }

            Button {
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                Material.background: Material.Green
                text: qsTr("Добавить объект")
                onClicked: {
                    objectsModel.append({
                                            "name": "Object " + objectsModel.counterWithoutRemoves,
                                            "xpos": Math.random() * 400,
                                            "ypos": Math.random() * 400,
                                            "colorVal": "red",
                                        })
                    objectsModel.counterWithoutRemoves += 1;
                }
            }
        }

        ListModel {
            id: objectsModel
            property int counterWithoutRemoves: 3
            ListElement {
                name: "Object 1"
                xpos: 15
                ypos: 30
                colorVal: "blue"
            }
            ListElement {
                name: "Object 2"
                xpos: 100
                ypos: 300
                colorVal: "green"
            }
        }
    }
}
