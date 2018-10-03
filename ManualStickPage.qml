import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Item {
    RowLayout {
        anchors.fill: parent
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 100
            spacing: 100
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("X - Y")
                font.pointSize: 15
                font.family: "Verdana"
                color: "#BEBEBE"
            }
            Item {
                width: 250
                height: 250
                Image {
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/002-up-arrow.png"
                }
                Image {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/001-chevron-sign-down.png"
                }
                Image {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/003-arrow.png"
                }
                Image {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/004-arrow-1.png"
                }
            }
        }
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 100
            spacing: 100
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Z")
                font.pointSize: 15
                font.family: "Verdana"
                color: "#BEBEBE"
            }
            Slider {
                Layout.alignment: Qt.AlignCenter
                value: 0.5
                orientation: Qt.Vertical
            }
        }
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 100
            spacing: 100

            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Pitch - Row")
                font.pointSize: 15
                font.family: "Verdana"
                color: "#BEBEBE"
            }
            Item {
                width: 250
                height: 250
                Image {
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/002-up-arrow.png"
                }
                Image {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/001-chevron-sign-down.png"
                }
                Image {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/003-arrow.png"
                }
                Image {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/004-arrow-1.png"
                }
            }
        }
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 100
            spacing: 100

            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Z")
                font.pointSize: 15
                font.family: "Verdana"
                color: "#BEBEBE"
            }
            Slider {
                Layout.alignment: Qt.AlignCenter
                value: 0.5
                orientation: Qt.Vertical
            }
        }
    }
}
