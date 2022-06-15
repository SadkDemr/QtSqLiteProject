import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2


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

        Text
        {

            text: qsTr("original_title")

        }
        TextField {id: original_titleField}
        Text {text: qsTr("release_date")}
        TextField { id: release_dateField}
        Text {text: qsTr(" vote_average")}
        TextField { id: vote_averageField}
        Text {text: qsTr("tagline")}
        TextField {id: taglineField}

        Button {
            text: qsTr("Add")

            // Veritabanına yeni bir giriş yapın
            onClicked: {
                database.inserIntoTable(original_titleField.text , release_dateField.text, taglineField.text, vote_averageField.text)
                myModel.updateModel() // And updates the data model with a new record
            }
        }
    }


}




}
