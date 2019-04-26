#ifndef QSFMLCANVAS_H
#define QSFMLCANVAS_H

#include <SFML/Graphics.hpp>
#include <QWidget>
#include <QTimer>

class QSFMLCanvas : public QWidget, public sf::RenderWindow
{
public :
    QSFMLCanvas(QWidget *parent);
    virtual ~QSFMLCanvas() {}

private :
    virtual void OnInit() {}
    virtual void OnUpdate() {}
    void resizeEvent(QResizeEvent*);
    virtual QPaintEngine *paintEngine() const;
    virtual void showEvent(QShowEvent*);
    virtual void paintEvent(QPaintEvent*);

    QTimer myTimer;
    bool myInitialized;
};

#endif // QSFMLCANVAS_H
