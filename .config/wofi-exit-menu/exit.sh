#!/usr/bin/env bash
# ⚛ ⚙  🞋

conf=~/.config/wofi-exit-menu

choice=$(printf "🞋    lock\n֍    logout\n⚙    suspend\n⚛    reboot\n⏻    shutdown" | wofi -d -c $conf/main_config -s $conf/style.css)
if [[ $choice == "🞋    lock" ]];then
    #bash ~/.config/system_scripts/wayland_session_lock
    notify-send "TODO!"
elif [[ $choice == "֍    logout" ]];then
    #pkill -KILL -u "$USER"
    notify-send "TODO!"
elif [[ $choice == "⚙    suspend" ]];then
    systemctl suspend
elif [[ $choice == "⚛    reboot" ]];then
    systemctl reboot
elif [[ $choice == "⏻    shutdown" ]];then
    systemctl poweroff
fi
