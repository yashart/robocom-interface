import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

ToolBar {
    Material.primary: "#FFFFFF"

    RowLayout {
        anchors.fill: parent
        ColumnLayout {
            id: homeColumnLayout
            Layout.alignment: Qt.AlignCenter
            Image {
                sourceSize.height: 64
                sourceSize.width: 64
                source: "qrc:/img/001-home.png"
                Layout.alignment: Qt.AlignCenter
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Главная")
                font.pointSize: 30
                font.family: "Verdana"
                color: "#9E9E9E"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mainView.currentIndex = 0
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignCenter
            Image {
                sourceSize.height: 64
                sourceSize.width: 64
                source: "qrc:/img/003-joystick-with-button.png"
                Layout.alignment: Qt.AlignCenter
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Ручное")
                font.pointSize: 30
                font.family: "Verdana"
                color: "#9E9E9E"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mainView.currentIndex = 1
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignCenter
            Image {
                sourceSize.height: 64
                sourceSize.width: 64
                source: "qrc:/img/008-area.png"
                Layout.alignment: Qt.AlignCenter
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Захват")
                font.pointSize: 30
                font.family: "Verdana"
                color: "#9E9E9E"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mainView.currentIndex = 2
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignCenter
            Image {
                sourceSize.height: 64
                sourceSize.width: 64
                source: "qrc:/img/007-aim.png"
                Layout.alignment: Qt.AlignCenter
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Калибровка")
                styleColor: "#da2e2e"
                font.pointSize: 30
                font.family: "Verdana"
                color: "#9E9E9E"
            }
        }

        ColumnLayout {
            id: networkInfoColumnLayout
            Layout.alignment: Qt.AlignCenter
            Image {
                sourceSize.height: 64
                sourceSize.width: 64
                source: "qrc:/img/share.png"
                Layout.alignment: Qt.AlignCenter
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Сети")
                font.pointSize: 30
                font.family: "Verdana"
                color: "#9E9E9E"
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignCenter
            Image {
                sourceSize.height: 64
                sourceSize.width: 64
                source: "qrc:/img/005-settings.png"
                Layout.alignment: Qt.AlignCenter
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Настройки")
                font.pointSize: 30
                font.family: "Verdana"
                color: "#9E9E9E"
            }
        }
    }
}
