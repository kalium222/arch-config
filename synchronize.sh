#!/bin/bash

# synchronize .config
#
# Define the source and target directories
source_dir="$(pwd)/.config"
target_dir="$HOME/.config"
#
# Function to create symbolic links recursively
sync_config() {
    local source="$1"
    local target="$2"
    # Create target directory if it doesn't exist
    mkdir -p "$target"
    # Loop through files and directories in source directory
    for item in "$source"/*; do
        local basename="$(basename "$item")"
        local target_item="$target/$basename"
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
sync_config "$source_dir" "$target_dir"

# synchronize the other things
files=(".bashrc" ".zshrc" ".shrc" ".condarc" ".Xmodmap")
for file in "${files[@]}"; do
    ln -sf "$(pwd)/$file" "$HOME/$file"
done

