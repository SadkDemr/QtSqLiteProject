import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.3
import Qt.labs.settings 1.0


ApplicationWindow {
    width: 1200
    height: 700
    visible: true
    title: qsTr("Sql")
    id: root

    menuBar: TabBar{
        TabButton {
            text : qsTr("MainPage")
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/MainPage.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
        TabButton {
            text : qsTr("Insert")
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/Insert.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }

        TabButton {
            text : qsTr("Update")
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/Update.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }

        TabButton {
            text : qsTr("Settings")
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/Settings.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
        TabButton {

            ColorAnimation {
                from: "red"
                to: "black"
                duration: 200
            }
            text : qsTr("Quit")
            onClicked: Qt.quit()
        }



    }




    StackView{
        id : mStackId
        anchors.fill: parent
        initialItem: MainPage{

        }
    }




}


