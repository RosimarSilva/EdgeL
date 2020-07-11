import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

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
            onSliderTimer:{
               sliderr.start()
           }
        }

        Slider{
            id:slider
            x: 153
            y: 347
            width: 369
            height: 81
            antialiasing: false
            opacity: 1
            clip: false
            visible: true
            orientation: Qt.Horizontal
            spacing: 6
            font.weight: Font.Medium
            padding: 13
            rightPadding: 4
            leftPadding: 18
            topPadding: 7
            bottomPadding: 7
            font.pointSize: 20
            enabled: true
            transformOrigin: Item.Center
            from: 30
            to:255
            stepSize: 10
            value: 200

         }

        Text {
            x: 505
            y: 16
            horizontalAlignment:  Text.AlignVCenter
            font.pointSize: 22
            color: "white"
            text:+ serial.horasLampada;


        }
        Timer{
            id:sliderr
            interval: 100
            repeat:true
            running: false
            onTriggered: {
               if(brilhou != slider.value)
               {
                   brilhou = slider.value;
                   serial.displayBrightness(slider.value);
                   console.log("changedd")
               }
               console.log("rodando")
            }
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
                    sliderr.stop()
                }
            }
        }



        Image {
            id: minus
            x: 97
            y: 367
            fillMode: Image.PreserveAspectFit
            source: "IconesBrilho/Mais.jpg"
            MouseArea
            {
                anchors.bottomMargin: -9
                anchors.leftMargin: -24
                anchors.rightMargin: 0
                anchors.topMargin: -19
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;

                    slider.value -= 10;

                }
            }
        }


        Image {
            id: mais
            x: 544
            y: 367
            fillMode: Image.PreserveAspectFit
            source: "IconesBrilho/Mais.jpg"
            MouseArea
            {
                x: -13
                width: 104
                anchors.topMargin: -15
                anchors.leftMargin: -13
                anchors.rightMargin: -13
                anchors.bottomMargin: -12
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    slider.value += 10;

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


}





























/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
