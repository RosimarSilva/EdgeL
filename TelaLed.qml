import QtQuick 2.0

Item {
    property int pont: 0
    property bool standBy_: false
    property bool vent: false
    property int tela: 2
    property int horasLamp: 0
    property int temperatura: 0
     property int auxPont: 0


    Image {
        id: telaLed
        x: 35
        y: 20
        source: "Telas/19_principal.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onClicked: {}
//recebe do c++ onumeros de horas da lampada
            Connections{  //enquanto não há white balance feito fica piscando
                    target: serial
                onHourChanged:{
                    horasLamp = serial.horasLampada;
               }
            }


 //recebe do c++ o comando para desligar o sistema
             Connections{
                     target: gpio
                     onDesliga:{
                         imagecentral.state = "Indicador0"
                         timeezero.start()
                         pont = 0;
                         serial.setConthora(pont)
                        ventMin.start()
                         serial.displayBrightness(100)
                         serial.writeFlash()
                         root.state = "PowerOff"
                    }
             }


//escrira de horas de lâmpada
            Text {
                x: 505
                y: 16
                horizontalAlignment:  Text.AlignVCenter
                font.pointSize: 22
                color: "white"
                text:+ serial.horasLampada;
            }

///botao connect
        Image {
            id: connect
            x: 8
            y: 362
            fillMode: Image.PreserveAspectFit
            source: "imagesInit/connectOff.png"
        }

        Image {
            id: imagecentral
            x: 199
            y: 69
            source: "IndicadoresCentrais/indi00.png"
            fillMode: Image.PreserveAspectFit
//máquina de estados das figuras indicadoras de intensidade
                    states: [
                        State {
                            name: "Indicador0"
                        },
                        State {
                            name: "Indicador1"
                        },

                        State {
                            name: "Indicador2"
                        },
                        State {
                            name: "Indicador3"
                        },

                        State {
                            name: "Indicador4"
                        },
                        State {
                            name: "Indicador5"
                        },

                        State {
                            name: "Indicador6"
                        },
                        State {
                            name: "Indicador7"
                        },

                        State {
                            name: "Indicador8"
                        },
                        State {
                            name: "Indicador9"
                        },
                        State {
                            name: "Indicador10"
                        }

                    ]
 // imagens das figuras da porcentagem, do led
                    Image {
                        id: indi0

                        source: "IndicadoresCentrais/indi00.png"
                        visible: imagecentral.state == "Indicador0"
                    }

                    Image {
                        id: indi1

                        source: "IndicadoresCentrais/indi10.png"
                        visible: imagecentral.state == "Indicador1"
                    }

                    Image {
                        id: indi2

                        source: "IndicadoresCentrais/indi20.png"
                        visible: imagecentral.state == "Indicador2"
                    }
                    Image {
                        id: indi3

                        source: "IndicadoresCentrais/indi30.png"
                        visible: imagecentral.state == "Indicador3"
                    }

                    Image {
                        id: indi4

                        source: "IndicadoresCentrais/indi40.png"
                        visible: imagecentral.state == "Indicador4"
                    }

                    Image {
                        id: indi5

                        source: "IndicadoresCentrais/indi50.png"
                        visible: imagecentral.state == "Indicador5"
                    }

                    Image {
                        id: indi6

                        source: "IndicadoresCentrais/indi60.png"
                        visible: imagecentral.state == "Indicador6"
                    }

                    Image {
                        id: indi7

                        source: "IndicadoresCentrais/indi70.png"
                        visible: imagecentral.state == "Indicador7"
                    }

                    Image {
                        id: indi8

                        source: "IndicadoresCentrais/indi80.png"
                        visible: imagecentral.state == "Indicador8"
                    }

                    Image {
                        id: indi9

                        source: "IndicadoresCentrais/indi90.png"
                        visible: imagecentral.state == "Indicador9"
                    }

                    Image {
                        id: indi10
                       source: "IndicadoresCentrais/indi100.png"
                        visible: imagecentral.state == "Indicador10"
                    }

        }
//figura menu no display
        Image {
            id: menu
            x: 651
            y: 5
            source: "Icones/BotaoMenu.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.rightMargin: 0
                anchors.bottomMargin: -11
                anchors.leftMargin: 0
                anchors.topMargin: 11
                anchors.fill: parent
                onPressed: {parent.scale = 0.97;}
                onReleased: {
                    root.state = "Menu"
                    parent.scale = 1.0;
                    serial.leSerial();
                }
            }
        }
//botao - do display
        Image {
            id: minus
            x: 40
            y: 120
            source: "IconesLed/Minus.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.90;}
                onReleased: {
                    pont --;
                    setLuminous() // ajusta a intensidade do led
                    parent.scale = 1.0;
                }
            }
        }
//botao + do display
        Image {
            id: plus
            x: 468
            y: 120
            source: "IconesLed/Plus.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.90;}
                onReleased: {
                  pont ++;
                  setLuminous() // ajusta a intensidade do led
                  parent.scale = 1.0;
                }
            }
        }

//botao do stanby
        Image {
            id: standBy
            x: 654
            y: 130
            source: "IndicadoresCentrais/StandByBranco.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.90;}
                onReleased: {
                    if(!standBy_)
                    {
                        standBy_ = true;
                        standBy.state = "StandByOn"
                        imagecentral.state = "Indicador00"
                        serial.setIntensidadeLed(1);
                    }
                    else
                    {
                         standBy.state = "StandByOff"
                         standBy_ =false;
                         setLuminous() // ajusta a intensidade do ledd
                    }
                    parent.scale = 1.0;
                }

                states: [
                    State {
                        name: "StandByOn"
                    },
                    State {
                        name: "StandByOff"
                    }
                ]

                Image {
                    id: standBOn
                    source: "IndicadoresCentrais/StandByVerde.png"
                     visible:standBy.state == "StandByOn"
                }

                Image {
                    id: standBOff
                    source:  "IndicadoresCentrais/StandByBranco.png"
                     visible:standBy.state == "StandByOff"
                }
                }
            }
        }

    // desenha a porcentagem atual no display e envia o comando para o módulo do led a porcentagem correspondente
//diminui a intensidade o led para nada
        Timer{
            id:timeezero
            interval: 100
            repeat:false
            running: false

            onTriggered: {
            serial.setIntensidadeLed(1);
           }
        }


//coloca o ventilador em potência máxima
            Timer{
                id:ventMax
                interval:300
                repeat:false
                running: false
                onTriggered: {
                    serial.openSerial("ttymxc0",false);
                    serial.writeBytes([0xA5,0x07,0x09,0x64,0x00,0x93,0xaf],0);
           }
        }
//coloca o ventilador em potência minima
            Timer{
                id:ventMin
                interval:300
                repeat:false
                running: false
                onTriggered: {
                    serial.openSerial("ttymxc0",false);
                    serial.writeBytes([0xA5,0x07,0x09,0x0A,0x00,0xbf,0xcf],0);
                }
            }
    }


//função que altera as fuguras no display e envia comandos para o módulo
         function setLuminous(){
                 if(standBy_)
                 {
                    standBy_= false
                    standBy.state = "StandByOff"
                 }
                if(pont >10) pont = 10;
                if(pont <= 0) pont = 0;

                 serial.openSerial("ttymxc0",false);
                switch(pont)
                {
                   case 0:
                        imagecentral.state = "Indicador0"
                        serial.writeBytes([0xA5,0x07,0x06,0x0A,0x00,0xbf,0xcf],0);
                        serial.setConthora(pont)
                        timeezero.start();
                      break
                    case 1:
                        imagecentral.state = "Indicador1"
                        serial.writeBytes([0xA5,0x07,0x06,0x14,0x00,0x86,0x6c],0);
                        serial.setConthora(pont)

                     break
                   case 2:
                        imagecentral.state = "Indicador2"
                       serial.writeBytes([0xA5,0x07,0x06,0x32,0x00,0x9c,0x0c],0);
                    break
                   case 3:
                        imagecentral.state = "Indicador3"
                         serial.writeBytes([0xA5,0x07,0x06,0x50,0x00,0xb5,0x6c],0);
                    break
                   case 4:
                        imagecentral.state = "Indicador4"
                        serial.writeBytes([0xA5,0x07,0x06,0x78,0x00,0xab,0x6c],0);
                    break
                   case 5:
                        imagecentral.state = "Indicador5"
                       serial.writeBytes([0xA5,0x07,0x06,0xaa,0x00,0xf7,0xcc],0);
                    break
                   case 6:
                        imagecentral.state = "Indicador6"
                       serial.writeBytes([0xA5,0x07,0x06,0xe6,0x00,0xc3,0x0c],0);
                    break
                   case 7:
                        imagecentral.state = "Indicador7"
                        serial.writeBytes([0xA5,0x07,0x06,0x40,0x01,0x79,0x6c],0);
                    break
                   case 8:
                        imagecentral.state = "Indicador8"
                         serial.writeBytes([0xA5,0x07,0x06,0xcc,0x01,0x1d,0xac],0);
                    break
                   case 9:
                        imagecentral.state = "Indicador9"
                        serial.writeBytes([0xA5,0x07,0x06,0xbc,0x02,0x78,0x6d],0);
                    break
                   case 10:
                        imagecentral.state = "Indicador10"
                        serial.writeBytes([0xA5,0x07,0x06,0xff,0x03,0x88,0x9d],0);
                    break
                }

                auxPont = pont*10;
                serial.setPercent(auxPont)

                if((pont > 0)&&(vent == false))  // coloca ventilador em 100%
                {

                     ventMax.start();
                    vent = true;
                }

                else if ((pont <= 0)&&(vent == true))  //coloca vent em 10%
                {
                   ventMin.start();

                    vent = false;
                }
         }


}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
