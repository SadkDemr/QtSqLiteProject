import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.15
import QtQuick.Controls.Styles 1.4


Item {
    Rectangle {
        color: "white"
        width: 200
        height: 100

        Text {
            text: "?"
            anchors.horizontalCenter: parent.horizontalCenter
            function findGreetings() {
                var db = openDatabaseSync("movies.sqlite", "1.0", "The Example QML SQL!", 1000000);

                db.transaction(
                    function(tx) {
//                        // Create the database if it doesn't already exist
//                        tx.executeSql('CREATE TABLE IF NOT EXISTS Greeting(salutation TEXT, salutee TEXT)');

//                        // Add (another) greeting row
//                        tx.executeSql('INSERT INTO Greeting VALUES(?, ?)', [ 'hello', 'world' ]);

                        // Show all added greetings
                        var rs = tx.executeSql('SELECT * FROM image');

                        var r = ""
                        for (var i = 0; i < rs.rows.length; i++) {
                            r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
                        }
                        text = r
                    }
                )
            }
            Component.onCompleted: findGreetings()
        }
    }
}
