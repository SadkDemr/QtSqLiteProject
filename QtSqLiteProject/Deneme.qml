import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Universal 2.12
Item {
    id: name

    UFile{
        id: uifile
        path : "C:/icon.ico"
    }
    Image {
        source: uifile.base64.length > 0 ? "data:image/png;base64," + uifile.base64: ""
    }
}
//Item {

//    RowLayout {
//               Label {
//                   text: qsTr("Light")
//                   font.pointSize: 13.5
//               }
//               Switch {
//                   id: colorModeSwitch
//                   position: darkModeOn ? 1.0 : 0.0

//                   onPositionChanged: {
//                       if (position === 0.0) {
//                           root.darkModeOn = false
//                       } else {
//                           root.darkModeOn = true
//                       }
//                   }
//               }
//               Label {
//                   text: qsTr("Dark")
//                   font.pointSize: 13.5
//               }

//               Pane {

//                   Button {
//                       text: qsTr("Button")
//                       Universal.background: Universal.Steel

//                   }
//               }
//               Button {
//                   text: qsTr("Button")
//                   Universal.foreground: Universal.Pink
//               }
//           }

//}


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











