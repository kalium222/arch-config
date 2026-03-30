import QtQuick
import Quickshell

import qs.modules.bar

CapsuleText {
    text: Qt.formatDateTime(clock.date, "hh:mm ddd, MM-d")
    background_color: Qt.rgba(0.4, 0.4, 0.4, 0.5)
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
