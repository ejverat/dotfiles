local applications = {}
local standalone = {}
local with_shell = {}

table.insert(standalone, "flameshot")
table.insert(standalone, "xscreensaver-systemd")

applications["standalone"] = standalone
applications["with_shell"] = with_shell

return applications
