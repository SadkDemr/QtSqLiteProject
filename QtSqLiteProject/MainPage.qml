import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2


Item {
    property var vote
    property var yearss
    property var monthss
    property var days
    property var date

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

            width: 200

        }
        TableViewColumn {
            role: "original_title"
            title: "original_title"
           width: 500
        }
        TableViewColumn {
            role: "release_date"
            title: "release_date"
             width: 200
        }

        TableViewColumn {
            role: "vote_average"
            title: "vote_average"
             width: 200
        }
        TableViewColumn {
            role: "tagline"
            title: "tagline"
           width: 500
        }
        TableViewColumn {
            role: "image"
            title: "Image"
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
                        cache : true;
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
            implicitHeight: 10
            implicitWidth: 2
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
            //TextField { id: release_dateField}
            ComboBox {

                currentIndex: 0
                model: ListModel {
                    id: years
                    ListElement { text: "" }
                    ListElement { text: "2000" }
                    ListElement { text: "2001" }
                    ListElement { text: "2002" }
                    ListElement { text: "2003" }
                    ListElement { text: "2004" }
                    ListElement { text: "2005" }
                    ListElement { text: "2006" }
                    ListElement { text: "2007" }
                    ListElement { text: "2008" }
                    ListElement { text: "2009" }
                    ListElement { text: "2010" }
                    ListElement { text: "2011" }
                    ListElement { text: "2012" }
                    ListElement { text: "2013" }
                    ListElement { text: "2014" }
                    ListElement { text: "2015" }
                    ListElement { text: "2016" }
                    ListElement { text: "2017" }
                    ListElement { text: "2018" }
                    ListElement { text: "2019" }
                    ListElement { text: "2020" }
                    ListElement { text: "2021" }
                    ListElement { text: "2022" }
                }

                width: 200

                onCurrentIndexChanged:{
                    yearss = years.get(currentIndex).text
                    console.debug(yearss)
                }
            }
            ComboBox {

                currentIndex: 0
                model: ListModel {
                    id: months
                    ListElement { text: "" }
                    ListElement { text: "01" }
                    ListElement { text: "02" }
                    ListElement { text: "03" }
                    ListElement { text: "04" }
                    ListElement { text: "05" }
                    ListElement { text: "06" }
                    ListElement { text: "07" }
                    ListElement { text: "08" }
                    ListElement { text: "09" }
                    ListElement { text: "10" }
                    ListElement { text: "11" }
                    ListElement { text: "12" }
                }

                width: 200
                onCurrentIndexChanged:{
                    monthss = months.get(currentIndex).text
                    console.debug(monthss)
                }
            }
            ComboBox {

                currentIndex: 0
                model: ListModel {
                    id: day
                    ListElement { text: "" }
                    ListElement { text: "01" }
                    ListElement { text: "02" }
                    ListElement { text: "03" }
                    ListElement { text: "04" }
                    ListElement { text: "05" }
                    ListElement { text: "06" }
                    ListElement { text: "07" }
                    ListElement { text: "08" }
                    ListElement { text: "09" }
                    ListElement { text: "10" }
                    ListElement { text: "11" }
                    ListElement { text: "12" }
                    ListElement { text: "13" }
                    ListElement { text: "14" }
                    ListElement { text: "15" }
                    ListElement { text: "16" }
                    ListElement { text: "17" }
                    ListElement { text: "18" }
                    ListElement { text: "19" }
                    ListElement { text: "20" }
                    ListElement { text: "21" }
                    ListElement { text: "22" }
                    ListElement { text: "23" }
                    ListElement { text: "24" }
                    ListElement { text: "25" }
                    ListElement { text: "26" }
                    ListElement { text: "27" }
                    ListElement { text: "30" }
                    ListElement { text: "31" }

                }

                width: 200
                onCurrentIndexChanged:{
                    days = day.get(currentIndex).text
                    console.debug(days)
                    date = yearss + "-" + monthss + "-" + days
                    console.debug(date)
                }
            }


            Text {text: qsTr(" vote_average") + MyTrans.emptyString}
            //TextField { id: vote_averageField}
            ComboBox {
                currentIndex: 0

                model: ListModel {
                    id: vote_averageField
                    ListElement { text: "" }
                    ListElement { text: "0" }
                    ListElement { text: "1" }
                    ListElement { text: "2" }
                    ListElement { text: "3" }
                    ListElement { text: "4" }
                    ListElement { text: "5" }
                    ListElement { text: "6" }
                    ListElement { text: "7" }
                    ListElement { text: "8" }
                    ListElement { text: "9" }
                    ListElement { text: "10" }
                }
                width: 200
                onCurrentIndexChanged:{
                    var combox = vote_averageField.get(currentIndex).text
                    vote=combox
                    console.debug(combox)
            }
        }
            Text {text: qsTr("tagline") + MyTrans.emptyString}
            TextField {id: taglineField}

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
                        if(database.update((myModel.getId(tableView.currentRow)),original_titleField.text , date, taglineField.text, vote, fileDialog.fileUrl))
                        {

                            console.log("Kayit basariyla düzenlendi")
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



















