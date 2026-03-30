import QtQuick
import QtQuick.Layouts
import qs.theme

Rectangle {
    id: root
    color: mouser.containsMouse ? hover_background_color : background_color
    radius: height / 2
    // HACK:
    // to make capsule background wrap the child,
    // need to get the implicitWidth of child
    // TODO:
    // is there better way?
    Layout.preferredHeight: Theme.bar.height - 4
    Layout.preferredWidth: children.length == 1 ? 60 : children[1].implicitWidth
    implicitHeight: Theme.bar.height
    implicitWidth: children.length == 1 ? 60 : children[1].implicitWidth

    property alias mouser: mouser
    property color background_color: Theme.bar.capsules.background_color
    property color hover_background_color: Theme.bar.capsules.hover_background_color
    property color content_color: Theme.bar.capsules.content_color
    property color hover_content_color: Theme.bar.capsules.hover_content_color
    signal clicked

    MouseArea {
        id: mouser
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }
    Behavior on Layout.preferredWidth {
        NumberAnimation {
            duration: 100
            easing.type: Easing.OutBack
        }
    }
    // TODO:
    // - different color onClicked
    // - animation when width change
    //      this wont work
    //      Behavior on width { NumAnimation {duration: 100} }
}
