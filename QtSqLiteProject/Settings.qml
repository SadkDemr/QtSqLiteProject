import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls 2.4
import MyLang 1.0


Item {
    id: settings
        Settings {
            id: setting4
                category: "General"
                property alias fontSize: textId.font

            }

    Rectangle {
        id : rectId
        anchors.fill: parent
        color: mySettings.sampleColor

        Column {
            spacing: 20
            anchors.centerIn: parent          
            //font tipini ve büyüklüğünü değiştirmek için kullanılır
            FontDialog{
                id : fontDialogId
                title: "Choose Font"
                font : Qt.font({ family: "Arial", pointSize: 24, weight: Font.Normal })

                onAccepted: {
                    console.log("Chose font : "+font)
                    textId.font = fontDialogId.font
                    mySettings.setfontType(fontDialogId.font);
                    console.log("New font : "+ mySettings.fontType)

                }

                onRejected: {
                    console.log("Dialog rejected")
                }
            }

            Text {
                id : textId
                text : "Merhaba Dünya"
                font:Qt.font({ family: "Arial", pointSize: 24, weight: Font.Normal })
                //font.pointSize: mySettings.fontSize
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button {
                id: btn
                text: qsTr("Background Color") + MyTrans.emptyString
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    colorDialogId.open()

                }

               //arka plan rengini değiştirmek için kullanılır.
                ColorDialog {
                    id: colorDialogId
                    title: "Please choose a color"
                    onAccepted: {
                        console.log("The new color is : "+ color)
                        rectId.color = color
                        mySettings.setSampleColor(color);
                        console.log("Yeni renk : "+ mySettings.sampleColor)


                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }

                }
            Button{
                text : qsTr("Font Değiştir") + MyTrans.emptyString
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    fontDialogId.open()
                }
            }






        }
       //Qt linguist yapısını qml bağlantısı buradadır.
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


}
