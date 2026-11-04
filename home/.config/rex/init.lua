-- Rex config. Stowed to ~/.config/rex/init.lua on the Mac and the devbox.
--
-- The server reads this file, so each machine needs its own copy: the Mac's
-- applies to local sessions, the devbox's to sessions on remote-dev.
-- After editing, run `rex config reload` on each machine. It is refused
-- over a remote connection.
--
-- Keys mirror home/.tmux.conf so tmux muscle memory keeps working.

local PREFIX = "ctrl+s"

local function prefix(key, action, args)
  rex.bind(PREFIX .. ">" .. key, action, args)
end

-- Press the prefix twice to send a literal Ctrl-S to the terminal.
prefix(PREFIX, "pane.send_key", { key = PREFIX })

-- From .tmux.conf ---------------------------------------------------------

prefix("r", "client.config.reload")

prefix("h", "pane.focus.left")
prefix("j", "pane.focus.down")
prefix("k", "pane.focus.up")
prefix("l", "pane.focus.right")

-- Alt+1..9 jumps to a tab. Physical digit keys, so Option never types ¡™£.
for i = 1, 9 do
  rex.bind("alt+[Digit" .. i .. "]", "client.tab.goto", { index = i })
end

-- tmux defaults -----------------------------------------------------------

prefix("c", "client.tab.new")
prefix("n", "client.tab.next")
prefix("p", "client.tab.previous")
prefix(",", "client.tab.rename")
prefix("shift+7", "client.tab.close")         -- &

prefix("shift+5", "pane.split.right")         -- %
prefix("shift+'", "pane.split.down")          -- "
prefix("z", "pane.zoom")
prefix("x", "pane.close")
prefix("o", "pane.focus_next")
prefix("shift+1", "pane.move_to_new_tab")     -- !

prefix("s", "session.switch")
prefix("w", "session.switch")
prefix("shift+4", "session.rename")           -- $
prefix("shift+9", "session.previous")         -- (
prefix("shift+0", "session.next")             -- )

-- Resize like `prefix + Ctrl-arrow`, but stay in the mode until Escape.
rex.mode("resize", { exclusive = true })
prefix("shift+r", "client.mode.enter", { name = "resize" })
for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  rex.bind("resize/" .. key, "pane.resize", { direction = dir })
  rex.bind("resize/shift+" .. key, "pane.resize", { direction = dir, amount = 15 })
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")

-- vim-tmux-navigator ------------------------------------------------------
-- Ctrl-h/j/k/l moves between Rex panes, except in Vim, which gets the key.
-- Vim moves between its own splits and calls `rex focus` at the edge
-- (home/.config/nvim/lua/plugins/tmux-navigator.lua).

local VIM = { vim = true, nvim = true, view = true, vimdiff = true }

local function vim_in_focus()
  local p = rex.block.call("com.superlogical.terminal", "process", {})
  local fg = p and p.foreground
  return fg ~= nil and VIM[fg.name] == true
end

for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  rex.bind("ctrl+" .. key, function()
    if vim_in_focus() then
      return false
    end
    rex.client.queue("pane.focus." .. dir)
    return true
  end)
end
