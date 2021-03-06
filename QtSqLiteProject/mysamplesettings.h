#ifndef MYSAMPLESETTINGS_H
#define MYSAMPLESETTINGS_H
#include <QObject>
#include <QSettings>
#include <QColor>
#include <QDebug>
#include <QString>
#include <QTranslator>

class MySampleSettings : public QObject
{
    Q_OBJECT
public:
    MySampleSettings(QObject* parent = nullptr); // constructer

    Q_PROPERTY(QString sampleColor          READ sampleColor        CONSTANT)
    Q_PROPERTY(QString fontType   READ fontType     CONSTANT)
    Q_PROPERTY(int fontSize   READ fontSize     CONSTANT)
    Q_PROPERTY( int lng   READ lng     CONSTANT)


    // read func
    QString sampleColor();
    QString fontType();
    int fontSize();
    int lng();


    // write func
    Q_INVOKABLE void setSampleColor(QString sampleColor);
    Q_INVOKABLE void setfontType(QString fontType);
    Q_INVOKABLE void setfontSize(int fontSize);
    Q_INVOKABLE void setlng( int lng);


private:
    void createSettingsGroup();

};

#endif // MYSAMPLESETTINGS_H
