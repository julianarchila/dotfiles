# Dotfiles

Personal config for macOS and an Ubuntu dev-box. `./dot` installs packages and
links `home/` into `$HOME` with GNU Stow.

## Layout

| Path | Stowed to | Notes |
|---|---|---|
| `home/.config/` | `~/.config/` | ghostty, mise, nvim, zed |
| `home/.agents/` | `~/.agents` | One symlink to the whole directory. Shared agent skills plus the `npx skills` lockfile. |
| `home/.claude/settings.json` | `~/.claude/settings.json` | The only Claude Code file we manage. |
| `packages/macos/Brewfile`, `packages/ubuntu/apt.txt` | n/a | System packages per OS. |

## Commands

```bash
./dot init     # packages, stow, runtimes, shell and tmux plugins
./dot update   # pull, upgrade, restow, relink Claude skills
./dot doctor   # verify agent config is linked from this repo
```

## Agent skills

- Skills live in `home/.agents/skills/<name>/`. Codex and OpenCode read
  `~/.agents/skills` directly. `./dot` symlinks each skill into
  `~/.claude/skills/` for Claude Code and prunes links to removed skills.
- `~/.agents` must be a single symlink into this repo, so `npx skills` writes
  straight into the checkout. Add, update, or remove skills globally, then
  commit `home/.agents`:

  ```bash
  npx skills add <owner/repo> -g -s <skill> -a claude-code
  npx skills update -g
  npx skills remove -g <skill>
  ```

- Do not commit anything under `~/.claude/skills/`. It also holds Claude Code
  state (`.trash`).

## Claude Code settings

`home/.claude/settings.json` keeps Claude Code minimal. It turns off claude.ai
skill and plugin sync, claude.ai connectors, and auto memory. Organization
policy (`remote-settings.json`, `policy-limits.json`) still applies and cannot be
overridden. User MCP servers live in `~/.claude.json`, which is machine state
and is not tracked.

## Drift

`./dot doctor` fails when any of these happen. Fix it with `./dot update`:

- `~/.agents` is a real directory instead of a symlink. Stow then links each
  skill on its own, and new installs land outside the repo.
- `~/.claude/settings.json` is a real file. A tool replaced the symlink. Fold
  the changes you want back into `home/.claude/settings.json`.

Before stowing, `./dot` moves unmanaged copies aside to `*.bak-<timestamp>`. It
never deletes them.
