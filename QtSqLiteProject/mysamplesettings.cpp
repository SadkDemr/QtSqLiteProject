#include "mysamplesettings.h"
#include "MyTranslator.h"
#include <QFont>

MySampleSettings::MySampleSettings(QObject* parent)
{
    qDebug() << "MySampleSettings Constructed running..";

    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    if(settings.contains("sampleColor"))
        qDebug() << "Settings group already exists.";
    else
        createSettingsGroup();

    settings.endGroup();
}

void MySampleSettings::createSettingsGroup()
{
    qDebug() << "Settings group creating...";

    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    settings.setValue("sampleColor", "grey");
    settings.setValue("fontType", "QFont(Algerian,24,-1,5,50,0,0,0,0,0,Regular)");
    settings.setValue("fontSize",24);
    settings.setValue("language", 0);
    settings.endGroup();
    qDebug() << "Settings group created...";
}


QString MySampleSettings::sampleColor()
{
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    QColor color = settings.value("sampleColor").value<QColor>();
    settings.endGroup();
    return color.name();
}

QString MySampleSettings::fontType()
{
    qDebug() << "font değişti";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    QString fontTyp = settings.value("fontType").value<QString>();
    qDebug()<<"Font family"<<fontTyp;
    settings.endGroup();
    return fontTyp;
}

int MySampleSettings::fontSize()
{
    qDebug() << "font değişti";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    int fontSize = settings.value("fontType").value<int>();
    qDebug()<<"Font family"<<fontSize;
    settings.endGroup();
    return fontSize;
}

int MySampleSettings::lng()
{
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    int lng = settings.value("language").value<int>();
    settings.endGroup();
    return lng;
}



void MySampleSettings::setSampleColor(QString sampleColor)
{
    qDebug() << "Arka plan rengi değişti";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    settings.setValue("sampleColor", sampleColor);
    settings.endGroup();
}

void MySampleSettings::setfontType(QString fontType)
{
    qDebug() << "font set";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    settings.setValue("fontType", fontType);

    settings.endGroup();
}

void MySampleSettings::setfontSize(int fontSize)
{
    qDebug() << "font set";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    settings.setValue("fontSize", fontSize);

    settings.endGroup();

}

void MySampleSettings::setlng(int lng)
{
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomSettings");
    settings.setValue("language", lng);
    settings.endGroup();
}


