import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

import "../js/style.js" as Style

Item {
    id:button
    property string labelColor: "#ffffff"
    property string buttonColor: Style.buttonBgColor
    property string labelText: 'Wrong Path (Correct it!)'
    property bool mainEnabled: true
    signal clicked()
    width: 75
    height: 25
    enabled: mainEnabled

    Button {
        id: buttonBg
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        enabled: mainEnabled

        style: ButtonStyle {
            background: Rectangle {
                color: buttonColor  
                border.color: Style.buttonBgColor           
            }
            label: Text {
                horizontalAlignment: Text.AlignHCenter
                text: labelText
                color: labelColor
                font.family: Style.font1
                font.pointSize : 10
            }
        }

        MouseArea {
            id: buttonMouse
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                buttonColor = Style.buttonLabelColor
                labelColor= Style.buttonBgColor
            }
            onExited: {
                buttonColor = Style.buttonBgColor
                labelColor= Style.lightColor
            }
            onPressed: {
                buttonColor = Style.checkBoxIndFgColor              
                labelColor= Style.buttonBgColor              
            }
            onReleased: {
                buttonColor = Style.buttonBgColor
                labelColor= Style.lightColor          
            }
            onClicked: {
                button.clicked()
            }
        }
    }
}