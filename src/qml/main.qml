// abstract factory ltd.
// Installer (GUI)
////////////////////////////////////////////////////////////////////
import QtQuick 2.0
import QtQuick.Controls 1.1 
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.1

ApplicationWindow {
    id: root
    width: 320
    height: 320
    title: "Installer"

    Rectangle {
        id: bg
        width: parent.width
        height: parent.height
        color: "#373737"

        Text {
            id: afLtd
            text: "abstract factory ltd."
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 25
            color : "#777777"
            font.family: "Helvetica"
        }

        TextField {
            id: passwordField
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 100
            width: 220
            text: ""
            placeholderText : "Enter Your Password..."
            font.family: "Helvetica"
            focus: true
            echoMode: TextInput.Password

            style: TextFieldStyle {
                textColor: "#424242"
                placeholderTextColor: "#424242"
                background: Rectangle {
                    color: "#252525"
                }
            }
        }

        Rectangle {
            id: buttonBg
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 50
            width: 75
            height: 25
            color: "#191919"

            Text {
                id: text
                anchors.centerIn: parent
                text: "Install"
                color: "#575757"
            }

            MouseArea {
                id: mouse
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    buttonBg.color= "#575757"
                    text.color= "#191919"
                }
                onExited: {
                    buttonBg.color= "#191919"
                    text.color= "#575757"
                }
                onClicked: {
                    messageDialog.visible = true
                    if(passwordField.text != "")
                        result.text = passwordField.text
                }
            }
        }

        Text {
            id: pipi
            text: "pipi 0.7.1"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 25
            color : "#777777"
            font.family: "Helvetica"
        }
    }

    Window {
        id: messageDialog
        // flags: Qt.WindowStaysOnTopHint
        modality: Qt.WindowModal
        title: "Confirmation"
        width: 200
        height: 90

        Rectangle {
            id: dialogBg
            width: parent.width
            height: parent.height
            color: "#373737"

            Text {
                id: pass
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 45
                anchors.topMargin: 25
                text: "pass: "
                color: "#191919"

                Text {
                    id: result
                    anchors.left: pass.right
                    color: "#191919"
                    text: "nothing"
                }
            }
        }

        Rectangle {
            id: okBtnBg
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 20
            width: 75
            height: 25
            color: "#191919"

            Text {
                id: dialogText
                anchors.centerIn: parent
                text: "OK"
                color: "#575757"
            }

            MouseArea {
                id: dialogMouse
                anchors.fill: okBtnBg
                hoverEnabled: true
                onEntered: {
                    okBtnBg.color= "#575757"
                    dialogText.color= "#191919"
                }
                onExited: {
                    okBtnBg.color= "#191919"
                    dialogText.color= "#575757"
                }
                onClicked: {
                    messageDialog.visible = false
                }
            }
        }
    }
}