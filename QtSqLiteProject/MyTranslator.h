#ifndef MYTRANSLATOR_H
#define MYTRANSLATOR_H

#include <QObject>
#include <QGuiApplication>
#include <QApplication>
#include <QQuickView>
#include <QTranslator>
#include <QSettings>
#include "MyLang.h"
#include "mysamplesettings.h"

class MyTranslator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    MyTranslator(QApplication* app) { mApp = app; }

    QString getEmptyString() { return ""; }

signals:
    void languageChanged();

public slots:
    void updateLanguage(int lang){
        switch(lang){
        case 0:
            mTranslator.load("HelloWorld_ENG", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        case 1:
            mTranslator.load("HelloWorld_TR", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        case 2:
            mTranslator.load("HelloWorld_GER", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        }
        emit languageChanged();
    }


private:
    QApplication* mApp;
    QTranslator mTranslator;
};

#endif // MYTRANSLATOR_H
