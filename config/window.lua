local hs = hs
local window_hot_key = { "alt", "shift" }

local function move_left_half()
	local win = hs.window.focusedWindow()
	local frame = win:screen():frame()
	local rect = hs.geometry.rect(frame.x, frame.y, frame.w / 2, frame.h)
	win:setFrame(rect)
end

local function move_right_half()
	local win = hs.window.focusedWindow()
	local frame = win:screen():frame()
	local rect = hs.geometry.rect(frame.x + frame.w / 2, frame.y, frame.w / 2, frame.h)
	win:setFrame(rect)
end

local function move_upper_half()
	local win = hs.window.focusedWindow()
	local frame = win:screen():frame()
	local rect = hs.geometry.rect(frame.x, frame.y, frame.w, frame.h / 2)
	win:setFrame(rect)
end

local function move_lower_half()
	local win = hs.window.focusedWindow()
	local frame = win:screen():frame()
	local rect = hs.geometry.rect(frame.x, frame.y + frame.h / 2, frame.w, frame.h - frame.h / 2)
	win:setFrame(rect)
end

hs.hotkey.bind(window_hot_key, "h", "Left harl of the Window", move_left_half)
hs.hotkey.bind(window_hot_key, "j", "Lower harl of the Window", move_lower_half)
hs.hotkey.bind(window_hot_key, "k", "Left harl of the Window", move_upper_half)
hs.hotkey.bind(window_hot_key, "l", "Right harl of the Window", move_right_half)

local function max_size()
	hs.window.focusedWindow():maximize()
end

local function toggle_full_screen()
	hs.window.focusedWindow():toggleFullScreen()
end

local function move_next_window()
	local win = hs.window.focusedWindow()
	win:moveToScreen(win:screen():next())
end

hs.hotkey.bind(window_hot_key, "m", "Maximize the Window", max_size)
hs.hotkey.bind(window_hot_key, "f", "Toggle full screen the Window", toggle_full_screen)
hs.hotkey.bind(window_hot_key, "n", "Move to next screen then Window", move_next_window)

local function move_to_left()
	local win = hs.window.focusedWindow()
	local current_point = win:topLeft()
	local point = hs.geometry.point(current_point.x - 10, current_point.y)
	win:setTopLeft(point)
end

local function move_to_right()
	local win = hs.window.focusedWindow()
	local current_point = win:topLeft()
	local point = hs.geometry.point(current_point.x + 10, current_point.y)
	win:setTopLeft(point)
end

local function move_to_up()
	local win = hs.window.focusedWindow()
	local current_point = win:topLeft()
	local point = hs.geometry.point(current_point.x, current_point.y - 10)
	win:setTopLeft(point)
end

local function move_to_down()
	local win = hs.window.focusedWindow()
	local current_point = win:topLeft()
	local point = hs.geometry.point(current_point.x, current_point.y + 10)
	win:setTopLeft(point)
end

hs.hotkey.bind(window_hot_key, "left", move_to_left)
hs.hotkey.bind(window_hot_key, "down", move_to_down)
hs.hotkey.bind(window_hot_key, "up", move_to_up)
hs.hotkey.bind(window_hot_key, "right", move_to_right)
