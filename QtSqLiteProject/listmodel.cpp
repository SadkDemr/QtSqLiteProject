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
QVariant ListModel::data(const QModelIndex & index, int role) const {

    // Sayı rolüne göre sütun numarasını tanımlayın
    int columnId = role - Qt::UserRole - 1;
    // Column id kullanarak dizi oluşturma
    QModelIndex modelIndex = this->index(index.row(), columnId);

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
void ListModel::updateModel()
{
    //veritabanına SQL sorguları gerçekleştirilir
   this->setQuery("SELECT id, " TABLE_TITLE ", " TABLE_DATE ", " TABLE_TAG" , " TABLE_VOTE"," TABLE_IMAGE " FROM " TABLE);
   //this->setQuery("SELECT id, " TABLE_TITLE " FROM " TABLE);

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
int ListModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}

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



















