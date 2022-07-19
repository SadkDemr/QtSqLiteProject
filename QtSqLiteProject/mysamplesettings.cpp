#include "mysamplesettings.h"
#include <QFont>

MySampleSettings::MySampleSettings(QObject* parent)
{
    qDebug() << "MySampleSettings Constructed running..";

    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
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

    settings.beginGroup("MyCustomColors");
    settings.setValue("sampleColor", "grey");
    settings.setValue("fontType", "QFont(Algerian,24,-1,5,50,0,0,0,0,0,Regular)");
    settings.setValue("fontSize",24);
    settings.endGroup();
    qDebug() << "Settings group created...";
}


QString MySampleSettings::sampleColor()
{
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
    QColor color = settings.value("sampleColor").value<QColor>();
    settings.endGroup();
    return color.name();
}

QString MySampleSettings::fontType()
{
    qDebug() << "font değişti";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
    QFont font = settings.value("fontType").value<QString>();
    settings.endGroup();
    return font.family();
}

QString MySampleSettings::fontSize()
{
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
    QColor color = settings.value("fontSize").value<QString>();
    settings.endGroup();
    return color.name();
}

void MySampleSettings::setSampleColor(QString sampleColor)
{
    qDebug() << "Arka plan rengi değişti";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
    settings.setValue("sampleColor", sampleColor);
    settings.endGroup();
}

void MySampleSettings::setfontType(QString fontType)
{
    qDebug() << "font set";
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
    settings.setValue("fontType", fontType);
    settings.endGroup();
}

void MySampleSettings::setfotSize(QString fontSize)
{
    QSettings settings("DasalGCS", "org.dasal");
    settings.beginGroup("MyCustomColors");
    settings.setValue("fontSize", fontSize);
    settings.endGroup();
}
