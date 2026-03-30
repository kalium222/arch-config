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

PanelWindow {
    id: root
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: Theme.bar.height
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top

    HyprWorkspaces {
        anchors.left: parent.left
        anchors.leftMargin: 5
    }

    component CapsuleRow: RowLayout {
        spacing: Theme.bar.capsules.spacing
        anchors {
            verticalCenter: parent.verticalCenter
            margins: Theme.bar.capsules.margins
        }
    }

    // Middle Components
    CapsuleRow {
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: ""
            color: "#89DCEB"
            font.pointSize: 17
        }
        Datetime {}
    }
    // Right Components
    CapsuleRow {
        anchors.right: parent.right
        SystemTray {}
        Network {}
        Bluetooth {}
        Audio {}
    }
}
