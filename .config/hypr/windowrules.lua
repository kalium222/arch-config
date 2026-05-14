-- window rules

---@class windowrule
---@field [1] table match
---@field float? boolean float
---@field center? boolean center
---@field size? table size
---@field opacity? string opacity

---@type windowrule[]
local rules = {
  -- small tools
  {
    { class = "^nemo$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
  },
  {
    { class = "^org.pulseaudio.pavucontrol$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
  },
  {
    { class = "^nm-connection-editor$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
  },
  {
    { class = "^qemu$" },
    float = true,
    opacity = "1 override",
  },
  {
    { class = "^virt-manager$" },
    float = true,
    opacity = "1 override",
  },
  {
    { class = "^com.obsproject.Studio$" },
    float = true,
    opacity = "1 override",
  },
  {
    { class = "^org.remmina.Remmina$" },
    float = true,
    opacity = "1 override",
  },
  {
    { class = "^blender$" },
    float = true,
    opacity = "1 override",
  },
  {
    { class = "^eden$" },
    float = true,
    opacity = "1 override",
  },
  {
    { class = "^org.godotengine.Editor$" },
    float = true,
    opacity = "1 override",
  },
  {
    { class = "^steam_app_3548580$" },
    opacity = "1 override",
  },
}

for _, r in ipairs(rules) do
  hl.window_rule {
    match = r[1],
    float = r.float,
    center = r.center,
    size = r.size,
    opacity = r.opacity,
  }
end
