import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

import qs.modules.bar

RowLayout {
    Layout.rightMargin: 10
    CapsuleText {
        id: screen_portal_identifier
        // pw-cli list Node | rg xdg-desktop-portal-hyprland
        // to find the node
        property PwNode portal_node: Pipewire.nodes.values.find(n => n.name === "xdg-desktop-portal-hyprland")
        // visible: !(portal_node === null)
        visible: false
        text: ""
        text_color: "red"
        text_size: 9
        color: "black"
        Layout.preferredHeight:20
        Layout.preferredWidth:20

        state: "hide"
        // Component.onCompleted: screen_portal_identifier.state = "hide"
        states: [
            State {
                name: "show"
                PropertyChanges {
                    screen_protal_identifier.scale: 1
                    screen_protal_identifier.opacity: 1
                    // screen_protal_identifier.visible: true
                }
            },
            State {
                name: "hide"
                PropertyChanges {
                    screen_protal_identifier.scale: 0
                    screen_protal_identifier.opacity: 0
                    // screen_protal_identifier.visible: false
                }
            }
        ]
        // transitions: [
        //     Transition {
        //         from: "appear"; to: "disappeared"
        //     }
        // ]
    }
    PwObjectTracker {
        objects: [screen_portal_identifier.portal_node]
    }
}
