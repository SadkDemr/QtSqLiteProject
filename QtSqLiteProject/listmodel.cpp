#include "listmodel.h"
#include "database.h"
#include <QLabel>
#include <QSqlRecord>

ListModel::ListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();

}

// Modelden veri elde etme yöntemi
// Method of obtaining data from the model
QVariant ListModel::data(const QModelIndex & index, int role) const {

    // Sayı rolüne göre sütun numarasını tanımlayın
    // Define column number by number role
    int columnId = role - Qt::UserRole - 1;
//    qDebug()<<"User Role"<< Qt::UserRole;
//    qDebug()<<"Column Id:"<< columnId;
//    qDebug()<<"Role:"<< role;


    // Column id kullanarak dizi oluşturma
    // Creating array using column id
    QModelIndex modelIndex = this->index(index.row(), columnId);
//    qDebug()<<"Index:"<< index;

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}



QHash<int, QByteArray> ListModel::roleNames() const  {

    QHash<int, QByteArray> roles;
      roles[IdRole] = "id";
      roles[TitleRole] = "original_title";
      roles[DateRole] = "release_date";
      roles[TagRole] = "tagline";
      roles[VoteRole] = "vote_average";
      roles[ImageRole] = "image";
      return roles;
}

// Yöntem, veri modeli gösterimindeki tabloları günceller
//The method updates the tables in the data model representation
void ListModel::updateModel()
{
    //veritabanına SQL sorguları gerçekleştirilir
    //SQL queries to the database are performed
   this->setQuery("SELECT id, " TABLE_TITLE ", " TABLE_DATE ", " TABLE_TAG" , " TABLE_VOTE"," TABLE_IMAGE " FROM " TABLE);

}

void ListModel::updateData()
{
     this->setQuery("UPDATE " TABLE " ( " TABLE_TITLE ", "
                    TABLE_DATE ", "
                    TABLE_TAG ","
                    TABLE_VOTE ","
                    TABLE_IMAGE " ) "
                    "WHERE id= :ID ;");
}

// Veri görünümü modelinde satırın kimliğini alma
// Getting the id of the row in the data view model
int ListModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}

//Seçilen Id değerine göre verileri yazdırma
//Printing data based on selected Id value
QString ListModel::getTitle(int row)
{
    qDebug() << "row : " << row;

    qDebug() << "this->index(row, 0) : " << this->index(row, 0);

    qDebug() << "this->data(this->index(row, 0), TitleRole).toString() : " << this->data(this->index(row, 0), TitleRole).toString();

    return this->data(this->index(row, 0), TitleRole).toString();

}

QString ListModel::getTag(int row)
{
    return this->data(this->index(row, 0), TagRole).toString();
}

QString ListModel::getDate(int row)
{
   return this->data(this->index(row, 0), DateRole).toString();
}

int ListModel::getVote(int row)
{
    return this->data(this->index(row, 0), VoteRole).toInt();
}

QString ListModel::getImage(int row)
{
    return this->data(this->index(row, 0), ImageRole).toString();
}



















