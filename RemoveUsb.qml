import QtQuick 2.0

Item {
    Image {
        id: image
        x: 35
        y: 20
        source: "Telas/updateSoftware.bmp"
        fillMode: Image.PreserveAspectFit

        Text {
            id: element1
            x: 163
            y: 70
            color: "#7aea1e"
            text: qsTr("Remove the USB stick !")
            font.pixelSize: 32
        }

        Text {
            id: element2
            x: 41
            y: 137
            color: "#ecd9b9"
            text: qsTr("The system needs to be restarted for")
            font.pixelSize: 32
        }

        Text {
            id: element3
            x: 121
            y: 178
            color: "#ecd9b9"
            text: qsTr(" the changes to take effect!")
            font.pixelSize: 32
        }

        Text {
            id: element6
            x: 39
            y: 247
            color: "#ecd9b9"
            text: qsTr("Do you want to restart the system now?")
            font.pixelSize: 32
        }

        Text {
            id: element4
            x: 232
            y: 319
            color: "#7aea1e"
            text: qsTr("Yes")
            font.pixelSize: 32
            MouseArea {
                id: sim
                x: -13
                y: -18
                width: 86
                height: 63
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                   calendario_.restartSystem();
                }

            }
        }

        Text {
            id: element5
            x: 416
            y: 319
            color: "#7aea1e"
            text: qsTr("No")
            font.pixelSize: 32
            MouseArea {
                id: nao
                x: -13
                y: -10
                width: 70
                height: 48
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    parent.scale = 1.0;
                    root.state = "Configuration"
                }

            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
