local awful     = require "awful"
local beautiful    = require "beautiful"
local gears     = require "gears"
local menubar   = require "menubar"
local wibox     = require "wibox"
local naughty   = require "naughty"
local key_popup = require "awful.hotkeys_popup"
local colors    = require "colors.gruvbox"
local xresources = require("beautiful.xresources")
local dpi = require("beautiful.xresources").apply_dpi

require "config.variables"


myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

