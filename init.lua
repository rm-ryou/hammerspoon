local hs = hs
hs.loadSpoon("AClock")

require("config.application")
require("config.window")
require("config.menu")

hs.hotkey.bind({ "cmd", "alt" }, "C", function()
	spoon.AClock:toggleShow()
end)
