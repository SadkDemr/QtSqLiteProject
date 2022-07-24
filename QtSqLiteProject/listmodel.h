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
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    /*
     * QAbstractItemModel temel sınıfının wild'larında kullanılan yöntem,
     * QSqlQueryModel sınıfını miras alan
     * */
     QHash<int, QByteArray> roleNames() const;

signals:

public slots:
    void updateModel();
    void updateData();
    int getId(int row);
};

#endif // LISTMODEL_H
