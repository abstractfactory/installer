import QtQuick 2.0
import QtQuick.Controls 1.0
import "utils"
import LOGIC 1.0
import "js/style.js" as Style

ApplicationWindow{
	id: root
	width: 320
	height: 320
	title: "Installer"
	flags: Qt.FramelessWindowHint
	maximumHeight: 320
	maximumWidth: 320
	minimumHeight: 320
	minimumWidth: 320
	color: "transparent"

	Logic {
		id: logic
	}

    BorderImage {
        anchors.fill: bg
        anchors { leftMargin: -6; topMargin: -6; rightMargin: -6; bottomMargin: -6 }
        border { left: 15; top: 15; right: 15; bottom: 15 }
        source: "content/shadow.png"; smooth: true
    }

	Rectangle {
		id: bg
		anchors.centerIn: parent
		width: parent.width-10
		height: parent.height-10
		color: Style.staticTextColor
		radius: 2
		// z: -1

		MouseArea {
			anchors.fill: parent
			property real lastMouseX: 0
			property real lastMouseY: 0
			acceptedButtons: Qt.LeftButton
			onPressed: {
				if(mouse.button == Qt.LeftButton){
					parent.forceActiveFocus()
					lastMouseX = mouseX
					lastMouseY = mouseY
				}
			}
			onMouseXChanged: root.x += (mouseX - lastMouseX)
			onMouseYChanged: root.y += (mouseY - lastMouseY)
		}
		Text {
			id: installerText
			anchors.top: parent.top
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 30	
			text: "( installer test program )"
			color : Style.progressBarBgColor
			font.family: Style.font1
			font.pointSize: Style.fontSize
			font.bold: true    	
		}

		InputField {
			id: pass1
			anchors.top: parent.top
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 80
			placeholderText : "Name..."
			// echoMode: TextInput.Password
			// focus: true
			z: 1
		}
		InputField {
			id: pass2
			anchors.top: pass1.bottom
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 15
			placeholderText : "Last Name..."
			// echoMode: TextInput.Password
			// focus: true
			z: 1
		}
		InputField {
			id: pass3
			anchors.top: pass2.bottom
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 15
			placeholderText : "Password..."
			echoMode: TextInput.Password
			flag: true
			// focus: true
			z: 1
		}
		Button {
			id: runCalcBtn
			label: "Install Package"
			anchors.top: pass3.bottom
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 35
			width: 100
			onClicked: {
				// logic.password = pass3.text	    		
				// logic.installProgram()
				// result.text = logic.password
				// logic.printPassword()
				// print("list: " + logic.installList[1])
			}
			z: 1
		}

		Text {
			id: result
			anchors.top: runCalcBtn.bottom
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 10	
			text: logic.password
			color : Style.lightColor
			font.family: Style.font1
			font.pointSize: Style.fontSize
			font.bold: true
		}

	}
}