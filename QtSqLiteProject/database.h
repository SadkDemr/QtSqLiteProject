#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <QImage>

#define DATABASE_HOSTNAME   "moviesDataBase"
#define DATABASE_NAME       "movies.sqlite"

#define TABLE                   "image"
#define TABLE_TITLE             "original_title"
#define TABLE_DATE             "release_date"
#define TABLE_TAG              "tagline"
#define TABLE_VOTE              "vote_average"
#define TABLE_IMAGE             "image"

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    void connectToDataBase();

private:
    QSqlDatabase    db;

private:
    bool openDataBase();
    bool restoreDataBase();
    void closeDataBase();
    bool createTable();

public slots:
    bool inserIntoTable(const QVariantList &data);      // Tabloya giriş ekleme
    bool inserIntoTable(const QString &title, const QString &date, const QString &tag, const QString &vote, const QByteArray &image);
    bool removeRecord(const int id); // tablodan kayıtları kaldırma
};

#endif // DATABASE_H
