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
            Layout.topMargin: 100
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            ButtonGroup { id: chooseWorkStateGroup }

            Label {
                text: qsTr("Режимы работы:")
                font.pointSize: 15
                font.family: "Verdana"
                color: "#9E9E9E"
            }

            RadioButton {
                text: qsTr("Наблюдение")
                ButtonGroup.group: chooseWorkStateGroup
                checked: true
            }

            RadioButton {
                text: qsTr("Целеуказание")
                ButtonGroup.group: chooseWorkStateGroup
            }
            RadioButton {
                text: qsTr("Следовать за взглядом")
                ButtonGroup.group: chooseWorkStateGroup
            }
        }
    }
}
