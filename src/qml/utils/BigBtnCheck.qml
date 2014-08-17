import QtQuick 2.0
import QtQuick.Layouts 1.1

import "../js/style.js" as Style

Item {
	id:button
	property alias label: buttonLabel.text
	property alias checkBoxLabel: state.checkBoxLabel
	property alias fgColor: innerBg.color
	property alias check: state.checked
	signal clicked()
	width: 138
	height: 164
	ColumnLayout {
		Rectangle {
			id: outterBg
			anchors.top: parent.top
			width: 138
			height: 138
			color: "#373737"
			border.color: "#2b2b2b"
			Rectangle {
				id: innerBg
				anchors.centerIn: parent
				width: parent.width-2
				height: parent.height-2
				color: check? "#474747":"#373737"
				border.color: "#4b4b4b"

				Text {
					id: buttonLabel
					anchors.centerIn: parent
					text: "default"
					color: Style.lightColor
					font.family: Style.font1
					font.pointSize: Style.fontSize
				}
				MouseArea {
					id: buttonMouse
					anchors.fill: parent
					hoverEnabled: true
					onEntered: {
						innerBg.color= "#474747"
						outterBg.border.color = check? "#2b2b2b":"#3c3c3c"
						innerBg.border.color = check? "#4b4b4b":"#2b2b2b"
					}
					onExited: {
						innerBg.color= check? "#474747":"#373737"
						outterBg.border.color = "#2b2b2b"
						innerBg.border.color = "#4b4b4b"
					}
					onClicked: {
						button.clicked()
						// state.checked = true
					}
					onPressed: {
						innerBg.color= check? "#474747":Style.checkBoxIndFgColor
						outterBg.border.color = check? "#2b2b2b":"#3c3c3c"
						innerBg.border.color = check? "#4b4b4b":"#2b2b2b"
						buttonLabel.color = check? Style.lightColor:"#373737"
					}
					onReleased: {
						innerBg.color= "#474747"
						outterBg.border.color = "#2b2b2b"
						innerBg.border.color = "#4b4b4b"
						buttonLabel.color = Style.lightColor
					}
				}
			}
		}
		StatusCheck {
			id: state
			anchors.top: outterBg.bottom            
			anchors.topMargin: 5            
			anchors.horizontalCenter: outterBg.horizontalCenter            
			checkBoxLabel: ""
			// checked: true
		}
	}
}