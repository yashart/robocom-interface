import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Item {
    ColumnLayout {
        Layout.alignment: Qt.AlignCenter
        spacing: -1

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            Rectangle {
                Layout.alignment: Qt.AlignCenter
                color: "transparent"
                width: 300
                height: 50
                border.width: 1
                border.color: "black"
                Label {
                    anchors.centerIn: parent
                    text: qsTr("Название")
                    color: "#F44336"
                }
            }

            Rectangle {
                Layout.alignment: Qt.AlignCenter
                color: "transparent"
                width: 300
                height: 50
                border.width: 1
                border.color: "black"
                Label {
                    anchors.centerIn: parent
                    text: qsTr("Координаты")
                    color: "#F44336"
                }
            }

            Rectangle {
                Layout.alignment: Qt.AlignCenter
                color: "transparent"
                width: 300
                height: 50
                border.width: 1
                border.color: "black"
                Label {
                    anchors.centerIn: parent
                    text: qsTr("Тип объекта")
                    color: "#F44336"
                }
            }
        }
        Repeater {
            model: 5
            delegate: RowLayout {
                Layout.alignment: Qt.AlignCenter
                Rectangle {
                    Layout.alignment: Qt.AlignCenter
                    color: "transparent"
                    width: 300
                    height: 50
                    border.width: 1
                    border.color: "black"
                    Label {
                        anchors.centerIn: parent
                        text: qsTr("Объект 1")
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignCenter
                    color: "transparent"
                    width: 300
                    height: 50
                    border.width: 1
                    border.color: "black"
                    Label {
                        anchors.centerIn: parent
                        text: qsTr("x: 50, y: 34, z: -7431")
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignCenter
                    color: "transparent"
                    width: 300
                    height: 50
                    border.width: 1
                    border.color: "black"
                    Label {
                        anchors.centerIn: parent
                        text: qsTr("скотч")
                    }
                }
            }
        }
    }
}
