import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Item {
    property alias viewModeRadio: viewModeRadio
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

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            //source: "qrc:/img/test_cam_img.jpg"
            width: 640
            height: 480
            color: "transparent"
            Label {
                anchors.centerIn: parent
                text: qsTr("Подключитесь к тележке")
            }
            Image {
                anchors.fill: parent
                source: "data:image/png;base64," + httpInterface.frontCamImgData
                Image {
                    source: "qrc:/img/004-view.png"
                    x: httpInterface.eyeX
                    y: httpInterface.eyeY
                    width: 32
                    height: 32
                }

                VoiceGridImg {
                    id: voiceGridImg
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    opacity: 0
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (pointModeRadio.checked == true) {
                            httpInterface.start_request_take_by_coordinate(mouseX, mouseY);
                        }
                    }
                }
            }
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
                id: viewModeRadio
                text: qsTr("Наблюдение")
                ButtonGroup.group: chooseWorkStateGroup
                checked: true
            }

            RadioButton {
                id: pointModeRadio
                text: qsTr("Целеуказание")
                ButtonGroup.group: chooseWorkStateGroup
            }
            RadioButton {
                id: eyeTrackingModeRadio
                text: qsTr("Следовать за взглядом")
                ButtonGroup.group: chooseWorkStateGroup
            }
            RadioButton {
                id: voiceTrackingModeRadio
                text: qsTr("Взять голосом")
                ButtonGroup.group: chooseWorkStateGroup
                onCheckedChanged: {
                    if (checked == true) {
                        voiceGridImg.opacity = 0.5
                    }else {
                        voiceGridImg.opacity = 0
                    }
                }
            }
        }
    }
}
