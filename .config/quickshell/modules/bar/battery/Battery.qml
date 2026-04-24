import QtQuick
import Quickshell.Services.UPower

import qs.modules.bar
import qs.theme
import "../../../js/ui_tools.js" as Js

CapsuleText {
    id: root
    property UPowerDevice battery: UPower.displayDevice
    visible: UPower.devices.values.length !== 0
    property var batterty_icon_list: ["", "", "", "", ""]
    property color state_color: {
        if (battery.percentage <= 0.25)
            return Theme.bar.capsules.battery_urgent;
        if (battery.state === 1)
            // charging
            return Theme.bar.capsules.battery_charging;
        else
            return Theme.bar.capsules.battery;
    }
    hover_background_color: state_color
    text_color: mouser.containsMouse ? Theme.bar.capsules.hover_content_color : state_color

    text: {
        const percentage = battery.percentage;
        var icon = Js.getByProgress(batterty_icon_list, percentage);
        if (!UPower.onBattery)
            icon = "";
        if (battery.state === 1)
            icon = "󰂄";
        const p = Math.round(percentage * 100);
        return `${icon}  ${p}%`;
    }
}
