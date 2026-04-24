pragma Singleton
import Quickshell
import QtQuick

Singleton {
    property string font_family: "MonofurNerdFont"
    property var bar: QtObject {
        property int height: 30
        property var capsules: QtObject {
            property color background_color: Qt.rgba(0.4, 0.4, 0.4, 0.25)
            property color hover_background_color: Qt.rgba(120, 120, 120)
            property color content_color: "#dddddd"
            property color hover_content_color: "#000000"
            property int margins: 3
            property int spacing: 4

            property color inactive_color: Qt.rgba(0.62, 0.62, 0.62)
            property color audio: "#f2cdcd"
            property color bluetooth: "#89b4fa"
            property color network: "#94e2d5"

            property color battery: Qt.rgba(0.59, 0.60, 0.16)
            property color battery_charging: "#a6e3a1"
            property color battery_urgent: "#f53c3c"
        }
        property var workspace: QtObject {
            property color inactive_color: Qt.rgba(0.62, 0.62, 0.62)
            property color active_color: Qt.rgba(224, 224, 224)
            property color urgent_color: "#f38ba8"
        }
    }
}
