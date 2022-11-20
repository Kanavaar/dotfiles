-- Awesome Config | Variables
--
--
local awful = require "awful"
local gears = require "gears"
local pretty = require "beautiful"
local naughty = require "naughty"
local menubar = require "menubar"

modkey = "Mod4"
altkey = "Mod1"
shiftkey = "Shift"
controlkey = "Control"

terminal = "alacritty" or "xterm"
editor   = "nvim"       or "vim"       or "nano"
browser  = "qutebrowser" or "firefox"
launcher = "rofi -show drun" or "dmenu_run"

terminal_cmd = terminal .. " -e "
editor_cmd   = terminal_cmd .. editor .. " -p "

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

normal_clock = "%H:%M"
