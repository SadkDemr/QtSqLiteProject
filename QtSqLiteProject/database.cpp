#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}

void DataBase::connectToDataBase()
{
    if(!QFile("C:/Users/msdemir/Desktop/QTProje/QTDasalProject/" DATABASE_NAME).exists()){
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
}

bool DataBase::restoreDataBase()
{
    if(this->openDataBase()){
        return (this->createTable()) ? true : false;
    } else {
        qDebug() << "Failed to restore the database";
        return false;
    }
    return false;
}

bool DataBase::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("C:/Users/msdemir/Desktop/QTProje/QTDasalProject/" DATABASE_NAME);
    if(db.open()){
        return true;
    } else {
        return false;
    }
}

void DataBase::closeDataBase()
{
    db.close();
}

bool DataBase::createTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE " TABLE " ("
                            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                            TABLE_TITLE     " VARCHAR(255)    NOT NULL,"
                            TABLE_DATE     " VARCHAR(255)    ,"
                            TABLE_TAG       " VARCHAR(255)    NOT NULL,"
                            TABLE_VOTE      " DOUBLE ,"
                            TABLE_IMAGE    "BLOB"
                        " )"
                    )){
        qDebug() << "DataBase: error of create " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::inserIntoTable(const QVariantList &data)
{
    QSqlQuery query;
    query.prepare("INSERT INTO " TABLE " ( " TABLE_TITLE ", "
                                             TABLE_DATE ", "
                                             TABLE_TAG ","
                                             TABLE_VOTE ","
                                             TABLE_IMAGE " ) "
                  "VALUES (:Title, :Date, :Nik, :Vote)");
    query.bindValue(":Title",      data[0].toString());
    query.bindValue(":Date",       data[1].toString());
    query.bindValue(":Tag",        data[2].toString());
    query.bindValue(":Vote",       data[3].toString());
    query.bindValue(":Image",      data[4].toByteArray());

    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::inserIntoTable(const QString &title, const QString &date, const QString &tag, const QString &vote, const QByteArray &image)
{
    QVariantList data;
    data.append(title);
    data.append(date);
    data.append(tag);
    data.append(vote);
    data.append(image);

    if(inserIntoTable(data))
        return true;
    else
        return false;
}

bool DataBase::removeRecord(const int id)
{
    QSqlQuery query;

    query.prepare("DELETE FROM " TABLE " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
