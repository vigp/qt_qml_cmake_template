import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt-Qml-CMake-Template-Project")

    Image {
        id: img
        source: "qrc:/images/qt_logo.png"
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
    }

    Image {
        source: "qrc:/images/cmake_logo.png"
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
    }
}
