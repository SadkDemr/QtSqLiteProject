#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QObject>
#include <QSqlQueryModel>
#include <QBuffer>

class ListModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    /* TableView'da kullanılacak tüm rolleri listeliyoruz.
     * Qt::UserRole parametresinin üzerindeki bellekte olmalılar.
     * Bu adresin altındaki bilgiler özelleştirmeler için olmadığı için
     *
     * We list all the roles to be used in TableView.
     * They must be in memory above the Qt::UserRole parameter.
     * Since the information under this address is not for customizations
     * */
    enum Roles {
        IdRole = Qt::UserRole + 1,      // id
        TitleRole,                      // original_title
        DateRole,                      // release_date
        TagRole,                         // tagline
        VoteRole,                        // vote_average
        ImageRole                       //image
    };



    explicit ListModel(QObject *parent = 0);



    // Verileri döndürecek yöntemi geçersiz kılmak
    // Make it impossible to return data
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


protected:
    /*
     * QAbstractItemModel temel sınıfının wild'larında kullanılan yöntem,
     * QSqlQueryModel sınıfını miras alan
     *
     * The method used in the wilds of the QAbstractItemModel base class,
     * Inheriting the QSqlQueryModel class
     * */
    QHash<int, QByteArray> roleNames() const;

signals:


public slots:
    void updateModel();
    void updateData();
    int getId(int row);
    QString getTitle(int row);
    QString getTag(int row);
    QString getDate(int row);
    int getVote(int row);
    QString getImage(int row);



};

#endif // LISTMODEL_H
