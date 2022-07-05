#ifndef UFILE_H
#define UFILE_H

#include <QObject>
class UFile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QByteArray data READ data NOTIFY dataChanged)
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QString base64 READ base64 NOTIFY base64Changed)
    Q_PROPERTY(int length READ length)
public:
    explicit UFile(QObject *parent = nullptr);
    QByteArray data() const;
    QString path() const;
    int length() const;
    QString base64() const;

public Q_SLOTS:
    void setPath(const QString &path);
    void readFile(const QString &filePath);

Q_SIGNALS:
    void dataChanged();
    void pathChanged(const QString & path);
    void base64Changed();

private :
    QByteArray _data;
    QString _path;
    QByteArray m_base64;
};

#endif // UFILE_H
