-- touchpad

local touchpad = {
  natural_scroll = true,
}

hl.config {
  input = {
    touchpad = touchpad,
  }
}


---@class gesture
---@field [1] integer fingers
---@field [2] string direction
---@field [3] string|function action

---@type gesture[]
local gestures = {
  { 3, "pinch",    "fullscreen" },
  { 3, "vertical", "workspace" },
  { 4, "up",       "float" },
  { 4, "down",     "close" },
}

for _, g in ipairs(gestures) do
  hl.gesture {
    fingers = g[1],
    direction = g[2],
    action = g[3],
  }
end
