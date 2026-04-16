import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

import qs.modules.bar

// TODO: show information when hovered
RowLayout {
    id: privacy
    Layout.rightMargin: 10
    property var nodes: Pipewire.nodes.values
    PwObjectTracker {
        objects: privacy.nodes
    }

    component Identifier: CapsuleText {
        // pw-cli ls Node | grep xxx
        // for example, pw-cli ls Node | grep "xdg-desktop-portal"
        // to find the xdg-desktop-portal which are used for screen capture
        id: identifier
        text: "identifier"
        text_color: "red"
        text_size: 9
        leftPadding: 11.5
        color: "black"
        mouser.hoverEnabled: false

        required property list<PwNode> nodes

        states: [
            State {
                name: "SHOW"
                when: identifier.nodes.length != 0
                PropertyChanges {
                    identifier {
                        opacity: 1
                        visible: true
                    }
                }
            },
            State {
                name: "HIDE"
                when: identifier.nodes.length == 0
                PropertyChanges {
                    identifier {
                        Layout.preferredHeight: 0
                        Layout.preferredWidth: 0
                        opacity: 0
                        visible: false
                    }
                }
            }
        ]
        transitions: [
            Transition {
                from: "SHOW"
                to: "HIDE"
                SequentialAnimation {
                    NumberAnimation {
                        target: identifier
                        properties: "opacity, Layout.preferredHeight, Layout.preferredWidth"
                        to: 0
                        duration: 100
                    }
                    PropertyAction {
                        target: identifier
                        property: "visible"
                        value: false
                    }
                }
            }
        ]

    }

    Identifier {
        id: playback_identifier
        nodes: privacy.nodes.filter(n => n.isStream)

        text: ""
        text_color: "lightblue"
    }
    Identifier {
        id: mic_identifier
        nodes: privacy.nodes.filter(n => n.properties["media.class"] === "Stream/Input/Audio")
        
        text: ""
        text_color: "pink"
    }
    Identifier {
        id: screen_portal_identifier
        nodes: privacy.nodes.filter(n => n.name.includes("xdg-desktop-portal"))

        text: "󱒃"
    }
}
