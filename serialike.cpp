#include "serialike.h"



SerialIke::SerialIke(QObject *parent): QObject(parent)
{
    port = new QSerialPort();
    out_ = new QByteArray();
    t4 = new QTimer;
    t0 = new QTimer;
   // THread = new SerialIke;

    connect(t4,&QTimer::timeout,this,&SerialIke::horasLamp);
    t4->start(60000);

    connect(t0,&QTimer::timeout,this,&SerialIke::tempp);
    t0->start(5000);

    connect(port, SIGNAL(readyRead()),this, SLOT(readBytes()));//lê os dados que chega da serial

//    THread->run();

    init();
}

SerialIke::~SerialIke()
{
    delete port;
    delete out_;
    delete t4;
    delete t0;
}


bool SerialIke::openSerial(const QString &name,bool readWrite)  //abrea serial
{
    if(readWrite == true)
    {
         port->close();
         port->setPortName(name);
        open_ = port->open(QIODevice::ReadWrite);
   }
    else {
        port->close();
        port->setPortName(name);
       open_ = port->open(QIODevice::WriteOnly);
   }

    return open_;
}

bool SerialIke::isopen()  //fala se a serial esta aberta ou não
{
    return open_;
}

bool SerialIke::paramSet(const QString &name, const QString &value)
{
    if (!isopen()) return false;

    if (name == "baud")        return port->setBaudRate(value.toInt());
    else if (name == "bits")   return port->setDataBits((QSerialPort::DataBits)value.toInt());
    else if (name == "parity") return port->setParity(
        value.startsWith("n") ? QSerialPort::NoParity :
        value.startsWith("e") ? QSerialPort::EvenParity :
        value.startsWith("o") ? QSerialPort::OddParity :
        value.startsWith("s") ? QSerialPort::SpaceParity :
        value.startsWith("m") ? QSerialPort::MarkParity :
        QSerialPort::UnknownParity
    );
    else if (name == "stops") return port->setStopBits((QSerialPort::StopBits)value.toInt());
    else if (name == "rts")   return port->setRequestToSend((bool)value.toInt());
    else if (name == "dtr")   return port->setDataTerminalReady((bool)value.toInt());
    else return false;
}
// recebe o comando e eo envia
int SerialIke::writeBytes(const QList<int> &l, const int resp)
{
     QSerialPort serial;
     QByteArray buf;

    if (isopen()){
        if (!l.size()) return true;
        out_->resize(l.size());
        for (int i=0; i<l.size(); i++) out_->data()[i] = l[i];
    }

    comando = resp;

    port->write(*out_) > 0;

    port->clearError();

    return true;
}


void SerialIke::displayOff()
{
    QFile pathBacklightPower("/sys/class/graphics/fb0/blank");
    if(pathBacklightPower.exists() && pathBacklightPower.open(QIODevice::WriteOnly | QIODevice::Text)) {
        pathBacklightPower.write("4");
        pathBacklightPower.close();
    }
}

void SerialIke::displayOn()
{
    QFile pathBacklightPower("/sys/class/graphics/fb0/blank");
    if(pathBacklightPower.exists() && pathBacklightPower.open(QIODevice::WriteOnly | QIODevice::Text)) {
        pathBacklightPower.write("0");
        pathBacklightPower.close();
    }
}

void SerialIke::displayBrightness(const int luz)
{
    QFile pathBacklightBrightness("/sys/class/backlight/pwm-backlight.0/brightness");
    if(pathBacklightBrightness.exists() && pathBacklightBrightness.open(QIODevice::WriteOnly| QIODevice::Text)) {

        pathBacklightBrightness.write(QByteArray::number(luz));
        pathBacklightBrightness.close();
    }
}

void SerialIke::activeTimerSlider()
{
   emit sliderTimer();
}
//desliga o equipamento
void SerialIke::powerOfff()
{
   // qDebug() << Q_FUNC_INFO;

#ifdef Q_PROCESSOR_ARM
    QProcess::startDetached("poweroff");
#endif

#ifdef Q_PROCESSOR_X86
    qInfo() << "Recurso não suportado ou desabilitado";
#endif
}



void SerialIke::init()
{

    openSerial("ttymxc0",true);

    port->setPortName("ttymxc0");
    port->setBaudRate(QSerialPort::Baud19200);
    port->setDataBits(QSerialPort::Data8);
    port->setParity(QSerialPort::NoParity);
    port->setStopBits(QSerialPort::OneStop);
    port->setFlowControl(QSerialPort::NoFlowControl);

    qDebug("Usb da camera configurada com sucesso");


   if(isopen())
   {
      paramSet("baud", "19200");
      paramSet("bits", "8");
      paramSet("parity", "n");
       paramSet("stops", "1");

        paramSet("dtr", "1");
      paramSet("rts", "1");
    }


       readFlash();

}


//lê os dados de calibração
void SerialIke::readFlash()
{
    //QFile range;

      horaslampada = 0;
      serialNumero = 0;
      h_hour = 0x30;

    escrita.setFileName("/root/cal.txt"); // caminho de onde está salvo os dados de calibração
    if(!escrita.open(QIODevice::ReadWrite))
    {
        qDebug("Falaha ao abrir o arquivo");

        return;
    }

    dadoSalvo = escrita.readAll();

   z = dadoSalvo[0];
   u = dadoSalvo[1];
   d = dadoSalvo[2];
   t = dadoSalvo[3];
   q = dadoSalvo[4];
   h_hour = dadoSalvo[5];
   minutoLampada = dadoSalvo[6];
   ze = dadoSalvo[7];
   um = dadoSalvo[8];
   doi = dadoSalvo[9];
   tre = dadoSalvo[10];
   qu = dadoSalvo[11];
   cin = dadoSalvo[12];

    for(int i = 0;i< 5;i++)
    {
      dadoSalvo[i] = ascII(dadoSalvo[i]);
       horaslampada = (horaslampada +dadoSalvo[i]);
      if(i<h_hour-1) horaslampada = (horaslampada*10);
    }


    for(int i = 7;i<= 12;i++)
    {
       dadoSalvo[i] = ascII(dadoSalvo[i]);
       serialNumero = (serialNumero +dadoSalvo[i]);
      if(i<=11) serialNumero = (serialNumero*10);
    }

   escrita.close();
}

char SerialIke::ascII(char dado)
{
    switch(dado)
     {
        case 0x30: dado = 0;break;
        case 0x31: dado = 1;break;
        case 0x32: dado = 2;break;
        case 0x33: dado = 3;break;
        case 0x34: dado = 4;break;
        case 0x35: {dado = 5;}break;
        case 0x36:{ dado = 6;}break;
        case 0x37: dado = 7;break;
        case 0x38: dado = 8;break;
        case 0x39: dado = 9;break;
    }
    return (dado);
}

char SerialIke::numToAscII(char dado)
{
    char zero = 0x30,uma = 0x31,dois = 0x32, tres = 0x33,quatro = 0x34, cinco = 0x35, seis = 0x36, sete = 0x37, oito = 0x38,nove = 0x39;
    switch(dado)
     {
        case 0: dado = zero;break;
        case 1: dado = uma;break;
        case 2: dado = dois;break;
        case 3: dado = tres;break;
        case 4: dado = quatro;break;
        case 5: {dado = cinco;}break;
        case 6:{ dado = seis;}break;
        case 7: dado = sete;break;
        case 8: dado = oito;break;
        case 9: dado = nove;break;
    }
    return (dado);
}

void SerialIke::run()
{
    qDebug("vai brasil");
}


//escreve os dados de calibração
void SerialIke::writeFlash()
{
    dadoSalvo[0] = z;
    dadoSalvo[1] = u;
    dadoSalvo[2] =  d;
    dadoSalvo[3] =  t;
    dadoSalvo[4] =  q;
    dadoSalvo[5] =  h_hour;
    dadoSalvo[6] =  minutoLampada;
    dadoSalvo[7] = ze;
    dadoSalvo[8] = um;
    dadoSalvo[9] =  doi;
    dadoSalvo[10] =  tre;
    dadoSalvo[11] =  qu;
    dadoSalvo[12] =  cin;

     escrita.setFileName("/root/cal.txt"); // caminho de onde está salvo os dados de calibração
     //escrita.fileName();
    if(!escrita.open(QIODevice::ReadWrite))
    {
        qDebug("Falaha ao abrir o arquivo");

        return;
    }
    // qDebug("lendo o arquivo");

  escrita.write(dadoSalvo);
   escrita.flush();
    escrita.close();

}
//Lê byte que chegam na serial
QList<int> SerialIke::readBytes()
   {
      QList<int> *l = new QList<int>();
       QByteArray buf;

   while(port->waitForReadyRead(200)) // aguarda um tempo para receber a resposta
         {
         if (port->bytesAvailable())
             {
                buf.append(port->readAll().simplified());
                 for (int i=0; i<buf.size(); i++)l->append(buf.at(i));
             }
         }
       temp = buf[4];
       if(temp > 90) temp = 35;
      setTempLed(temp);
      port->clear();
      port->close();

     return *l;
   }

//seta a intensidade do led
   void SerialIke::setIntensidadeLed(char sinal)
   {
       int tamanho;

       if(sinal == 2){
           intensidadeLed ++;
          // qDebug("sinal +");
           if(intensidadeLed > 10) {intensidadeLed = 10; return;}
       }
       if(sinal == 1){
           intensidadeLed --;
           if(intensidadeLed <= 0) {intensidadeLed = 0; }
       }
       ikeenv[0] = 0xA5; ikeenv[1] = 0x07; ikeenv[2] = 0x06; ikeenv[4] = 0x00;

        switch(intensidadeLed)
        {
           case 0:{ikeenv[3] = 0x05; ikeenv[5] = 0x8A;  ikeenv[6] = 0x3C;comando = 0;tamanho = 6; }break;

            case 1:{ikeenv[3] = 0x14; ikeenv[5] = 0x86;  ikeenv[6] = 0x6c; comando = 0;tamanho = 6;}break;//[0xA5,0x07,0x06,0x14,0x00,0x86,0x6c

            case 2: { ikeenv[3] = 0x32; ikeenv[5] = 0x9C;  ikeenv[6] = 0x0C; comando = 0; tamanho = 6;}break;

            case 3:{ikeenv[3] = 0x50; ikeenv[5] = 0xB5;  ikeenv[6] = 0x6C; comando = 0; tamanho = 6;}break;

           case 4: {ikeenv[3] = 0x78; ikeenv[5] = 0xAB;  ikeenv[6] = 0x6C; comando = 0;tamanho = 6;}break;

            case 5: {ikeenv[3] = 0xAA; ikeenv[5] = 0xF7;  ikeenv[6] = 0xcC; comando = 0;tamanho = 6;}break;//0xaa,0x00,0xf7,0xcc

             case 6: {ikeenv[3] = 0xE6; ikeenv[5] = 0xC3;  ikeenv[6] = 0x0C; comando = 0;tamanho = 6;}break;//0xe6,0x00,0xc3,0x0c

             case 7: {ikeenv[3] = 0xE6; ikeenv[5] = 0x79;  ikeenv[6] = 0x6C; comando = 0;tamanho = 6;}break;//0xe6,0x00,0x79,0x6c

             case 8: {ikeenv[3] = 0xCC; ikeenv[4] = 0x01; ikeenv[5] = 0x1D;  ikeenv[6] = 0xAC; comando = 0;tamanho = 6;}break;//0xcc,0x01,0x1d,0xac

             case 9: {ikeenv[3] = 0xBC; ikeenv[4] = 0x02; ikeenv[5] = 0x78;  ikeenv[6] = 0x6D; comando = 0;tamanho = 6;}break;//0xbc,0x02,0x78,0x6d

             case 10: {ikeenv[3] = 0xFF; ikeenv[4] = 0x03; ikeenv[5] = 0x88;  ikeenv[6] = 0x9d; comando = 0;tamanho = 6;}break;//0xff,0x03,0x88,0x9d

        }

         this->openSerial("ttymxc0",false);
       for(int i = 0;i<=tamanho;i++)
        {
           this->writeBytes({ikeenv[i]},comando);
        }

         //    readResp();
   }


/***************************************************************************************************************************/
void SerialIke::setSerialNumber( char number)
{
    switch (number)
       {
       case 1:
       case 2:
       case 3:
       case 4:
       case 5:
       case 6:
       case 7:
       case 8:
       case 9:
       case 0:
       {
          if(contSerialNumber <= 12)
          {
              auxSerial = number;
              serialDig = serialDig*10;
              serialDig = serialDig += auxSerial;

             number = numToAscII(number);
             dadoSalvo[contSerialNumber] = number;
             if(contSerialNumber== 7) ze = number;
             else if(contSerialNumber== 8) um = number;
             else if(contSerialNumber== 9) doi = number;
             else if(contSerialNumber== 10) tre = number;
             else if(contSerialNumber== 11) qu = number;
             else if(contSerialNumber== 12) cin = number;
             contSerialNumber ++;
         }

       } break;


      case 100://tecla ok
      {
           serialNumero = serialDig;
           this->leSerial();
           this->writeFlash();
           contSerialNumber = 7;
           serialDig = 0;
           emit backMenu();
      } break;

         case 99://tecla del
         {
            if(contSerialNumber == 12) {serialDig = serialDig - auxSerial; serialDig = serialDig/10;}

            else if(contSerialNumber == 11)serialDig = serialDig/10;

              else if(contSerialNumber == 10) serialDig = serialDig/10;

            else if(contSerialNumber == 9)serialDig = serialDig/10;

            else if(contSerialNumber == 8) serialDig = 0;


             if(serialDig <= 0)serialDig = 0;
              contSerial --;
             if(contSerialNumber <= 8) contSerialNumber = 7;
         } break;
       }

       this->setNumberSerie(serialDig);
   }
// escreve horas pelo teclado
   void SerialIke::setHorasDgit( char number)
   {
       switch (number)
       {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 0:
          {
             if(contSerial < 5)
             {
                 auxSerial = number;
                 horasDigit = horasDigit*10;
                 horasDigit = horasDigit += auxSerial;
                 number = numToAscII(number);

                 dadoSalvo[contSerial] = number;
                 if(contSerial== 0) z = number;
                 else if(contSerial== 1) u = number;
                 else if(contSerial== 2) d = number;
                 else if(contSerial== 3) t = number;
                 else if(contSerial== 4) q = number;

                 contSerial ++;
                 h_hour = contSerial;

             }

          } break;



         case 100://tecla ok
         {
               horaslampada = horasDigit;
                this->setHorasLamp(horaslampada);
                this->writeFlash();
                contSerial = 0;
                serialDig = 0;
                emit backConf();
                horasDigit = 0;
         } break;

         case 99://tecla del
         {
            if(contSerial == 4) {horasDigit = horasDigit - auxSerial; horasDigit = horasDigit/10;}

            else if(contSerial == 3)horasDigit = horasDigit/10;

              else if(contSerial == 2) horasDigit = horasDigit/10;

            else if(contSerial == 1)horasDigit = horasDigit/10;

            else if(contSerial == 0) serialDig = 0;


             if(serialDig <= 0)serialDig = 0;
              contSerial --;
             if(contSerial < 0) contSerial = 0;
         } break;
       }

       this->setHorasDigitadas(horasDigit);
   }
//escrev o numero de serie no display
   void SerialIke::readNumberSerie(const int value)
   {
       this->myNumberSerie();
       emit serialScreen();
   }

//verifica se a luminosidae esta acima de zero se tiver conta minutos
   void SerialIke::setConthora(bool conta)
   {
       conts = conta;
       if(conta == 1)t0->start(5000);
       else t0->stop();
   }

   void SerialIke::setTempLed(const char temmp)
   {
       if(m_temp != temmp)
       {
           m_temp = temmp;

           emit tempLedChanged();

       }
   }

   void SerialIke::setMin(const char min)
   {

       if(m_min != min)
       {
            m_min = min;

            emit minChanged();
       }
   }

   void SerialIke::setPercent(const char percento)
   {
       if(m_percent != percento)
       {
            m_percent = percento;

            emit percentChanged();
       }
   }

//veriafica se o minuto e a hora mudou
 void SerialIke::horasLamp()
   {
     if(!conts) return;
       minutoLampada++;
      if(minutoLampada < 60) setMin(minutoLampada);
       if(minutoLampada > 59)
       {

          horaslampada++;
          this->calcHoras();
          this->setHorasLamp(horaslampada);
          minutoLampada = 0;
          setMin(minutoLampada);
          writeFlash();
       }
   }
//retorna o numero da serial number
   int SerialIke::myNumberSerie()
   {
    return serialNumero;
   }
//seta o serial number do equipamnto
   void SerialIke::setNumberSerie(const int serial)
   {

       if(m_serial != serial)
       {
           m_serial = serial;

           emit serialChanged();
           m_serial = 0;
       }
   }
//pega o numero de horas digitadas e envia para o qml
   void SerialIke::setHorasDigitadas(const int digit)
   {
       if(m_digit != digit)
       {
           m_digit = digit;

           emit horasDigitada();
       }
   }
//retorna o seral number
   int SerialIke::serialNumber()
   {
       return serialDig;
   }

   int SerialIke::horasDigitadas()
   {
       return horasDigit;
   }

   int SerialIke::tempLed()
   {
       return temp;
   }

   int SerialIke::minutos()
   {
       return minutoLampada;
   }

   int SerialIke::percent()
   {
       return m_percent;
   }
//seta a hora e envia um sinal para atualizar la na interface
 void SerialIke::setHorasLamp(int hour)
{
      m_hour = hour;

      emit hourChanged();
}
//retorna o numero de horas
int SerialIke::horasLampada()
{
    return horaslampada;
}


void SerialIke::calcHoras()
{
    u = 0,d=0,t=0,q=0,z=0;

    if(horaslampada<10)
    {

        z = horaslampada;
        h_hour = 0;
    }
    else if((horaslampada >= 10)&&(horaslampada<= 99))
    {
        z = horaslampada/10;
        u = horaslampada%10;
        h_hour = 1;
    }

    else if((horaslampada >= 100)&&(horaslampada<= 999))
    {
        z = horaslampada/100;
        u = horaslampada/10;
        u = u%10;

        d =  horaslampada%100;
        h_hour = 2;
    }

    else if((horaslampada >= 1000)&&(horaslampada<= 9999))
    {
        z = horaslampada/1000;

        u = horaslampada/100;
        u = u%10;

        d =  horaslampada/10;
        d = d%10;

        t = horaslampada%10;
        h_hour = 3;

    }

    else if((horaslampada > 9999))
    {
        z = horaslampada/1000;
        z = z/10;

        u = horaslampada/1000;
        u = u%10;

        d =  horaslampada/100;
        d = d%10;

        t = horaslampada/10;
        t = t%10;

        q = horaslampada%10;
        h_hour = 4;
    }


}

void SerialIke::tempp()
{
   // t0->stop();
    openSerial("ttymxc0",true);
   writeBytes({0xA5,0x05,0x03,0x22,0xb2},0);
   //setTempLed(temp);
}


 //reseta horas e minutos da lampada
void SerialIke::resetHoras()
{
    horaslampada = 0;
    minutoLampada =0;
    setHorasLamp(horaslampada);
}

void SerialIke::readHoras()
{
    this->setHorasLamp(horaslampada);
}

void SerialIke::leSerial()
{
    this->readNumberSerie(serialNumero);
}






