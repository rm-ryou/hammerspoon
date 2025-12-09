local hs = hs
hs.loadSpoon("AClock")

require("config.application")

hs.hotkey.bind({ "cmd", "alt" }, "C", function()
	spoon.AClock:toggleShow()
end)
