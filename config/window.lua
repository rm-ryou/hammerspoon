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

local function max_size()
	hs.window.focusedWindow():maximize()
end

local function toggle_full_screen()
	hs.window.focusedWindow():toggleFullScreen()
end

hs.hotkey.bind(window_hot_key, "h", "Left harl of the Window", move_left_half)
hs.hotkey.bind(window_hot_key, "j", "Lower harl of the Window", move_lower_half)
hs.hotkey.bind(window_hot_key, "k", "Left harl of the Window", move_upper_half)
hs.hotkey.bind(window_hot_key, "l", "Right harl of the Window", move_right_half)

hs.hotkey.bind(window_hot_key, "m", "Maximize the Window", max_size)
hs.hotkey.bind(window_hot_key, "f", "Toggle full screen the Window", toggle_full_screen)
