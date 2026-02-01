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

local function buildBindings(vimMaps)
  local bindings = {}

  for _, group in pairs(vimMaps) do
    for _, map in pairs(group) do
      bindings[map.key] = function()
        hs.eventtap.keyStroke(map.mods or {}, map.send, 0)
      end
    end
  end

  return bindings
end

M.bindings = buildBindings(keys.vim and keys.vim.normal or {})

function M:init()
  hs.hotkey.bind(keys.mods.ctrl, keys.vim.toggle, function()
    self:toggleVimMode()
  end)

  self.keyWatcher = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    if not self.enabled or not self:isBrowser(focusedAppName()) then
      return false
    end

    local flags = event:getFlags()
    local char = event:getCharacters()

    if not flags.ctrl and not flags.cmd and not flags.alt then
      local binding = self.bindings[char]
      if binding then
        binding()
        return true
      end
    end

    return false
  end)
  self.keyWatcher:start()

  self.appWatcher = hs.application.watcher.new(function(appName, eventType, _)
    if eventType == hs.application.watcher.activated then
      if self.enabled and not self:isBrowser(appName) then
        self:setEnabled(false)
      end
    end
  end)
  self.appWatcher:start()
end

M:init()

return M
