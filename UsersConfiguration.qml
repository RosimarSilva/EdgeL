import QtQuick 2.0

Item {
    Image {
        id: telaCal
        x: 40
        y: 20
        source: "Telas/TelaCal.png"
        fillMode: Image.PreserveAspectFit


        Connections{  //enquanto não há white balance feito fica piscando

            target: serial
            onChangedEcolha3Cmos:{
                 escLaparoEsc.state = "laparo1_3cmos"
                esclLaparoDir.state =  "laparo0_1cmos"
            }
        }

        Image {
            id: escLaparoEsc
            x: 88
            y: 81
            source: "IconesCalUsers/Esclp1.bmp"
            fillMode: Image.PreserveAspectFit
            states: [

                State {
                    name: "laparo0_3cmos"
                },
                State {
                    name: "laparo1_3cmos"
                },
                State {
                    name: "laparo2_3cmos"
                },
                State {
                    name: "laparo3_3cmos"
                },
                State {
                    name: "laparo4_3cmos"
                }
            ]

            // imagens das figuras da porcentagem, do led
            Image {
                id: lap0

                source: "IconesCalUsers/Esclp0.bmp"
                visible: escLaparoEsc.state == "laparo0_3cmos"
            }

             Image {
                 id: lap1

                 source: "IconesCalUsers/Esclp1.bmp"
                 visible: escLaparoEsc.state == "laparo1_3cmos"
             }

              Image {
                 id: lap2

                 source: "IconesCalUsers/Esclp2.bmp"
                 visible: escLaparoEsc.state ==  "laparo2_3cmos"
             }

              Image {
                 id: lap3

                 source: "IconesCalUsers/Esclp3.bmp"
                 visible: escLaparoEsc.state ==  "laparo3_3cmos"
             }

              Image {
                 id: lap4

                 source: "IconesCalUsers/Esclp4.bmp"
                 visible: escLaparoEsc.state ==  "laparo4_3cmos"
             }
        }

        Image {
            id: laparo013cmos
            x: 173
            y: 98
            source: "IconesCalUsers/Laparo01.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    escLaparoEsc.state = "laparo1_3cmos"
                    esclLaparoDir.state = "laparo0_1cmos"
                     printLaparo.state = "laparo1"
                     serial.setmodeCamera(3);
                     serial.setIformationUser(1);
                     serial.trocaUser(1);;//troca de user na ikegami
                     backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Image {
            id: laparo023cmos
            x: 173
            y: 176
            source: "IconesCalUsers/Laparo02.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    escLaparoEsc.state = "laparo2_3cmos"
                    esclLaparoDir.state = "laparo0_1cmos"
                     printLaparo.state = "laparo2"
                    serial.setmodeCamera(3);
                     serial.setIformationUser(2);
                     serial.trocaUser(2);;//troca de user na ikegami
                     backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Image {
            id: hysat3cmos
            x: 174
            y: 334
            source: "IconesCalUsers/HysteroUro.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                   escLaparoEsc.state = "laparo4_3cmos"
                    esclLaparoDir.state = "laparo0_1cmos"
                     printLaparo.state = "laparo4"
                     serial.setmodeCamera(3);
                     serial.setIformationUser(4);
                     serial.trocaUser(4);// troca de user na ikegami
                     backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Image {
            id: endoFlex3cmos
            x: 174
            y: 254
            source: "IconesCalUsers/Endoflexible.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    escLaparoEsc.state = "laparo3_3cmos"
                    esclLaparoDir.state = "laparo0_1cmos"
                     printLaparo.state = "laparo3"
                     serial.setmodeCamera(3);
                     serial.setIformationUser(3);
                     serial.trocaUser(3);//troca de user na ikegami
                     backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Connections{  //enquanto não há white balance feito fica piscando

            target: serial
            onChangedEcolha1Cmos:{
                 escLaparoEsc.state = "laparo0_3cmos"
                esclLaparoDir.state =  "laparo1_1cmos"
            }
        }

        Image {
            id: esclLaparoDir
            x: 403
            y: 81
            source: "IconesCalUsers/Esclp0.bmp"
            fillMode: Image.PreserveAspectFit

            states: [

                State {
                    name: "laparo0_1cmos"
                },
                State {
                    name: "laparo1_1cmos"
                },
                State {
                    name: "laparo2_1cmos"
                },
                State {
                    name: "laparo3_1cmos"
                },
                State {
                    name: "laparo4_1cmos"
                }
            ]

            // imagens das figuras da porcentagem, do led
            Image {
                id: lap00

                source: "IconesCalUsers/Esclp0.bmp"
                visible: esclLaparoDir.state == "laparo0_1cmos"
            }

             Image {
                 id: lap11

                 source: "IconesCalUsers/Esclp1.bmp"
                 visible: esclLaparoDir.state == "laparo1_1cmos"
             }

              Image {
                 id: lap22

                 source: "IconesCalUsers/Esclp2.bmp"
                 visible: esclLaparoDir.state ==  "laparo2_1cmos"
             }

              Image {
                 id: lap33

                 source: "IconesCalUsers/Esclp3.bmp"
                 visible: esclLaparoDir.state ==  "laparo3_1cmos"
             }

              Image {
                 id: lap44

                 source: "IconesCalUsers/Esclp4.bmp"
                 visible: esclLaparoDir.state ==  "laparo4_1cmos"
             }

        }

        Image {
            id: endoflex1cmos
            x: 484
            y: 254
            source: "IconesCalUsers/Endoflexible.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    escLaparoEsc.state = "laparo0_3cmos"
                    esclLaparoDir.state = "laparo3_1cmos"
                    printLaparo.state = "laparo3"
                     serial.setmodeCamera(1);
                     serial.setIformationUser(3);
                      serial.trocaUser(7);//troca de user na ikegami
                     backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Image {
            id: laparo01_1cmos
            x: 489
            y: 98
            source: "IconesCalUsers/Laparo01.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    escLaparoEsc.state = "laparo0_3cmos"
                    esclLaparoDir.state = "laparo1_1cmos"
                     printLaparo.state = "laparo1"
                      serial.setmodeCamera(1);
                      serial.trocaUser(5);//troca de user na ikegami
                     serial.setIformationUser(1);
                     backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Image {
            id: laparo02_1cmos
            x: 489
            y: 176
            source: "IconesCalUsers/Laparo02.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    escLaparoEsc.state = "laparo0_3cmos"
                    esclLaparoDir.state = "laparo2_1cmos"
                     printLaparo.state = "laparo2"
                      serial.setmodeCamera(1);
                    serial.setIformationUser(2);
                      serial.trocaUser(6);//troca de user na ikegami
                     backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Image {
            id: hystero1cmos
            x: 489
            y: 334
            source: "IconesCalUsers/HysteroUro.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    escLaparoEsc.state = "laparo0_3cmos"
                    esclLaparoDir.state = "laparo4_1cmos"
                     printLaparo.state = "laparo4"
                      serial.setmodeCamera(1);
                     serial.setIformationUser(4);
                      serial.trocaUser(8);//troca de user na ikegami
                    backconf.start();
                    parent.scale = 1.0;
                }
           }
        }

        Image {
            id: printLaparo
            x: 21
            y: 115
            source: "IconesCalUsers/Printlp1.bmp"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {parent.scale = 0.95;}
                onReleased: {
                    root.state = "Configuration"
                    parent.scale = 1.0;
                }
           }

            states: [

                State {
                    name: "laparo1"
                },
                State {
                    name: "laparo2"
                },
                State {
                    name: "laparo3"
                },
                State {
                    name: "laparo4"
                }
            ]

            // imagens das figuras da porcentagem, do led
            Image {
                id: lapp1
                source: "IconesCalUsers/Printlp1.bmp"
                visible: printLaparo.state == "laparo1"
            }

            Image {
                id: lapp2
                source: "IconesCalUsers/Printlp2.bmp"
                visible: printLaparo.state == "laparo2"
            }

            Image {
                id: lapp3
                source: "IconesCalUsers/Printlp3.bmp"
                visible: printLaparo.state == "laparo3"
            }

            Image {
                id: lapp4
                source: "IconesCalUsers/Printlp1.bmp"
                visible: printLaparo.state == "laparo4"
            }
        }

        Timer{
            id:backconf
            interval: 2000
            repeat: false
            running: false
            onTriggered: {
                root.state = "Configuration"
            }
        }

    }

}
