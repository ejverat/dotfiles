local HOME = os.getenv("HOME")
local screen_config = HOME .. "/.screenlayout/default-screen-config.sh"
return {
	standalone = {
		"flameshot",
		"lxpolkit",
		"xscreensaver --no-splash",
	},
	with_shell = { screen_config },
}
