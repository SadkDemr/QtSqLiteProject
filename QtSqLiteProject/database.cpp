#include "database.h"
#include <QIODevice>
#include <QSqlField>
#include <QSqlDriver>
#include <QDateTime>
DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}

void DataBase::connectToDataBase()
{
    if(!QFile("C:/Users/msdemir/Desktop/QTProje/QtSqLiteProject/" DATABASE_NAME).exists()){
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
        qDebug() << "Veritabani geri yuklenemedi";
        return false;

    }
    return false;
}

bool DataBase::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("C:/Users/msdemir/Desktop/QTProje/QtSqLiteProject/" DATABASE_NAME);
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
                            TABLE_DATE     " DATE    ,"
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


bool DataBase::inserIntoTable(const QString &title, const QDate &date, const QString &tag, const QString &vote, const QString &image)
{


    QSqlQuery query;

    query.prepare(
                "INSERT INTO " TABLE
                " ("
                TABLE_TITLE ", "
                TABLE_DATE ", "
                TABLE_TAG ","
                TABLE_VOTE ","
                TABLE_IMAGE ") "
                "VALUES (:Title, :Date, :Tag, :Vote, :Image)");

     QTime time = QTime::currentTime();
     QString text = time.toString("hh.mm.ss.z");
     if ((time.second() % 2) == 0)
         text[2] = ' ';
    qDebug()<< text;

    QString filePath = image;
    QFileInfo info(filePath) ;
    QString fileName = info.fileName();
    qDebug()<< filePath;


    QString temp = image;//file:///C:/Users/msdemir/Downloads/2548a.jpg
    temp.remove(0,8);
    QFile file(temp);
    QString path = "C:/Users/msdemir/Desktop/QTProje/QtSqLiteProject/movies_img/"+ text + "_" + fileName  ;
    file.copy(path);
    qDebug()<< path;


    query.bindValue(":Title",      title);
    query.bindValue(":Date",      date);
    query.bindValue(":Tag",        tag);
    query.bindValue(":Vote",       vote);
    query.bindValue(":Image",     path , QSql::In | QSql::Binary);


    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }

    return false;


}
//((myModel.getId(tableView.currentRow)), original_titleField.text , release_dateField.text, taglineField.text, vote_averageField.text, fileDialog.fileUrl)
bool DataBase::update(const int id,const QString &title, const QDate &date, const QString &tag, const QString &vote, const QString &image) // there are not exists params
{
    //fonksiyona gelen tum datalara debug at

    qDebug() << "update() running..";
    QSqlQuery query;
    qDebug() << "title : " << title;
    qDebug()<< "date : "<< date;
    qDebug()<< "tag : "<< tag;
    qDebug()<< "vote : "<< vote;
    qDebug() << "id : " << id;

    query.prepare("UPDATE movies_image SET original_title=:Title, release_date=:Date, tagline=:Tag, vote_average=:Vote, image=:Image   WHERE id = :ID");

    QTime time = QTime::currentTime();
    QString text = time.toString("hh.mm.ss.z");
    if ((time.second() % 2) == 0)
        text[2] = ' ';
   qDebug()<< text;

   QString filePath = image;
   QFileInfo info(filePath) ;
   QString fileName = info.fileName();
   qDebug()<< filePath;


   QString temp = image;//file:///C:/Users/msdemir/Downloads/2548a.jpg
   temp.remove(0,8);
   QFile file(temp);
   QString path = "C:/Users/msdemir/Desktop/QTProje/QtSqLiteProject/movies_img/"+ text + "_" + fileName  ;
   file.copy(path);
   qDebug()<< path;

    query.bindValue(":ID",          id);
    query.bindValue(":Title",      title);
    query.bindValue(":Date",       date);
    query.bindValue(":Tag",       tag);
    query.bindValue(":Vote",       vote);
    query.bindValue(":Image",      path, QSql::In | QSql::Binary);



    //query sorgusunun son halini ekrana string yaz

    qDebug() << "query prepared ! "<< query.exec();

    if(!query.exec()){
        qDebug() << "error update " << TABLE;
        qDebug() << "lastError : " << query.lastError().text();
        return false;
    } else {
        return true;

    }
    return false;
}


bool DataBase::removeRecord(const int id)
{

    // id degerine debug at

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
