import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Window 2.0
import "content"

ApplicationWindow{
	id: root
	width: 500
	height: 500
	title: "Installer"
	flags: Qt.FramelessWindowHint
	maximumHeight: 500
	maximumWidth: 500
	minimumHeight: 500
	minimumWidth: 500
	color: "transparent"

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
		color: "#505050"
		radius: 2
		// border.color: "#252525"
		// z: -2
		MouseArea {
			anchors.fill: parent
			property real lastMouseX: 0
			property real lastMouseY: 0
			acceptedButtons: Qt.LeftButton | Qt.RightButton
			onPressed: {
				if(mouse.button == Qt.LeftButton){
					lastMouseX = mouseX
					lastMouseY = mouseY
				}
				else
					Qt.quit()
			}
			onMouseXChanged: root.x += (mouseX - lastMouseX)
			onMouseYChanged: root.y += (mouseY - lastMouseY)
		}
	}
}