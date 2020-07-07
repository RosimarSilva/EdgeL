#ifndef CALENDARIO_H
#define CALENDARIO_H

#include <QObject>
#include <QTimer>

#include <QDebug>
#include "QDateTime"
#include "QDate"
#include "QProcess"
#include "QTime"

class Calendario:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int dia READ dia WRITE setDia NOTIFY changedDia)
    Q_PROPERTY(int mes READ mes WRITE setMes NOTIFY changedMes)
    Q_PROPERTY(int ano READ ano WRITE setAno NOTIFY changedAno)
    Q_PROPERTY(int hora READ hora WRITE setHora NOTIFY changedHora)
    Q_PROPERTY(int minuto READ minuto WRITE setMinuto NOTIFY changeMinuto)
     Q_PROPERTY(int formatHora READ formatHora WRITE setFormatHora NOTIFY changeFormat)
public:
    explicit Calendario(QObject* parent = nullptr);
    ~Calendario();

    void setDia(const int value);
    int dia() const;
    void setMes(const int value);
    int mes() const;
    void setAno(const int value);
    int ano() const;

    void setMinuto(const int value);
    int minuto() const;
    void setHora(const int value);
    int hora() const;
   Q_INVOKABLE void setFormatHora(const bool value);
    int formatHora()const;


    char convertHoras(char dado,char op);
    char horaAmerica(char hora);

   Q_INVOKABLE void readData(void);

    Q_INVOKABLE void setDay(char sinal);
    Q_INVOKABLE void setMonth(char sinal);
    Q_INVOKABLE void setYear(char sinal);
    Q_INVOKABLE void setHour(char sinal);
    Q_INVOKABLE void setminute(char sinal);
    Q_INVOKABLE void setDate(void);

    Q_INVOKABLE void setFormatAmPm(void);
   Q_INVOKABLE void amPM(void);



signals:
    void changedDia();
    void changedMes();
    void changedAno();
    void changedHora();
    void changeMinuto();
    void changeFormat();

private:
   char day;
   char month;
   char year;
   char hour;
   char minute;
   uint16_t brasil = 600;

   int m_day,m_month,m_year,m_hour,m_minute;
   bool m_format,auxFormat;
    QTimer *cu;
    QTimer *h;

};

#endif // CALENDARIO_H
