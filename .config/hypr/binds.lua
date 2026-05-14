-- keybind

-- leader key
local main = "SUPER"
local sub = "ALT"

local function toggle_window_to_special()
  local window = hl.get_active_window()
  local workspace = hl.get_active_workspace()
  if not window or not workspace then
    return
  elseif window.workspace.special then
    hl.dispatch(hl.dsp.window.move { workspace = workspace })
  else
    hl.dispatch(hl.dsp.window.move { workspace = "special" })
  end
end

---@class mapping
---@field [1] string key
---@field [2] HL.Dispatcher|function map
---@field flag? table flag

---@type mapping[]
local mappings = {
  -- session
  { main .. "+SHIFT+BackSpace",         hl.dsp.exit() },
  -- window
  { main .. "+BackSpace",               hl.dsp.window.close() },
  -- window focus
  { main .. "+H",                       hl.dsp.focus({ direction = "left" }) },
  { main .. "+L",                       hl.dsp.focus({ direction = "right" }) },
  { main .. "+Tab",                     hl.dsp.window.cycle_next() },
  -- window move
  { main .. "+SHIFT+H",                 hl.dsp.window.move({ direction = "left" }) },
  { main .. "+SHIFT+L",                 hl.dsp.window.move({ direction = "right" }) },
  { main .. "+SHIFT+K",                 hl.dsp.window.move({ workspace = "-1" }) },
  { main .. "+SHIFT+J",                 hl.dsp.window.move({ workspace = "+1" }) },
  { main .. "+mouse:272",               hl.dsp.window.drag(),                                          flag = { mouse = true } },
  -- window resize
  { main .. "+" .. sub .. "+L",         hl.dsp.window.resize({ x = 100, y = 0 }) },
  { main .. "+" .. sub .. "+H",         hl.dsp.window.resize({ x = -100, y = 0 }) },
  { main .. "+" .. sub .. "+K",         hl.dsp.window.resize({ x = 0, y = -100 }) },
  { main .. "+" .. sub .. "+J",         hl.dsp.window.resize { x = 0, y = 100 } },
  { main .. "+mouse:273",               hl.dsp.window.resize(),                                        flag = { mouse = true } },
  -- window misc
  { main .. "+F",                       hl.dsp.window.fullscreen() },
  { main .. "+SHIFT+F",                 hl.dsp.window.float() },
  { main .. "+P",                       hl.dsp.window.pin() },
  -- workspace
  { main .. "+mouse_up",                hl.dsp.focus({ workspace = "m+1" }) },
  { main .. "+mouse_down",              hl.dsp.focus({ workspace = "m-1" }) },
  { main .. "+K",                       hl.dsp.focus({ workspace = "m-1" }) },
  { main .. "+J",                       hl.dsp.focus({ workspace = "m+1" }) },
  { main .. "+backslash",               hl.dsp.workspace.toggle_special() },
  -- { main .. "+SHIFT+backslash",         hl.dsp.exec_cmd("sh ~/.config/hypr/scripts/toggle_window_to_special.sh") },
  { main .. "+SHIFT+backslash",         toggle_window_to_special },
  -- applications
  { main .. "+" .. main .. "_L",        hl.dsp.exec_cmd(Menu),                                         flag = { release = true } },
  { main .. "+RETURN",                  hl.dsp.exec_cmd(Terminal) },
  { main .. "+E",                       hl.dsp.exec_cmd(FileManger) },
  { main .. "+" .. sub .. "+BackSpace", hl.dsp.exec_cmd("~/.config/rofi-powermenu/powermenu.sh") },
  { main .. "+SHIFT+P",                 hl.dsp.exec_cmd("slurp -d | grim -g -") },
  -- misc
  { "XF86AudioRaiseVolume",             hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),  flag = { repeating = true } },
  { "XF86AudioLowerVolume",             hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),  flag = { repeating = true } },
  { "XF86AudioMute",                    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), flag = { locked = true } },
  { "XF86AudioPlay",                    hl.dsp.exec_cmd("mpc toggle"),                                 flag = { locked = true } },
  { "XF86AudioPrev",                    hl.dsp.exec_cmd("mpc prev"),                                   flag = { locked = true } },
  { "XF86AudioNext",                    hl.dsp.exec_cmd("mpc next"),                                   flag = { locked = true } },
  { "XF86MonBrightnessUp",              hl.dsp.exec_cmd("brightnessctl set '5%+'"),                    flag = { locked = true } },
  { "XF86MonBrightnessDown",            hl.dsp.exec_cmd("brightnessctl set '5%-'"),                    flag = { locked = true } },
}

-- num key related
for i = 1, 10 do
  local key = i % 10
  ---@type mapping
  local focus = { main .. "+" .. key, hl.dsp.focus { workspace = i } }
  local move = { main .. "+SHIFT+" .. key, hl.dsp.window.move { workspace = i } }
  table.insert(mappings, focus)
  table.insert(mappings, move)
end

for _, m in ipairs(mappings) do
  hl.bind(m[1], m[2], m.flag or {})
end
