import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls 2.4
import MyLang 1.0

Item {
    id: settings

    Rectangle {
        id : rectId
        anchors.fill: parent
        color: "grey"

        Column {
            spacing: 20
            anchors.centerIn: parent          

            FontDialog{
                id : fontDialogId
                title: "Choose Font"
                font : Qt.font({ family: "Arial", pointSize: 24, weight: Font.Normal })

                onAccepted: {
                    console.log("Chose font : "+font)
                    textId.font = fontDialogId.font
                    textId1.font = fontDialogId.font

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
                text: qsTr("Background Color") + MyTrans.emptyString
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    colorDialogId.open()

                }


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

                }
            Button{
                text : qsTr("Change Font") + MyTrans.emptyString
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    fontDialogId.open()
                }
            }






        }

        Image {
               id: id_eng
               anchors {
                   top: parent.top
                   right: parent.right
                   margins: 5


               }
               width: 130
               height: 100
               source: "image/ing.png"

               MouseArea{
                   anchors.fill: parent
                   onClicked: {
                       MyTrans.updateLanguage(MyLang.ENG)
                   }
               }
           }

           Image {
               id: id_jap
               anchors {
                   top: id_eng.bottom
                   right: parent.right
                   margins: 5


               }
               width: 130
               height: 100
               source: "image/tr.png"

               MouseArea{
                   anchors.fill: parent
                   onClicked: {
                       MyTrans.updateLanguage(MyLang.TR)
                   }
               }
           }

           Image {
               id: id_vie
               anchors {
                   top: id_jap.bottom
                   right: parent.right
                   margins: 5


               }
               width: 130
               height: 100
               source: "image/ger.png"

               MouseArea{
                   anchors.fill: parent
                   onClicked: {

                       MyTrans.updateLanguage(MyLang.GER)
                   }
               }
}

    }

//    Settings{
//        id: setting1
//        category: "item"
//        property alias x : rectId.x
//        property alias y : rectId.y
//        property alias width : rectId.width
//        property alias height : rectId.height
//    }

//    Settings{
//        id: setting2
//        category: "colors"
//        property alias rectColor : rectId.color
//    }
//    Settings{
//        id: setting3
//        category: "window"
//        property alias x : rectId.x
//        property alias y : rectId.y
//        property alias width : rectId.width
//        property alias height : rectId.height
//   }

//    Settings {
//        id: setting4
//            category: "text"
//            property alias fontSize: textId.textFormatChanged()
//            // ...
//        }


}
