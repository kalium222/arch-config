pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import qs.theme

Capsule {
    id: root
    color: "transparent"

    RowLayout {
        id: workspaces
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0

        Repeater {
            // NOTE: read https://quickshell.org/docs/v0.1.0/types/Quickshell/ScriptModel/
            model: ScriptModel {
                values: Hyprland.workspaces.values.filter(ws => ws.monitor == Hyprland.monitorFor(QsWindow.window.screen) && ws.id > 0)
            }

            // NOTE: workspace identifier
            CapsuleText {
                // NOTE: read https://quickshell.org/docs/v0.1.0/types/Quickshell/ObjectModel/
                id: workspace_identifier
                required property var modelData
                Layout.preferredWidth: root.radius * 2
                background_color: "transparent"
                hover_background_color: "white"

                text: ""
                text_size: 7.5
                text_color: modelData.urgent ? Theme.bar.workspace.urgent_color : modelData.active ? Theme.bar.workspace.active_color : Theme.bar.workspace.inactive_color
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
                onClicked: {
                    Hyprland.dispatch(`workspace ${modelData.id}`);
                }
            }
        }
    }
}
