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
        TableViewColumn {
            role: "image"
            title: "image"

        }

        model: myModel

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
            text: qsTr("Sil")
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
        title: qsTr("Kaydı sil")
        text: qsTr("Girişlerin silinmesini onaylayın!!")
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Ok | StandardButton.Cancel


        onAccepted: {
            /* ... remove the line by id, which is taken from the data model
             * on the line number in the presentation
             * */
            database.removeRecord(myModel.getId(tableView.currentRow))
            myModel.updateModel();
        }
    }
}
