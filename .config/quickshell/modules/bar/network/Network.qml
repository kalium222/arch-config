import Quickshell.Networking

import qs.modules.bar
import qs.theme
import "../../../js/ui_tools.js" as Js

CapsuleText {
    property NetworkDevice adapter: {
        Networking.devices.values.find(d => d.connected);
    }
    hover_background_color: Theme.bar.capsules.network
    text_color: mouser.containsMouse ? Theme.bar.capsules.hover_content_color : Networking.connectivity === 4 ? Theme.bar.capsules.network : Theme.bar.capsules.inactive_color
    text: {
        if (Networking.connectivity != 4)
            return Networking.connectivity;
        const t = adapter.type;
        const icon_list = ["󰤟", "󰤢", "󰤥", "󰤨"];
        let icon;
        let network = adapter.networks.values[0]
        switch (t) {
        case 1: // wifi
            icon = Js.getByProgress(icon_list, network.signalStrength);
            break;
        case 2: // ethernet
            icon = "";
            break;
        default: // unknown
            icon = "󰀂";
            break;
        }
        return `${icon}  ${network.name}`
    }
}
