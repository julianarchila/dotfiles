---
name: agent-desktop
description: >
  Operate desktop apps on this Mac through the agent-desktop CLI (accessibility tree):
  click, type, fill forms, read UI state, menus, settings screens, screenshots, windows,
  launching or quitting apps. Use for any task that needs a GUI app (Obsidian, browsers
  such as Helium, browser extensions' settings pages, System Settings, any Mac app),
  or when the user asks you to do something for them in an app's interface.
---

# agent-desktop

The CLI ships its own guides, compiled into the binary and matching the installed version.
Before the first GUI action in a session, load them and follow them:

```sh
agent-desktop skills get desktop    # core loop: snapshot -> ref -> act -> verify
agent-desktop skills get platform   # macOS specifics, permissions, troubleshooting
```

Each prints JSON; the guide is in `data.content`. Load a reference only when needed
(`agent-desktop skills get desktop workflows`).

## Lessons from this machine

- Prefer refs over coordinates and keystrokes: `snapshot` / `find`, then `click`, `set-value`,
  `select` on the ref. If a field appears only as a `group`, snapshot it with `--root <ref>`
  to reach the real `textfield` inside.
- `set-value` on a web or Electron text field fires its input event, and the app saves it.
  Verify by reloading or by reading the stored value afterwards.
- Keystrokes (`press`) may not reach the focused field. Never paste through the clipboard
  without saving it first (`pbpaste`) and restoring it afterwards, and check the result: a
  failed `clipboard-set` pastes whatever the user had copied.
- Native dropdowns: click the popup, then `find --role menuitem` and click the item's ref.
- Screenshots are larger than screen points. Convert with the window bounds from
  `list-windows`; don't reuse old coordinates.
- Some apps open settings in a separate window (Obsidian). Re-run `list-windows`.
- The user's apps are live. Don't quit or modify them, or their data, beyond what the
  task needs, and say what you touched.
