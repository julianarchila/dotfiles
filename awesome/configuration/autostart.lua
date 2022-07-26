-- local awful = require("awful")
run = require("helpers.run")

local function autostart_apps()
	--- Other stuff
  --
  -- awful.util.spawn("nm-applet")
  -- awful.util.spawn("pa-applet")
  -- awful.util.spawn("picom")


	run.run_once_grep("picom")
  run.run_once_grep("nm-applet")
	run.run_once_grep("pa-applet")
end

autostart_apps()
