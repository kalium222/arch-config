import QtQuick
import Quickshell.Services.Pipewire

import qs.modules.bar
import qs.theme
import "../../../js/ui_tools.js" as Js

CapsuleText {
    id: root
    property PwNode sink: Pipewire.defaultAudioSink
    property var volume_icon_list: ["", "", ""]
    property var muted_icon: ""
    hover_background_color: Theme.bar.capsules.audio
    text_color: mouser.containsMouse ? Theme.bar.capsules.hover_content_color
    : sink.audio.muted ? Theme.bar.capsules.inactive_color
    : Theme.bar.capsules.audio

    text: {
        const audio = sink.audio;
        if (audio.muted)
            return muted_icon;
        const volume = sink.audio.volume;
        const icon = Js.getByProgress(volume_icon_list, volume);
        const v = Math.round(volume * 100);
        return `${icon}  ${v}%`;
    }

    onClicked: {
        const audio = sink.audio;
        audio.muted = !audio.muted;
    }

    PwObjectTracker {
        objects: [root.sink]
    }
}
