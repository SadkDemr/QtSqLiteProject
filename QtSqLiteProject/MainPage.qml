import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2


Item {
anchors.centerIn: parent



    TableView {
        id: tableView
        anchors.top: rowLayout.bottom
        width: parent.width
        height: parent.height
        anchors.bottom: parent.bottom
        anchors.margins: 10
        TableViewColumn {
            role: "id"
            title: "ID"
        }

        TableViewColumn {
            role: "original_title"
            title: "original_title"
        }
        TableViewColumn {
            role: "release_date"
            title: "release_date"
        }

        TableViewColumn {
            role: "vote_average"
            title: "vote_average"
        }
        TableViewColumn {
            role: "tagline"
            title: "tagline"
        }



//        TableViewColumn {
//            role: "image"
//            title: "image"
//            delegate: imageDelegate

//        }




          model: myModel
//        Component {
//            id: imageDelegate
//            Item {
//                Image {
//                    anchors.verticalCenter: parent.verticalCenter
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    fillMode: Image.PreserveAspectFit
//                    height:20
//                    cache : true;
//                    asynchronous: true;
//                    source:styleData.value // !== undefined  ? styleData.value : ""
//                }
//            }
//         }



        // Fare sol tıklamasını engellemek için TableView'da çizgileri ayarlama
        rowDelegate: Rectangle {
            anchors.fill: parent
            color: styleData.selected ? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton | Qt.LeftButton
                onClicked: {
                    tableView.selection.clear()
                    tableView.selection.select(styleData.row)
                    tableView.currentRow = styleData.row
                    tableView.focus = true

                    switch(mouse.button) {
                    case Qt.RightButton:
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
}
