-- monitor related

---@class monitor
---@field [1] string name
---@field [2] string mode
---@field position? string position
---@field scale? number scale

---@type monitor[]
local monitors = {
  { "DP-2", "preferred", position = "0x0" },
  { "HDMI-A-2", "preferred", position = "auto-right"}
}

for _, monitor in ipairs(monitors) do
  hl.monitor {
    output = monitor[1],
    mode = monitor[2] or "preferred",
    position = monitor.position or "auto",
    scale = monitor.scale or "auto",
  }
end
