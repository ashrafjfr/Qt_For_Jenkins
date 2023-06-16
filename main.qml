import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    RowLayout {
        x: 284
        y: 215
        width: 72
        height: 51
        Button {
            text: "Ok"
            icon.height: 30
            icon.width: 30
            onClicked: console.log("Ok")
        }
        Button {
            text: "Cancel"
            icon.width: 30
            icon.height: 30
            icon.color: "#000000"
            onClicked: console.log("Cancel")
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
