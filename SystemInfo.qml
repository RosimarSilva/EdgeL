import QtQuick 2.0

Item {
    property int temperatura: 0
    property int  min: 0
    property int percento: 0
    Image {
        id: systemInfo
        x: 40
        y: 20
        source: "Telas/systeminformation.bmp"
        fillMode: Image.PreserveAspectFit
        MouseArea{
        anchors.fill: parent
        onClicked: {}
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
                 parent.scale = 1.0;
                }
            }
        }

        Text {
            id: element
            x: 418
            y: 123
            color: "#ecd9b9"
            text: qsTr("Total hours and minutes")
            font.pixelSize: 20
        }

        Text {
            id: element1
            x: 183
            y: 123
            color: "#ecd9b9"
            text: qsTr("Led temperature")
            font.pixelSize: 20
        }

        Text {
            id: element2
            x: 177
            y: 261
            color: "#ecd9b9"
            text: qsTr("Percentage of light :")
            font.pixelSize: 20
        }
        //recebe do c++ onumeros de horas da lampada
        Connections{  //enquanto não há white balance feito fica piscando
              target: serial
              onTempLedChanged:{
                 temperatura = serial.tempLed;
              }
        }

        Connections{  //enquanto não há white balance feito fica piscando
                 target: serial
                 onMinChanged:{
                    min = serial.minutos;
             }
        }
 //recebe do c++ onumeros de horas da lampada
         Connections{  //enquanto não há white balance feito fica piscando
                 target: serial
                 onPercentChanged:{
                       percento = serial.percent;
                   }
         }

//escrira de horas de lâmpada
          Text {
               x: 203
               y: 161
               horizontalAlignment:  Text.AlignVCenter
               font.pointSize: 38
               color: "#ecd9b9"
               text:+temperatura;
           }

          Text {
               x: 433
               y: 256
               horizontalAlignment:  Text.AlignVCenter
               font.pointSize: 20
               color: "#ecd9b9"
               text: "%"
           }

                                Text {
                                    id: element3
                                    x: 264
                                    y: 169
                                    color: "#ecd9b9"
                                    text: qsTr("°C")
                                    font.pixelSize: 38
                                }

                                //escrira de horas de lâmpada
                                            Text {
                                                x: 513
                                                y: 173
                                                horizontalAlignment:  Text.AlignVCenter
                                                font.pointSize: 22
                                                color: "#ecd9b9"
                                                text:+ serial.horasLampada;
                                                font.capitalization: Font.Capitalize
                                            }

                                            Text {
                                                id: element4
                                                x: 433
                                                y: 178
                                                color: "#ecd9b9"
                                                text: qsTr("Hours:")
                                                font.pixelSize: 22
                                            }

                                            Text {
                                                x: 542
                                                y: 219
                                                horizontalAlignment:  Text.AlignVCenter
                                                font.pointSize: 22
                                                color: "#ecd9b9"
                                                text:+ serial.minutos;
                                            }

                                            Text {
                                                id: element5
                                                x: 435
                                                y: 224
                                                color: "#ecd9b9"
                                                text: qsTr("Minutes:")
                                                font.pixelSize: 22
                                            }

                                            Text {
                                                x: 382
                                                y: 257
                                                color: "#ecd9b9"
                                                text: +percento
                                                horizontalAlignment: Text.AlignVCenter
                                                font.pointSize: 20
                                            }
}
    }

}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
