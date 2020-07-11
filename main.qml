import QtQuick 2.0
import QtQuick.Window 2.2

import AstusFonte 1.0
import Gpio 1.0
import Senha 1.0
import Calendario 1.0


Window {
    //: true
    visible: true;
    visibility: Window.FullScreen
    width: 800
    height: 480
    color: "black"

    Rectangle{
        id:root

        FonteLed{id:serial}
        Gpios{id: gpio}
        Password{id:senha_}
        Calender{id: calendario_}
        Initial{id:inicia}



      // Telaprincipal{}
        // Inicializacao{}
       // TelaLed{}
        PowerOff{}
         // Menu{}
       //  MediaStateFailure{}

        states: [


            State {
                name: "Configuration"
            },
            State {
                name: "Menu"
           },
            State {
                name: "Calendario"
             },
            State {
                name: "TelaLed"
            },
            State {
                name: "Senha"
            },
            State {
                name: "Brilhos"
            },
            State {
                name: "SerialNumber"
            },
            State {
                name: "EditHoras"
            },
            State {
                name: "PowerOff"
            },
            State {
                name: "Information"
            },
            State {
                name: "UpdateSoftware"
            },
            State {
                name: "Wait"
            },
             State {
                name: "Remove"
            }

        ]




        Configuration
        {
            id: config
            anchors.fill: parent
            visible: root.state == "Configuration"
        }
        Menu
        {
            id: menu
            anchors.fill: parent
            visible: root.state == "Menu"
        }
        Calendario
        {
            id: calender
            anchors.fill: parent
            visible: root.state == "Calendario"
        }
        TelaLed
        {
            id: telaled
            anchors.fill: parent
            visible: root.state == "TelaLed"
        }
        Senha
        {
            id:telasenha
            anchors.fill: parent
            visible: root.state == "Senha"
        }
        Inicializacao
        {
            id:telaInit
            anchors.fill: parent
            visible: root.state == "TelaInit"
        }



        Brilho
        {
            id:brigtnes
            anchors.fill: parent
            visible: root.state == "Brilhos"
        }
        SerialNumber
        {
            id:numberSerie
            anchors.fill: parent
            visible: root.state == "SerialNumber"
        }

        EditHours
        {
            id:horasEdit
            anchors.fill: parent
            visible: root.state == "EditHoras"
        }

        PowerOff
        {
            id:desliga
            anchors.fill: parent
            visible: root.state == "PowerOff"
        }

        SystemInfo
        {
            id:info
            anchors.fill: parent
            visible: root.state == "Information"
        }

        UpdateSoftware
        {
            id:update
            anchors.fill: parent
            visible: root.state == "UpdateSoftware"
        }
        Wait
        {
            id:aguarde
            anchors.fill: parent
            visible: root.state == "Wait"
        }
        RemoveUsb
        {
            id:remo
            anchors.fill: parent
            visible: root.state == "Remove"
        }


    }

}
