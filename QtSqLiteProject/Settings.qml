import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls 2.4

Item {
    id: settings

    Rectangle {
        id : rectId
        anchors.fill: parent
        color: "grey"

        Column {
            spacing: 20
            anchors.centerIn: parent

            ColorDialog {
                id: colorDialogId
                title: "Please choose a color"
                onAccepted: {
                    console.log("The new color is : "+ color)
                    rectId.color = color
                }
                onRejected: {
                    console.log("Canceled")
                }
            }

            FontDialog{
                id : fontDialogId
                title: "Choose Font"
                font : Qt.font({ family: "Arial", pointSize: 24, weight: Font.Normal })

                onAccepted: {
                    console.log("Chose font : "+font)
                    textId.font = fontDialogId.font

                }

                onRejected: {
                    console.log("Dialog rejected")
                }
            }

            Text {
                id : textId
                text : "Hello World"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button {
                id: btn
                text: qsTr("Background Color")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    colorDialogId.open()

                }

                }
            Button{
                text : "Change Font"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    fontDialogId.open()
                }
            }

//            Settings{
//                category: "window"
//                property alias x : rectId.x
//                property alias y : rectId.y
//                property alias width : rectId.width
//                property alias height : rectId.height
//            }

//            Settings{
//                category: "colors"
//                property alias rectColor : rectId.color
//            }
//            Settings{
//                category: "window"
//                property alias x : rectId.x
//                property alias y : rectId.y
//                property alias width : rectId.width
//                property alias height : rectId.height
//           }

//            Settings {
//                    category: "text"
//                    property alias fontSize: textId.textFormatChanged()
//                    // ...
//                }


    }


        }
}



