import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

import "../js/style.js" as Style

Item {
	id: progressBar	
	property alias label: txt.text
	property alias value: bar.value
	property alias indeterminate: bar.indeterminate
	width: 270
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
		height: 5
		// indeterminate: true
		style: ProgressBarStyle {
			background: Rectangle {
				radius: 2
				color: "lightblue"
				border.color: "gray"
				border.width: 1
				implicitWidth: 200
				implicitHeight: 24
			}
			progress: Rectangle {
			    border.color: "steelblue"
			    color: "lightsteelblue"

			    // Indeterminate animation by animating alternating stripes:
			    Item {
			        anchors.fill: parent
			        anchors.margins: 1
			        visible: bar.indeterminate
			        clip: true
			        Row {
			            Repeater {
			                Rectangle {
			                    color: index % 2 ? "steelblue" : "lightsteelblue"
			                    width: 20 ; height: bar.height
			                }
			                model: bar.width / 20 + 2
			            }
			            XAnimator on x {
			                from: -40 ; to: 0
			                loops: Animation.Infinite
			                duration: 500
			                running: bar.indeterminate
			            }
			        }
			    }
			}
		}
	}
}
