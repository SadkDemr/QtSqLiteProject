#include "listmodel.h"
#include "database.h"

ListModel::ListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// The method for obtaining data from the model
QVariant ListModel::data(const QModelIndex & index, int role) const {

    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
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

// The method updates the tables in the data model representation
void ListModel::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT id, " TABLE_TITLE ", " TABLE_DATE ", " TABLE_TAG" , " TABLE_VOTE"," TABLE_IMAGE " FROM " TABLE);
}

// Getting the id of the row in the data view model
int ListModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
