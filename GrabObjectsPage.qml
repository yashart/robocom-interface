import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

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
            Layout.alignment: Qt.AlignCenter
            source: "qrc:/img/test_cam_img.jpg"
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
                    }
                    Image {
                        source: "qrc:/img/x-button.png"
                        sourceSize.height: 32
                        sourceSize.width: 32
                    }
                }
            }
        }

        ListModel {
            id: objectsModel
            ListElement {
                name: "Object 1"
            }
            ListElement {
                name: "Object 2"
            }
        }
    }
}
