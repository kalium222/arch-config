import QtQuick
import Quickshell.Bluetooth

import qs.modules.bar
import qs.theme

CapsuleText {
    id: root
    property BluetoothAdapter adapter: Bluetooth.defaultAdapter
    property int connected_num: adapter.devices.values.filter(dev=>dev.connected).length
    hover_background_color: Theme.bar.capsules.bluetooth
    text_color: mouser.containsMouse? Theme.bar.capsules.hover_content_color
    : adapter.enabled ? Theme.bar.capsules.bluetooth
    : Theme.bar.capsules.inactive_color

    text: {
        const bluetooth_icon = "󰂯"
        if (connected_num == 0)
            return bluetooth_icon
        else
            return `${bluetooth_icon} ${connected_num} connected`
    }
    onClicked: adapter.enabled = !adapter.enabled
}
