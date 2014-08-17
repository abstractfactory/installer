import QtQuick 2.0

Rectangle {
    id: idRect

    width: 600 ; height: 300

    Component {
        id: idCompDelegate
        Item {
            id: idItmRow
            width: 600
            height: 50
            Row {
                id: idRow

                spacing: 100

                Rectangle {
                    id: idRectUp

                    width: 150
                    height: 50
                    color: "lightsteelblue"
                    radius: 8
                    Text {
                        anchors.centerIn: parent
                        text: "Up"
                    }

                    MouseArea {
                        id: idMouseAreaUp
                        anchors.fill:  parent
                        propagateComposedEvents: true
                        onClicked: {

                            list.currentIndex = index   //it's not working
                                    ((list.currentIndex)===0) ? console.log("Cannot Move towards Up"):list.model.move(list.currentIndex,list.currentIndex-1,1)


                        }
                    }
                }

                Text {
                    id: idCenterText
                    width: 100
                    text: firstName+" "+lastName
                }
                Rectangle {
                    id: idRectDown

                    width: 150
                    height: 50
                    color: "lightsteelblue"
                    radius: 8
                    Text {
                        anchors.centerIn: parent
                        text: "Down"
                    }
                    MouseArea {
                        id: idMouseAreaDown
                        anchors.fill:  parent
                        onClicked: {
                              list.currentIndex = index //it's not working
                            (list.count === (list.currentIndex)+1)? console.log("Cannot Move towards Down"):list.model.move(list.currentIndex,list.currentIndex+1,1)
                        }
                    }
                }
            }


        }


    }


    ListView {
        id: list
        width: parent.width
        height: parent.height

        model: AddressModel {}

        delegate:  idCompDelegate
        highlight: Rectangle { color: "lightgrey" ; radius : 8 }
        highlightFollowsCurrentItem: true
        focus: true

        spacing: 5


    }
}