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

    ListModel {
        id: objectsModel
        property int counterWithoutRemoves: 3
        property int activeElem: 0
        ListElement {
            name: "скотч"
            xpos: 15
            ypos: 30
            widthVal: 100
            heightVal: 200
        }
        ListElement {
            name: "виски"
            xpos: 100
            ypos: 300
            widthVal: 40
            heightVal: 30
        }
    }

    footer: MainToolbar {
        width: parent.width
        id: mainToolbar
    }

}
