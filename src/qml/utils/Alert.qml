import QtQuick 2.0
import QtQuick.Controls 1.0
import "../js/style.js" as Style

Item {
	id: alert
	// clip: true
	signal clicked()
	width: 310
	height: 80
	Rectangle {
		id: outterBg
		// anchors.centerIn: parent
		width: parent.width
		height: parent.height
		color: "#373737"
		border.color: "#2b2b2b"
		Rectangle {
			id: innerBg
			// anchors.centerIn: parent
			width: parent.width-2
			height: parent.height-2
			color: "#474747"
			border.color: "#4b4b4b"
	        state: "out"

	        states: [
	            State {
	                name: "in"
	                PropertyChanges { target: outterBg; x: 0; }
	            },
	            State {
	                name: "out"
	                PropertyChanges { target: outterBg; x: -350; }
	            }
	        ]

	        transitions:[
	            Transition {
	                from: "*"
	                PropertyAnimation { target: outterBg; properties: "x"; duration: 450; easing.type: Easing.OutQuad }
	            }
	        ]
	        Text {
	        	anchors.centerIn: parent
	        	text: "Alert:\n Python 2.7 does not exsist."
	        	font.family: Style.font1
	        	font.pointSize: 10
	        }
	        Component.onCompleted: {
	            innerBg.state = 'in'
	        }
			MouseArea {
				id: buttonMouse
				anchors.fill: innerBg
				onClicked: {
		            innerBg.state = 'out'
		            alert.clicked()
				}
			}
	    }
    }
}