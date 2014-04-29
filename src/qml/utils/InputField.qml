import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

import "../js/style.js" as Style

Item {
	id: inputField
	property alias placeholderText: input.placeholderText
	property alias text: input.text
	property alias echoMode: input.echoMode
	property bool flag: false
	width: 220
	height: 25
	state: input.focus? "after": "before"

	states: [
		State {
			name: "before"
			PropertyChanges { target: input; width: 200; }
		},
		State {
			name: "after"
			PropertyChanges { target: input; width: 230; }
		}
	]

	transitions:[
		Transition {
			from: "*"
			// to: "right"
			PropertyAnimation { target: input; properties: "width"; duration: 350; easing.type: Easing.OutQuad }
		}
	]

	TextField {
		id: input
		anchors.centerIn: parent
		width: 200
		height: parent.height
		text: ""
		placeholderText : "Enter Your name..."
		font.family: Style.font1
		font.pointSize: Style.fontSize
		// activeFocusOnPress: false
		// focus: true
		// echoMode: TextInput.Password
		// activeFocusOnPress: false

		style: TextFieldStyle {
			textColor: Style.textFieldTextColor
			placeholderTextColor: Style.textFieldTextColor
			background: Rectangle {
				color: Style.textFieldBgColor
			}
		}
		Rectangle {
			id: passEye
			width: 25
			height: 25
			anchors.left: parent.right
			anchors.leftMargin: 3
			visible: input.text != "" && flag == true? true : false
			// opacity: 0.0
			enabled: input.focus == true ? 1.0 : 0.0
			anchors.verticalCenter: parent.verticalCenter
			color: Style.textFieldBgColor	
			state: input.focus? "after": "before"

			states: [
				State {
					name: "before"
					PropertyChanges { target: passEye; opacity: 0.0; }
				},
				State {
					name: "after"
					PropertyChanges { target: passEye; opacity: 1.0; }
				}
			]

			transitions:[
				Transition {
					from: "*"
					// to: "right"
					PropertyAnimation { target: passEye; properties: "opacity"; duration: 200; easing.type: Easing.OutQuad }
				}
			]

			Text {
				id: eye
				anchors.centerIn: parent
				text: "\uE18B" 
				// text: "\u004c" 
				font.family: myFont.name
				font.pointSize: 10
				font.bold: true
				color: Style.checkBoxIndFgColor
			}
			MouseArea {
				id: checking
				anchors.fill: parent
				onPressed: {
					if(echoMode == TextInput.Password ){
						echoMode = TextInput.Normal
						eye.color = Style.textFieldBgColor
						parent.color = Style.textFieldTextColor
						// text = ""
					}
				}
				onReleased:{
					if(echoMode == TextInput.Normal ){
						echoMode = TextInput.Password
						eye.color = Style.textFieldTextColor
						parent.color = Style.textFieldBgColor
						// text = ""
					}
				}
			}	        
		}

		MouseArea {
			// anchors.fill: parent
			onPressed: {
				if(focus != true){
					parent.forceActiveFocus()
				}
			}
		}
		// KeyNavigation.tab: 
	}
	FontLoader {
		id: myFont
		name: "Segoe UI Symbol"
		// name: "FontAwesome"
		// name: "GLYPHICONS Halflings"
		// name: "Glyphish"
	}

	Component.onCompleted: {
		if(input.text != "" && flag == true)
			passEye.visible = true
	}

}