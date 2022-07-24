#include "listmodel.h"
#include "database.h"
#include <QLabel>

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

QHash<int, QByteArray> ListModel::roleNames() const {

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
//    qDebug()<<"Image Show";
//    QByteArray outByteArray =TABLE_IMAGE ;
//        QPixmap outPixmap = QPixmap();
//        outPixmap.loadFromData( outByteArray );
//   qDebug()<< outByteArray;

//        // Display image
//        QLabel myLabel;
//        myLabel.setPixmap( outPixmap );
//        myLabel.show();
//    qDebug()<< outPixmap;
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
















