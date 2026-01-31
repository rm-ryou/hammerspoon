local hs = hs
local keys = require("config.keymaps")

local M = {
  GRID_WIDTH = 100,
  GRID_HEIGHT = 100,
  MARGIN = 10,
  MOVE_STEP = 50,
  savedFrame = nil,
}

function M:fitToGrid(win, x, y, w, h)
  local screen = win:screen():frame()
  local margin = self.MARGIN

  win:setFrame({
    x = screen.x + (screen.w * x / self.GRID_WIDTH) + margin,
    y = screen.y + (screen.h * y / self.GRID_HEIGHT) + margin,
    w = (screen.w * w / self.GRID_WIDTH) - (margin * 2),
    h = (screen.h * h / self.GRID_HEIGHT) - (margin * 2),
  }, 0)
end

function M:toggleFullScreen()
  local win = hs.window.focusedWindow()
  if win then
    win:toggleFullScreen()
  end
end

function M:maximize()
  local win = hs.window.focusedWindow()
  if win then
    win:maximize()
  end
end

function M:minimize()
  local win = hs.window.focusedWindow()
  if win then
    win:minimize()
  end
end

function M:leftHalf()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 0, 0, 50, 100)
  end
end

function M:rightHalf()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 50, 0, 50, 100)
  end
end

function M:topHalf()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 0, 0, 100, 50)
  end
end

function M:bottomHalf()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 0, 50, 100, 50)
  end
end

function M:topLeft()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 0, 0, 50, 50)
  end
end

function M:topRight()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 50, 0, 50, 50)
  end
end

function M:bottomLeft()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 0, 50, 50, 50)
  end
end

function M:bottomRight()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 50, 50, 50, 50)
  end
end

function M:center()
  local win = hs.window.focusedWindow()
  if win then
    self:fitToGrid(win, 15, 15, 70, 70)
  end
end

-- Move window by hjkl; shrink when reaching edges.
function M:moveLeft()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local frame = win:frame()
  local screen = win:screen():frame()

  if frame.x <= screen.x + 5 then
    frame.w = math.max(200, frame.w - self.MOVE_STEP)
  else
    frame.x = math.max(screen.x, frame.x - self.MOVE_STEP)
  end

  win:setFrame(frame, 0)
end

function M:moveRight()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local frame = win:frame()
  local screen = win:screen():frame()

  if frame.x + frame.w >= screen.x + screen.w - 5 then
    frame.w = math.max(200, frame.w - self.MOVE_STEP)
    frame.x = frame.x + self.MOVE_STEP
  else
    frame.x = math.min(screen.x + screen.w - frame.w, frame.x + self.MOVE_STEP)
  end

  win:setFrame(frame, 0)
end

function M:moveUp()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local frame = win:frame()
  local screen = win:screen():frame()

  if frame.y <= screen.y + 5 then
    frame.h = math.max(200, frame.h - self.MOVE_STEP)
  else
    frame.y = math.max(screen.y, frame.y - self.MOVE_STEP)
  end

  win:setFrame(frame, 0)
end

function M:moveDown()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local frame = win:frame()
  local screen = win:screen():frame()

  if frame.y + frame.h >= screen.y + screen.h - 5 then
    frame.h = math.max(200, frame.h - self.MOVE_STEP)
    frame.y = frame.y + self.MOVE_STEP
  else
    frame.y = math.min(screen.y + screen.h - frame.h, frame.y + self.MOVE_STEP)
  end

  win:setFrame(frame, 0)
end

function M:moveToNextScreen()
  local win = hs.window.focusedWindow()
  if win then
    win:moveToScreen(win:screen():next(), false, true, 0)
  end
end

function M:moveToPrevScreen()
  local win = hs.window.focusedWindow()
  if win then
    win:moveToScreen(win:screen():previous(), false, true, 0)
  end
end

-- stylua: ignore
function M:init()
  -- Basic layout
  hs.hotkey.bind(keys.mods.altShift, keys.window.toggleFullScreen, function() self:toggleFullScreen() end)
  hs.hotkey.bind(keys.mods.altShift, keys.window.maximize, function() self:maximize() end)
  -- hs.hotkey.bind(keys.mods.alt, keys.window.minimize, function() self:minimize() end)
  hs.hotkey.bind(keys.mods.alt, keys.window.left, function() self:leftHalf() end)
  hs.hotkey.bind(keys.mods.alt, keys.window.right, function() self:rightHalf() end)
  hs.hotkey.bind(keys.mods.alt, keys.window.top, function() self:topHalf() end)
  hs.hotkey.bind(keys.mods.alt, keys.window.bottom, function() self:bottomHalf() end)

  -- Quarters
  hs.hotkey.bind(keys.mods.hyperShift, keys.window.topLeft, function() self:topLeft() end)
  hs.hotkey.bind(keys.mods.hyperShift, keys.window.topRight, function() self:topRight() end)
  hs.hotkey.bind(keys.mods.hyperShift, keys.window.bottomLeft, function() self:bottomLeft() end)
  hs.hotkey.bind(keys.mods.hyperShift, keys.window.bottomRight, function() self:bottomRight() end)

  -- Center
  hs.hotkey.bind(keys.mods.hyper, keys.window.center, function() self:center() end)

  -- Screen move
  hs.hotkey.bind(keys.mods.altShift, keys.window.nextScreen, function() self:moveToNextScreen() end)
  hs.hotkey.bind(keys.mods.altShift, keys.window.prevScreen, function() self:moveToPrevScreen() end)

  -- Move by step
  hs.hotkey.bind(keys.mods.altShift, keys.window.move.left, function() self:moveLeft() end)
  hs.hotkey.bind(keys.mods.altShift, keys.window.move.right, function() self:moveRight() end)
  hs.hotkey.bind(keys.mods.altShift, keys.window.move.up, function() self:moveUp() end)
  hs.hotkey.bind(keys.mods.altShift, keys.window.move.down, function() self:moveDown() end)
end
M:init()

return M
