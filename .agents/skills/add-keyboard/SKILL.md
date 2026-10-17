---
name: add-keyboard
description: "Add a new keyboard to the keeb-utils repo. Use when the user wants to add, register, import, or onboard a new keyboard board. Creates the directory structure, docs/notes.md, and updates README.md."
---

# Add a New Keyboard

Follow these steps whenever the user wants to add a new keyboard to this repo.

## 1. Gather info

Ask the user for any missing details before creating files:

- **Vendor** (slug, e.g. `ramaworks`, `modedesigns`, `qwertykeys`)
- **Model** (slug, e.g. `U80`, `65`, `Neo75-Cu`)
- **MCU / controller** (e.g. `RP2040`, `ATmega32U4`, `Wilba Tech`)
- **Firmware origin** (e.g. `vendor stock`, `qmk-configurator`, `wilba-tech`, `QMK`)
- **VIA, Vial, or both?**
- **Current firmware filename** (if already flashed; use naming convention `YYYY-MM-DD_<vendor>-<model>_<fw-origin>_<variant>.<ext>`)
- **Current keymap filename** (if already exported; use `YYYY-MM-DD_<variant>.json`)
- **Any notable quirks or flash instructions**

Use today's date for dated filenames when the user doesn't specify.

## 2. Create directory structure

```
keyboards/<vendor>/<model>/
  firmware/
  keymaps/via/    (if VIA)
  keymaps/vial/   (if Vial)
  docs/
    notes.md
```

Create only the keymap subdirectories that apply (via, vial, or both).

## 3. Write docs/notes.md

Use this template, filling in the user's details:

```markdown
# <Vendor display name> <Model> Notes

- Vendor: `<vendor-slug>`
- Model: `<model-slug>`
- MCU/Controller: <MCU>
- Firmware origin: `<fw-origin>`
- Current firmware: `../firmware/<firmware-filename>` (or "none yet")
- Current VIA layout: `../keymaps/via/<keymap-filename>` (omit if not applicable)
- Current Vial layout: `../keymaps/vial/<keymap-filename>` (omit if not applicable)

## Usage
- Flash with <tool>. Enter bootloader by <method>.
- <Any VIA/Vial load notes>

## Layout variants
- Base: `<variant-name>`

## Notes
- <Any quirks the user mentioned, or "None noted.">

## Changelog
- <YYYY-MM-DD>: Initial import.
```

## 4. Update README.md keyboard index table

Append a new row to the `## Keyboard index` table:

```
| <vendor> | <model> | <fw-origin> | VIA/Vial | [firmware](keyboards/<vendor>/<model>/firmware/), [notes](keyboards/<vendor>/<model>/docs/notes.md) |
```

Include a `[keymap](...)` link only if an actual keymap file exists. Use the same format as existing rows.

## 5. Remind the user of next steps

After creating files, tell the user:
1. Copy firmware and keymap files into the new directories using the naming convention.
2. Export the VIA/Vial layout and save it under `keymaps/via/` or `keymaps/vial/`.
3. Run `scripts/validate_keymaps.sh` to confirm keymap JSON is valid (requires `jq`).
4. Commit: `git add keyboards/<vendor>/<model>/ README.md && git commit`.
