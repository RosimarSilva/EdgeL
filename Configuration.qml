import QtQuick 2.0

Item {
    Image {
        id: image
        x: 41
        y: 20
        source: "Telas/TelaConfig.bmp"
        fillMode: Image.PreserveAspectFit

        MouseArea{
            anchors.rightMargin: -1
            anchors.bottomMargin: 0
            anchors.leftMargin: 1
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: {}

            Image {
                id: resetHoras
                x: 145
                y: 107
                source: "IconesConfig/ResetHoras.png"
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    x:145
                    y:107
                    anchors.fill: parent
                    onPressed: {parent.scale = 0.95;}
                    onReleased: {
                        serial.resetHoras();
                        parent.scale = 1.0;
                    }
                }
            }


//imagem de volta de tela
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

                    root.state = "Menu"

                    //serial.salvarDadosCalibracao();

                    serial.writeFlash();


                    parent.scale = 1.0;
                }
            }
        }

        Image
        {
            id: edit
            x: 460
            y: 117
            source: "IconesConfig/edithourLamp.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea
            {
                anchors.fill: parent
                onPressed: {parent.scale = 2.00;}
                onReleased:
                {
                   serial.setHorasDigitadas(0);
                   parent.scale = 1.50;
                   root.state = "EditHoras"
                }

            }
        }

         Text {
             id: horass
             x: 369
             y: 264
              color: "blue"
             text: +serial.horasLampada;
             font.pixelSize: 60
         }


      }


    }

  }

