import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2


Item {


    Image {
        source: uifile.base64.length > 0 ? "data:image/png;base64," + uifile.base64: ""
    }
    Image {
        source: uifile.base64.length > 0 ? "data:image/png;base64," + uifile.base64: ""
    }

}
