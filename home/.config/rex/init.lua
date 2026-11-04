-- Rex config. Stowed to ~/.config/rex/init.lua on the Mac and the devbox.
--
-- The server reads this file, so each machine needs its own copy: the Mac's
-- applies to local sessions, the devbox's to sessions on remote-dev.
-- After editing, run `rex config reload` on each machine. It is refused
-- over a remote connection.
--
-- Rex for Mac's default Cmd shortcuts do most of the work (Cmd+D splits,
-- Cmd+T opens a tab, Cmd+K switches sessions). This file only adds what the
-- defaults lack.

-- Resize mode ---------------------------------------------------------------
-- Cmd+Shift+R, then h/j/k/l (shift for big steps), = to balance, Esc to leave.

rex.mode("resize", { exclusive = true })
rex.bind("shift+cmd+r", "client.mode.enter", { name = "resize" })
for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  rex.bind("resize/" .. key, "pane.resize", { direction = dir })
  rex.bind("resize/shift+" .. key, "pane.resize", { direction = dir, amount = 15 })
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")

-- vim-tmux-navigator --------------------------------------------------------
-- Ctrl-h/j/k/l moves between Rex panes, except in Vim, which gets the key.
-- Vim moves between its own splits and calls `rex focus` at the edge
-- (home/.config/nvim/lua/plugins/tmux-navigator.lua).

local VIM = { vim = true, nvim = true, view = true, vimdiff = true }
local KEYS = { left = "ctrl+h", down = "ctrl+j", up = "ctrl+k", right = "ctrl+l" }

local function vim_in_focus(block_id)
  local p = rex.block.call("com.superlogical.terminal", "process", { block_id = block_id })
  local fg = p and p.foreground
  return fg ~= nil and VIM[fg.name] == true
end

-- Only a named action may ask the app to act, so the keys bind to this
-- rather than to a function.
rex.action{
  name  = "navigate",
  title = "Navigate Panes (Vim-aware)",
  args  = { direction = "string" },
  run   = function(ctx, args)
    if vim_in_focus(ctx.block_id) then
      rex.client.queue("pane.send_key", { key = KEYS[args.direction] })
    else
      rex.client.queue("pane.focus." .. args.direction)
    end
  end,
}

for dir, key in pairs(KEYS) do
  rex.bind(key, "navigate", { direction = dir })
end
