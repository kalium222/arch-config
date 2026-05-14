-- decorations

-- cursor
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- decoration
local decoration = {
  rounding = 10,
  active_opacity = 0.9,
  inactive_opacity = 0.8,
  blur = {
    enabled = true,
    size = 3,
    passes = 1,
  },
}

hl.config {
  decoration = decoration,
}

-- animation

---@class animation
---@field [1] string leaf
---@field [2]? boolean enabled
---@field [3]? number speed
---@field [4]? string curve
---@field style? string style

---@type animation[]
local animations = {
  { "windowsOut",       style = "popin 80%" },
  { "workspaces",       style = "slidevert" },
  { "specialWorkspace", style = "fade" },
}

for _, a in ipairs(animations) do
  hl.animation {
    leaf = a[1],
    enabled = a[2] or true,
    speed = a[3] or 10,
    bezier = a[4] or "default",
    style = a.style,
  }
end
