import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import Qt.labs.settings 1.0
import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2


Item {
    anchors.centerIn: parent
    property var vote
    property var yearss
    property var monthss
    property var days
    property var date


    Rectangle{
        id:insert
        color: mySettings.sampleColor
        height: parent.height
        width: parent.width
        ColumnLayout {
            id: rowLayout
            anchors.centerIn: parent
//            anchors.top: parent.top
//            anchors.fill: parent
//            anchors.left: parent.left
//            anchors.right: parent.right

            anchors.margins: 5

            spacing: 10
            RowLayout{
                Text{
                    id: name
                    text: qsTr("Original_title  :") + MyTrans.emptyString
                    font.pointSize: 20

                }
                TextField {
                    id: original_titleField
                    font { family: "Arial"; pointSize: 20; }
                    style: TextFieldStyle
                    {
                    textColor: "#000";
                    background: Rectangle
                    {
                    color: "#FFF";
                    border.color: "#999";
                    border.width: 1;
                    radius: 4
                }
                }
                }

            }
//            Component.completed: {
//                while(original_titleField.items.length > 0)
//                    original_titleField.removeItem(original_titleField.items[0]);
//            }



            RowLayout{
                Text {id: textId1
                    text: qsTr("Release_date :") + MyTrans.emptyString
                    font.pointSize: 20
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
                    height: 200
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
                    height: 20
                    width: 20
                    onCurrentIndexChanged:{
                        days = day.get(currentIndex).text
                        console.debug(days)
                        date = yearss + "-" + monthss + "-" + days
                        console.debug(date)
                    }
                }
            }


            RowLayout{
                Text {
                    text: qsTr("Vote_average :") + MyTrans.emptyString
                    font.pointSize: 20
                }
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
            }

            RowLayout{
                Text {
                    text: qsTr("Tagline          :") + MyTrans.emptyString
                    font.pointSize: 20
                }

                TextField {
                    id: taglineField
                    font { family: "Arial"; pointSize: 20; }
                    style: TextFieldStyle
                    {
                    textColor: "#000";
                    background: Rectangle
                    {
                    color: "#FFF";
                    border.color: "#999";
                    border.width: 1;
                    radius: 4
                }
                }

                }

            }


            RowLayout{
                Text{
                    text: qsTr("Image           :") + MyTrans.emptyString
                    font.pointSize: 20
                }

                Button{
                Layout.preferredWidth: parent.width * 0.6
                Layout.preferredHeight:parent.height * 0.9
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Image Selecet") + MyTrans.emptyString
                    font { family: "Arial"; pointSize: 15; }
                }


                onClicked: {
                fileDialog.open()
                   }
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



            Button {
                Layout.preferredWidth: parent.width * 0.9
                Layout.preferredHeight:parent.height * 0.2
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Add") + MyTrans.emptyString
                    font { family: "Arial"; pointSize: 15; }
                }

                // Veritabanına yeni bir giriş yapın
                onClicked: {
                    dialogKayit.open()
                }

            }
            MessageDialog{
                id: dialogKayit
                title: qsTr("Kayıt") + MyTrans.emptyString
                text: qsTr("Kayıt İşlemi Tamamlansın mı?") + MyTrans.emptyString
                icon: StandardIcon.Warning
                standardButtons: StandardButton.Yes | StandardButton.No
                onYes: {
                    if(database.inserIntoTable(original_titleField.text , date, taglineField.text, vote, fileDialog.fileUrl))
                    {
                        console.log("Kayit basariyla eklendi")
                        myModel.updateModel() // And updates the data model with a new record


                    }
                    else{
                        console.log("Kayit eklenemedi")
                    }
                }
                onNo: {
                    console.log("Canceled")
                }

                }

                }


            }



        }








