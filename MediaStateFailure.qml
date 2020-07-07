import QtQuick 2.0

Item {
    Image {
        id: stateFaulure
        x: 40
        y: 20
        source: "Telas/MediaStateFailure.bmp"
        fillMode: Image.PreserveAspectFit

    }
    Timer{
        id:warning
        interval: 2000
        repeat:false
        running: true

        onTriggered: {
        // serial.mensagens(1035,0);
      }
    }

    Image {
        id: back
        x: 40
        y: 40
        source: "Icones/Back.png"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill:parent
            onPressed: {parent.scale = 0.97;}
            onReleased:
            {
                parent.scale = 1.0;
                 gpio.setTela(1);
                // serial.mensagens(1036,0);

                root.state = "Principal"
            }
        }
    }

}
