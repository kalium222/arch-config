#!/usr/bin/env bash
# ⚛ ⚙  🞋

conf=~/.config/wofi-menus

choice=$(printf "🞋    lock\n\
֍    logout\n\
⚙    suspend\n\
⚛    reboot\n\
⏻    shutdown\n\
" \
    | wofi -d  \
    -c $conf/quit_config \
    -s $conf/style.css)
if [[ $choice == "🞋    lock" ]];then
    hyprlock
elif [[ $choice == "֍    logout" ]];then
    #pkill -KILL -u "$USER"
    notify-send "TODO!"
elif [[ $choice == "⚙    suspend" ]];then
    systemctl suspend
elif [[ $choice == "⚛    reboot" ]];then
    systemctl reboot
elif [[ $choice == "⏻    shutdown" ]];then
    systemctl poweroff
else
    notify-send "No such option!"
fi
