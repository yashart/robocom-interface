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
            model: httpInterface.objectsModel
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
                        text: qsTr("Объект id: " + edit.id)
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
                        text: qsTr("x: " + edit.x + " y: " + edit.y)
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
                        text: edit.type
                    }
                }
            }
        }
    }
    Label {
        id: unconectedLabel
        anchors.centerIn: parent
        visible: (httpInterface.objectsModel.rowCount() === 0)?true:false
        text: qsTr("Подключитесь к тележке")
    }
}
