#include "MDisplayImage.h"
#include <QPainter>

MDisplayImage::MDisplayImage()
{

}
void MDisplayImage::setImage(const QImage &image){
    m_image = image;
    emit imageChanged();
    update();
    setImplicitHeight(image.height());
    setImplicitWidth(image.width());
}
void MDisplayImage::paint(QPainter *painter){
    m_image = m_image.scaled(width(), height(),Qt::KeepAspectRatio);
    if(m_image.isNull()) return;
    painter->drawImage(0,0,m_image);

}
