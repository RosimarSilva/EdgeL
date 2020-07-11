#include "calendario.h"
#include <QDebug>

Calendario::Calendario(QObject *parent) :
    QObject(parent)
{
//qDebug() << Q_FUNC_INFO;
     cu = new QTimer;
    wait = new QTimer;

            //this->readData();
    connect(cu,&QTimer::timeout,this,&Calendario::readData);
    cu->start(30000);

     connect(wait,&QTimer::timeout,this,&Calendario::chama);

}

Calendario::~Calendario()
{
  // qDebug() << Q_FUNC_INFO;
    delete cu;
}

void Calendario::setDia(const int value)
{
    if(m_day != value)
    {
        m_day = value;
        emit changedDia();
    }
}

int Calendario::dia() const
{
    return m_day;
}

void Calendario::setMes(const int value)
{
    if(m_month != value)
    {
        m_month = value;
        emit changedMes();
    }
}

int Calendario::mes() const
{
    return m_month;
}

void Calendario::setAno(const int value)
{
    if(m_year != value)
    {
        m_year = value;
        emit changedAno();
    }
}

int Calendario::ano() const
{
    return m_year;
}

void Calendario::setMinuto(const int value)
{
    if(m_minute != value)
    {
        m_minute = value;
        emit changeMinuto();
    }
}

int Calendario::minuto() const
{
    return  m_minute;
}

void Calendario::setHora(const int value)
{
    if(m_hour != value)
    {
        m_hour = value;
        emit changedHora();

    }
}

int Calendario::hora() const
{
    return  m_hour;
}

void Calendario::setFormatHora(const bool value)
{
    if(m_format != value)
    {
        m_format = value;
        emit changeFormat();

    }
}

void Calendario::setInterval()
{
   wait->start(3000);
}
void Calendario::setFormatAmPm()
{
   // qDebug()<< auxFormat;
    setFormatHora(auxFormat);
    if(auxFormat) auxFormat = 0;
    else auxFormat = 1;
}

void Calendario::amPM(void)
{
    QTime time = QTime::currentTime();
    hour = time.hour();
    if(hour>= 12)  m_format = 1;
    else m_format = 0;
    h->stop();

    emit changeFormat();
}

void Calendario::updateSoftware()
{
    system("cp /media/sda1/EdgeL /usr/bin/");

    system("umount /media/sda1/");
}

void Calendario::restartSystem()
{
    system("reboot");
}

void Calendario::chama()
{
    wait->stop();
    emit tempo();
}

int Calendario::formatHora() const
{
    return m_format;
}


void Calendario::setDay(char sinal)
{
    switch(sinal)
    {
        case 1:
        {
            day= day += 1;
            if(day > 31) day = 1;

        }break;

        case 2:
        {
           day= day -= 1;
            if(day <= 0) day = 31;
         }break;

    }

    this->setDia(day);
}

void Calendario::setMonth(char sinal)
{
    switch(sinal)
    {
        case 3:
        {
            month= month += 1;
            if(month > 12)month =1;
        }break;

        case 4:
        {
           month= month -= 1;
            if(month <= 0)month =1;
         }break;

    }

    this->setMes(month);
}

void Calendario::setYear(char sinal)
{
    switch(sinal)
    {
        case 5:
        {
            year= year += 1;
        }break;

        case 6:
        {
           year= year -= 1;
           if(year <= 1) year = 1;
         }break;

    }

    this->setAno(year);
}

void Calendario::setHour(char sinal)
{
    switch(sinal)
    {
        case 5:
        {
            hour= hour += 1;
             if(hour >12)hour =0;
        }break;

        case 6:
        {
         hour= hour -= 1;
         if(hour > 20)hour =12;
         }break;

    }
    qDebug() <<hour;
    this->setHora(hour);
}

void Calendario::setminute(char sinal)
{
    switch(sinal)
    {
        case 5:
        {
            minute= minute += 1;
             if(minute >= 60)minute =0;
        }break;

        case 6:
        {
         minute= minute -= 1;
         if(minute > 65)minute =59;
         }break;

    }
 qDebug() <<minute;
 this->setMinuto(minute);
}

void Calendario::setDate()
{
    // "2010-09-09 16:50:00
     QByteArray date = "date +%T -s";
     QByteArray geraldao = "date +%Y%m%d -s ";
     QByteArray data;

     QByteArray horas;

      if(auxFormat)
      {
          qDebug()<<auxFormat;

              switch(hour)
              {
                  case 13: hour = 1;break;
                  case 14: hour = 2;break;
                  case 15: hour = 3;break;
                  case 16: hour = 4;break;
                  case 17: hour = 5;break;
                  case 18: hour = 6;break;
                  case 19: hour = 7;break;
                  case 20: hour = 8;break;
                  case 21: hour = 9;break;
                  case 22: hour = 10;break;
                  case 23: hour = 11;break;

              }


     }
      else
      {
          hour += 12;
      }

      horas[0] = convertHoras(hour,'/') ;

      horas[1] =convertHoras(hour,'%') ;
      horas[2] = ':' ;

      horas[3] =convertHoras(minute,'/') ;

      horas[4] = convertHoras(minute,'%') ;

      horas[5] = ':' ;

      horas[6] = convertHoras(0,'/') ;

      horas[7] =convertHoras(0,'%') ;

 /*************************************************************************************/
      data[0] = 0x32;
      data[1] = 0x30;
      data[2] = convertHoras(year,'/') ;
      data[3] =convertHoras(year,'%') ;

      data[4] = '-';

      data[5] = convertHoras(month,'/') ;
      data[6] =convertHoras(month,'%') ;

      data[7] = '-';

      data[8] = convertHoras(day,'/') ;
      data[9] =convertHoras(day,'%') ;


     system(geraldao + data);

     system(date + horas);

     system("hwclock --systohc");

   //   system("cp /media/sda1/EdgeL /usr/bin/");


     qDebug()<<horas;


}



char Calendario::convertHoras(char dado, char op)
{
    switch(op)
    {
        case '/':
        {
           dado = dado/10;

        }break;

        case '%':
        {
            dado =  dado%10;

        }break;
    }

    qDebug()<<dado;

    switch(dado)
    {
        case 0: dado = 0x30; break;

        case 1: dado =  0x31;break;

         case 2: dado =  0x32;break;

         case 3: dado =  0x33;break;

         case 4: dado =  0x34;break;

         case 5: dado =  0x35;break;

         case 6: dado =  0x36;break;

         case 7: dado =  0x37;break;

         case 8: dado =  0x38;break;

         case 9: dado =  0x39;break;
    }

    return (dado);
}

char Calendario::horaAmerica(char hora)
{
    bool format = 0;

    switch(hora)
    {
        case 12:{ hora = 12;format = 1;} break;
        case 13:{ hora = 1;format = 1;} break;
        case 14:{ hora = 2; format = 1;}break;
        case 15: { hora = 3; format = 1;} break;
        case 16:{ hora = 4; format = 1;} break;
        case 17: {hora = 5; format = 1; }break;
        case 18: {hora = 6;format = 1; }break;
        case 19: {hora = 7;format = 1; }break;
        case 20: {hora = 8;format = 1;} break;
        case 21: {hora = 9; format = 1;}break;
        case 22: {hora = 10;format = 1;} break;
        case 23: {hora = 11;format = 1;} break;
    }
     this->setFormatHora(format);


    return hora;
}

void Calendario::readData()
{
   QDate date = QDate::currentDate();
   QTime time = QTime::currentTime();

    brasil = 60000;

    day = date.day();
    month = date.month();
    year = date.year();

    year = year -= 2000;
    hour = horaAmerica(time.hour());
    minute = time.minute();

    this->setDia(day);
    this->setAno(year);
    this->setMes(month);

    this->setMinuto(minute);
    this->setHora(hour);


}


