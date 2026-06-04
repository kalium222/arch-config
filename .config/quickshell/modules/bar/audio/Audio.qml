import QtQuick
import Quickshell.Services.Pipewire

import qs.modules.bar
import qs.theme
import "../../../js/ui_tools.js" as Js

CapsuleText {
    id: root
    property PwNode sink: Pipewire.defaultAudioSink
    hover_background_color: Theme.bar.capsules.audio
    text_color: mouser.containsMouse ? Theme.bar.capsules.hover_background_color : sink.audio.muted ? Theme.bar.capsules.inactive_color : Theme.bar.capsules.audio

    text: {
        const audio = sink.audio;
        const icon_list = ["", "", ""];
        if (audio.muted)
            return "";
        const volume = sink.audio.volume;
        const icon = Js.getByProgress(icon_list, volume);
        const v = Math.round(volume * 100);
        return `${icon}  ${v}%`;
    }

    onClicked: {
        const audio = sink.audio;
        audio.muted = !audio.muted;
    }


    WheelHandler {
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: event => {
            const step = 0.05
            const audio = root.sink.audio;
            const delta = event.angleDelta.y > 0 ? step : -step;
            const next = Math.max(0, Math.min(1, audio.volume + delta));
            audio.volume = next;
        }
    }

    PwObjectTracker {
        objects: [root.sink]
    }
}
