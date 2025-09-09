#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi-powermenu"

# CMDs
lastlogin="`last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7`"
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
hibernate='󱋑'
shutdown=''
reboot=''
lock=''
suspend='⏾'
logout='󰍃'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg " Last Login: $lastlogin |  Uptime: $uptime" \
        -theme $dir/config.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
        shutdown now
        ;;
    $reboot)
        reboot
        ;;
    $hibernate)
        systemctl hibernate
        ;;
    $lock)
        hyprlock
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        hyprctl dispatch exit 1
        ;;
esac
