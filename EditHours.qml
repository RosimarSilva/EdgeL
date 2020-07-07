import QtQuick 2.0

Item {
     property int horas:0
    Image {
        id: horasDigitadas
        x: 40
        y: 20
        source: "Telas/editHoras.bmp"
        fillMode: Image.PreserveAspectFit

        Connections{  //enquanto não há white balance feito fica piscando
                target: serial
            onHorasDigitada:{
                horas = serial.horasDigitadas
           }
        }


    Connections{  //enquanto não há white balance feito fica piscando
              target: serial
                onBackConf:{
                    root.state = "Configuration"
             }
        }

    Image {
        id: one
        x: 149
        y: 152
        source: "IconesSenha/1.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
               //serieNumber.setSerialNumber(1);
                serial.setHorasDgit(1);
             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: two
        x: 215
        y: 152
        source: "IconesSenha/2.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: 5
            anchors.bottomMargin: 0
            anchors.leftMargin: -5
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                serial.setHorasDgit(2);
             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: tree
        x: 280
        y: 152
        source: "IconesSenha/3.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.leftMargin: 2
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                 serial.setHorasDgit(3);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: four
        x: 150
        y: 212
        source: "IconesSenha/4.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                 serial.setHorasDgit(4);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: five
        x: 219
        y: 211
        source: "IconesSenha/5.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                   serial.setHorasDgit(5);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: six
        x: 282
        y: 211
        source: "IconesSenha/6.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.leftMargin: 2
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                 serial.setHorasDgit(6);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: seven
        x: 150
        y: 271
        source: "IconesSenha/7.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.leftMargin: 2
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                serial.setHorasDgit(7);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: eight
        x: 218
        y: 270
        source: "IconesSenha/8.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: -3
            anchors.bottomMargin: 0
            anchors.leftMargin: 3
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                  serial.setHorasDgit(8);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: nine
        x: 284
        y: 272
        source: "IconesSenha/9.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.leftMargin: 2
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                 serial.setHorasDgit(9);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: zero
        x: 219
        y: 331
        source: "IconesSenha/0.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            width: 61
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.leftMargin: 1
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                 serial.setHorasDgit(0);

             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: del
        x: 152
        y: 335
        source: "IconesSenha/del.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.leftMargin: 2
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
              serial.setHorasDgit(99);


             parent.scale = 1.0;
            }
        }
    }

    Image {
        id: enter
        x: 288
        y: 333
        source: "IconesSenha/enter.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: -2
            anchors.bottomMargin: 0
            anchors.leftMargin: 2
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {parent.scale = 0.95;}
            onReleased: {
                 serial.setHorasDgit(100);

             parent.scale = 1.0;
            }
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
                root.state = "Configuration"
                parent.scale = 1.0;

            }
        }
    }

    Text {
        x: 175
        y: 82
        horizontalAlignment:  Text.AlignVCenter
        font.pointSize: 30
        color: "pink"
        text: +serial.horasDigitadas;

    }



    }


}
