import QtQuick 2.0

Item {
    property int versaoSoftawre: 230620
    property int  numSerie: 0
//tela Menu
    Image {
        id: menu
        x: 40
        y: 20
        source: "Telas/Menu.bmp"
        fillMode: Image.PreserveAspectFit

        MouseArea{
            anchors.fill: parent
            onClicked: {}


            Connections{  //recebe o numero de serie do c++
                    target: serial
                onSerialScreen:{numSerie = serial.myNumberSerie;
               }
            }
//ícone do brilho
            Image {
                id: brilho
                x: 649
                y: 13
                fillMode: Image.PreserveAspectFit
                source: "IconesBrilho/IconeBrilho.jpg"
                MouseArea{
                    anchors.fill: parent
                    onPressed: {parent.scale = 0.97;}
                    onReleased: {
                        root.state = "Brilhos"
                        parent.scale = 1.0;
                    }
                }
            }
        }

//icone de voltar
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
                    root.state = "TelaLed"
                    parent.scale = 1.0;
                }
            }
        }
//ícone calendario
        Image {
            id: calender
            x: 142
            y: 77
            source: "IconesConfig/Calendario.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    calendario_.readData();
                   // calendario_.amPM();
                    root.state = "Calendario"
                    parent.scale = 1.0;
                }
            }
        }
//ícone configuração
        Image {
            id: conf
            x: 412
            y: 77
            source: "IconesConfig/configuration.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                   // root.state =  "Configuration"
                    root.state = "Senha"
                    parent.scale = 1.0;
                }
            }
        }
//ícone serialnumber
        Image {
            id: serialNumber
            x: 412
            y: 200
            source: "IconesConfig/serialNumber.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.rightMargin: 2
                anchors.bottomMargin: 0
                anchors.leftMargin: -2
                anchors.topMargin: 0
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    root.state = "Senha";
                }
            }
        }
//ícone si
        Image {
            id: sI
            x: 142
            y: 191
            source: "Icones/system.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                     root.state = "Information"
                    parent.scale = 1.0;

                }
            }
        }


//text of software version
            Text {
                 x:520
                  y: 390
                 width: parent.width/2
                height: 25
                horizontalAlignment:  Text.AlignVCenter
               font.pointSize: 15
               color: "white"
               text: +versaoSoftawre
           }
//text of serial number
            Text {
                x: 390
                y: 390
                 width: parent.width/2
                horizontalAlignment:  Text.AlignVCenter
                font.pointSize: 15
                color: "white"
                text: +numSerie;
            }

     }




}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
