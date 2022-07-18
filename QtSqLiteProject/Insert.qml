import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import Qt.labs.settings 1.0


Item {
    anchors.centerIn: parent
    Rectangle{
        id:insert
        color: "grey"
        height: parent.height
        width: parent.width
        RowLayout {
            id: rowLayout
            anchors.top: parent.top
            anchors.fill: parent
            anchors.left: parent.left
            anchors.right: parent.right

            anchors.margins: 5

            spacing: 10

            Text{text: qsTr("original_title") + MyTrans.emptyString}
            TextField {id: original_titleField}
            Text {id: textId1
                text: qsTr("release_date") + MyTrans.emptyString
            }
            TextField { id: release_dateField}
            Text {text: qsTr(" vote_average") + MyTrans.emptyString}
            TextField { id: vote_averageField}
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



            Button {
                text: qsTr("Add") + MyTrans.emptyString

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
                    if(database.inserIntoTable(original_titleField.text , release_dateField.text, taglineField.text, vote_averageField.text, fileDialog.fileUrl))
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








