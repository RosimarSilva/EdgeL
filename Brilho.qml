import QtQuick 2.0

Item {
    property int  brilhou: 7

    Image {
        id: brilho
        x: 35
        y: 20
        source: "Telas/19_principal.bmp"
        fillMode: Image.PreserveAspectFit

        Connections{  //enquanto não há white balance feito fica piscando
                target: serial
            onHourChanged:{
                //horasLamp = serial.horasLampada;
           }
        }


        Text {
            x: 550
            y: 16
            horizontalAlignment:  Text.AlignVCenter
            font.pointSize: 22
            color: "white"
            text:+ serial.horasLampada;
        }

        Image {
            id: connect
            x: 8
            y: 362
            fillMode: Image.PreserveAspectFit
            source: "imagesInit/connectOff.png"
        }


        Image {
            id: menu
            x: 651
            y: 5
            width: 63
            height: 96
            source: "Icones/HomeBack.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                x: -24
                y: 20
                width: 62
                height: 96
                anchors.rightMargin: 2
                anchors.bottomMargin: -9
                anchors.leftMargin: -1
                anchors.topMargin: 9
                anchors.fill: parent
                onClicked: {
                    root.state = "TelaLed"
                }
            }
        }


        Image {
            id: barraBrilho
            x: 175
            y: 372
            fillMode: Image.PreserveAspectFit
            source: "IconesBrilho/Barra70.jpg"

            states: [
                State {
                    name: "Barra0%"
               },
                State {
                    name: "Barra10%"
               },
                State {
                    name: "Barra20%"
               },
                State {
                    name: "Barra30%"
               },
                State {
                    name: "Barra40%"
               },
                State {
                    name: "Barra50%"
               },
                State {
                    name: "Barra60%"
               },
                State {
                    name: "Barra70%"
               },
                State {
                    name: "Barra80%"
               },
                State {
                    name: "Barra90%"
               },
                State {
                    name: "Barra100%"
               }
            ]

            Image {
                id:barra0
                source: "IconesBrilho/Barra00.jpg"
                visible: barraBrilho.state == "Barra0%"
            }


            Image {
                id:barra10
                source: "IconesBrilho/Barra10.jpg"
                visible: barraBrilho.state == "Barra10%"
            }


            Image {
                id:barra20
                source: "IconesBrilho/Barra20.jpg"
                visible: barraBrilho.state == "Barra20%"
            }


            Image {
                id:barra30
                source: "IconesBrilho/Barra30.jpg"
                visible: barraBrilho.state == "Barra30%"
            }


            Image {
                id:barra40
                source: "IconesBrilho/Barra40.jpg"
                visible: barraBrilho.state == "Barra40%"
            }


            Image {
                id:barra50
                source: "IconesBrilho/Barra50.jpg"
                visible: barraBrilho.state == "Barra50%"
            }


            Image {
                id:barra60
                source: "IconesBrilho/Barra60.jpg"
                visible: barraBrilho.state == "Barra60%"
            }


            Image {
                id:barra70
                source: "IconesBrilho/Barra70.jpg"
                visible: barraBrilho.state == "Barra70%"
            }


            Image {
                id:barra80
                source: "IconesBrilho/Barra80.jpg"
                visible: barraBrilho.state == "Barra80%"
            }


            Image {
                id:barra90
                source: "IconesBrilho/Barra90.jpg"
                visible: barraBrilho.state == "Barra90%"
            }


            Image {
                id:barra100
                source: "IconesBrilho/Barra100.jpg"
                visible: barraBrilho.state == "Barra100%"
            }
        }

        Image {
            id: minus
            x: 107
            y: 367
            fillMode: Image.PreserveAspectFit
            source: "IconesBrilho/Mais.jpg"
            MouseArea
            {
                anchors.bottomMargin: -9
                anchors.leftMargin: -46
                anchors.rightMargin: -27
                anchors.topMargin: -19
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    brilhou--;
                    if(brilhou < 0) brilhou = 0;
                    setBrightnees();

                }
            }
        }

        Image {
            id: mais
            x: 528
            y: 367
            fillMode: Image.PreserveAspectFit
            source: "IconesBrilho/Mais.jpg"
            MouseArea
            {
                anchors.topMargin: -15
                anchors.leftMargin: -34
                anchors.rightMargin: -36
                anchors.bottomMargin: -12
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    brilhou ++;
                    if(brilhou > 10) brilhou = 10;
                    setBrightnees();

                }
            }
        }

        Image {
            id: image
            x: 199
            y: 69
            fillMode: Image.PreserveAspectFit
            source: "IndicadoresCentrais/indi100.png"
        }

        Image {
            id: standBy
            x: 654
            y: 130
            fillMode: Image.PreserveAspectFit
            source: "IndicadoresCentrais/StandByVerde.png"
        }

    }
    function setBrightnees()
    {
        switch(brilhou)
        {
             case 0:
                 barraBrilho.state = "Barra0%"
                 serial.displayBrightness(25);
             break

             case 1:
                 barraBrilho.state = "Barra10%"
                 serial.displayBrightness(50);
             break

             case 2:
                 barraBrilho.state = "Barra20%"
                 serial.displayBrightness(75);
             break

             case 3:
                 barraBrilho.state = "Barra30%"
                 serial.displayBrightness(100);
             break

             case 4:
                 barraBrilho.state = "Barra40%"
                 serial.displayBrightness(107);
             break

             case 5:
                 barraBrilho.state = "Barra50%"
                 serial.displayBrightness(125);
             break

             case 6:
                 barraBrilho.state = "Barra60%"
                 serial.displayBrightness(150);
             break

             case 7:
                 barraBrilho.state = "Barra70%"
                 serial.displayBrightness(175);
             break

             case 8:
                 barraBrilho.state = "Barra80%"
                 serial.displayBrightness(200);
             break

             case 9:
                 barraBrilho.state = "Barra90%"
                 serial.displayBrightness(225);
             break

             case 10:
                 barraBrilho.state = "Barra100%"
                 serial.displayBrightness(250);
             break

        }

    }

}





























/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
