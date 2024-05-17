#!/usr/bin/env bash
# ⚛ ⚙  🞋

conf=~/.config/wofi-menus

choice=$(printf "\
🞋    lock\n\
֍    logout\n\
⚙    suspend\n\
⚛    reboot\n\
⏻    shutdown\n\
" \
    | wofi -d  \
    -c $conf/tweaks_config \
    -s $conf/style.css)
if [[ $choice == "🞋    lock" ]];then
    notify-send "TODO!"
elif [[ $choice == "֍    logout" ]];then
    notify-send "TODO!"
elif [[ $choice == "⚙    suspend" ]];then
    notify-send "TODO!"
elif [[ $choice == "⚛    reboot" ]];then
    notify-send "TODO!"
elif [[ $choice == "⏻    shutdown" ]];then
    notify-send "TODO!"
fi
