-- Awesome Config | Keybinds
local awful = require "awful"
local gears = require "gears"
local menubar = require "menubar"

local hotkeys_popup = require "awful.hotkeys_popup"

require("config/variables")


-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.global_bydirection("down")
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.global_bydirection("up")
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey,           }, "l",     function () awful.client.focus.global_bydirection("right")          end,
              {description = "change active window to the right", group = "client"}),
    awful.key({ modkey,           }, "h",     function () awful.client.focus.global_bydirection("left")           end,
              {description = "change active window to the left", group = "client"}),
    awful.key({ modkey, shiftkey   }, "h",     function () awful.client.swap.global_bydirection("left") end,
              {description = "swap window to the left", group = "client"}),
    awful.key({ modkey, shiftkey   }, "l",     function () awful.client.swap.global_bydirection("right") end,
              {description = "swap window to the right", group = "client"}),
    awful.key({ modkey, controlkey }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, controlkey }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    -- Layout manipulation
    awful.key({ modkey, shiftkey   }, "j", function () awful.client.swap.global_bydirection("down")    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, shiftkey   }, "k", function () awful.client.swap.global_bydirection("up")    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, controlkey }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, controlkey }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab", function () awful.spawn("rofi -show window") end,
        {description = "change active window", group = "client"}),
    -- awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
    --           {description = "select next", group = "layout"}),
    -- awful.key({ modkey, shiftkey   }, "space", function () awful.layout.inc(-1)                end,
    --           {description = "select previous", group = "layout"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, controlkey }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, shiftkey   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey, shiftkey }, "s", function () awful.spawn.with_shell("~/.config/scripts/screenshot select") end,
              {description = "select area of screenshot", group = "screenshot"}),
    awful.key({ modkey, controlkey }, "s", function () awful.spawn.with_shell("~/.config/scripts/screenshot window") end,
              {description = "screenshot active window", group = "screenshot"}),
    awful.key({ modkey }, "v", function () awful.spawn(terminal .. " -t pulsemixer -e pulsemixer") end,
              {description = "spawn pulsemixer", group = "sound"}),
    awful.key({ modkey, controlkey }, "v", function () awful.spawn("pavucontrol") end,
              {description = "spawn pavucontrol", group = "sound"}),
    awful.key({ modkey, shiftkey }, "v", function () awful.spawn("get-volume") end,
              {description = "get current volume in notification", group = "sound"}),
    awful.key({ modkey, controlkey }, "Up", function () awful.spawn.with_shell("change-volume up") end,
    	      {description = "increase volume by 5", group = "sound"}),
    awful.key({ modkey, controlkey }, "Down", function () awful.spawn.with_shell("change-volume down") end,
    	      {description = "decrease volume by 5", group = "sound"}),
    awful.key({ modkey }, "b", function () awful.spawn(browser) end,
    	      {description = "spawn browser", group = "launcher",}),
    awful.key({ modkey }, "d", function () awful.spawn("discord") end,
    	      {description = "spawn discord", group  = "launcher"}),
    awful.key({ modkey }, "t", function () awful.spawn.with_shell("get-time-date") end,
    	      {description = "Show time and date", group  = "system"}),


    awful.key({ modkey, controlkey }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey, shiftkey },            "d",     function () awful.spawn(launcher) end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function () awful.spawn.with_shell("powermenu") end,
              {description = "lua execute powermenu", group = "system"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    --awful.key({ modkey, controlkey }, "space",  awful.client.floating.toggle                     ,
    --         {description = "toggle floating", group = "client"}),
    awful.key({modkey, controlkey}, "space", function(c) -- Center and raise floating windows if there is more than one
  awful.client.floating.toggle(c)
  local num_tiled_clients = 0
  for _ in pairs(c.screen.tiled_clients) do num_tiled_clients = num_tiled_clients + 1 end
  if num_tiled_clients >= 1 then
    awful.placement.centered(c, nil)
  end
  c:raise()
end,
{
  description = "Toggle floating",
  group = "client"
}
),
    awful.key({ modkey, controlkey }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, controlkey }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, shiftkey   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        awful.spawn.with_shell(string.format("workspace-notify %d", i))
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, controlkey }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag and view tag.
        awful.key({ modkey, shiftkey }, "#" .. i + 9,
                  function ()
                      if client.focus then
                        local tag = client.focus.screen.tags[i]
                        awful.spawn.with_shell(string.format("workspace-notify %d", i))
                          if tag then
                              client.focus:move_to_tag(tag)
                              tag:view_only()
                          end
                     end
                  end,
                  {description = "move focused client to tag # and view tag "..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, controlkey, shiftkey }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
