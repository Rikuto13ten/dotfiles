local wezterm = require 'wezterm'
local c = wezterm.config_builder()

-- font
c.font = wezterm.font_with_fallback {
  {
    family = 'Iosevka Custom Rikuto Code', stretch = 'Expanded', italic = false
  },
  { family = 'PlemolJP', italic = false}
}
c.font_size = 15.0

-- 背景
c.window_background_opacity = 0.7
c.macos_window_background_blur = 30

-- 字間
c.cell_width = 1

-- タブの上のタイトルバーをなくす
c.window_decorations = "RESIZE"

-- status
wezterm.on('update-status', function(window, pane)
  -- 日付のtableを作成する方法じゃないと曜日の取得がうまくいかなかった
  -- NOTE: https://www.lua.org/pil/22.1.html
  -- 指定子の後に半角スペースをつけないと正常に表示されなかった
  local date = wezterm.strftime('󰃭  %Y.%m.%d ' .. '    ' .. ' %H:%M:%S' .. '    ');

  local bat = ''

  local battery_icons = {
    [100] = '󰁹  ',
    [90]  = '󰂂  ',
    [80]  = '󰂁  ',
    [70]  = '󰂀  ',
    [60]  = '󰁿  ',
    [50]  = '󰁾  ',
    [40]  = '󰁽  ',
    [30]  = '󰁼  ',
    [20]  = '󰁻  ',
    [10]  = '󰁺  ',
    [0]   = '󰂎  '
  }

  for _, b in ipairs(wezterm.battery_info()) do
    local charge = math.floor(b.state_of_charge * 100)
    local icon = ''
    for level = 100, 0, -10 do
      if charge >= level then
        icon = battery_icons[level]
        break
      end
    end
    bat = string.format('%s%.0f%% ', icon, charge)
  end

  window:set_right_status(wezterm.format {
    { Text = date .. '  ' .. bat },
  })
end)

return c
