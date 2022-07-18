#ifndef MDISPLAYIMAGE_H
#define MDISPLAYIMAGE_H
#include <QQuickPaintedItem>
#include <QImage>
#include <QtQuick/qquickitem.h>
class MDisplayImage:public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QImage image READ image WRITE setImage NOTIFY imageChanged)
public:
    explicit MDisplayImage(QQuickItem * parent): QQuickPaintedItem(parent){}
    QImage image() const { return *m_image;}
    void setImage(const QImage& image);
    void paint(QPainter *painter) Q_DECL_OVERRIDE;
    MDisplayImage();
private:
    QImage* m_image;
signals:
   void imageChanged();
};

#endif // MDISPLAYIMAGE_H
