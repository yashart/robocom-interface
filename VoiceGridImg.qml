import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

Rectangle {
    id: voiceGridImg
    property int deep: 0

    Rectangle {
        id: voiceTab1
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: parent.left
        anchors.top: parent.top
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("1")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab2
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: voiceTab1.right
        anchors.top: voiceTab1.top
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("2")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab3
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: voiceTab2.right
        anchors.top: voiceTab2.top
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("3")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab4
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: parent.left
        anchors.top: voiceTab1.bottom
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("4")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab5
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: voiceTab4.right
        anchors.top: voiceTab4.top
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("5")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab6
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: voiceTab5.right
        anchors.top: voiceTab5.top
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("6")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab7
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: parent.left
        anchors.top: voiceTab4.bottom
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("7")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab8
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.left: voiceTab7.right
        anchors.top: voiceTab7.top
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("8")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Rectangle {
        id: voiceTab9
        color: "transparent"
        width: parent.width / 3
        height: parent.height / 3
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        border.width: 1
        border.color: "black"
        Label {
            text: qsTr("9")
            anchors.centerIn: parent
            font.pixelSize: parent.height / 1.4
            font.family: "Verdana"
        }
    }
    Connections {
        target: window
        onKeyReceived: {
            if (key === Qt.Key_1) {
                x += 0;
                y += 0;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_2) {
                x += width / 3;
                y += 0;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_3) {
                x += 2 * width / 3;
                y += 0;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_4) {
                x += 0;
                y += height / 3;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_5) {
                x += width / 3;
                y += height / 3;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_6) {
                x += 2 * width / 3;
                y += height / 3;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_7) {
                x += 0;
                y += 2 * height / 3;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_8) {
                x += width / 3;
                y += 2 * height / 3;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key === Qt.Key_9) {
                x += 2 * width / 3;
                y += 2 * height / 3;
                width = width / 3;
                height = height / 3;
                voiceGridImg.deep += 1;
            }
            if (key == Qt.Key_R) {
                x = 0;
                y = 0;
                width = parent.width;
                height = parent.height;
                voiceGridImg.deep = 0;
            }
            if (voiceGridImg.deep === 4) {
                console.log("x, y: " + Math.round(x) + " " + Math.round(y));
                x = 0;
                y = 0;
                width = parent.width;
                height = parent.height;
                voiceGridImg.deep = 0;
            }
        }
    }
}
