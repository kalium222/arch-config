#!/usr/bin/env python3

import subprocess

"""
    otd setoutputmode "Wacom CTL-472" OpenTabletDriver.Desktop.Output.LinuxArtistMode
    setdisplayarea <tablet> <width> <height> <x> <y>            Sets the display area
    settabletarea <tablet> <width> <height> <x> <y> <rotation>  Sets the tablet area
    setoutputmode <tablet> <path>                               Sets the output mode
"""

TABLET_NAME = "Wacom CTL-472"
TABLET_W = 152
TABLET_H = 95
TABLET_X_CENTER = TABLET_W / 2
TABLET_Y_CENTER = TABLET_H / 2
RATIO = TABLET_W / TABLET_H


def run_slurp():
    res = subprocess.run(
        ["slurp", "-d", "-f", "%x %y %w %h"], capture_output=True, text=True
    )
    x, y, w, h = map(float, res.stdout.strip().split())
    return x, y, w, h


def reset_map():
    subprocess.run(["otd", "applypreset", "default"])


def set_map(
    x_center: str,
    y_center: str,
    w: str,
    h: str,
    rotate: str,
    tablet_w: str,
    tablet_h: str,
):
    subprocess.run(
        [
            "otd",
            "settabletarea",
            TABLET_NAME,
            str(tablet_w),
            str(tablet_h),
            str(TABLET_X_CENTER),
            str(TABLET_Y_CENTER),
            str(rotate),
        ]
    )
    subprocess.run(
        [
            "otd",
            "setdisplayarea",
            TABLET_NAME,
            str(w),
            str(h),
            str(x_center),
            str(y_center),
        ]
    )
    subprocess.run(
        [
            "otd",
            "setoutputmode",
            TABLET_NAME,
            "OpenTabletDriver.Desktop.Output.LinuxArtistMode",
        ]
    )


def compute_map(x: float, y: float, w: float, h: float):
    if w > h:
        h = w / RATIO
        rotate = 0.0
        tablet_w = TABLET_W
        tablet_h = TABLET_H
    else:
        w = h / RATIO
        rotate = 90.0
        tablet_w = TABLET_H
        tablet_h = TABLET_W

    x_center = x + w / 2
    y_center = y + h / 2

    return x_center, y_center, w, h, rotate, tablet_w, tablet_h


if __name__ == "__main__":
    reset_map()
    x, y, w, h = run_slurp()
    x_center, y_center, w, h, rotate, tablet_w, tablet_h = compute_map(x, y, w, h)
    set_map(x_center, y_center, w, h, rotate, tablet_w, tablet_h)
