import QtQuick 2.0

Item {
    Image {
        id: update
        x: 35
        y: 20
        source: "Telas/updateSoftware.bmp"
        fillMode: Image.PreserveAspectFit

        Text {
            id: ipdate
            x: 49
            y: 105
            color: "#ecd9b9"
            text: qsTr("Please make sure the Usb stick is connected!\r\n")
            font.family: "Verdana"
            font.pixelSize: 25
        }


        Text {
            id: element2
            x: 77
            y: 165
            color: "#ecd9b9"
            text: qsTr("This action will update the system!")
            font.pixelSize: 34
        }

        Text {
            id: element3
            x: 107
            y: 226
            color: "#ecd9b9"
            text: qsTr("Do you want to  update the system?")
            font.pixelSize: 28
        }

        Text {
            id: element4
            x: 239
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
                    root.state = "Wait"

                    serial.writeFlash()
                    calendario_.updateSoftware()
                    calendario_.setInterval();
                }

            }
        }

        Text {
            id: element5
            x: 424
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

        Text {
            id: element6
            x: 239
            y: 8
            color: "#9be127"
            text: qsTr("Update system")
            font.pixelSize: 32
        }
    }

}
