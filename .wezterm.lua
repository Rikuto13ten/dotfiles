local wezterm = require 'wezterm'
return {
  -- font
  font = wezterm.font_with_fallback {
    {
      family = 'Iosevka Custom Rikuto Code', stretch = 'Expanded', italic = false
    },
    { family = 'PlemolJP', italic = false}
  },
  font_size = 15.0,

  window_background_opacity = 0.7,
  --macos_window_background_blur = 30,

  -- 字間
  cell_width = 1
}
