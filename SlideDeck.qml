import QtQuick 2.8
import Qt.labs.presentation 1.0

Presentation {
    id: presentation

    property bool delayPoints: true
    property real fontScale: 0.7

    Image {
        anchors.fill: parent
        source: "qt-1.png"
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

    SlideCounter {
        anchors.right: undefined
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Clock {}

    Slide {
        centeredText: "<h1>Introducción a Qt</h1><br>" +
                      "Jesús Fernández (<a href=\"mailto:jesus.fernandez@qt.io\">jesus.fernandez@qt.io</a>)"
    }

    Slide {
        id: whoami
        title: "¿Quién soy?"
        delayPoints: presentation.delayPoints
        Rectangle {
            anchors.fill: parent
            Image {
                id: whoamiImage
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: whoami.content[whoami._pointCounter] ? whoami.content[whoami._pointCounter] : ""
            }
        }

        content: [
            "gijon.jpg",
            "spectrum.jpg",
            "virus.jpg",
            "printer.jpg",
            "asphalt.jpg",
            "tqtc.jpg"
        ]
    }

    Slide {
        title: "¿Qué es Qt?"
        delayPoints: presentation.delayPoints
        content: [
            "Framework C++",
            "Multiplataforma",
            "Bindings a otros lenguajes",
            "Open source",
        ]
    }

    Slide {
        id: storySlide
        title: "Historia de Qt: " + content[_pointCounter]
        delayPoints: presentation.delayPoints

        Rectangle {
            anchors.fill: parent
            Image {
                id: storyImage
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit

                states: [
                    State {
                        when: storySlide.content[storySlide._pointCounter] === "Quasar Toolkit"
                        PropertyChanges { target: storyImage; source: "ParkBench.jpg" }
                    },
                    State {
                        when: storySlide.content[storySlide._pointCounter] === "Trolltech"
                        PropertyChanges { target: storyImage; source: "trolltech.png" }
                    },
                    State {
                        when: storySlide.content[storySlide._pointCounter] === "Nokia"
                        PropertyChanges { target: storyImage; source: "qt-nokia.png" }
                    },
                    State {
                        when: storySlide.content[storySlide._pointCounter] === "Digia"
                        PropertyChanges { target: storyImage; source: "digia-qt.png" }
                    },
                    State {
                        when: storySlide.content[storySlide._pointCounter] === "The Qt Company"
                        PropertyChanges { target: storyImage; source: "qt-logo.png" }
                    }
                ]
            }
        }

        content: [
            "Quasar Toolkit",
            "Trolltech",
            "Nokia",
            "Digia",
            "The Qt Company"
        ]
    }

    Slide {
        title: "The Qt Project"
        fontScale: parent.fontScale

        Image {
            anchors.centerIn: parent
            source: "qt-contributions-5-9.png"
        }
    }

    Slide {
        title: "¿Qué puedo hacer con Qt?"
        fontScale: parent.fontScale

        content: [
            "GUIs (QtWidgets, QtQuick, Qt3DStudio)",
            "Aplicaciones de consola (QtCore)",
            "Servidores (QtNetwork, QtWebsockets)",
            "Juegos y herramientas de visualización (QtOpenGL, Qt3D, QtGamepad)",
            "Entornos de usuario (*)",
            "...",
            "Multiplataforma (Qt Platform Abstraction)",
        ]
    }

    Slide {
        title: "Plataformas soportadas"
        content: [
            "Escritorio:",
            " Windows",
            " OS X",
            " Linux",
            "Móviles:",
            " Android",
            " iOS & WatchOS",
            " WinRT",
            " Dispositivos empotrados:",
            " Raspberry Pi 0, 1, 2, 3",
            " Nvidia Tegra",
            "... (qt5/qtbase/mkspecs)",
        ]
    }

    Slide {
        title: "¿Quién usa Qt?"

        Component {
            id: delegate
            Image {
                id: wrapper
                width: pathView.width; height: pathView.height
                source: icon
            }
        }

        LaunchScreen {
            clip: true
            anchors.fill: parent
            model: ListModel {
                ListElement { icon: "google-earth.jpg" }
                ListElement { icon: "maya.jpg" }
                ListElement { icon: "lg.jpg" }
                ListElement { icon: "rimac.png" }
                ListElement { icon: "battlenet.png" }
                ListElement { icon: "KDE.png" }
                ListElement { icon: "lxqt.jpg" }
                ListElement { icon: "mathematica.png" }
                ListElement { icon: "crytek.jpg" }
                ListElement { icon: "asphalt.jpg" }
                ListElement { icon: "hp.jpg" }
                ListElement { icon: "sky.png" }
                ListElement { icon: "tableau.png" }
                ListElement { icon: "dcc.png" }
                ListElement { icon: "autoio.jpg" }
                ListElement { icon: "navico.jpg" }
                ListElement { icon: "Orcamp.jpg" }
                ListElement { icon: "Imaginando.jpg" }
            }
        }
    }

    Slide {
        title: "¿Qué me ofrece Qt como desarrollador?"
        delayPoints: presentation.delayPoints
        content: [
            "Buena documentación",
            "Sencillez",
            "Resultados rápidos",
            "Robustez",
            "Ejecutar el mismo código en diferentes plataformas",
            "Aplicaciones asíncronas"
        ]
        Image {
            source: "cpp.png"
            anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
            fillMode: Image.PreserveAspectFit
            z: -1
        }
    }

    Slide  {
        title: "QtCreator"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qtcreator.png"
        }
    }
    
    Slide {
        title: "QObject"
        delayPoints: presentation.delayPoints

        Image {
            source: "qobject.jpg"
            anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
            fillMode: Image.PreserveAspectFit
            z: -1
        }

        content: [
            "Son únicos ➜ No se pueden copiar",
            "Forman parte de la jerarquía de objetos",
            "Se pueden conectar entre ellos (signals y slots)",
            "Pueden vivir en un hilo",
            "Pueden tener funciones invocables",
            "No es una clase abstracta",
        ]
    }

    CodeSlide {
        title: "Signals y slots"

        code: "class ClassA : public QObject
{
    Q_OBJECT
public:
    explicit ClassA(QObject *parent = nullptr);
signals:
    void finished(bool error);
public slots:
    void start();
    // ...
};"
    }

    Slide {
        title: "MOC (MetaObject Compiler)"
        Image {
            source: "uglyduckling.jpg"
            anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
            fillMode: Image.PreserveAspectFit
            z: -1
        }

        delayPoints: presentation.delayPoints
        content: [
            "No necesita RTTI",
            "Require Q_OBJECT",
            "Genera metainformación de las clases (meta-object)",
            " Nombre de la clase y los elementos",
            " Muestra información de la herencia",
            " Traducción - QObject::tr",
            " Acceso a las Q_PROPERTY de la clase"
        ]
    }

    Slide {
        title: "MOC (MetaObject Compiler) - 2"
        Text {
            anchors.centerIn: parent
            text: "<a href=\"https://youtu.be/NunSS_ppDsI?t=2137\">Quizá en un futuro no sea necesario ≥ C++2x: Metaclases"
            font.pixelSize: parent.baseFontSize
            font.family: parent.fontFamily
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.openUrlExternally("https://youtu.be/NunSS_ppDsI?t=2137");
            }
        }

    }

    Slide {
        title: "Signals y slots"

        content: [
            "Permiten conexiones entre QObjects",
            "Pueden ser conectados en tiempo de ejecución",
            "Se pueden desconectar",
            "Permiten conexiones asíncronas",
            "Permiten conectar diferentes hilos de una manera segura"
        ]
    }

    CodeSlide {
        title: "Signals y slots"

        code: "int main(int argc, char **argv) {
    QCoreApplication app(argc, argv);
    ClassA object;
    auto timer = new QTimer(&app);
    QObject::connect(timer, SIGNAL(timeout()), &object, SLOT(start()));
    QObject::connect(timer, &QTimer::timeout, timer, &QTimer::deleteLater);
    QObject::connect(&object, &ClassA::finished, [&](bool ok) {
        if (ok) {
            QObject::disconnect(timer, SIGNAL(timeout()), &object, SLOT(start()));
            QObject::metaObject()->invokeMethod(&app, \"quit\");
        } else { timer->start(1000); }
    });
    timer.start(1000);
    return app.exec();
}"
    }

    Slide {
        title: "QtWidgets"
        delayPoints: presentation.delayPoints
        Image {
            source: "widgets.png"
            anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
            fillMode: Image.PreserveAspectFit
            z: -1
        }
        content: [
            "Libreria para hacer UIs",
            "Se basa en el concepto de layouts",
            "Sus clases heredan de QWidget",
            "Se pueden personalizar usando un subconjunto de CSS",
            "Aunque antiguas no han sido abandonadas",
            "Se pueden crear archivos .ui",
        ]
    }

    Slide {
        title: "QtWidgets - QtDesigner"
        Image {
            source: "designer.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }

    Slide {
        title: "QtWidgets - MVC"
        delayPoints: presentation.delayPoints
        content: [
            "MVC: Model-View-Component",
            "Permite separar los datos de la vista",
            "Permite reusar modelos en diferentes vistas",
            "Modelos: QAbstractItemModel, QAbstractProxyModel",
            "Vista: QListView, QTableView, QTreeView (QAbstractItemView)",
            "Controlador: QItemDelegate",
        ]
    }

    Slide {
        title: "QtQuick"
        delayPoints: presentation.delayPoints
        content: [
            "QML: Qt Markup Language",
            "Lenguaje declarativo",
            "Muy flexible",
            "Interacción muy sencilla con C++",
            "Se puede usar Javascript",
            "QML no está limitado a interfaces de usuario"
        ]
    }

    Slide {
        title: "Qt Quick Designer"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qtquickdesigner.png"
        }
    }

    LiveCodeSlide {
        title: "QML"
    }

    Slide {
        centeredText: "<h1>¡Muchas gracias!</h1><h2>¿Preguntas?</h2>" +
                      "<br /><a href=\"https://github.com/jsfdez/usingstdcpp2017\">"+
                      "https://github.com/jsfdez/usingstdcpp2017</a>"
    }
}
