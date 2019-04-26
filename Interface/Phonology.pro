#-------------------------------------------------
#
# Project created by QtCreator 2019-03-01T00:03:39
#
#-------------------------------------------------

QT       += core gui

LIBS += -L$$_PRO_FILE_PWD_/libs/SFML-2.5.1/lib
LIBS += -lsfml-audio -lsfml-graphics -lsfml-window -lsfml-system
INCLUDEPATH += $$_PRO_FILE_PWD_/libs/SFML-2.5.1/include

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Phonology
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        MainWindow.cpp \
        MyCanvas.cpp \
        QSFMLCanvas.cpp \
        main.cpp

HEADERS += \
        MainWindow.h \
        MyCanvas.h \
        QSFMLCanvas.h

FORMS += \
        mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
