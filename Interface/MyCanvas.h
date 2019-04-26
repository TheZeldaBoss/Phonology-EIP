#ifndef MYCANVAS_H
#define MYCANVAS_H

#include "QSFMLCanvas.h"

class MyCanvas : public QSFMLCanvas
{
public :
    MyCanvas(QWidget *parent);

private :
    void OnInit();
    void OnUpdate();
};

#endif // MYCANVAS_H
