import QtQuick 2.0

Item {
    id :poweroff

    property int calendarioHoras: 0
    property int calendariominutos: 0
    property int  qhoras: 0
    property int  rHoras: 0

    property int  qMinutos: 0
    property int  rMinutos: 0
    property int sizeFont : 50

     property  int amPms: 0

     property color colorText: "white"
    Image {
        id: powerofff
        x: 20
        y: 35
        fillMode: Image.PreserveAspectFit
        source: "Telas/black.bmp"



//recebe do c++ o comando para ligar o sistema
        Connections{
                target: gpio
                 onLiga:{
                      root.state = "TelaLed"
                      serial.readFlash()
                      serial.displayBrightness(200)
                     drive.start()

                 }
        }

        //coloca o ventilador em potência máxima
         Timer{
            id:drive
            interval:300
            repeat:false
            running: false
            onTriggered: {
                 serial.openSerial("ttymxc0",false);
                 serial.writeBytes([0xA5,0x06,0x0a,0x00,0xc4,0x49],1);// habilita o drive do led
            }
        }

         Connections{
               target: calendario_
               onChangedHora:{calendarioHoras = calendario_.hora;
                      qhoras = calendarioHoras/10;
                    rHoras = calendarioHoras%10;
              }
           }

          Connections{
                target: calendario_
                    onChangeMinuto:{calendariominutos = calendario_.minuto;
                    qMinutos = calendariominutos/10;
                    rMinutos = calendariominutos%10;
                }
           }

                    //variaveis da hora
                          Text {
                              x: 451
                              y: 25
                              horizontalAlignment:  Text.AlignVCenter
                              font.pointSize: sizeFont
                              color: "white"
                              text: +poweroff.qhoras
                          }

                          Text {
                              x: 492
                              y:25
                              horizontalAlignment:  Text.AlignVCenter
                              font.pointSize: sizeFont
                              color: "white"
                              text:+poweroff.rHoras
                          }

                          //variaveis da minuto
                                Text {
                                    x: 563
                                    y: 25
                                    horizontalAlignment:  Text.AlignVCenter
                                    font.pointSize: sizeFont
                                    color: "white"
                                     text: +poweroff.qMinutos

                                }

                                Text {
                                    x: 607
                                    y: 25
                                    horizontalAlignment:  Text.AlignVCenter
                                    font.pointSize: sizeFont
                                    color: "white"
                                    text:+poweroff.rMinutos
                                }



                                Text {
                                    x: 539
                                    y: 33
                                    horizontalAlignment:  Text.AlignVCenter
                                    color: "white"
                                    text:  ":"
                                    font.pointSize: 35
                                }

                                Connections{  //enquanto não há white balance feito fica piscando
                                          target: calendario_
                                          onChangeFormat:{
                                              amPms = calendario_.formatHora;

                                              if(amPms){format.state = "PM"
                                             }
                                              else {
                                                  format.state = "AM"
                                           }
                                             // drivs.start();
                                          }
                                    }

                                Image {
                                       id: format

                                       fillMode: Image.PreserveAspectFit

                                       states: [
                                             State {
                                                 name: "PM"
                                             },
                                             State {
                                                 name: "AM"
                                             }
                                        ]
                                           // imagens das figuras da porcentagem, do led
                                            Image {

                                                id: format2
                                                x: 662
                                                y: 38
                                                source: "Icones/PM.bmp"
                                                visible: format.state == "PM"
                                             }
                                            Image {
                                                id: format1
                                                x: 662
                                                y: 38
                                                source: "Icones/AM.bmp"
                                                visible: format.state == "AM"

                                            }

                                }

                               Image {
                                   id: turnOff
                                   x: 310
                                   y: 212
                                   source: "Icones/TurnOff.png"
                                   fillMode: Image.PreserveAspectFit
                                    MouseArea{
                                       anchors.rightMargin: 5
                                       anchors.bottomMargin: 0
                                       anchors.leftMargin: -5
                                       anchors.topMargin: 0
                                       anchors.fill: parent

                                       onPressed: {parent.scale = 0.90;}
                                       onReleased: {
                                             parent.scale = 1.0;
                                           serial.writeFlash()
                                           serial.powerOfff()
                                       }
                                   }
                               }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
