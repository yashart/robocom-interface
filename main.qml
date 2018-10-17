import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3

ApplicationWindow {
    id: window
    visible: true
    width: 1080
    height: 800
    title: qsTr("robocom-interface")

    signal keyReceived(int key)

    SwipeView {
        id: mainView
        currentIndex: 0
        anchors.fill: parent
        MainCameraPage {
            id: mainCameraPage
        }

        ManualStickPage {
        }

        GrabObjectsPage {
        }

        CalibrationPage {
        }

        NetworkInfoPage {
        }

        PropertiesPage {
        }

        Keys.onPressed: {
            keyReceived(event.key)
        }
    }

    ListModel {
        id: objectsModel
        property int counterWithoutRemoves: 3
        property int activeElem: 0
    }

    Timer {
        id: imgRefreshTimer;
        interval: 1000; running: false; repeat: true
        onTriggered: httpInterface.ready_to_http_slot()
    }

    footer: MainToolbar {
        width: parent.width
        id: mainToolbar
    }

    Connections {
        target: microphoneConnection
        onCommandIdChanged: {
            if (microphoneConnection.commandId == 5) {
                if (mainView.currentIndex != 5) {
                    mainView.currentIndex += 1;
                }
            }
            if (microphoneConnection.commandId == 6) {
                if (mainView.currentIndex != 0) {
                    mainView.currentIndex -= 1;
                }
            }
            if (microphoneConnection.commandId == 3) {
                mainCameraPage.viewModeRadio.checked = true;
            }

            console.log("voice command: " + microphoneConnection.commandId)
        }
    }
}
