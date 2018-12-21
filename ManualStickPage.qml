import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Item {
    id: rootManualStickPage
    RowLayout {
        Layout.alignment: Qt.AlignTop
        Layout.topMargin: 100
        spacing: 0

        //anchors.fill: parent
        Item {
            width: window.width * 0.25
            ColumnLayout {
                Label {
                    text: qsTr("Шарниры")
                }
                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("g1")
                    }
                    Slider {
                        id: g1Slider
                        value: 0
                        from: -18000
                        to: 18000
                        stepSize: 1
                    }
                    TextField {
                        text: g1Slider.value / 100
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            g1Slider.value = text * 100
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("g2")
                    }
                    Slider {
                        id: g2Slider
                        value: 0
                        from: -18000
                        to: 18000
                        stepSize: 1
                    }
                    TextField {
                        text: g2Slider.value / 100
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            g2Slider.value = text * 100
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("g3")
                    }
                    Slider {
                        id: g3Slider
                        value: 0
                        from: -18000
                        to: 18000
                        stepSize: 1
                    }
                    TextField {
                        text: g3Slider.value / 100
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            g3Slider.value = text * 100
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("g4")
                    }
                    Slider {
                        id: g4Slider
                        value: 0
                        from: -18000
                        to: 18000
                        stepSize: 1
                    }
                    TextField {
                        text: g4Slider.value / 100
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            g4Slider.value = text * 100
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("g5")
                    }
                    Slider {
                        id: g5Slider
                        value: 0
                        from: -18000
                        to: 18000
                        stepSize: 1
                    }
                    TextField {
                        text: g5Slider.value / 100
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            g5Slider.value = text * 100
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("g6")
                    }
                    Slider {
                        id: g6Slider
                        value: 0
                        from: -18000
                        to: 18000
                        stepSize: 1
                    }
                    TextField {
                        text: g6Slider.value / 100
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            g6Slider.value = text * 100
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("g7")
                    }
                    Slider {
                        id: g7Slider
                        value: 0
                        from: -9000
                        to: 9000
                        stepSize: 1
                    }
                    TextField {
                        text: g7Slider.value / 100
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            g7Slider.value = text * 100
                        }
                    }
                }
                RowLayout {
                    Button {
                        text: qsTr("Использовать шарниры")
                        onClicked: {
                            httpInterface.start_request_take_full_g_coordinates(g1Slider.value, g2Slider.value, g3Slider.value,
                                                                                g4Slider.value, g5Slider.value, g6Slider.value,
                                                                                g7Slider.value);
                        }
                    }
                    Button {
                        text: qsTr("Сохранить")
                    }
                }
            }
        }
        Item {
            width: window.width * 0.22
            ColumnLayout {

                Label {
                    text: qsTr("Координаты")
                }
                RowLayout {
                    Label {
                        text: qsTr("x")
                    }
                    Slider {
                        id: xSlider
                        value: 0
                        from: -1
                        to: 1
                        stepSize: 0.001
                    }
                    TextField {
                        text: Math.round(xSlider.value * 1000) / 1000
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            xSlider.value = text
                        }
                    }
                }
                RowLayout {
                    Label {
                        text: qsTr("y")
                    }
                    Slider {
                        id: ySlider
                        value: 0
                        from: -1
                        to: 1
                        stepSize: 0.001
                    }
                    TextField {
                        text: Math.round(ySlider.value * 1000) / 1000
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            ySlider.value = text
                        }
                    }
                }
                RowLayout {
                    Label {
                        text: qsTr("z")
                    }
                    Slider {
                        id: zSlider
                        value: 0
                        from: -1
                        to: 1
                        stepSize: 0.001
                    }
                    TextField {
                        text: Math.round(zSlider.value * 1000) / 1000
                        inputMethodHints: Qt.ImhDigitsOnly
                        onAccepted: {
                            zSlider.value = text
                        }
                    }
                }

                RowLayout {
                    Button {
                        text: qsTr("Использовать координаты")
                        onClicked: {
                            httpInterface.start_request_take_full_x_coordinates(g7Slider.value,
                                                                                Math.round(xSlider.value * 1000) / 1000,
                                                                                Math.round(ySlider.value * 1000) / 1000,
                                                                                Math.round(zSlider.value * 1000) / 1000);
                        }
                    }
                    Button {
                        text: qsTr("Сохранить")
                    }
                }
            }
        }
        /*
        Item {
            width: window.width * 0.22
            ListView {
                model: savedCoordinatesModel
                delegate: RowLayout {
                    Label {
                        text: qsTr("Координата " + index)
                    }
                    Button {
                        text: qsTr("Использовать")
                        onClicked: {

                        }
                    }
                }
            }
        }
        */
        Item {
            width: window.width * 0.22
            ColumnLayout {
                Label {
                    text: qsTr("Предустановленные координаты")
                }
                TextField {
                    id: predefinedCoordinatesTextField
                    inputMethodHints: Qt.ImhDigitsOnly
                }
                Button {
                    text: qsTr("Использовать")
                    onClicked: {
                        httpInterface.start_request_predefined_coordinates(Math.round(predefinedCoordinatesTextField.text));
                    }
                }
            }
        }
    }
/*
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
*/
}
