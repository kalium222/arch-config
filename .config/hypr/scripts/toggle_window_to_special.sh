current_workspace_id=$(hyprctl activewindow -j | jq '.workspace.id')

if [ $current_workspace_id = -99 ]; then
    # in special workspace now
    target_id=$(hyprctl activeworkspace -j | jq '.id')
    hyprctl dispatch movetoworkspace $target_id
else
    # in normal workspace now. move to special
    hyprctl dispatch movetoworkspace special
fi
