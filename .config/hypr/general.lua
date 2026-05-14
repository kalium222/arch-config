-- general config

local general = {
  border_size = 2,
  gaps_in = 5,
  gaps_out = 20,
  col = {
    active_border = {
      colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45
    },
    inactive_border = "rgba(595959aa)",
  },
  layout = "scrolling",
  resize_on_border = true,
}

local input = {
  kb_layout = "us",
  kb_options = "caps:swapescape",
  follow_mouse = 2,
  sensitivity = 0,
}

local cursor = {
  no_warps = true,
  enable_hyprcursor = true,
  inactive_timeout = 3,
}

local misc = {
  disable_hyprland_logo = true,
  disable_splash_rendering = true,
  disable_autoreload = true,
  force_default_wallpaper = true,
}

hl.config {
  general = general,
  input = input,
  cursor = cursor,
  misc = misc,
}
