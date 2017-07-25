import QtQuick 2.8
import Qt.labs.presentation 1.0

Presentation {
    id: presentation

    property real fontScale: 0.7

    Image {
        anchors.fill: parent
        source: "background.png"
    }

    FontLoader {
        id: titilium
        source: "TitilliumWeb-Regular.ttf"
    }

    FontLoader {
        id: titiliumLight
        source: "TitilliumWeb-Light.ttf"
    }

    fontFamily: titilium.name
    codeFontFamily: titiliumLight.name

    SlideCounter {}
    Clock {}

    Slide {
        centeredText: "<h1>Introducción a Qt</h1><br>" +
                      "por Jesús Fernández (<a href=\"mailto:jesus.fernandez@qt.io\">jesus.fernandez@qt.io</a>)"
    }

    Slide {
        title: "¿Quién soy?"
        fontScale: parent.fontScale

        content: [
            "Panda Security",
            "Hewlett-Packard",
            "Gameloft",
            "The Qt Company",
            " Mantenedor de QtNetworkAuth",
            " Mantenedor de QtWebGLStreaming Plugin"
        ]
    }

    Slide {
        title: "¿Quién es The Qt Company?"
        fontScale: parent.fontScale

        content: [
            "Mayor contribuidor al proyecto Qt",
            "Nos encargamos del mantenimiento de servidores",
            "Organizamos la comunidad",
            "Oficinas en todo el mundo"
        ]
    }

    Slide {
        title: "¿Quién es The Qt Company? (2)"
        fontScale: parent.fontScale

        Image {
            anchors.centerIn: parent
            source: "qt-contributions-5-9.png"
        }
    }

    Slide {
        title: "Qué es Qt?"
        delayPoints: true
        fontScale: parent.fontScale

        content: [
            "Código abierto",
            "Framework C++",
            "Multiplataforma",
            "¿Qué puedo hacer con Qt?",
            " GUIs (QtWidgets, QtQuick, Qt3DStudio)",
            " Aplicaciones de consola (QtCore)",
            " Aplicaciones de servidor (QtNetwork, QtWebsockets)",
            " Juegos (QtOpenGL, Qt3D, QtGamepad)",
            " Entornos gráficos*",
            " ..."
        ]
    }

    Slide {
        title: "¿Quién usa Qt?"

        Image {
            anchors.centerIn: parent
            source: "google-earth.jpg"
            width: parent.width
            height: parent.height
            fillMode: Image.PreserveAspectFit

            Timer {
                id: timer
                property int current: 0
                running: currentSlide === 5
                interval: 1000
                repeat: true
                onTriggered: {
                    var images = [
                                "google-earth.jpg",
                                "maya.jpg",
                                "lg.jpg",
                                "rimac.png",
                                "battlenet.png",
                                "KDE.png",
                                "lxqt.jpg",
                                "mathematica.png",
                                "crytek.jpg",
                                "asphalt8.jpg",
                                "hp.jpg",
                                "sky.png",
                                "tableau.png",
                                "dcc.png",
                                "autoio.jpg",
                                "navico.jpg",
                                "Orcamp.jpg",
                                "Imaginando.jpg"
                            ]
                    current = (current + 1) % images.length
                    console.log(current)
                    parent.source = images[current]
                }
            }
        }
    }

    Slide {
        title: "Build System"
        delayPoints: true
        fontScale: parent.fontScale

        content: [
            "QMake",
            "QBS",
            " Basado en QML",
            "CMake"
        ]
    }

    CodeSlide {
        title: "QCoreApplication/QGuiApplication/QApplication"
        fontScale: parent.fontScale
        code: "#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    // ...
    return a.exec();
}"
    }

    Slide {
        title: "QObject"
        fontScale: parent.fontScale
        delayPoints: true

        content: [
            "Tipo principal de todas las clases de Qt",
            "Manejo de memoria",
            "Reflection (moc)",
            "Soporte de señales y slots*",
            "Puede vivir en un hilo"
        ]
    }

    Slide {
        title: "Qt Widgets"
        fontScale: parent.fontScale
        delayPoints: true

        content: [
            "Clase base QWidget",
            "Estándar para crear interfaces en Qt",
            "Usa QPainter para \"pintar\" las UIs",
            " Modo imperativo",
            " Usa principalmente la CPU -> No aprovecha por completo la acceleración gráfica por " +
                "hardware",
            "Qt Designer + QtCreator",
            "Usa el patrón Modelo-Vista-Controlador",
            "Muy estable",
            "Muy usado actualmente"
        ]
    }

    Slide {
        title: "Qt Quick"
        fontScale: parent.fontScale
        delayPoints: true

        content: [
            "Basado en QML",
            " Lenguaje declarativo",
            " Compatible con Javascript",
            "Pensado para interfaces de control táctil",
            "Aprovecha la acceleración gráfica por hardware (GPU)",
            "En continua evolución",
            "Qt Quick Designer",
            "Qt Quick Controls 2"
        ]
    }

    CodeSlide {
        title: "Ejemplo de archivo QML"
        fontScale: parent.fontScale
        code: "import QtQuick 2.0

Item {
    id : clock
    width: {
        if (ListView.view && ListView.view.width >= 200)
            return ListView.view.width / Math.floor(ListView.view.width / 200.0);
        else
            return 200;
    }

    height: {
        if (ListView.view && ListView.view.height >= 240)
            return ListView.view.height;
        else
            return 240;
    }

    property alias city: cityLabel.text
    property int hours
    property int minutes
    property int seconds
    property real shift
    property bool night: false
    property bool internationalTime: true //Unset for local time

    function timeChanged() {
        var date = new Date;
        hours = internationalTime ? date.getUTCHours() + Math.floor(clock.shift) : date.getHours()
        night = ( hours < 7 || hours > 19 )
        minutes = internationalTime ? date.getUTCMinutes() + ((clock.shift % 1) * 60) : date.getMinutes()
        seconds = date.getUTCSeconds();
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Item {
        anchors.centerIn: parent
        width: 200; height: 240

        Image { id: background; source: \"clock.png\"; visible: clock.night == false }
        Image { source: \"clock-night.png\"; visible: clock.night == true }

        Image {
            x: 92.5; y: 27
            source: \"hour.png\"
            transform: Rotation {
                id: hourRotation
                origin.x: 7.5; origin.y: 73;
                angle: (clock.hours * 30) + (clock.minutes * 0.5)
                Behavior on angle {
                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                }
            }
        }

        Image {
            x: 93.5; y: 17
            source: \"minute.png\"
            transform: Rotation {
                id: minuteRotation
                origin.x: 6.5; origin.y: 83;
                angle: clock.minutes * 6
                Behavior on angle {
                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                }
            }
        }

        Image {
            x: 97.5; y: 20
            source: \"second.png\"
            transform: Rotation {
                id: secondRotation
                origin.x: 2.5; origin.y: 80;
                angle: clock.seconds * 6
                Behavior on angle {
                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                }
            }
        }

        Image {
            anchors.centerIn: background; source: \"center.png\"
        }

        Text {
            id: cityLabel
            y: 210; anchors.horizontalCenter: parent.horizontalCenter
            color: \"white\"
            font.family: \"Helvetica\"
            font.bold: true; font.pixelSize: 16
            style: Text.Raised; styleColor: \"black\"
        }
    }
}"
    }

    Slide {
        title: "Otras modulos importantes"
        fontScale: parent.fontScale
        delayPoints: true
        content: [
            "Qt Network",
            "Qt SQL",
            "Qt Location",
            "Qt Bluetooth",
            "Qt Multimedia",
            "..."
        ]
    }

    Slide {
        title: "Qt 3D"
        fontScale: parent.fontScale
        delayPoints: true

        content: [
            "Motor gráfico",
            "Paradigma basado en aspectos",
            "Diseñado para simulaciones",
            "APIs para C++ y Qt Quick",
            "Qt 3D Studio"
        ]
    }

    Slide {
        centeredText: "<h1>¿Preguntas?</h1>"
    }
}
