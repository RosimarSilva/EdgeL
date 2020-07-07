import QtQuick 2.0

Item {
    id :calendaro

    property int calendarioDia: 0
    property int calendarioMes: 0
    property int calendarioAno: 0
    property int calendarioHora: 0
    property int calendariominuto: 0

    property int  rMes: 0
    property int  qMes: 0

    property int  qDia: 0
    property int  rDia: 0

    property int  qAno: 0
    property int  rAno: 0

    property int  qhora: 0
    property int  rHora: 0

    property int  qMinuto: 0
    property int  rMinuto: 0

   property color colorCaixa: "#88000000"
    property color colorText: "white"

    property string horaAgora:    "00"
    property string minutoAgora:  "00"
    property string segundoAgora: "00"
    property string diaHoje:    "00"
    property string mesHoje:  "00"
    property string anoHoje: "00"

        property int tamanhoBorda: 4
    property color corFundo: "#242424"
    property color corLaranja: "#f37906"
    property  int amPm: 0


    Image {
        id: calendario
        x: 40
        y: 20
        source: "Telas/calendario.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onClicked: {}


         Image {
                id: format
                x: 528
                y: 291
                fillMode: Image.PreserveAspectFit
                source: "Icones/AM.bmp"

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
                         id: format1
                         source: "Icones/AM.bmp"
                         visible: format.state == "AM"
                      }
                     Image {
                         id: format2
                         source: "Icones/PM.bmp"
                         visible: format.state == "PM"
                      }

         }

            MouseArea {
                id: mouseArea
                x: 509
                y: 266
                width: 100
                height: 100
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    calendario_.setFormatAmPm()
                }
            }
        }


        Connections{  //enquanto não há white balance feito fica piscando
                  target: calendario_
                  onChangeFormat:{
                      amPm = calendario_.formatHora;
                       if(amPm)format.state = "PM"
                       else format.state =   "AM"
                }
            }

        //data recebida pela digitação do display
        Connections{
                target: calendario_
            onChangedDia:{calendarioDia = calendario_.dia;
                qDia = calendarioDia/10;
                rDia = calendarioDia%10;
            }
        }

        Connections{
                target: calendario_
            onChangedMes:{calendarioMes  = calendario_.mes;
               qMes = calendarioMes/10;
                rMes = calendarioMes%10;
            }
        }
        Connections{
                target: calendario_
             onChangedAno:{calendarioAno = calendario_.ano;
                 qAno = calendarioAno/10;
                  rAno = calendarioAno%10;

             }
        }

        Connections{
                target: calendario_
             onChangedHora:{calendarioHora = calendario_.hora;
                 qhora = calendarioHora/10;
                  rHora = calendarioHora%10;
             }
        }

        Connections{
                target: calendario_
             onChangeMinuto:{calendariominuto = calendario_.minuto;
                 qMinuto = calendariominuto/10;
                  rMinuto = calendariominuto%10;
             }
        }


        Image {
            id: back
            x: 0
            y: 0
            source: "Icones/Back.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                   calendario_.setDate();
                    root.state = "Menu"
                    parent.scale = 1.0;
                }
            }
        }

        Image {
            id: maisDia
            x: 235
            y: 158
            source: "IconesConfig/BotaoPlus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;

                     calendario_.setMonth(3);
                 }
            }
        }

        Image {
            id: menosDia
            x: 140
            y: 158
            source: "IconesConfig/BotaoMinus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;

                     calendario_.setMonth(4);
                }
            }
        }

        Image {
            id: menosMes
            x: 345
            y: 158
            source: "IconesConfig/BotaoMinus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    calendario_.setDay(2);
                }
            }
        }

        Image {
            id: maisMes
            x: 441
            y: 159
            source: "IconesConfig/BotaoPlus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                   calendario_.setDay(1);
                }
            }
        }

        Image {
            id: maisAno
            x: 639
            y: 158
            source: "IconesConfig/BotaoPlus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                     calendario_.setYear(5);
                }
            }
        }

        Image {
            id: menosAno
            x: 542
            y: 158
            source: "IconesConfig/BotaoMinus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    calendario_.setYear(6);
                }
            }
        }

        Image {
            id: maisMinuto
            x: 441
            y: 292
            source: "IconesConfig/BotaoPlus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                      calendario_.setminute(5);
                }
            }
        }

        Image {
            id: menosMinuto
            x: 351
            y: 292
            source: "IconesConfig/BotaoMinus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    calendario_.setminute(6);
                }
            }
        }

        Image {
            id: maisHora
            x: 235
            y: 292
            source: "IconesConfig/BotaoPlus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    calendario_.setHour(5);
                }
            }
        }

        Image {
            id: menosHora
            x: 140
            y: 292
            source: "IconesConfig/BotaoMinus.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    calendario_.setHour(6);
                }
            }
        }
//variaveis do dia
        Text {
            x: 210
            y: 158
            width: parent.width/2
            height: 50
            horizontalAlignment:  Text.verticalCenter
            font.pointSize: 30
            color: calendaro.colorText
            text:  +calendaro.rMes
        }

        Text {
            x: 190
            y: 158
            width: parent.width/2
            height: 50
            horizontalAlignment:  Text.verticalCenter
            font.pointSize: 30
            color: calendaro.colorText
            text: +calendaro.qMes
        }
//variaveis do mes
      Text {
                x:395
                y: 158
                width:parent.width/2
                height: 50
                horizontalAlignment:  Text.AlignVCenter
                font.pointSize: 30
                color: calendaro.colorText
                text:   +calendaro.qDia
            }

      Text {
                x:415
                y: 158
                width: parent.width/2
                height: 50
               horizontalAlignment:  Text.AlignVCenter
                font.pointSize: 30
                color: calendaro.colorText
                text:+calendaro.rDia
            }

      //variaveis do ano
            Text {
                x: 590
                y: 158
                horizontalAlignment:  Text.AlignVCenter
                font.pointSize: 30
                color: calendaro.colorText
                text: +calendaro.qAno
            }

            Text {
                x: 610
                y: 158
                horizontalAlignment:  Text.AlignVCenter
                font.pointSize: 30
                color: calendaro.colorText
                text: +calendaro.rAno
            }



    //variaveis da hora
          Text {
              x: 210
              y: 292
              horizontalAlignment:  Text.AlignVCenter
              font.pointSize: 30
              color: calendaro.colorText
              text:  +calendaro.rHora
          }

          Text {
              x: 190
              y: 292
              horizontalAlignment:  Text.AlignVCenter
              font.pointSize: 30
              color: calendaro.colorText
              text:+calendaro.qhora
          }

          //variaveis da minuto
                Text {
                    x: 395
                    y: 292
                    horizontalAlignment:  Text.AlignVCenter
                    font.pointSize: 30
                    color: calendaro.colorText
                    text: +calendaro.qMinuto
                }

                Text {
                    x: 415
                    y: 292
                    horizontalAlignment:  Text.AlignVCenter
                    font.pointSize: 30
                    color: calendaro.colorText
                    text:+calendaro.rMinuto
                }

//datas que seram exibidas na parte superior da tela

                 //variáveis hora
                    Text {
                        x: 623
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+ calendarioHora
                    }
                    Text {
                        x: 655
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+ calendariominuto
                    }
                //variáveis mes
                    Text {
                        x: 410
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+calendaro.rMes
                    }

                    Text {
                        x: 400
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+calendaro.qMes
                    }
                    //variaveis dia
                    Text {
                        x: 455
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+  +calendaro.rDia
                    }

                    Text {
                        x: 445
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+  +calendaro.qDia
                    }
                    //varaiáveis ano

                    Text {
                        x: 495
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+  20
                    }
                    Text {
                        x: 520
                        y: 26
                        horizontalAlignment:  Text.AlignVCenter
                        font.pointSize: 15
                        color: calendaro.colorText
                        text:+ calendarioAno
                    }

                }


}

