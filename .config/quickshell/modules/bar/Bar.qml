import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import qs.theme
import qs.modules.bar.audio
import qs.modules.bar.bluetooth
import qs.modules.bar.datetime
import qs.modules.bar.network
import qs.modules.bar.systemtray
import qs.modules.bar.privacy

PanelWindow {
    id: root
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: Theme.bar.height
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top

    component CapsuleRow: RowLayout {
        spacing: Theme.bar.capsules.spacing
        anchors {
            verticalCenter: parent.verticalCenter
            margins: Theme.bar.capsules.margins
        }
    }

    // Left Components
    CapsuleRow {
        anchors.left: parent.left
        Audio {}
        Bluetooth {}
        // Network {}
    }
    // Middle Components
    CapsuleRow {
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: ""
            color:"#89DCEB"
            font.pointSize: 17
        }
        HyprWorkspaces {}
        Datetime {}
    }
    // Right Components
    // CapsuleRow {
    //     anchors.right: parent.right
    //     SystemTray {}
    // }
}
