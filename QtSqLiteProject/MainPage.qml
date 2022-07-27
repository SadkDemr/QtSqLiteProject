import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls.Private 1.0
import QtQuick.Controls 1.3
import QtQuick.Controls 2.12
import QtQuick.Controls 2.3 as QQC2

Item {
    property var vote
    property var yearss
    property var monthss
    property var days
    property var date
    Rectangle{
       width: parent.width
       height: parent.height
       color:mySettings.sampleColor

    }


    TableView {
        id: tableView
        //anchors.fill: racesWindow
        //anchors.top: rowLayout.bottom
        anchors.centerIn: parent
        width: 1800
        height: 800
        //anchors.bottom: parent.bottom
        //anchors.margins: 10
        //anchors.fill: tableArea
        //headerDelegate: headersDel





        itemDelegate: Item {

                   Text {
                     anchors.verticalCenter: parent.verticalCenter
                     color: "black"
                     elide: styleData.elideMode
                     text: styleData.value
                     font.pixelSize: 20
                   }
        }




        TableViewColumn {

            role: "id"

            title: "ID"

            width: 50

        }
        TableViewColumn {
            role: "original_title"
            title: qsTr("Original_Title")
           width: 500
        }
        TableViewColumn {
            role: "release_date"
            title: qsTr("Release_Date")
             width: 200
        }

        TableViewColumn {
            role: "vote_average"
            title: qsTr("Vote_Average")
             width: 200
        }
        TableViewColumn {
            role: "tagline"
            title: qsTr("Tagline")
           width: 500
        }
        TableViewColumn {
            role: "image"
            title: qsTr("Image")
            width: 200
            //width: root.width/4
            delegate:imageDelegate

        }
        model: myModel

        Component {
            id: imageDelegate
              Item {

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                        height:50
                        width: 100
                        //cache : true;
                        asynchronous: true;
                        source: "file:///"+styleData.value// !== undefined  ? styleData.value : ""
                    }
                }

         }




        // Fare sol tıklamasını engellemek için TableView'da çizgileri ayarlama
        rowDelegate: Rectangle {
            //anchors.fill: parent
            color: styleData.selected ? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
            height:50
            width: parent.width
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton | Qt.LeftButton
                onClicked: {
                    tableView.selection.clear()
                    tableView.selection.select(styleData.row)
                    tableView.currentRow = styleData.row
                    tableView.focus = true



                    switch(mouse.button) {
                    case Qt.LeftButton:
                        contextMenu.popup() // Call the context menu
                        break
                    default:
                        break
                    }
                }
            }
        }
    }

    // Bağlam menüsü, veritabanından bir satırı silmeyi sunar
    Menu {
        id: contextMenu

        MenuItem {
            text: qsTr("Sil") + MyTrans.emptyString
            onTriggered: {
                /* Satırı veritabanından kaldırma niyetini netleştirecek iletişim kutusunu çağırın
                 * */
                dialogDelete.open()
            }

        }
        MenuItem{
            text: qsTr("Düzenle") + MyTrans.emptyString

            onTriggered:{
                console.log("myModel.get(tableView.currentRow).title : " + myModel.getTitle(tableView.currentRow))
                console.log("tableView.currentRow : " + tableView.currentRow);
                original_titleField.text = myModel.getTitle(tableView.currentRow);
                taglineField.text= myModel.getTag(tableView.currentRow);
                release_dateField.text = myModel.getDate(tableView.currentRow);
                vote_averageField.text = myModel.getVote(tableView.currentRow);
                popup.open()

            }
        }
        MenuItem{
            id: menuItemid
            text: qsTr("Kapat")+ MyTrans.emptyString
            onTriggered: {
                popup.close()
            }
        }
    }

    // Veri tabanından kaldırma satırının onaylandığı iletişim kutusu
    MessageDialog {
        id: dialogDelete
        title: qsTr("Kaydı sil") + MyTrans.emptyString
        text: qsTr("Girişlerin silinmesini onaylayın!!") + MyTrans.emptyString
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Yes | StandardButton.No


        onYes: {
            /* ... veri modelinden alınan kimliğe göre satırı kaldırın
             *
             * */
            if(database.removeRecord(myModel.getId(tableView.currentRow))) //  if(true)
            {
                console.log("Kayit basariyla silindi")
                myModel.updateModel();
            }
            else
                console.log("Silinemedi");


        }
        onNo: {
            console.log("Canceled")
        }
    }

    Popup{
        id:popup
        background: Rectangle{
            implicitHeight: 100
            implicitWidth: parent.width
            border.color: "green"
        }


        contentItem: RowLayout{
            id: rowLayout
            Text{ text: qsTr("original_title") + MyTrans.emptyString
            }
            TextField {
                id: original_titleField
            }


            Text {
                id: textId1
                text: qsTr("release_date") + MyTrans.emptyString
            }
            TextField { id: release_dateField}



            Text {text: qsTr(" vote_average") + MyTrans.emptyString}
            TextField { id: vote_averageField}

            Text {text: qsTr("tagline") + MyTrans.emptyString}
            TextField {
                id: taglineField
            }

            Button{
            text: qsTr("Image Selecet") + MyTrans.emptyString
            onClicked: {
            fileDialog.open()
               }
            }
            FileDialog {
                id: fileDialog
                title: "Please choose a file"
                folder: shortcuts.home
                nameFilters: [ "Image files (*.jpg *.png)", "All files (*)" ]
                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrl)
                }
                onRejected: {
                    console.log("Canceled")

                }
                Component.onCompleted: visible = false
            }

            Button{
                text: qsTr("Düzenle") + MyTrans.emptyString

                onClicked: {

                       dialogDuzenle.open()


                }
            }
            MessageDialog{
                id: dialogDuzenle
                title: qsTr("Kayıt") + MyTrans.emptyString
                text: qsTr("Kayıt İşlemi Tamamlansın mı?") + MyTrans.emptyString
                icon: StandardIcon.Warning
                standardButtons: StandardButton.Yes | StandardButton.No
                onYes: {
                    //database.removeRecord(myModel.getId(tableView.currentRow)
                    //current_id = myModel.getId(tableView.currentRow)

                    // fonksiyona giden butun data lara debug at
                        if(database.update((myModel.getId(tableView.currentRow)),original_titleField.text , release_dateField.text, taglineField.text, vote_averageField.text, fileDialog.fileUrl))
                        {

                            console.log("Kayit basariyla düzenlendi")
                            original_titleField.text = "";
                            release_dateField.text = "";
                            taglineField.text = "";
                            vote_averageField.text = "";

                            myModel.updateModel()

                        }
                    else{
                        console.log("Kayit düzenlenmedi")
                    }
                   }

                onNo: {
                    console.log("Canceled")
                }

                }
            Button {
                   text: qsTr("Kapat") + MyTrans.emptyString
                   // Respond to the signal here.
                   onClicked: popup.close();
               }


        }



    }

}



















