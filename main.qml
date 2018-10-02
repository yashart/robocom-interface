import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3

ApplicationWindow {
    id: window
    visible: true
    width: 1080
    height: 800
    title: qsTr("robocom-interface")

    SwipeView {
        id: mainView
        currentIndex: 0
        anchors.fill: parent
        MainCameraPage {
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
    }

    footer: MainToolbar {
        width: parent.width
        id: mainToolbar
    }

}
