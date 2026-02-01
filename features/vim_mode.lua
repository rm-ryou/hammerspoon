local hs = hs
local keys = require("config.keymaps")
local indicator = require("lib.indicator")

local M = {
  enabled = false,
  browsers = keys.browsers,
  indicator = indicator.new("VIM"),
}

local function focusedAppName()
  local app = hs.window.focusedWindow():application()
  return app and app:name() or ""
end

function M:isBrowser(appName)
  return self.browsers[appName] or false
end

function M:setEnabled(on)
  self.enabled = on and true or false

  if self.enabled then
    self.indicator:show()
  else
    self.indicator:hide()
  end
end

function M:toggleVimMode()
  local appName = focusedAppName()
  if self:isBrowser(appName) then
    self:setEnabled(not self.enabled)
    hs.alert.show(self.enabled and "Vim Mode ON" or "Vim Mode OFF", 0.5)
  end
end

function M:init()
  hs.hotkey.bind(keys.mods.ctrl, keys.vim.toggle, function()
    self:toggleVimMode()
  end)
end

M:init()

return M
