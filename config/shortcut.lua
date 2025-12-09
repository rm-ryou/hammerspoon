hs = hs

local short_cut_hot_key = { "alt" }

local application_bundle_id = {
	finder = "com.apple.finder",
	wezterm = "com.github.wez.wezterm",
	browser = "com.google.Chrome",
	obsidian = "md.obsidian",
	discord = "com.hnc.Discord",
	miro = "com.electrom.realtimeboard",
	one_password = "com.1password.1password",
}

hs.hotkey.bind(short_cut_hot_key, "f", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.finder)
end)

hs.hotkey.bind(short_cut_hot_key, "t", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.wezterm)
end)

hs.hotkey.bind(short_cut_hot_key, "b", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.browser)
end)

hs.hotkey.bind(short_cut_hot_key, "n", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.obsidian)
end)

hs.hotkey.bind(short_cut_hot_key, "d", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.discord)
end)

hs.hotkey.bind(short_cut_hot_key, "m", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.miro)
end)

hs.hotkey.bind(short_cut_hot_key, "o", function()
	hs.application.launchOrFocusByBundleID(application_bundle_id.one_password)
end)
