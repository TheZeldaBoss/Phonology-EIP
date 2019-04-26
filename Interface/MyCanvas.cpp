#include "MyCanvas.h"

MyCanvas::MyCanvas(QWidget *parent) :
QSFMLCanvas(parent)
{
}

void MyCanvas::OnInit()
{
}

void MyCanvas::OnUpdate()
{
    clear(sf::Color(0, 128, 0));
}
