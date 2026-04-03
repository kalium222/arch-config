import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

import qs.modules.bar

Capsule {
    RowLayout {
        Layout.rightMargin: 10

        Rectangle {
            Layout.preferredWidth: content.implicitWidth
            Layout.fillHeight: true
            Text {
                id: content
                anchors.centerIn: parent
                text: "todo: privacy"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    const state = screen_portal_identifier.state;
                    if (state === "HIDE")
                        screen_portal_identifier.state = "SHOW";
                    else
                        screen_portal_identifier.state = "HIDE";
                }
            }
        }
        CapsuleText {
            id: screen_portal_identifier
            // pw-cli list Node | rg xdg-desktop-portal-hyprland
            // to find the node
            property PwNode portal_node: Pipewire.nodes.values.find(n => n.name === "xdg-desktop-portal-hyprland")
            text: "󱒃"
            text_color: "red"
            text_size: 9
            leftPadding: 11.5
            color: "black"

            onClicked: state = "HIDE"
            state: "SHOW"
            states: [
                State {
                    name: "SHOW"
                    PropertyChanges {
                        screen_portal_identifier {
                            scale: 1
                            opacity: 1
                            // visible: true
                        }
                    }
                },
                State {
                    name: "HIDE"
                    PropertyChanges {
                        screen_portal_identifier {
                            scale: 0
                            opacity: 0
                            // visible: false
                        }
                    }
                }
            ]
            transitions: [
                Transition {
                    from: "HIDE"
                    to: "SHOW"
                    SequentialAnimation {
                        // PropertyAction {
                        //     target: screen_portal_identifier
                        //     property: "visible"
                        //     value: true
                        // }
                        NumberAnimation {
                            target: screen_portal_identifier
                            properties: "scale, opacity"
                            from: 0
                            to: 1
                        }
                    }
                },
                Transition {
                    from: "SHOW"
                    to: "HIDE"
                    SequentialAnimation {
                        NumberAnimation {
                            target: screen_portal_identifier
                            properties: "scale, opacity"
                            to: 0
                            duration: 200
                        }
                        // PropertyAction {
                        //     target: screen_portal_identifier
                        //     property: "visible"
                        //     value: false
                        // }
                    }
                }
            ]
        }
        PwObjectTracker {
            objects: [screen_portal_identifier.portal_node]
        }
    }
}
