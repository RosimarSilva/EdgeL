#include "gpio.h"
#include  <QEvent>
#include "gpio.h"


GPIO::GPIO(QObject *parent): QObject(parent),
   m_path_b1("/sys/class/gpio/keypad_pin6/value"),m_path_b2("/sys/class/gpio/keypad_pin8/value"),
   m_path_b3("/sys/class/gpio/keypad_pin7/value"),m_path_b4("/sys/class/gpio/keypad_pin3/value"),
   m_value_b1(0),m_value_b2(0),m_value_b3(0),m_value_b4(0)
{

  gpioExport();

  setDirectionGpioBotao1();
  setDirectionGpioBotao2();
  setDirectionGpioBotao3();


   //timerBotao.start(150);
   //Lê os botoẽs da cabeça a cada 250 mlissegundos
  connect(&timerBotao, &QTimer::timeout, [&](){


     QByteArray gpioValue4;
     QFile gpio4(m_path_b4);

  if (gpio4.open(QIODevice::ReadOnly)) {         // Abre arquivo
      gpioValue4 = gpio4.readAll();// // Le o arquivo e remove
      gpio4.close();                             // Fecha arquivo

      tecla4 = gpioValue4[0]; // lê se há tecla pressionado

      if((tecla4 == 49)&&(Liga == 0))
      {
         liga(); Liga = 1;

      }

     else if((tecla4 == 48)&&(Liga == 1))
     {
        desliga(); Liga = 0;

     }


    }
  });


}

GPIO::~GPIO()
{
   timerBotao.stop();
 // qDebug() << Q_FUNC_INFO;
 //  qDebug("destruido");

}

void GPIO::gpioExport()
{
    QFile gpioExportFile("/sys/class/gpio/export");// exporta todos os pinos i/o
    if(!gpioExportFile.open(QIODevice::Append))
    {
      //  qDebug("Falha ao tentar exportar o gpio");
    }

   // else   qDebug("Sucesso ao exportar");
}

void GPIO::setDirectionGpioLedBotao()
{
    QFile gpiosetDirectionFile("/sys/class/gpio/keypad_pin4/direction");
    if(!gpiosetDirectionFile.open(QIODevice::Append))
    {
    //    qDebug("Falha ao tentar abrir o gpio");
        return;
    }
 //    else   qDebug("Sucesso ao abrir");

    gpiosetDirectionFile.write("out");
    gpiosetDirectionFile.close();
}

void GPIO::setDirectionGpioBotao1()
{
    QFile gpiosetDirectionFile("/sys/class/gpio/keypad_pin6/direction");
    if(!gpiosetDirectionFile.open(QIODevice::Append))
    {
      //  qDebug("Falha ao tentar abrir a entrada do gpio");
        return;
    }
   //  else   qDebug("Sucesso ao abrir a entrada");
    gpiosetDirectionFile.write("in");
    gpiosetDirectionFile.close();

}

void GPIO::setDirectionGpioBotao2()
{
    QFile gpiosetDirectionFile("/sys/class/gpio/keypad_pin8/direction");
    if(!gpiosetDirectionFile.open(QIODevice::Append))
    {
      //  qDebug("Falha ao tentar abrir a entrada do gpio 8");
        return;
    }
   //  else   qDebug("Sucesso ao abrir a entrada");
    gpiosetDirectionFile.write("in");
    gpiosetDirectionFile.close();
}

void GPIO::setDirectionGpioBotao3()
{
    QFile gpiosetDirectionFile("/sys/class/gpio/keypad_pin7/direction");
    if(!gpiosetDirectionFile.open(QIODevice::Append))
    {
    //    qDebug("Falha ao tentar abrir a entrada do gpio 7");
        return;
    }
  //   else   qDebug("Sucesso ao abrir a entrada 7");
    gpiosetDirectionFile.write("in");
    gpiosetDirectionFile.close();
}

void GPIO::setDirectionGpioIke()//define a direção do pino da ikegami
{
    QFile gpiosetDirectionFile("/sys/class/gpio/keypad_pin3/direction");
    if(!gpiosetDirectionFile.open(QIODevice::Append))
    {
        qDebug("Falha ao tentar abrir o gpio");
        return;
    }
    else   qDebug("Sucesso ao abrir");

    gpiosetDirectionFile.write("in");
    gpiosetDirectionFile.close();
}

/*void GPIO::PutValPin3(int out)// aciona o rele que ligará a ikegami
{
    QFile gpioSetValue("/sys/class/gpio/keypad_pin3/value");
    if(!gpioSetValue.open(QIODevice::Append))
    {
     //   qDebug("Falha ao tentar setar o gpio");
        return;
    }
  //   else   qDebug("Sucesso ao setar");

    if(out == 0)gpioSetValue.write("0");
    else gpioSetValue.write("1");
    gpioSetValue.close();
}*/

void GPIO::PutvalPin4(int out)// aciona o pino do botão liga desl
{
    QFile gpioSetValue("/sys/class/gpio/keypad_pin4/value");
    if(!gpioSetValue.open(QIODevice::Append))
    {
     //   qDebug("Falha ao tentar setar o gpio");
        return;
    }
   //  else   qDebug("Sucesso ao setar");

    if(out == 0)gpioSetValue.write("0");
    else gpioSetValue.write("1");
    gpioSetValue.close();
}

void GPIO::powerOff()
{
    emit desliga();
}

void GPIO::startCounter(void)
{
    timerBotao.start(150);
}

void GPIO::powerOn()
{
    emit liga();
}


/*void GPIO::readBotao1()
{
 QByteArray gpioValue;
int botao1;
   char data;
    QFile gpio(QString("/sys/class/gpio/keypad_pin6/value"));
    if(!gpio.open(QIODevice::ReadOnly))
    {
        qCritical() << "falha ao abrir"<< gpio.fileName();
        return;
    }

    gpioValue = gpio.readAll().simplified();;

    tecla = gpioValue[0];

    gpio.close();

    if(tecla == 49)
    {
       botao1 = 0;
    }else {
        botao1 = 1;

        if(tela == 2)
        {
           this-> setLuminousMenos();
        }
    }
}

void GPIO::readBotao2()
{
    QByteArray gpioValue2;
   int botao2;
      char data;
       QFile gpio2(QString("/sys/class/gpio/keypad_pin8/value"));
       if(!gpio2.open(QIODevice::ReadOnly))
       {
           qCritical() << "falha ao abrir"<< gpio2.fileName();
           return;
       }

       gpioValue2 = gpio2.readAll().simplified();

       tecla2 = gpioValue2[0];

       gpio2.close();

       if(tecla2 == 49)
       {
          botao2 = 0;
       }else {
           botao2 = 1;
           if(tela == 1)
           {
              this->setWiteBalnce();
           }
           else if(tela == 2){
           this-> changeLuminousMais();
           }
       }

}

/*void GPIO::readBotao3()
{
    QByteArray gpioValue3;
   int botao3;
      char data;
       QFile gpio3(QString("/sys/class/gpio/keypad_pin7/value"));
       if(!gpio3.open(QIODevice::ReadOnly))
       {
           qCritical() << "falha ao abrir"<< gpio3.fileName();
           return;
       }

       gpioValue3 = gpio3.readAll().simplified();

       tecla3 = gpioValue3[0];

       gpio3.close();

       if(tecla3 == 49)
       {
          botao3 = 0;
       }else {
           botao3 = 1;
           if(tela == 1)
           {
              this->setWiteBalnce();
           }
           else if(tela == 2){
           this-> changeLuminousMais();
           }
       }
}*/
