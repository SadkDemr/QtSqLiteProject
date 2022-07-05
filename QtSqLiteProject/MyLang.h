#ifndef MYLANG_H
#define MYLANG_H

#include <QObject>
#include <QLocale>

class MyLang : public QObject
{
    Q_OBJECT
public:
    MyLang() {}

    enum E_Languages
    {
        ENG = QLocale::English,
        TR =  QLocale::Turkish,
        GER = QLocale::German
    };

    Q_ENUM(E_Languages)
};

#endif // MYLANG_H
