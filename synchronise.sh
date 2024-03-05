#!/bin/bash

THIS_DIR="$(pwd)"
CONFIG_DIR="$HOME/.config"
DIRS=("hypr" "kitty" "neofetch" "tmux" "tmux-powerline" "waybar" "wofi")

ln -f .bashrc "$HOME/.bashrc"

for dir in "${DIRS[@]}"; do
    mkdir -p "${CONFIG_DIR}/${dir}"

    find "${THIS_DIR}/.config/${dir}/" -type f -exec ln -f {} "${CONFIG_DIR}/${dir}/" \;
done

