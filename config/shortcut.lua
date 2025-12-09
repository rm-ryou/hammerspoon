hs = hs

local alt = { "alt" }

local application_bundle_id = {
	finder = "com.apple.finder",
	wezterm = "com.github.wez.wezterm",
	browser = "com.google.Chrome",
	obsidian = "md.obsidian",
	discord = "com.hnc.Discord",
	miro = "com.electrom.realtimeboard",
	one_password = "com.1password.1password",
}

hs.hotkey.bind(alt, "f", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.finder)
end)

hs.hotkey.bind(alt, "t", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.wezterm)
end)

hs.hotkey.bind(alt, "b", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.browser)
end)

hs.hotkey.bind(alt, "n", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.obsidian)
end)

hs.hotkey.bind(alt, "d", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.discord)
end)

hs.hotkey.bind(alt, "m", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.miro)
end)

hs.hotkey.bind(alt, "o", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.one_password)
end)
