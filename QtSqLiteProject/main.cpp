#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>
#include <QSettings>
#include <QVariant>
#include <QColor>
#include <QLabel>

#include "database.h"
#include "listmodel.h"
#include "MyTranslator.h"
#include "mysamplesettings.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QApplication::setOrganizationName("DasalGCS");
    QApplication::setOrganizationDomain("Dasal.org");
    QApplication::setApplicationName("org.dasal");
    QSettings settings("DasalGCS", "org.dasal");
    MySampleSettings* mSettings = new MySampleSettings();

    MyTranslator mTrans(&app);
    QQmlApplicationEngine engine;

    qDebug() << "mSettings->lng() : " << mSettings->lng();
    mTrans.updateLanguage(mSettings->lng());



    DataBase database;
    database.connectToDataBase();


    ListModel *model = new ListModel();

    engine.rootContext()->setContextProperty("myModel", model);
    engine.rootContext()->setContextProperty("database", &database);
    engine.rootContext()->setContextProperty("mySettings", mSettings);
    engine.rootContext()->setContextProperty("MyTrans",(QObject*)&mTrans);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));



    return app.exec();
}
