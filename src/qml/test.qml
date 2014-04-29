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
	// flags: Qt.SplashScreen
	maximumHeight: 320
	maximumWidth: 320
	minimumHeight: 320
	minimumWidth: 320

	Logic {
		id: logic
	}

	Rectangle {
		width: parent.width
		height: parent.height
		color: Style.staticTextColor
		z: -1

		MouseArea {
			anchors.fill: parent
			onClicked: {
				parent.forceActiveFocus()
				// parent.focus = !parent.focus
			}
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
				logic.password = pass3.text	    		
				logic.installProgram()
				result.text = logic.password
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