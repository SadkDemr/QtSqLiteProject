#ifndef MYSAMPLESETTINGS_H
#define MYSAMPLESETTINGS_H

#include <QObject>
#include <QSettings>
#include <QColor>
#include <QDebug>
#include <QString>

class MySampleSettings : public QObject
{
    Q_OBJECT
public:
    MySampleSettings(QObject* parent = nullptr); // constructer

    Q_PROPERTY(QString sampleColor          READ sampleColor            CONSTANT)
    Q_PROPERTY(QString fontType   READ fontType     CONSTANT)
    Q_PROPERTY(int fontSize   READ fontSize     CONSTANT)


    // read func
    QString sampleColor();
    QString fontType();
    int fontSize();


    // write func
    Q_INVOKABLE void setSampleColor(QString sampleColor);
    Q_INVOKABLE void setfontType(QString fontType);
    Q_INVOKABLE void setfontSize(int fontSize);


private:
    void createSettingsGroup();

};

#endif // MYSAMPLESETTINGS_H
