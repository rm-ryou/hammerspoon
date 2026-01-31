local M = {}

M.mods = {
  hyper = { "cmd", "alt", "ctrl" },
  hyperShift = { "cmd", "alt", "ctrl", "shift" },
  alt = { "alt" },
  altShift = { "alt", "shift" },
  ctrl = { "ctrl" },
}

M.apps = {
  { key = "f", msg = "Finder", bundleID = "com.apple.finder" },
  { key = "t", msg = "Wezterm", bundleID = "com.github.wez.wezterm" },
  { key = "b", msg = "Google Chrome", bundleID = "com.google.Chrome" },
  { key = "g", msg = "Google Chrome", bundleID = "com.google.Chrome" },
  { key = "n", msg = "Obsidian", bundleID = "md.obsidian" },
  { key = "d", msg = "Discord", bundleID = "com.hnc.Discord" },
  { key = "m", msg = "Miro", bundleID = "com.electrom.realtimeboard" },
  { key = "o", msg = "1Password", bundleID = "com.1password.1password" },
}

M.window = {
  -- basic
  toggleFullScreen = "f",
  maximize = "m",
  minimize = "m",
  left = "h",
  right = "l",
  top = "k",
  bottom = "j",

  -- Quarters (with hyper + shift)
  topLeft = "h",
  topRight = "l",
  bottomLeft = "j",
  bottomRight = "k",

  -- Center
  center = "c",

  -- Screen move
  nextScreen = "n",
  prevScreen = "p",

  -- Move by step (ctrl + alt)
  move = {
    left = "h",
    right = "l",
    up = "k",
    down = "j",
  },
}

return M
