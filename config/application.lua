local hs = hs
local application_hot_key = { "alt" }
local applications = {
	{ key = "f", msg = "Finder", bundle_id = "com.apple.finder" },
	{ key = "t", msg = "Wezterm", bundle_id = "com.github.wez.wezterm" },
	{ key = "b", msg = "Chrome", bundle_id = "com.google.Chrome" },
	{ key = "g", msg = "Chrome", bundle_id = "com.google.Chrome" },
	{ key = "n", msg = "Obsidian", bundle_id = "md.obsidian" },
	{ key = "d", msg = "Discord", bundle_id = "com.hnc.Discord" },
	{ key = "m", msg = "Miro", bundle_id = "com.electrom.realtimeboard" },
	{ key = "o", msg = "1Password", bundle_id = "com.1password.1password" },
}

local function toggle_application_window(bundle_id)
	local win = hs.window.focusedWindow()
	local app = win and win:application()

	if app and app:bundleID() == bundle_id then
		app:hide()
		return
	end

	hs.application.launchOrFocusByBundleID(bundle_id)
end

hs.fnutils.each(applications, function(app)
	hs.hotkey.bind(application_hot_key, app.key, app.msg, function()
		toggle_application_window(app.bundle_id)
	end)
end)
