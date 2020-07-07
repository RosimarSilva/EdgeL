import QtQuick 2.0

Item {
    Image {
        id: image
        x: 40
        y: 20
        source: "Telas/NoMedia.bmp"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: back
        x: 40
        y: 20
        width: 110
        height: 102
        source: "Icones/Back.png"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.rightMargin: 0
            anchors.bottomMargin: -1
            anchors.leftMargin: 0
            anchors.topMargin: 1
            anchors.fill:parent
            onPressed: {parent.scale = 0.97;}
            onReleased:
            {
                parent.scale = 1.0;
                 gpio.setTela(1);
                 serial.mensagens(1038,1);
                root.state = "Principal"
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
                gpio.setTela(1);
            root.state = "Principal"
            }
    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
