import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Window {
	id: splash
	color: "transparent"
	title: "Splash Logo Window"
	modality: Qt.ApplicationModal
	flags: Qt.SplashScreen
	property int timeoutInterval: 15000
	signal timeout
	width: 330
	height: 170
	x: (Screen.width - width) / 2
	y: (Screen.height - height) / 2


	Rectangle {
		id: border
		// anchors.centerIn: parent
		width: parent.width
		height: parent.height
		// clip: true
		color: "transparent"
		// state: "out"

		// second animate
		// ScaleAnimator {
		//     target: border
		//     from: 0.9
		//     to: 1
		//     duration: 1000
		//     running: true
		// }

		// First animate
		// states: [
		//     State {
		//         name: "in"
		//         PropertyChanges { target: topImage; x: 0; }
		//         PropertyChanges { target: bottomImage; x: 0; }
		//     },
		//     State {
		//         name: "out"
		//         PropertyChanges { target: topImage; x: -250; }
		//         PropertyChanges { target: bottomImage; x: +250; }
		//     }
		// ]

		// transitions:[
		//     Transition {
		//         from: "*"
		//         PropertyAnimation { target: topImage; properties: "x"; duration: 450; easing.type: Easing.OutQuad }
		//         PropertyAnimation { target: bottomImage; properties: "x"; duration: 450; easing.type: Easing.OutQuad }
		//     }
		// ]



		RowLayout {
			Layout.alignment: Qt.AlignHCenter
			ColumnLayout {
				spacing: 10
				Image {
					id: topImage
					// anchors.top: parent.top
					// anchors.left: parent.left
					// anchors.topMargin: 5
					// anchors.leftMargin: 5
					source: "../content/abstract.png"
				}
				Image {
					id: bottomImage
					// anchors.top: topImage.bottom
					// anchors.left: parent.left
					// anchors.topMargin: 15
					// anchors.leftMargin: 5
					source: "../content/factory.png"
				}
				ProgressBar {
					label:"Loading..."
					indeterminate: true
				}

				DropShadow {
					anchors.fill: topImage
					horizontalOffset: 0
					verticalOffset: 0
					radius: 4
					samples: 6
					color: "#80000000"
					source: topImage
					spread: .5        }
				DropShadow {
					anchors.fill: bottomImage
					horizontalOffset: 0
					verticalOffset: 0
					radius: 4
					samples: 6
					color: "#80000000"
					source: bottomImage
					spread: .5        }
			}
		}
		Component.onCompleted: {
			if(state == 'out')
				state = 'in'
			else
				state = 'out'
		}
	}

	Timer {
		interval: timeoutInterval; running: true; repeat: false
		onTriggered: {
			visible = false
			splash.timeout()
		}
	}

	Component.onCompleted: visible = true
}
