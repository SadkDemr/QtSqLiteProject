import QtQuick 2.5
import QtQuick.Controls 1.4 //TextField
import QtQuick.Layouts 1.1 //ColumnLayout
import QtQuick.Dialogs 1.2 //FileDialog
//import Qt.labs.settings 1.0
//import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2 //TextFieldStyle

Item {
    property var vote
    property var yearss
    property var monthss
    property var days
    property var date


    /*
    This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
    It is supposed to be strictly declarative and only uses a subset of QML. If you edit
    this file manually, you might introduce QML code that is not supported by Qt Design Studio.
    Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
    */

    Rectangle {

        color:"#dddddd"
        height: 600
        width: 750
        border.width: 2
        anchors.centerIn: parent

        TextField {
            id: original_titleField
            x: 138
            y: 17
            width: 373
            height: 54
            placeholderText: qsTr("Original Title")
            font.pointSize: 18
        }

        ComboBox {
            id: comboBox3
            x: 138
            y: 138
            width: 373
            height: 35

            Text {
                id: text4
                x: 160
                y: 10
                width: 103
                height: 16
                text: qsTr("Vote")
                font.pixelSize: 18
            }
            model: ListModel {
                id: vote_averageField
                ListElement {
                    text: ""
                }
                ListElement {
                    text: "0"
                }
                ListElement {
                    text: "1"
                }
                ListElement {
                    text: "2"
                }
                ListElement {
                    text: "3"
                }
                ListElement {
                    text: "4"
                }
                ListElement {
                    text: "5"
                }
                ListElement {
                    text: "6"
                }
                ListElement {
                    text: "7"
                }
                ListElement {
                    text: "8"
                }
                ListElement {
                    text: "9"
                }
                ListElement {
                    text: "10"
                }
            }
            onCurrentIndexChanged:{
                var combox = vote_averageField.get(currentIndex).text
                vote=combox
                console.debug(combox)
        }
        }

        TextField {
            id: taglineField
            x: 138
            y: 188
            width: 373
            height: 51
            placeholderText: qsTr("Tagline")
            font.pointSize: 18
        }

        ComboBox {
            id: comboBox5
            x: 138
            y: 88
            width: 114
            height: 35

            Text {
                id: text1
                x: 38
                y: 10
                width: 70
                height: 19
                text: qsTr("Years")
                font.pixelSize: 12
            }

            model: ListModel {
                id: years
                ListElement {
                    text: ""
                }
                ListElement {
                    text: "2000"
                }
                ListElement {
                    text: "2001"
                }
                ListElement {
                    text: "2002"
                }
                ListElement {
                    text: "2003"
                }
                ListElement {
                    text: "2004"
                }
                ListElement {
                    text: "2005"
                }
                ListElement {
                    text: "2006"
                }
                ListElement {
                    text: "2007"
                }
                ListElement {
                    text: "2008"
                }
                ListElement {
                    text: "2009"
                }
                ListElement {
                    text: "2010"
                }
                ListElement {
                    text: "2011"
                }
                ListElement {
                    text: "2012"
                }
                ListElement {
                    text: "2013"
                }
                ListElement {
                    text: "2014"
                }
                ListElement {
                    text: "2015"
                }
                ListElement {
                    text: "2016"
                }
                ListElement {
                    text: "2017"
                }
                ListElement {
                    text: "2018"
                }
                ListElement {
                    text: "2019"
                }
                ListElement {
                    text: "2020"
                }
                ListElement {
                    text: "2021"
                }
                ListElement {
                    text: "2022"
                }
            }
            onCurrentIndexChanged:{
                yearss = years.get(currentIndex).text
                console.debug(yearss)
            }
        }


        ComboBox {
            id: comboBox6
            x: 268
            y: 88
            width: 114
            height: 35
            Text {
                id: text2
                x: 38
                y: 10
                width: 70
                height: 19
                text: qsTr("Month")
                font.pixelSize: 12
            }
            model: ListModel {
                id: months
                ListElement {
                    text: ""
                }
                ListElement {
                    text: "01"
                }
                ListElement {
                    text: "02"
                }
                ListElement {
                    text: "03"
                }
                ListElement {
                    text: "04"
                }
                ListElement {
                    text: "05"
                }
                ListElement {
                    text: "06"
                }
                ListElement {
                    text: "07"
                }
                ListElement {
                    text: "08"
                }
                ListElement {
                    text: "09"
                }
                ListElement {
                    text: "10"
                }
                ListElement {
                    text: "11"
                }
                ListElement {
                    text: "12"
                }
            }
            onCurrentIndexChanged:{
                monthss = months.get(currentIndex).text
                console.debug(monthss)
            }
        }

        ComboBox {
            id: comboBox7
            x: 397
            y: 88
            width: 114
            height: 35
            Text {
                id: text3
                x: 38
                y: 10
                width: 70
                height: 19
                text: qsTr("Day")
                font.pixelSize: 12
            }
            model: ListModel {
                id: day
                ListElement {
                    text: ""
                }
                ListElement {
                    text: "01"
                }
                ListElement {
                    text: "02"
                }
                ListElement {
                    text: "03"
                }
                ListElement {
                    text: "04"
                }
                ListElement {
                    text: "05"
                }
                ListElement {
                    text: "06"
                }
                ListElement {
                    text: "07"
                }
                ListElement {
                    text: "08"
                }
                ListElement {
                    text: "09"
                }
                ListElement {
                    text: "10"
                }
                ListElement {
                    text: "11"
                }
                ListElement {
                    text: "12"
                }
                ListElement {
                    text: "13"
                }
                ListElement {
                    text: "14"
                }
                ListElement {
                    text: "15"
                }
                ListElement {
                    text: "16"
                }
                ListElement {
                    text: "17"
                }
                ListElement {
                    text: "18"
                }
                ListElement {
                    text: "19"
                }
                ListElement {
                    text: "20"
                }
                ListElement {
                    text: "21"
                }
                ListElement {
                    text: "22"
                }
                ListElement {
                    text: "23"
                }
                ListElement {
                    text: "24"
                }
                ListElement {
                    text: "25"
                }
                ListElement {
                    text: "26"
                }
                ListElement {
                    text: "27"
                }
                ListElement {
                    text: "30"
                }
                ListElement {
                    text: "31"
                }
            }
            onCurrentIndexChanged:{
                days = day.get(currentIndex).text
                console.debug(days)
                date = yearss + "-" + monthss + "-" + days
                console.debug(date)
            }
        }

        Button {
            id: button1
            x: 138
            y: 207
            width: 373
            height: 46
            text: qsTr("Image Select")
            onClicked: {
            fileDialog.open()
               }

        }

        FileDialog {
            id: fileDialog
            title: qsTr("Please choose a file") + MyTrans.emptyString
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

        BorderImage {
            id: borderImage
            x: 259
            y: 252
            width: 132
            height: 114
            source: fileDialog.fileUrl
        }


        Button {
            id: button
            x: 138
            y: 383
            width: 373
            height: 67
            Text {
               id: name
               anchors.centerIn: parent
               text: qsTr("Insert")
               font { family: mySettings.fontType; pointSize: 15; }
            }
            onClicked: {
                dialogKayit.open()
            }

        }
    }

    /*##^##
    Designer {
        D{i:0;autoSize:true;height:480;width:640}
    }
    ##^##*/




}
