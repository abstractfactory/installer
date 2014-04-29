import QtQuick 2.0

import "../js/style.js" as Style

Item {
    id:button
    property alias label: buttonLabel.text
    signal clicked()
    width: 75
    height: 25

    Rectangle {
        id: buttonBg
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Style.buttonBgColor
        border.color: Style.buttonBgColor

        Text {
            id: buttonLabel
            anchors.centerIn: parent
            text: "default"
            color: Style.buttonLabelColor
        }

        MouseArea {
            id: buttonMouse
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                buttonBg.color= Style.buttonLabelColor
                buttonLabel.color= Style.buttonBgColor
            }
            onExited: {
                buttonBg.color= Style.buttonBgColor
                buttonLabel.color= Style.buttonLabelColor
            }
            onClicked: {
                button.clicked()
            }
            onPressed: {
                buttonBg.color= Style.checkBoxIndFgColor
                buttonLabel.color= Style.buttonLabelColor                
            }
            onReleased: {
                buttonBg.color= Style.buttonLabelColor
                buttonLabel.color= Style.buttonBgColor              
            }
        }
    }
}