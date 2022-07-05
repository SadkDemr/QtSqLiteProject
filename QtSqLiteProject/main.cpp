#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>

#include "database.h"
#include "listmodel.h"
#include "MyLang.h"
#include "MyTranslator.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<MyLang>("MyLang", 1, 0, "MyLang");

      MyTranslator mTrans(&app);
      QQmlApplicationEngine engine;
      engine.rootContext()->setContextProperty("MyTrans",(QObject*)&mTrans);

      DataBase database;
      database.connectToDataBase();

      ListModel *model = new ListModel();

      engine.rootContext()->setContextProperty("myModel", model);
      engine.rootContext()->setContextProperty("database", &database);

      engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

      return app.exec();
}
