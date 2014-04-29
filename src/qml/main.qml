// abstract factory ltd.
// Installer (GUI)
////////////////////////////////////////////////////////////////////
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Window 2.0

import "utils"
import "js/style.js" as Style

ApplicationWindow {
    id: root
    width: 320
    height: 320
    title: "Installer"
    // flags: Qt.SplashScreen
    maximumHeight: 320
    maximumWidth: 320
    minimumHeight: 320
    minimumWidth: 320

    Rectangle {
        id: bg
        width: parent.width
        height: parent.height
        color: "#373737"
        z: -1
        
        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.forceActiveFocus()
                // parent.focus = !parent.focus
            }
        }
        Button {
            label: "next"
            anchors.bottom: parent.bottom
            width: 50
            height: 20
            onClicked: {
                if(page1.visible == true){
                    page1.visible = false
                    page2.visible = true
                }
                else if(page2.visible == true){
                    page2.visible = false
                    page3.visible = true
                }
                else{
                    page3.visible = false
                    page1.visible = true
                }
            }
        }

        Column {
            id: ui
            width: parent.width
            height: parent.height
            Row {
                id: header
                width: parent.width
                height: 60
                Text {
                    id: brand
                    text: Style.brand
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.topMargin: 20
                    anchors.leftMargin: 20
                    color : Style.staticTextColor
                    font.family: Style.font1
                    font.pointSize: Style.fontSize
                }

                Rectangle {
                    id: minBtn
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.topMargin: 20
                    anchors.rightMargin: 40
                    width: 15
                    height: 15
                    color: "transparent"

                    Text {
                        id: _
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: -7
                        text: "_"
                        color : Style.lightColor
                        font.family: Style.font1
                        font.bold: true
                        font.pointSize: 13
                    }
                }

                Rectangle {
                    id: closeBtn
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.topMargin: 20
                    anchors.rightMargin: 20
                    width: 15
                    height: 15
                    color: "transparent"

                    Text {
                        id: x
                        anchors.centerIn: parent
                        text: "X"
                        color : Style.lightColor
                        font.family: Style.font1
                        font.bold: true
                        font.pointSize: 13
                    }

                    MouseArea {
                        id: closeId
                        anchors.fill: parent
                        onClicked: Qt.quit()
                    }
                }
            }

            Row {
                id: pages
                width: parent.width
                height: 230

                Column {
                    id: page1
                    // anchors.left: parent.left
                    // anchors.leftMargin: 50
                    width: parent.width
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    // visible: false
                    Row {
                        id:checkBoxes
                        width: parent.width
                        height: 140
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle {
                            id: checkBoxesBg
                            // anchors.top: parent.top
                            // anchors.topMargin: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 250
                            height: 110
                            color: Style.textFieldBgColor
                            border.color: Style.checkBoxIndBgColor
                            Column {
                                width: parent.width

                                Row {
                                    width: parent.width
                                    height: 28
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        StatusCheck {
                                            checked: true
                                            checkBoxLabel: "pifou"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        Text {
                                            text: "0.7.1"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            font.family: Style.font1
                                            font.pointSize: Style.fontSize
                                            color: Style.staticTextColor
                                        }                                    
                                    }
                                }
                                Row {
                                    width: parent.width
                                    height: 28
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        StatusCheck {
                                            checked: true
                                            checkBoxLabel: "pigui"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        Text {
                                            text: "0.7.1"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            font.family: Style.font1
                                            font.pointSize: Style.fontSize
                                            color: Style.staticTextColor
                                        }                                    
                                    }
                                }
                                Row {
                                    width: parent.width
                                    height: 28
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        StatusCheck {
                                            checked: true
                                            checkBoxLabel: "piapp"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        Text {
                                            text: "0.7.1"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            font.family: Style.font1
                                            font.pointSize: Style.fontSize
                                            color: Style.staticTextColor
                                        }                                    
                                    }
                                }
                                Row {
                                    width: parent.width
                                    height: 28
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        StatusCheck {
                                            checked: true
                                            checkBoxLabel: "pidep"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Column {
                                        width: 140
                                        height: parent.heigh
                                        anchors.verticalCenter: parent.verticalCenter
                                        Text {
                                            text: "1.0.0"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            font.family: Style.font1
                                            font.pointSize: Style.fontSize
                                            color: Style.staticTextColor
                                        }                                    
                                    }
                                }

                            }
                        }                        
                    }

                    Row {
                        width: parent.width
                        height: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        InputField {
                            id: pass
                            anchors.horizontalCenter: parent.horizontalCenter
                            placeholderText : "Password..."
                            echoMode: TextInput.Password
                            flag: true
                        }
                    }

                    Row {
                        width: parent.width
                        height: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            id: installBtn
                            anchors.horizontalCenter: parent.horizontalCenter
                            // anchors.top: parent.bottom
                            // anchors.topMargin: 5
                            label: "Install"
                            onClicked: {                
                                messageDialog.visible = true
                                if(passwordField.text != "")
                                    result.text = passwordField.text
                            }
                        }
                    }
                }
                Column {
                    id: page2
                    // anchors.left: parent.left
                    // anchors.leftMargin: 50
                    width: parent.width
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: false
                    Row {
                        width: parent.width
                        height: 120
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Row {
                        width: parent.width
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        Column {
                            anchors.horizontalCenter: parent.horizontalCenter
                            ProgressBar{
                                label:"downloading..."
                                // value: Math.floor(Math.random()*11)/10
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Row {
                                width: parent.width
                                height: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            ProgressBar{
                                label:"progress..."
                                indeterminate: true
                                // value: Math.floor(Math.random()*11)/10
                                anchors.horizontalCenter: parent.horizontalCenter
                            }          
                        }
                    }
                }
                Column {
                    id: page3
                    // anchors.left: parent.left
                    // anchors.leftMargin: 50
                    width: parent.width
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: false
                    Row {
                        width: parent.width
                        height: 140
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text {
                            id: success
                            text: "Installation Successful!"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 25
                            color : Style.lightColor
                            font.family: Style.font1
                            font.pointSize: Style.fontSize
                        }
                    }
                    Row {
                        width: parent.width
                        height: 35
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            label: "Documentation"
                            width: 140
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    Row {
                        width: parent.width
                        height: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            label: "Close"
                            width: 120
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: Qt.quit()
                        }
                    }
                }
            }

            Row {
                id: footer
                width: parent.width
                height: 35                
                Text {
                    id: pipi
                    text: "pipi 0.7.1"
                    anchors.centerIn: parent
                    color : Style.staticTextColor
                    font.family: Style.font1
                    font.pointSize: Style.fontSize
                }
            }
        }
    }

    // Window {
    //     id: messageDialog
    //     // flags: Qt.WindowStaysOnTopHint
    //     modality: Qt.WindowModal
    //     title: "Confirmation"
    //     width: 200
    //     height: 90

    //     Rectangle {
    //         id: dialogBg
    //         width: parent.width
    //         height: parent.height
    //         color: "#373737"
    //         Column {
    //             id: dialogUi

    //             Text {
    //                 id: passText
    //                 anchors.top: parent.top
    //                 anchors.left: parent.left
    //                 anchors.leftMargin: 45
    //                 anchors.topMargin: 25
    //                 text: "pass: "
    //                 color: "#191919"

    //                 Text {
    //                     id: result
    //                     anchors.left: passText.right
    //                     color: "#191919"
    //                     text: "nothing"
    //                 }
    //             }

    //             Button {
    //                 id: okBtn
    //                 width: 100
    //                 label: "OK"
    //                 onClicked: {
    //                     messageDialog.visible = false
    //                 }
    //             }
    //         }
    //     }
    // }
}