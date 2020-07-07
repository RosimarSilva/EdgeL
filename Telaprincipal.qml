import QtQuick 2.0

import AstusFonte 1.0

Item {
    property int piscWhite: 1
    property int zomm: 0
    property int  pul: 0
    property int  ponta: 0
     property int piscWhiteNeg: 1
    //tecla da tela principal ganho


    Image {
        id: ganho
        x: 35
        y: 20
        source: "Telas/telaPrincipalCamera.bmp"
        fillMode: Image.PreserveAspectFit


        Image {
            id: whitebalance
            x: 208
            y: 87
            source: "Icones/white1.png"
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent

                onPressed: { parent.scale = 0.95; }
               onReleased: {
                   serial.setComandoIke(1); // envia comando de white balance
                  // serial.gpioExport();

                 parent.scale = 1.0;
               }

            }

            states: [
                State {
                    name: "PiscVerde"
               },
                State {
                    name: "Piscpreto"
               },
                State {
                    name: "PisOk"
               }

            ]

           Image {
                id:pscverde
                source: "Icones/white1.png"
                visible:whitebalance.state == "PiscVerde"
            }
            Image {
                id:pscpreto
                source: "Icones/white0.png"
                visible:whitebalance.state == "Piscpreto"
            }

            Image {
                id:pscOk
                source: "Icones/white2.png"
                visible:whitebalance.state == "PisOk"
            }

            Connections{  //manda desligar ventilador e led se estiver ligado
                target: gpio
                onPowerOff:{
                   // pont = 0;

                    timerluz.start();
                }
            }
            Timer{
                id:timerluz
                interval: 100
                repeat:false
               running: false
               onTriggered: {
                  serial.setIntensidadeLed(1); //coloca led em baixa
                   timervent.start();
               }
           }

            Timer{
                id:timervent
                interval: 100
                repeat:false
               running: false
               onTriggered: {
                   serial.writeBytes([0xA5,0x07,0x09,0x0A,0x00,0xbf,0xcf],0);//coloca ventilador em zero
                   timerOff.start();
               }
           }

            Timer{
                id:timerOff
                interval: 100
                repeat:false
               running: false
               onTriggered: {
                   serial.powerOfff();

               }
           }

            Connections{  //enquanto não há white balance feito fica piscando

                target: gpio
                onChangeWhiteBalance:{

                    serial.setComandoIke(1); // envia comando de white balance
                }
            }

            Connections{  //enquanto não há white balance feito fica piscando

                target: serial
                onPiscWhiteBlance:{

                    piscWhite++

                    if(piscWhite >1)piscWhite=0;

                   if(piscWhite) whitebalance.state = "PiscVerde"

                   else whitebalance.state = "Piscpreto"
                }
            }
            Connections{  //enquanto não há white balance feito fica piscando

                target: gpio
                onChangeTelaLed:{
                    root.state = "TelaLed"
                    gpio.setTela(2);
                    gpio.setPercentLed(0);
                }
            }
        }
        //vai para a tela de ajuste do led
           Image {
               id: led
               x: 503
               y: 7
               source: "Icones/Lamp.png"
               fillMode: Image.PreserveAspectFit
               MouseArea{
                   anchors.rightMargin: 0
                   anchors.bottomMargin: -21
                   anchors.leftMargin: 0
                   anchors.topMargin: 21
                   anchors.fill: parent
               onPressed: { parent.scale = 0.95; }
               onReleased: {
                   //  serial.setComandoIke(1); // envia comando de white balance
                   root.state = "TelaLed"
                   gpio.setTela(2);
                   gpio.setPercentLed(1);
                  parent.scale = 1.0;

               }
               }

           }
           //botao enhancement

         Timer{
             id:timerenhance
             interval: 200
             repeat:false
            running: false

           onTriggered: {
               serial.mensagens(5,0);
            }
        }

        Timer{
          id:timerClearEnhance
          interval: 4000
          repeat:false
          running: false

           onTriggered: {
             //APAGA O QUE ESTIVER ESCRITO NO ENHANCEMENT
             serial.mensagens(1000,0);
          }
      }


        Image {
            id: enhancement
            x: 44
            y: 96
            source: "Icones/Enhancehigh.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed:{parent.scale = 0.95;}
                onReleased:
                {
                    parent.scale = 1.0;

                    serial.setComandoIke(5);

                    timerenhance.start();
                   timerClearEnhance.start();
                }
            }
 //estados do enhnacement
            states: [
               State {
                   name: "High"
               },

               State {
                   name: "Med"
               },
               State {
                   name: "Low"
               },
               State {
                    name: "Off"
               }
             ]

            Image {
               id:alto
               source: "Icones/Enhancehigh.png"
               visible:enhancement.state == "High"
            }

            Image {
               id:medio
               source: "Icones/Enhancemed.png"
               visible:enhancement.state == "Med"
            }

            Image {
               id:baixo
               source: "Icones/EnhanceLow.png"
               visible:enhancement.state == "Low"
            }

            Image {
               id:desligado
               source: "Icones/EnhanceOff.png"
               visible:enhancement.state == "Off"
            }
          }
        Connections{  //enquanto não há white balance feito fica piscando
                target: serial
            onChangeEnhanceHigh:{
                enhancement.state =  "High"
             }
        }

        Connections{  //enquanto não há white balance feito fica piscando
                target: serial
            onChangeEnhanceMed:{
                enhancement.state =  "Med"
          }
        }

        Connections{  //enquanto não há white balance feito fica piscando
                target: serial
            onChangeEnhanceLow:{
                enhancement.state = "Low"
            }
        }

        Connections{  //enquanto não há white balance feito fica piscando
                target: serial
            onChangeEnhanceOff:{
                enhancement.state = "Off"
             }
        }

        Connections{
           target: serial
             onChangeGanhoLow:
            {
              gain.state =  "Zero"
            }
        }

        Connections{
           target: serial
             onChangeGanhoMed:
            {
              gain.state =   "One"
            }
        }

        Connections{
           target: serial
             onChangeGanhoHig:
            {
              gain.state =  "Two"
            }
        }

        Connections{  //recebe o comando do botão da cabeça
                target: gpio
            onChangeEnhance:{
                serial.setComandoIke(5);
                 timerenhance.start();
               timerClearEnhance.start();
            }
        }


        Timer{
            id:timerGanho
            interval: 100
            repeat:false
            running: false

            onTriggered: {
                 serial.mensagens(12,0);
             }
        }

        Connections{  //recebe o comando do botao do zoom da cabeça, a rotina ta escrito ganho mas é zoom

            target: gpio
            onChangeGanho:{
               // serial.setComandoIke(12);
               //  timerGanho.start();

                 serial.setComandoIke(4);//pede zoom pel cabeça

        }
        }

        Connections{  //recebe o comando do botao de zoom da cabeça

            target: serial
            onZoom0:{
                timerzoom.start();
               zoom0.state = "Zoom0";
            }
        }


        Connections{  //recebe o comando do botao de zoom da cabeça

            target: serial
            onZoom1:{
                timerzoom.start();
               zoom0.state = "Zoom1";
            }
        }

        Connections{  //recebe o comando do botao de zoom da cabeça

            target: serial
            onZoom2:{
                timerzoom.start();
               zoom0.state = "Zoom2";
            }
        }

        Connections{  //recebe o comando do botao de zoom da cabeça

            target: serial
            onZoom3:{
                timerzoom.start();
               zoom0.state = "Zoom3";
            }
        }



        Image {
            id: gain
            x: 463
            y: 84
            source: "Icones/Ganho0.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed:{parent.scale = 0.95;}
                onReleased:
                {
                    parent.scale = 1.0;
                    serial.setComandoIke(12);
                     timerGanho.start();
                 }

            states: [
            State {
                 name: "Zero"
            },
            State {
                  name: "One"
            },
            State {
                name: "Two"
           }
       ]

            Image {
                id: zerado
                source: "Icones/Ganho0.png"
                 visible:gain.state == "Zero"
            }
            Image {
                id: hum
                source: "Icones/Ganho1.png"
                 visible:gain.state == "One"
            }
            Image {
                id: dois
                source: "Icones/Ganho2.png"
                visible:gain.state == "Two"
            }
        }
            //conexões do ganho com o c++
            Connections{
               target: serial
                 onChangeGanhoLow:
                {
                  ganho.state =  "Zero"
                }
            }

            Connections{
               target: serial
                 onChangeGanhoMed:
                {
                  ganho.state =   "One"
                }
            }

            Connections{
               target: serial
                 onChangeGanhoHig:
                {
                  ganho.state =  "Two"
                }
            }
         }


        Connections{
           target: serial
             onGainZero:
            {
              timerGanho.start();
            }
        }



        Timer{
            id:timerzoom
            interval: 200
            repeat:false
            running: false

            onTriggered: {
            serial.setComandoIke(40);
        }
        }


        Image {
            id: menu
            x: 648
            y: 8
            source: "Icones/BotaoMenu.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.97;}
                onReleased: {
                    root.state = "Menu"
                     parent.scale = 1.0;
                }
            }
        }

        Image {
            id: laparo
            x: 672
            y: 109
            source: "IndicadoresCentrais/Laparo01.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.97;}
                onReleased: {
                    root.state = "Users"
                    parent.scale = 1.0;
                }
            }
            states: [
                State {
                    name: "LaparoOne"
                     },
                State {
                    name: "LaparoTwo"
                     },
                State {
                    name: "LaparoTree"
                     },
                State {
                    name: "LaparoFour"
                     }
            ]
            Image {
               id: larparoo1
                source: "IndicadoresCentrais/Laparo01.png"
                  visible: laparo.state =="LaparoOne"
             }

            Image {
               id: laparoo2
                source: "IndicadoresCentrais/Laparo.png"
                  visible: laparo.state == "LaparoTwo"
             }

            Image {
               id: laparoo3
                source: "IndicadoresCentrais/Endoflexivel.png"
                  visible: laparo.state ==  "LaparoTree"
             }

            Image {
               id: laparoo4
                source: "IndicadoresCentrais/Histero.png"
                  visible: laparo.state =="LaparoFour"
             }
        }

        Connections{
            target: serial
           onChangedUsers3:
           {
             laparo.state =  "LaparoTree"
           }
        }
        Connections{
            target: serial
           onChangedUsers1:
           {
             laparo.state =  "LaparoOne"
           }
        }
        Connections{
            target: serial
           onChangedUsers2:
           {
             laparo.state =  "LaparoTwo"
           }
        }
        Connections{
            target: serial
            onChangedUsers4:
            {
              laparo.state =  "LaparoFour"
            }
        }

        Image {
            id: rec
            x: 47
            y: 224
            source: "Icones/RecRun.png"
            fillMode: Image.PreserveAspectFit
            MouseArea
            {
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                      parent.scale = 1.0;

                    rec.state = "RecAguarde"
                    serial.gravacao();
                }

              }

               states: [
                   State {
                      name: "NoRec"
                  },
                   State {
                      name: "recRun"
                  },
                   State {
                      name: "RecInit"
                  },
                   State {
                      name: "RecStop"
                  }
               ]

               Image {
                   id:norec
                   source: "Icones/NoRec.png"
                    visible: rec.state == "NoRec"
               }
               Image {
                   id:recrun
                   source: "Icones/RecRun.png"
                    visible: rec.state == "recRun"
               }

               Image {
                   id:recinit
                   source: "Icones/RecIni.png"
                    visible: rec.state == "RecInit"
               }

               Image {
                   id:recstop
                   source: "Icones/RecStop.png"
                    visible: rec.state == "RecStop"
               }

               Image {
                   id:recreini
                   source: "Icones/RecReini.png"
                   visible: rec.state == "RecReini"
               }

               Image {
                   id:recaguarde
                   source: "Icones/Aguarde.png"
                   visible: rec.state == "RecAguarde"
               }

        }

        Image {
            id: connect
            x: 8
            y: 362
            fillMode: Image.PreserveAspectFit
            source: "imagesInit/connectOff.png"
        }

          }

    //da o zoom pelo display
    Image {
        id: zoom0
        x: 495
        y: 247
        source: "Icones/Zoom0.png"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onPressed: {parent.scale = 0.97;}
            onReleased: {
                parent.scale = 1.0;

                 serial.setComandoIke(4);

            }
        }

        states: [
            State {
                name: "Zoom0"
            },
            State {
                name: "Zoom1"
            },
            State {
                name: "Zoom2"
            },

            State {
                name: "Zoom3"
            }

          ]
        Image {
            id:zeroo
            source: "Icones/Zoom0.png"
             visible: zoom0.state == "Zoom0"
        }
        Image {
            id:one
            source: "Icones/Zoom1.png"
             visible: zoom0.state == "Zoom1"
        }
        Image {
            id:two
            source: "Icones/Zoom2.png"
             visible: zoom0.state == "Zoom2"
        }
        Image {
            id:tree
            source: "Icones/Zoom3.png"
             visible: zoom0.state == "Zoom3"
        }
        }
    // desenha o campo do white balance negado
            Image {
                id:wbEvents
                x: 237
                y: 385
                source: "Icones/wbOk.bmp"

                states: [
                    State {
                        name: "WbOk"
                   },
                    State {
                        name: "WbNegado"
                   },
                    State {
                        name: "WbShow"
                   },
                    State {
                        name: "SemMedia"
                   },
                    State {
                        name: "NoMedia"
                   }

                ]

                Image {
                     id:wbok
                     source:"Icones/wbOk.bmp"
                     visible:wbEvents.state == "Ok"
                 }

                Image {
                     id:wbokNeg
                     source:"Icones/wbNegado.bmp"
                     visible:wbEvents.state == "WbNegado"
                 }

                Image {
                     id:wboShow
                     source:"Icones/white2.png"
                     visible:wbEvents.state == "WbShow"
                 }

                Image {
                    id:midiaevent
                    source: "Icones/SemMedia.png"
                    visible: wbEvents.state == "SemMedia"
                }

                Image {
                    id:midiaNov
                    source: "Icones/Nomedia.png"
                    visible: wbEvents.state == "NoMedia"
                }
            }



            Connections{
                target: serial
               onAceptWhite:
               {
                 wbEvents.state = "0k"
                   whitebalance.state = "PisOk"
               }
            }
            Connections{
                target: serial
               onNoMediaConnected:
               {
                // wbEvents.state = "NoMedia"

                   root.state = "NoMediaConnected"
                timerMedia.start();
               }
            }


            Timer{
                id:timerMedia
                interval: 500
                repeat:false
                running: false

                onTriggered: {
                 serial.mensagens(1037,0);
                //wbEvents.state = "SemMedia"

            }
            }


    Connections{  //enquanto não há white balance feito fica piscando

        target: serial
        onPiscWbNegval:{

            piscWhiteNeg++
            if(piscWhiteNeg >1)piscWhiteNeg=0;

            if(piscWhiteNeg) wbEvents.state = "WbNegado"

            else   wbEvents.state = "Wbok"
        }
    }
    Connections{
        target: serial
       onNaoTemPlacaAdicional:
       {
        rec.state = "NoRec"
         serial.placaGrav(false);//fala para o c++ que não tem placa de gravaçaão
       }
    }
    Connections{
        target: serial
       onTemPlacaAdicional:
       {
         rec.state = "RecStop"
       }
    }

    Connections{
        target: serial
       onGravando:
       {
            rec.state =  "recRun"

           recstart.start();
      }
    }

    Timer{
        id:recstart
        interval: 50
        repeat:false
        running: false

        onTriggered: {
        // serial.mensagens(1002,2);
             serial.setComandoIke(1003);//pergunta sobre a mídia
             recstart.stop();
            recmes.start();
        }
    }
    Timer{
        id:recmes
        interval: 100
        repeat:false
        running: false

        onTriggered: {
        // serial.mensagens(1002,2);
             serial.mensagens(1002,2); //escreve rec no monitor
             recmes.stop();
        }
    }
    Connections{
        target: serial
       onGravandoNot:
       {
        // serial.setComandoIke(1003);
           rec.state = "RecStop"
           recpara.start();
         //  serial.setComandoIke(1020);
       }
    }
    Timer{
        id:recpara
        interval: 100
        repeat:false
        running: false

        onTriggered: {
         serial.mensagens(1001,2);
      }
    }

//AÇÕES PARA ESCREVER PHOTO OK NO MONITOR



    Connections{
        target: gpio
       onFoto:
       {
         //  console.log("vai corintias");
        serial.setComandoIke(1034);

       }
    }


    Connections{
        target: serial
       onFotoOk:
       {
           //console.log("vai corintias");
         writeFoto.start();

       }
    }

    Timer{
        id:writeFoto
        interval: 50
        repeat:false
        running: false

        onTriggered: {
         serial.mensagens(1034,2);
         clearFoto.start();
      }
    }

    Timer{
        id:clearFoto
        interval: 2000
        repeat:false
        running: false

        onTriggered: {
         serial.mensagens(1035,0);
      }
    }

    //falhas de de midiaNov



    Connections{
        target: serial
       onMediaStateFailure:{
          // console.log("failure");
         //  root.state = "MediaFail"
       }
    }


}
















/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
