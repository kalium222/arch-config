import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Widgets

import qs.modules.bar

Capsule {
    // TODO: menu
    id: sysTray
    Layout.preferredWidth: row.implicitWidth + radius
    RowLayout {
        id: row
        anchors.centerIn: parent
        // FIX: margins doesn't work
        // anchors.margins: 10
        Repeater {
            model: SystemTray.items
            IconImage {
                required property var modelData
                source: modelData.icon
                Layout.preferredWidth: 20
                Layout.preferredHeight: 20

                MouseArea {
                    id: mouser
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: e => {
                        const i = parent.modelData;
                        switch (e.button) {
                        case Qt.LeftButton:
                            i.activate();
                            break;
                        case Qt.RightButton:
                            // FIX: cannot goto this branch
                            console.log("right");
                            break;
                        }
                    }
                }
            }
        }
    }
}
