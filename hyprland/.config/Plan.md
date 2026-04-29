Alright — here’s a **clean, step-by-step setup** to give you a **macOS-like ⌘ experience (Super key)** on **Hyprland + Ghostty**, using the **robust Insert-based approach** you found.

This is designed to be:

* ✅ consistent across apps
* ✅ Wayland-friendly
* ✅ minimal + fast (fits your setup style)

---

# 🧩 STEP 0 — What you’re building

You’ll end up with:

* `Super+C` → Copy
* `Super+V` → Paste
* `Super+X` → Cut
* Full mac-style shortcuts (Save, Undo, Tabs, etc.)
* Terminal behaving correctly (Ghostty)

---

# ⚙️ STEP 1 — Edit your Hyprland config

Open:
---

## 🔑 1A. Define your main modifier (if not already)

Make sure you have:

```ini
$mainMod = SUPER
```

---

## 📋 1B. Add macOS-style clipboard (Insert-based)

Add this block:

```ini
# --- macOS-style clipboard (robust across apps) ---
bind = $mainMod, C, sendshortcut, CTRL, Insert
bind = $mainMod, V, sendshortcut, SHIFT, Insert
bind = $mainMod, X, sendshortcut, SHIFT, Delete
```

---

## ✏️ 1C. Add core macOS shortcuts

```ini
# --- Editing ---
bind = $mainMod, A, sendshortcut, CTRL, A
bind = $mainMod, Z, sendshortcut, CTRL, Z
bind = $mainMod SHIFT, Z, sendshortcut, CTRL SHIFT, Z

# --- File operations ---
bind = $mainMod, S, sendshortcut, CTRL, S
bind = $mainMod, O, sendshortcut, CTRL, O
bind = $mainMod, N, sendshortcut, CTRL, N

# --- Find ---
bind = $mainMod, F, sendshortcut, CTRL, F

# --- Tabs ---
bind = $mainMod, T, sendshortcut, CTRL, T
bind = $mainMod SHIFT, T, sendshortcut, CTRL SHIFT, T

# --- Close / Quit ---
bind = $mainMod, W, sendshortcut, CTRL, W
bind = $mainMod, Q, killactive
```

---

## 🪟 1D. Add mac-like window/app behavior
 Might already have this check first
```ini
# --- App switching (⌘+Tab feel) ---
bind = $mainMod, TAB, cyclenext
bind = $mainMod SHIFT, TAB, cyclenext, prev

---

---

# 🖥️ STEP 2 — Configure Ghostty (VERY important)

Open:

```bash
nano ~.dotfiles/ghostty/.config/ghostty/config
```

---

## 📋 2A. Add clipboard support for Insert keys

```ini
# --- Clipboard compatibility ---
keybind = shift+insert=paste_from_clipboard
keybind = control+insert=copy_to_clipboard
```

---

## 🍎 2B. Optional: direct mac-style inside terminal

(This makes it feel even closer to macOS)

```ini
keybind = super+c=copy_to_clipboard
keybind = super+v=paste_from_clipboard
```

---

## 💾 2C. Restart Ghostty

Close and reopen it.

---

# 🧪 STEP 3 — Test everything

Try these:

### In browser / editor:

* `Super+C` → should copy
* `Super+V` → should paste
* `Super+Z` → undo

### In Ghostty:

* `Super+C` → copy
* `Super+V` → paste

---

# ⚠️ STEP 4 — If something doesn’t work

### Some apps ignore Insert shortcuts

Fallback option (replace clipboard binds):

```ini
bind = $mainMod, C, sendshortcut, CTRL, C
bind = $mainMod, V, sendshortcut, CTRL, V
```

---
