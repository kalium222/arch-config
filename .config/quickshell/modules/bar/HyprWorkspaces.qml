pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import qs.theme

Rectangle {
    id: root
    anchors.verticalCenter: parent.verticalCenter
    implicitHeight: Theme.bar.height - 4
    implicitWidth: workspaces.implicitWidth + 9
    radius: height / 2
    color: Theme.bar.capsules.background_color

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
        }
    }

    RowLayout {
        id: workspaces
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0

        Text {
            text: ""
            bottomPadding: 1.5
            font.pointSize: 16
            color: "#89DCEB"
            Layout.leftMargin: root.radius
            Layout.rightMargin: root.radius - 5
        }
        Repeater {
            // NOTE: read https://quickshell.org/docs/v0.1.0/types/Quickshell/ScriptModel/
            model: ScriptModel {
                values: Hyprland.workspaces.values.filter(ws => ws.monitor == Hyprland.monitorFor(QsWindow.window.screen) && ws.id > 0)
            }
            CapsuleText {
                // NOTE: read https://quickshell.org/docs/v0.1.0/types/Quickshell/ObjectModel/
                required property var modelData
                property bool active: modelData.active
                property bool urgent: modelData.urgent
                Layout.preferredWidth: root.radius * 2
                background_color: "transparent"
                hover_background_color: "white"
                text_color: modelData.urgent ? Theme.bar.workspace.urgent_color : active ? Theme.bar.workspace.active_color : Theme.bar.workspace.inactive_color
                text: ""
                Behavior on text_color {
                    ColorAnimation {
                        duration: 200
                    }
                }
                scale: 0
                opacity: 0
                Behavior on scale {
                    NumberAnimation {
                        duration: 250
                        easing.type: Easing.OutBack
                    }
                }
                Behavior on opacity {
                    NumberAnimation {
                        duration: 200
                    }
                }
                Component.onCompleted: {
                    scale = 1;
                    opacity = 1;
                }
                // TODO: exit transition
                // see https://quickshell.org/docs/v0.2.1/types/Quickshell/Retainable/
                onClicked: {
                    Hyprland.dispatch(`workspace ${modelData.id}`);
                }
            }
        }
    }
}
