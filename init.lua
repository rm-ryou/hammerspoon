hs = hs
hs.loadSpoon("AClock")

require("config.shortcut")

hs.hotkey.bind({ "cmd", "alt" }, "C", function()
	spoon.AClock:toggleShow()
end)
