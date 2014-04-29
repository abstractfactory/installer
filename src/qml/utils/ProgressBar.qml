import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

import "../js/style.js" as Style

Item {
	id: progressBar	
    property alias label: txt.text
    property alias value: bar.value
    property alias indeterminate: bar.indeterminate
    width: 250
    height: 30

    Text {
        id: txt
        text: "default..."
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        // color : 
        font.family: Style.font1
        font.pointSize: Style.fontSize
        color: Style.lightColor
    }

    ProgressBar {
        id: bar
        anchors.top: txt.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 7
        width: parent.width
        height: 3
        value: .5
        style: ProgressBarStyle {
            background: Rectangle {
                // radius: 2
                color: Style.progressBarBgColor
                // border.color: "gray"
                // border.width: 1
                // implicitWidth: 100
                // implicitHeight: 24
            }
            progress: Rectangle {
                color: Style.progressBarFgColor
                // border.color: "steelblue"
            }
        }
    }
}
