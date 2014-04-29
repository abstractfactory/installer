import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

import "../js/style.js" as Style

Item {
    id:statusCheck
    property var checkBoxLabel: "default"
    property alias checked: check.checked
    width: 100
    height: 16

    CheckBox {
        id: check
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        enabled: false
        // anchors.topMargin: 5
        // anchors.bottomMargin: 5
        style: CheckBoxStyle {
            indicator: Rectangle {
                    implicitWidth: 13
                    implicitHeight: 13
                    color: Style.checkBoxIndBgColor
                    // radius: 3
                    // border.color: control.activeFocus ? "#191919" : "#7dd9f4"
                    // border.width: 1
                    Rectangle {
                        visible: control.checked
                        color: Style.checkBoxIndFgColor
                        // border.color: "#333"
                        // radius: 1
                        anchors.margins: 3
                        anchors.fill: parent
                    }
            }
            label: Text {
                text: checkBoxLabel
                anchors.centerIn: parent
                color: Style.lightColor
            }
        }
    }
}