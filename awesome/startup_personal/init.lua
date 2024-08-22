local applications = {}
local user = os.getenv("USER")
local home_dir = "/home/" .. user

applications["standalone"] = {
	"flameshot",
	"xscreensaver",
	"nm-applet",
	--  "barrierc --name ejverat-luffy 192.168.0.131",
	--"lxpolkit",
	--  "discord --start-minimized",
	-- "element-desktop --hidden",
}
applications["with_shell"] = {
	-- home_dir .. "/.screenlayout/default-2-screens.sh",
}

return applications
