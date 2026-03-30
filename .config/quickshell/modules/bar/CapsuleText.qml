import QtQuick
import qs.modules.bar
import qs.theme

Capsule {
    id: root
    property alias text: text_content.text
    property alias text_color: text_content.color
    property alias text_size: text_content.font.pointSize
    text_color: root.mouser.containsMouse ? hover_content_color : content_color
    Text {
        id: text_content
        text: "text content"
        anchors.centerIn: parent
        font.family: Theme.font_family
        font.pointSize: 10
        padding: 10
    }
}
