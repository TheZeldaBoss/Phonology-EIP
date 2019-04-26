#include "QSFMLCanvas.h"

QSFMLCanvas::QSFMLCanvas(QWidget *parent) :
    QWidget(parent),
    myInitialized(false)
{
    //QPoint position;
    //QSize size;
    unsigned int frameTime = 30;
    setAttribute(Qt::WA_PaintOnScreen);
    setAttribute(Qt::WA_OpaquePaintEvent);
    setAttribute(Qt::WA_NoSystemBackground);
    setFocusPolicy(Qt::StrongFocus);
    //move(position);
    //resize(size);
    myTimer.setInterval(static_cast<int>(frameTime));
}

void QSFMLCanvas::resizeEvent(QResizeEvent*)
{
    setSize(sf::Vector2u(static_cast<unsigned int>(QWidget::width()), static_cast<unsigned int>(QWidget::height())));
}

QPaintEngine* QSFMLCanvas::paintEngine() const
{
    return (nullptr);
}

void QSFMLCanvas::showEvent(QShowEvent*)
{
    if (!myInitialized)
    {
        sf::RenderWindow::create(reinterpret_cast<sf::WindowHandle>(winId()));
        OnInit();
        connect(&myTimer, SIGNAL(timeout()), this, SLOT(repaint()));
        myTimer.start();
        myInitialized = true;
    }
}

void QSFMLCanvas::paintEvent(QPaintEvent*)
{
    OnUpdate();
    display();
}

