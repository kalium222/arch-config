#!/bin/bash

THIS_DIR="$(pwd)"
CONFIG_DIR="$HOME/.config"
FILES=(".bashrc" ".zshrc" ".basic_shell_conf" "code-flags.conf")
DIRS=("hypr" "kitty" "neofetch" "tmux" "tmux-powerline"\
    "waybar" "wofi" "wofi-menus" "wofi-menus"\
    "ranger" "docker" "mako")

for file in "${FILES[@]}"; do
    ln -f ${file} "${HOME}/${file}"
done

for dir in "${DIRS[@]}"; do
    mkdir -p "${CONFIG_DIR}/${dir}"
    find "${THIS_DIR}/.config/${dir}/" -type f -exec ln -f {} "${CONFIG_DIR}/${dir}/" \;
done

