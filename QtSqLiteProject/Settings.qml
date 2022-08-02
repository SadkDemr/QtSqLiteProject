import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.0
//import Qt.labs.settings 1.0
import QtQuick.Controls 2.4 //Button
//import QtQuick.Layouts 1.1
//import QtQuick.Dialogs 1.2
//import QtQuick.Controls.Styles 1.2

Item {
    id: settings

    visible: true

    //        Settings {
    //            id: setting4
    //                category: "General"
    //                property alias fontSize: textId.font

    //            }
    property var fontType
    property var fontSizes


    Rectangle {
        id : rectId
        anchors.fill: parent
        color: mySettings.sampleColor

        Image{
            id:settingIcon
            width: 200
            height: 200
            x:850
            y:80
            source: "qrc:/image/settings.png"
        }

        Image{
            id:colorChange
            width: 50
            height: 50
            x:1050
            y:400
            source: "qrc:/image/programming.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    colorDialogId.open()

                }
            }
        }


        Column {
            spacing: 20
            anchors.centerIn: parent          

                Button {
                    id: btn
                    text: qsTr("Background Color") + MyTrans.emptyString
                    font.family: mySettings.fontType
                    font.pointSize: 8
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        colorDialogId.open()

                    }

                   //arka plan rengini değiştirmek için kullanılır.
                    //background change color
                    ColorDialog {
                        id: colorDialogId
                        title: qsTr("Please choose a color")+ MyTrans.emptyString
                        onAccepted: {
                            console.log("The new color is : "+ color)
                            rectId.color = color
                            mySettings.setSampleColor(color);
                            console.log("New color : "+ mySettings.sampleColor)


                        }
                        onRejected: {
                            console.log("Canceled")
                        }
                    }

                    }





//font degistirme islemi
//font change family
                Text {id: textId1
                    text: qsTr("Font Tipi :") + MyTrans.emptyString
                    font.pointSize: 15
                    font.family: mySettings.fontType
                }

                    ComboBox {
                        currentIndex: 0
                        model: ListModel {
                            id: fontTyp
                            ListElement { text: "Arial" }
                            ListElement { text: "Helvetica" }
                            ListElement { text: "Verdana" }
                            ListElement { text: "Calibri" }
                            ListElement { text: "Franklin Gothic Medium" }
                            ListElement { text: "Geneva" }
                            ListElement { text: "Times New Roman" }
                            ListElement { text: "Cambria" }

                        }

                        width: 200
                        height: 100
                        onCurrentIndexChanged:{
                            fontType = fontTyp.get(currentIndex).text
                            //textId.font = fontTyp.get(currentIndex).text
                            mySettings.setfontType(fontType);
                            console.debug(mySettings.fontType);
                        }
                    }





//                Text {id: textId2
//                    text: qsTr("Font Size :") + MyTrans.emptyString
//                    font.pointSize: mySettings.fontSize
//                }
//                ComboBox {

//                    editable: true
//                    currentIndex:0

//                    model: ListModel {
//                        id: fontSz
//                        ListElement { text: "9" }
//                        ListElement { text: "10" }
//                        ListElement { text: "11" }
//                        ListElement { text: "12" }
//                        ListElement { text: "13" }
//                        ListElement { text: "14" }
//                        ListElement { text: "15" }
//                        ListElement { text: "16" }
//                        ListElement { text: "17" }
//                        ListElement { text: "18" }
//                        ListElement { text: "19" }
//                        ListElement { text: "20" }
//                        ListElement { text: "21" }
//                    }

//                    width: 200
//                    height: 100
//                    onCurrentIndexChanged:{
//                        fontSizes =fontSz.get(currentIndex).text
//                        textId.font = fontSz.get(currentIndex).text
//                        mySettings.setfontSize(fontSizes);
//                        console.debug(fontSizes);
////                        console.debug("FONT SIZE")
////                        console.debug(mySettings.fontSize);
//                    }
//                }






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
                       MyTrans.updateLanguage(0)
                       mySettings.setlng(0);
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

                       MyTrans.updateLanguage(1)
                       mySettings.setlng(1);
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

                       MyTrans.updateLanguage(2)
                       mySettings.setlng(2);
                   }
               }
}

    }


}
