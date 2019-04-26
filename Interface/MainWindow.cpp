#include "MainWindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow),
    m_prevPage(0)
{
    this->ui->setupUi(this);
    connect(this->ui->SFML_buttonGroup, SIGNAL(buttonClicked(int)), this, SLOT(SFML_buttonGroup_clicked(int)));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_modulesDecouverte_pushButton_clicked()
{
    this->ui->stackedWidget->setCurrentIndex(1);
}

void MainWindow::on_modulesControle_pushButton_clicked()
{
    this->ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_modulesGraphiques_pushButton_clicked()
{
    this->ui->stackedWidget->setCurrentIndex(3);
}

void MainWindow::on_modulesDecouverteBack_pushButton_clicked()
{
    this->ui->stackedWidget->setCurrentIndex(0);
}

void MainWindow::on_modulesControleBack_pushButton_clicked()
{
    this->ui->stackedWidget->setCurrentIndex(0);
}

void MainWindow::on_modulesGraphiquesBack_pushButton_clicked()
{
    this->ui->stackedWidget->setCurrentIndex(0);
}

void MainWindow::SFML_buttonGroup_clicked(int index)
{
    this->m_prevPage = this->ui->stackedWidget->currentIndex();
    this->ui->stackedWidget->setCurrentIndex(4);
    this->m_currentModuleName = this->ui->SFML_buttonGroup->button(index)->objectName().toStdString();
    std::cout << this->m_currentModuleName << std::endl;
}

void MainWindow::on_SFMLBack_pushButton_clicked()
{
    this->ui->stackedWidget->setCurrentIndex(this->m_prevPage);
}
