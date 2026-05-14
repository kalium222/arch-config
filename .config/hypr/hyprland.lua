-- hyprland config in lua!

-- define global applications
Menu              = "rofi -show drun"
FileManger        = "nemo"
Terminal          = "ghostty -e zsh -ic zellij_wrapper"

hl.on("hyprland.start", function ()
  hl.exec_cmd("qs")
  hl.exec_cmd("dunst")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("fcitx5 -D")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

require"general"
require"binds"
require"decoration"
require"monitors"
require"windowrules"
