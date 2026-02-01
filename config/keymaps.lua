local M = {}

M.mods = {
  hyper = { "cmd", "alt", "ctrl" },
  hyperShift = { "cmd", "alt", "ctrl", "shift" },
  alt = { "alt" },
  altShift = { "alt", "shift" },
  cmd = { "cmd" },
  cmdShift = { "cmd", "shift" },
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

M.browsers = {
  ["Google Chrome"] = true,
}

M.vim = {
  toggle = "[",

  normal = {
    scroll = {
      down = { key = "j", send = "down" },
      up = { key = "k", send = "up" },
      left = { key = "h", send = "left" },
      right = { key = "l", send = "right" },
    },

    page = {
      reload = { key = "r", mods = M.mods.cmd, send = "r" },
      up = { key = "u", send = "pageup" },
      down = { key = "d", send = "pagedown" },
      next = { key = "L", mods = M.mods.cmd, send = "]" },
      prev = { key = "H", mods = M.mods.cmd, send = "[" },
    },

    topBottom = {
      top = { key = "g", mods = M.mods.cmd, send = "up" },
      bottom = { key = "G", mods = M.mods.cmd, send = "down" },
    },

    tab = {
      next = { key = "K", mods = M.mods.cmdShift, send = "]" },
      prev = { key = "J", mods = M.mods.cmdShift, send = "[" },
      close = { key = "x", mods = M.mods.cmd, send = "w" },
      new = { key = "t", mods = M.mods.cmd, send = "t" },
    },
  },
}

return M
