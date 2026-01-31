local hs = hs
local keys = require("config.keymaps")

local function toggleApplicationWindow(bundleID)
  local win = hs.window.focusedWindow()
  local app = win and win:application()

  if app and app:bundleID() == bundleID then
    app:hide()
    return
  end

  hs.application.launchOrFocusByBundleID(bundleID)
end

hs.fnutils.each(keys.apps, function(app)
  hs.hotkey.bind(keys.mods.alt, app.key, app.msg, function()
    toggleApplicationWindow(app.bundleID)
  end)
end)
