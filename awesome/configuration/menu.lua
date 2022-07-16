local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local apps = require("configuration.apps")


local terminal = apps.default.terminal
local editor = apps.default.code_editor
local editor_cmd = terminal .. " -e " .. editor



myawesomemenu = {{"hotkeys", function()
    hotkeys_popup.show_help(nil, awful.screen.focused())
end}, {"manual", apps.default.terminal .. " -e man awesome"}, {"edit config", editor_cmd .. " " .. awesome.conffile},
                 {"restart", awesome.restart}, {"quit", function()
    awesome.quit()
end}}

mymainmenu = awful.menu({
    items = {{"awesome", myawesomemenu, beautiful.awesome_icon}, {"open terminal", terminal}}
})

mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
