#ifndef GPIO_H
#define GPIO_H

#include <QObject>
#include <QObject>
#include <QtSerialPort/QSerialPortInfo>
#include <QString>
#include <QSerialPort>
#include <QIODevice>
#include <QTimer>
#include "serialike.h"
#include <QFile>
#include <QProcess>
#include <QDebug>
#include <QFileSystemWatcher>
#include <QTextStream>

class GPIO:public  QObject
{
    Q_OBJECT
public:
    explicit GPIO(QObject* parent = nullptr);
    ~GPIO();


    Q_INVOKABLE void gpioExport(void);
    Q_INVOKABLE void setDirectionGpioIke(void);
     Q_INVOKABLE void setDirectionGpioLedBotao(void);
    Q_INVOKABLE void setDirectionGpioBotao1(void);//--
    Q_INVOKABLE void setDirectionGpioBotao2(void);// ++
    Q_INVOKABLE void setDirectionGpioBotao3(void); //  botao do ganho
   // Q_INVOKABLE void PutValPin3(int out); // acionnará a placa da ikegami
    Q_INVOKABLE void PutvalPin4(int out); // acionnará o led do botão liga/desl



    void setLuminousMenos(void);
     void setLuminousMais(void);
     void setWiteBalnce(void);
     void setEnhance(void);
     void setGanho(void);
     void setTelaLed(void);
     void setTelaPrincipal(void);
public slots:

   Q_INVOKABLE void powerOff(void);
   Q_INVOKABLE  void startCounter(void);
     void powerOn(void);

signals:

     void liga(void);
     void desliga(void);

private:

    QString  m_path_b1;
    QString  m_path_b2;
     QString  m_path_b3;
     QString  m_path_b4;

   int  m_value_b1;
   int  m_value_b2;
    int  m_value_b3;
     int  m_value_b4;

    int tecla,tecla2,tecla3,tecla4;
    int tela;
     QTimer timerBotao;
     int contBotao,auxBotao,cont,contBotao2,auxBotao2,cont2,contBotao3,auxBotao3,cont3;

    bool Liga;
};

#endif // GPIO_H
