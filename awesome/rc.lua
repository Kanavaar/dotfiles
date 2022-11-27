-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = require("beautiful.xresources").apply_dpi
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/theme.lua")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Variables
require("config.variables")

-- Bindings
require("config.keys")

-- Rules
require("config.rules")

-- Layouts
require("config.layouts")

-- Colors
local colors = require("colors.gruvbox")

-- Widgets
require("config.widgets")

-- Bar
require("config.bar")

-- Signal
require("config.signals")

-- Error handling
require("config.error")

-- Autostart
awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "scripts/autostart.sh")
