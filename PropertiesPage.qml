import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Item {
    ColumnLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        spacing: 50

        Label {
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.topMargin: 50
            text: qsTr("Информация о состоянии внешних устройств")
        }

        Label {
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 50
            text: qsTr("Мой хост: ") + connectionInfo.host
        }

        Label {
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 50
            text: qsTr("Мой порт: ") + connectionInfo.port
        }

        Label {
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 50
            text: qsTr("Хост компа: ") + connectionInfo.computerHost
        }

        Label {
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 50
            text: qsTr("Порт компа: ") + connectionInfo.computerPort
        }

        Rectangle {
            Layout.fillHeight: true
        }

        Button {
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            text: qsTr("Обновлять картинку")
            onClicked: {
                //imgRefreshTimer.start()
                httpInterface.ready_to_http_slot(connectionInfo.computerHost,
                                                 connectionInfo.computerPort)
            }
        }

        Button {
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.bottomMargin: 50
            text: qsTr("Послать бродкаст")
            onClicked: {
                connectionInfo.brodcast_my_host()
            }
        }
    }
}
