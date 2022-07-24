import QtQuick 2.12
import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Universal 2.12
import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: window
    width: 320
    height: 260
    visible: true
    property var yearss
    property var monthss
    property var days
    property var date



//    TextField
//    {
//        id: blah;
//        font { family: "Arial"; pointSize: 32; }
//        style: TextFieldStyle
//        {
//        textColor: "#000";
//        background: Rectangle
//        {
//        color: "#FFF";
//        border.color: "#999";
//        border.width: 1;
//        radius: 4
//    }
//    }
//    }





}







//    Calendar {
//        id: calendar
//        anchors.centerIn: parent
//        frameVisible: true
//        weekNumbersVisible: true
//        // selectedDate: new Date(2014, 0, 1)
//        focus: true
//        property var startDate: undefined
//        property var stopDate: undefined

//        style: CalendarStyle {
//            dayDelegate: Item {
//                readonly property color sameMonthDateTextColor: "#444"
//                readonly property color selectedDateColor: "#3778d0"
//                readonly property color selectedDateTextColor: "white"
//                readonly property color differentMonthDateTextColor: "#bbb"
//                readonly property color invalidDatecolor: "#dddddd"
//                property var dateOnFocus: styleData.date



//                Rectangle {
//                    anchors.fill: parent
//                    border.color: "transparent"
//                    color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"

//                }

//                Rectangle{
//                    id:fl
//                    anchors.fill: parent
//                    property bool flag: false
//                    color: ((dateOnFocus>calendar.startDate) && (dateOnFocus< calendar.stopDate))?"#55555555":
//                           (calendar.startDate !==undefined && dateOnFocus.getTime()===calendar.startDate.getTime())?"#3778d0":"transparent"
//                }


//                MouseArea{
//                    anchors.fill: parent
//                    propagateComposedEvents: true
//                    onPressed: {

//                        if(calendar.startDate===undefined){
//                            calendar.startDate=styleData.date
//                        }
//                        else if(calendar.stopDate=== undefined){
//                            calendar.stopDate=styleData.date
//                        }
//                        else{
//                            calendar.startDate=styleData.date
//                            calendar.stopDate= undefined
//                        }

//                        if(calendar.stopDate<=calendar.startDate){
//                            calendar.startDate=styleData.date
//                            calendar.stopDate= undefined
//                        }

//                        mouse.accepted = false
//                    }
//                }


//                Label {
//                    id: dayDelegateText
//                    text: styleData.date.getDate()
//                    anchors.centerIn: parent
//                    color: {
//                        var color = invalidDatecolor;
//                        if (styleData.valid) {
//                            // Date is within the valid range.
//                            color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
//                            if (styleData.selected) {
//                                color = selectedDateTextColor;
//                            }
//                            else if (dateOnFocus.getTime()===calendar.startDate.getTime()) {
//                                color = selectedDateTextColor;
//                            }
//                        }
//                        color;
//                    }
//                }
//            }
//        }
//    }



//        id: window
//        width: 320
//        height: 260
//        visible: true

//        Rectangle{
//            id:rectİd
//            color:mySettings.sampleColor
//            Text {
//                id: name
//                text: qsTr("Hello")
//                font.family: "Algerian"
//                font.pointSize:15
//            }
//        }
//        Column{
//            spacing: 20
//            anchors.centerIn: parent
//            MenuBar {
//                 Menu {
//                     title: qsTr("&Nummber")
//                     Action { text: qsTr("1") }
//                     Action { text: qsTr("2") }
//                     Action { text: qsTr(3) }
//                     Action { text: qsTr(4) }
//                     MenuSeparator { }
//                     Action { text: qsTr("&Quit") }
//                 }
//                 Menu {
//                     title: qsTr("&Edit")
//                     Action { text: qsTr("Cu&t") }
//                     Action { text: qsTr("&Copy") }
//                     Action { text: qsTr("&Paste") }
//                 }
//                 Menu {
//                     title: qsTr("&Help")
//                     Action { text: qsTr("&About") }
//                 }
//             }



//        }








//ApplicationWindow {
//    visible: true

//    Universal.theme: Universal.Dark
//    Universal.accent: Universal.Violet

//    Column {
//        anchors.centerIn: parent

//        RadioButton { text: qsTr("Small") }
//        RadioButton { text: qsTr("Medium");  checked: true }
//        RadioButton { text: qsTr("Large") }
//    }
//}
//ListView {
//           id: listView
//           anchors.fill: parent
//           topMargin: 48
//           leftMargin: 48
//           bottomMargin: 48
//           rightMargin: 48
//           spacing: 20
//           model: myModel
//           delegate: ItemDelegate {
//               text: database
//               width: listView.width - listView.leftMargin - listView.rightMargin
//               height: avatar.implicitHeight
//               leftPadding: avatar.implicitWidth + 32

//               Image {
//                   id: avatar
//                   source: "qrc:/" + database.replace(" ", "_") + ".png" + ".jpg"

//               }
//           }
//       }











