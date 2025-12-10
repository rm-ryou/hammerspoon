local hs = hs
local menu_hot_key = { "alt", "shift" }
local ANIMATION_DURATION = 0.5
local canvas = hs.canvas.new({ x = 100, y = 100, h = 500, w = 500 })

canvas:appendElements({
	type = "rectangle",
	action = "fill",
	fillColor = { alpha = 0.8, red = 0, green = 0, blue = 0 },
})

local function toggle_menu()
	if canvas:isShowing() then
		canvas:hide(ANIMATION_DURATION)
	else
		canvas:show(ANIMATION_DURATION)
	end
end

hs.hotkey.bind(menu_hot_key, "/", toggle_menu)
