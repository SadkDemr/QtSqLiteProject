import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1 //RowLayout
import QtQuick.Dialogs 1.2 //TableView
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls.Private 1.0
import QtQuick.Controls 1.3
import QtQuick.Controls 2.12
import QtQuick.Controls 2.3 as QQC2
import QtLocation 5.15

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
        anchors.centerIn: parent
        width: 1800
        height: 800

        itemDelegate: Item {

                   Text {
                     anchors.verticalCenter: parent.verticalCenter
                     color: "black"
                     elide: styleData.elideMode
                     text: styleData.value
                     font.pixelSize: 20
                   }
        }



//Verileri siralama islemi
//Data sorting process

        TableViewColumn {

            role: "id"

            title: "ID"

            width: 50

        }
        TableViewColumn {
            role: "original_title"
            title: qsTr("Original_Title")+ MyTrans.emptyString
           width: 500
        }
        TableViewColumn {
            role: "release_date"
            title: qsTr("Release_Date")+ MyTrans.emptyString
             width: 200
        }

        TableViewColumn {
            role: "vote_average"
            title: qsTr("Vote_Average")+ MyTrans.emptyString
             width: 200
        }
        TableViewColumn {
            role: "tagline"
            title: qsTr("Tagline")+ MyTrans.emptyString
           width: 500
        }
        TableViewColumn {
            role: "image"
            title: qsTr("Image")+ MyTrans.emptyString
            width: 200
            //width: root.width/4
            delegate:imageDelegate

        }
        model: myModel

//Gorselleri goruntuleme
//View Image
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

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                tableView.selection.clear()
                                tableView.selection.select(styleData.row)
                                tableView.currentRow = styleData.row
                                tableView.focus = true
                                imageView.open();
                                console.debug("View Image")
                                console.debug(myModel.getImage(tableView.currentRow));
                            }
                        }
                    }
                }

         }
        Popup{
            id:imageView
            width: 600
            height: 600


            Rectangle {
                id: rectangle
                width: 568
                height: 533
                color: "#ffffff"

                Image {
                    id: imagePopup
                    x: 100
                    y: 43
                    width: 253
                    height: 225
                    source:  "file:///" + myModel.getImage(tableView.currentRow);
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: titleImage
                    x: 150
                    y: 289
                    width: 136
                    height: 25
                    text: myModel.getTitle(tableView.currentRow);
                    font.pixelSize: 18
                }

                Text {
                    id: dateTime
                    x: 150
                    y: 328
                    width: 136
                    height: 25
                    text: myModel.getDate(tableView.currentRow);
                    font.pixelSize: 18
                }

                Text {
                    id: text3
                    x: 150
                    y: 368
                    width: 136
                    height: 25
                    text: myModel.getTag(tableView.currentRow);
                    font.pixelSize: 18
                }

                Button {
                    id: button
                    x: 423
                    y: 479
                    width: 137
                    height: 46
                    text: qsTr("Close")
                    onClicked: {
                        imageView.close();
                    }
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
            text: qsTr("Delete") + MyTrans.emptyString
            onTriggered: {
                /* Satırı veritabanından kaldırma niyetini netleştirecek iletişim kutusunu çağırın
                 * */
                dialogDelete.open()
            }

        }
        MenuItem{
            text: qsTr("Edit") + MyTrans.emptyString

            onTriggered:{
                console.log("myModel.get(tableView.currentRow).title : " + myModel.getTitle(tableView.currentRow))
                console.log("tableView.currentRow : " + tableView.currentRow);
                original_titleField.text = myModel.getTitle(tableView.currentRow);
                taglineField.text= myModel.getTag(tableView.currentRow);
                release_dateField.text = myModel.getDate(tableView.currentRow);
                vote_averageField.text = myModel.getVote(tableView.currentRow);
                imageField.text = "file:///" + myModel.getImage(tableView.currentRow);
                popup.open()

            }
        }
        MenuItem{
            id: menuItemid
            text: qsTr("Canceled")+ MyTrans.emptyString
            onTriggered: {
                popup.close()
            }
        }
    }

    // Veri tabanından kaldırma satırının onaylandığı iletişim kutusu
    MessageDialog {
        id: dialogDelete
        title: qsTr("Delete record") + MyTrans.emptyString
        text: qsTr("Confirm the deletion of entries!!") + MyTrans.emptyString
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Yes | StandardButton.No


        onYes: {
            /* ... veri modelinden alınan kimliğe göre satırı kaldırın
             *
             * */
            if(database.removeRecord(myModel.getId(tableView.currentRow))) //  if(true)
            {
                console.log("Registration deleted successfully!!")
                myModel.updateModel();
            }
            else
                console.log("Could not delete");


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

//Secilen verinin degistirilmesi
//update selected data
        contentItem: RowLayout{
            id: rowLayout
            Text{ text: qsTr("Original_title") + MyTrans.emptyString
            }
            TextField {
                id: original_titleField
            }


            Text {
                id: textId1
                text: qsTr("Release_date") + MyTrans.emptyString
            }
            TextField { id: release_dateField}



            Text {text: qsTr(" Vote_average") + MyTrans.emptyString}
            TextField { id: vote_averageField}

            Text {text: qsTr("Tagline") + MyTrans.emptyString}
            TextField {
                id: taglineField
            }

            Text {text: qsTr("Image") + MyTrans.emptyString}
            TextField {
                id: imageField

            }

            Button{
            text: qsTr("Image Selecet") + MyTrans.emptyString
            onClicked: {
            fileDialog.open()
               }
            }
            FileDialog {
                id: fileDialog
                title: qsTr("Please choose a file")+ MyTrans.emptyString
                folder: shortcuts.home
                nameFilters: [ "Image files (*.jpg *.png)", "All files (*)" ]
                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrl)
                    imageField.text = fileDialog.fileUrl;
                }
                onRejected: {
                    console.log("Canceled")

                }
                Component.onCompleted: visible = false
            }

            Button{
                text: qsTr("Edit") + MyTrans.emptyString

                onClicked: {

                       dialogDuzenle.open()


                }
            }
            MessageDialog{
                id: dialogDuzenle
                title: qsTr("Regulation") + MyTrans.emptyString
                text: qsTr("Finish Editing?") + MyTrans.emptyString
                icon: StandardIcon.Warning
                standardButtons: StandardButton.Yes | StandardButton.No
                onYes: {
                        if(database.update((myModel.getId(tableView.currentRow)),original_titleField.text , release_dateField.text, taglineField.text, vote_averageField.text, imageField.text))
                        {
                            console.log("Edited successfully")
                            original_titleField.text = "";
                            release_dateField.text = "";
                            taglineField.text = "";
                            vote_averageField.text = "";
                            imageField.text="";
                            myModel.updateModel()

                        }
                    else{
                        console.log("Not edited")
                    }
                   }

                onNo: {
                    console.log("Canceled")
                }

                }
            Button {
                   text: qsTr("Canceled") + MyTrans.emptyString
                   // Respond to the signal here.
                   onClicked: popup.close();
               }


        }



    }

}



















