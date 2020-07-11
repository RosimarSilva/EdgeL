import QtQuick 2.0

Item {
    Image {
        id: wait
        x: 37
        y: 20
        source: "Telas/updateSoftware.bmp"
        fillMode: Image.PreserveAspectFit


        Timer{
            id:ti
            interval:3000
            repeat:false
            running: false
            onTriggered: {
               root.state = "Configuration"

            }
        }

        Text {
            id: element
            x: 241
            y: 112
            color: "#9be127"
            text: qsTr("Please wait!!")
            font.pixelSize: 32
     }
        }


        Text {
            id: element2
            x: 73
            y: 187
            color: "#ecd9b9"
            text: qsTr("Do not remove the USB stick or turn off")
            font.pixelSize: 32
        }

        Text {
            id: element3
            x: 99
            y: 264
            color: "#ecd9b9"
            text: qsTr("while the system is  being updated!")
            font.pixelSize: 32
        }

        Connections{
                target: calendario_
                onTempo:{
                    root.state = "Remove"

               }
        }


    }


