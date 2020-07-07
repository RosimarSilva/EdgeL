import QtQuick 2.0

Item {
    Image {

        id: telaInit
        x: 40
        y: 20
        fillMode: Image.PreserveAspectFit
        source: "imagesInit/loading_1.bmp"



        states: [
            State {
                name: "Init1"
             },
            State {
                name: "Init2"
             },
            State {
                name: "Init3"
             },
            State {
                name: "Init4"
             },
            State {
                name: "Init5"
             },
            State {
                name: "Init6"
             },
            State {
                name: "Init7"
             },
            State {
                name: "Init8"
             },
            State {
                name: "Init9"
             },
            State {
                name: "Init10"
             }
        ]
        Image {
            id: init1
            source: "imagesInit/loading_1.bmp"
            visible: telaInit.state == "Init1"
        }
        Image {
            id: init2
            source: "imagesInit/loading_2.bmp"
            visible: telaInit.state == "Init2"
        }
        Image {
            id: init3
            source: "imagesInit/loading_3.bmp"
            visible: telaInit.state == "Init3"
        }
        Image {
            id: init4
            source: "imagesInit/loading_4.bmp"
            visible: telaInit.state == "Init4"
        }
        Image {
            id: init5
            source: "imagesInit/loading_5.bmp"
            visible: telaInit.state == "Init5"
        }
        Image {
            id: init6
            source: "imagesInit/loading_6.bmp"
            visible: telaInit.state == "Init6"
        }
        Image {
            id: init7
            source: "imagesInit/loading_7.bmp"
            visible: telaInit.state == "Init7"
        }
        Image {
            id: init8
            source: "imagesInit/loading_8.bmp"
            visible: telaInit.state == "Init8"
        }
        Image {
            id: init9
            source: "imagesInit/loading_9.bmp"
            visible: telaInit.state == "Init9"
        }
        Image {
            id: init10
            source: "imagesInit/loading_10.bmp"
            visible: telaInit.state == "Init10"
        }


Connections{
    target: inicia
    onInit_2:
    {
       telaInit.state = "Init2"
       serial.openSerial("ttymxc0",false)
      // serial.writeBytes([0xA5,0x06,0x0a,0x00,0xc4,0x49],1);// habilita o drive do led
       inicia.setTime();
       apagaLEd.start();
    }
}

 Timer
 {
     id:apagaLEd
     interval:1
     repeat: false
     running: false
     onTriggered:
      {
         serial.openSerial("ttymxc0",false)
         serial.setIntensidadeLed(1);
      }
 }


Connections{
    target: inicia
     onInit_3:
     {
        telaInit.state = "Init3"
        //serial.readFlash();

        serial.openSerial("ttymxc0",false);
        serial.writeBytes([0xA5,0x07,0x09,0x0A,0x00,0xbf,0xcf],0);
        inicia.setTime4();

     }
}

Connections{
    target: inicia
    onInit_4:
    {
      telaInit.state = "Init4"
        //serial.readFlash();
      inicia.setTime5();
        serial.displayBrightness(100)
    }
 } }

Connections{
    target: inicia
    onInit_5:
     {
         telaInit.state = "Init5"
         inicia.setTime6();
         serial.openSerial("ttymxc0",false);
         serial.writeBytes([0xA5,0x07,0x09,0x0A,0x00,0xbf,0xcf],0);
     }
  }


Connections{
   target: inicia
     onInit_6:
    {
         telaInit.state = "Init6"
         calendario_.readData()
        inicia.setTime7();
     }
}

Connections{
   target: inicia
     onInit_7:
    {
         telaInit.state = "Init7"
         inicia.setTime8();
          calendario_.setFormatAmPm()
    }
}
Connections{
   target: inicia
     onInit_8:
    {
         telaInit.state = "Init8"
         inicia.setTime9();

    }
}
Connections{
   target: inicia
     onInit_9:
    {
         telaInit.state = "Init9"
         inicia.setTime10();
     }
}

Connections
{
   target: inicia
     onInit_10:
    {
        serial.setConthora(0)
       //  gpio.powerOff()
         gpio.startCounter()
    }
}

}
