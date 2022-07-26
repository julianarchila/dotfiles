-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
-- local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- ERROR HANDLING ----
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
    message = message
  }
end)
------------------------------------------------------------

-- VARIABLE DEFINITIONS ------
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/themes/default/theme.lua")

--------------
---- MENU ----
--------------
require("configuration.menu")



--- TAG LAYOUT ---
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({ awful.layout.suit.tile, awful.layout.suit.floating })
end)
------------------------------------------------------------

---- WALLPAPER ----
screen.connect_signal("request::wallpaper", function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      {
        image = beautiful.wallpaper,
        upscale = true,
        downscale = true,
        widget = wibox.widget.imagebox
      },
      valign = "center",
      halign = "center",
      tiled = false,
      widget = wibox.container.tile
    }
  }
end)
------------------------------------------------------------

-----------------------
-------- WIBAR --------
-----------------------

require("configuration.wibar")

---------------------------
------ KEY BINDINGS -------
---------------------------
require("configuration.bindings")

---------------
---- RULES ----
---------------

require("configuration.rules")

-------------------
---- TITLEBARS ----
-------------------

-- require("configuration.titlebars")



-----------------------
---- NOTIFICATIONS ----
-----------------------


ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5
    }
  }
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box {
    notification = n
  }
end)

------------------------------------------------------------

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate {
    context = "mouse_enter",
    raise = false
  }
end)



beautiful.useless_gap = 3



---- MODULES ----
require("configuration.autostart")
