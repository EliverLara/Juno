import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

TextField {
    placeholderTextColor: config.color
    palette.text: config.color
    font.pointSize: config.fontSize
    font.family: config.font
    background: Rectangle {
        color: "#1a1e2d"
        radius: 10
        height: width / 9
        width: parent.width
        opacity: 0.5
        anchors.centerIn: parent
    }
}