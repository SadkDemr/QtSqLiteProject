import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.3
import Qt.labs.settings 1.0
import MyLang 1.0

ApplicationWindow {
    width: 1700
    height: 1000
    visible: true
    title: qsTr("Sql") + MyTrans.emptyString
    id: root

    menuBar: TabBar{
        TabButton {
            text : qsTr("MainPage") + MyTrans.emptyString
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/MainPage.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
        TabButton {
            text : qsTr("Insert") + MyTrans.emptyString
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/Insert.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }


        TabButton {
            text : qsTr("Settings") + MyTrans.emptyString
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/Settings.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }

        TabButton {
            text : qsTr("Deneme") + MyTrans.emptyString
            onClicked: {
                mStackId.pop()
                mStackId.push("qrc:/Deneme.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
        TabButton {

            ColorAnimation {
                from: "red"
                to: "black"
                duration: 200
            }
            text : qsTr("Quit") + MyTrans.emptyString
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


