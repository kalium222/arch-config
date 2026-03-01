#!/bin/bash

# synchronize .config
#
# Define the source and target directories
xdg_config_source="$(pwd)/.config"
xdg_config="$HOME/.config"
#
# Function to create symbolic links recursively
sync_config() {
    local config_source="$1"
    local config_target="$2"

    mkdir -p "$config_target"
    for item in "$config_source"/*; do
        local basename="$(basename "$item")"
        local target_item="$config_target/$basename"
        # If item is a directory, recursively sync it
        if [ -d "$item" ]; then
            sync_config "$item" "$target_item"
        # If item is a file, create symbolic link
        elif [ -f "$item" ]; then
            ln -sf "$item" "$target_item"
        fi
    done
}
#
# Call function to synchronize directories
sync_config "$xdg_config_source" "$xdg_config"

# synchronize the other things
files=(".zshrc" ".shrc" ".Xmodmap" ".xinitrc" ".Xresources")
for file in "${files[@]}"; do
    ln -sf "$(pwd)/$file" "$HOME/$file"
done

