#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <iostream>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_modulesDecouverte_pushButton_clicked();
    void on_modulesControle_pushButton_clicked();
    void on_modulesGraphiques_pushButton_clicked();
    void on_modulesDecouverteBack_pushButton_clicked();
    void on_modulesControleBack_pushButton_clicked();
    void on_modulesGraphiquesBack_pushButton_clicked();
    void SFML_buttonGroup_clicked(int index);
    void on_SFMLBack_pushButton_clicked();

private:
    Ui::MainWindow *ui;

    int m_prevPage;
    std::string m_currentModuleName;
};

#endif // MAINWINDOW_H
