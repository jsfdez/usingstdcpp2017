import QtQuick 2.8
import Qt.labs.presentation 1.0

Presentation {
    id: presentation

    SlideCounter {}
    Clock {}

    Slide {
        centeredText: "<h1>Introducción a Qt</h1><br>" +
                      "by Jesús Fernández (<a href=\"mailto:jesus.fernandez@qt.io\">jesus.fernandez@qt.io</a>)"
    }

    Slide {
        title: "¿Quién soy?"

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
        title: "Qué es Qt?"
        delayPoints: true

        content: [
            "Código abierto",
            "Framework C++",
            "Multiplataforma",
            "¿Qué puedo hacer con Qt?",
            " GUIs (QtWidgets, QtQuick, Qt3DStudio)",
            " Aplicaciones de consola (QtCore)",
            " Aplicaciones de servidor (QtNetwork)",
            " Juegos (QtOpenGL, Qt3D)",
            " ..."
        ]
    }

    CodeSlide {
        title: "QCoreApplication/QGuiApplication/QApplication"
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
        delayPoints: true

        content: [
            "Clase base QWidget",
            "Estándar para crear interfaces en Qt",
            "Usa QPainter para \pintar\" las UIs",
            " Modo imperativo",
            " Usa principalmente la CPU",
            " No aprovecha por completo la acceleración gráfica por hardware",
            "Qt Designer + QtCreator",
            "Usa el patrón Modelo-Vista-Controlador",
            "Muy estable",
            "Muy usado por aplicaciones existentes"
        ]
    }

    Slide {
        title: "Qt Quick"
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

    Slide {
        title: "Otras modulos importantes"
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
