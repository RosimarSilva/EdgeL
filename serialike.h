#ifndef SERIALIKE_H
#define SERIALIKE_H

#include <QObject>
#include <QObject>
#include <QtSerialPort/QSerialPortInfo>
#include <QString>
#include <QSerialPort>
#include <QIODevice>
#include <QTimer>
#include <QFile>
#include <QProcess>
#include <QDebug>
#include <QFileSystemWatcher>
#include <QTextStream>
#include <QTimer>

#include "QProcess"
#include "QtPrintSupport/QPrintDialog"
#include "QThread"



class SerialIke:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int myNumberSerie READ myNumberSerie WRITE readNumberSerie NOTIFY serialScreen);
    Q_PROPERTY(int serialNumber READ serialNumber WRITE setNumberSerie NOTIFY serialChanged);
    Q_PROPERTY(int horasDigitadas READ horasDigitadas WRITE setHorasDigitadas NOTIFY horasDigitada);
    Q_PROPERTY(int horasLampada READ horasLampada WRITE setHorasLamp NOTIFY hourChanged);
    Q_PROPERTY(int tempLed READ tempLed WRITE setTempLed NOTIFY tempLedChanged);
    Q_PROPERTY(int minutos READ minutos WRITE setMin NOTIFY minChanged);
    Q_PROPERTY(int percent READ percent WRITE setPercent NOTIFY percentChanged);


public:
    explicit SerialIke(QObject* parent = nullptr);
    ~SerialIke();

    Q_INVOKABLE bool openSerial(const QString &name,bool readWrite);
    Q_INVOKABLE bool isopen(void);
    Q_INVOKABLE bool paramSet(const QString &name, const QString &value) ;
    Q_INVOKABLE int writeBytes(const QList<int> &l, const int resp);
    Q_INVOKABLE void displayOff(void);
    Q_INVOKABLE void displayOn(void);
    Q_INVOKABLE void displayBrightness(const int luz);
    Q_INVOKABLE void powerOfff(void);
    Q_INVOKABLE void init(void);
    Q_INVOKABLE void resetHoras(void);
    Q_INVOKABLE void readHoras(void);
    Q_INVOKABLE void leSerial(void);


    Q_INVOKABLE void readFlash(void);
    Q_INVOKABLE void writeFlash(void);

    Q_INVOKABLE void setIntensidadeLed(char sinal);
    Q_INVOKABLE void setSerialNumber(char number);
    Q_INVOKABLE void setHorasDgit( char number);
    Q_INVOKABLE void readNumberSerie(const int value);
    Q_INVOKABLE void setConthora(bool conta);
    Q_INVOKABLE void setTempLed(const char temmp);
    Q_INVOKABLE void setMin(const char min);
    Q_INVOKABLE void setPercent(const char percento);


     int myNumberSerie(void);
     void setNumberSerie(const int serial);
     Q_INVOKABLE void setHorasDigitadas(const int digit);
     int serialNumber(void);
     int horasDigitadas(void);
     int tempLed(void);
     int minutos(void);
     int percent(void);

     void setHorasLamp(int hour);
     int horasLampada(void);
     char ascII(char dado);
     char numToAscII(char dado);

     void run();

signals:
     void goTela(void);
     void menuChanged(void);
     void menu_TelaPrincipal(void);

     void serialChanged(void);
     void horasDigitada(void);
     void backMenu();
     void backConf(void);
     void serialScreen(void);
     void hourChanged(void);
     void tempLedChanged(void);
     void minChanged(void);
     void percentChanged(void);

 public slots:
    Q_INVOKABLE  QList<int>readBytes(void);

     void horasLamp(void);

      void calcHoras(void);
      void tempp(void);


 private:
     QSerialPort *port;
     QByteArray  *out_;

     QTimer *t4;
     QTimer *t0;

     bool tela_;

     bool open_ ;

     int comando;
      QFile escrita;

     QByteArray ikeenv;
     QByteArray dadoSalvo;

     SerialIke *THread;

     int userConf = 0;
     int intensidadeLed = 0;

     int horaslampada = 0,minutoLampada,m_hour;

     int dia,mes,ano,hora,minuto;

     int auxSerial,serialDig,horasDigit = 0,contSerial = 0, temp;
     int serialNumero;
     int m_serial, numberSerie,m_digit,m_temp,m_min,m_percent;
     bool conts;
     char z,u,d,t,q,ze,um,doi,tre,qu,cin;
     char h_hour;
     int conta = 1;
     char data;
     char contSerialNumber = 7;

};

#endif // SERIALIKE_H
