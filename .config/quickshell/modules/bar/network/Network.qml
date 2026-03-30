import QtQuick

import qs.modules.bar
import qs.theme

CapsuleText {
    hover_background_color: Theme.bar.capsules.network
    text_color: mouser.containsMouse? Theme.bar.capsules.hover_content_color
    : Theme.bar.capsules.network
    text: "  wait package"
}
