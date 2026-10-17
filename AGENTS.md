# AGENTS.md

Shared project guidance for coding agents working in this repository.

## What this repo is

A personal archive of compiled firmware artifacts and VIA/Vial keymap JSON exports for custom keyboards. There is no source code to build—only artifacts, JSONs, and a validation helper.

## Validation

```bash
scripts/validate_keymaps.sh   # requires jq
```

CI runs this automatically on push/PR via `.github/workflows/validate-keymaps.yml`. The script discovers all `*.json` files under `keyboards/*/*/keymaps/via/` and `keymaps/vial/`, checks valid JSON, then applies format-specific rules (VIA: must have a non-empty `layers` array of string arrays; Vial: lenient object check).

## Directory layout

```
keyboards/<vendor>/<model>/
  firmware/        compiled firmware (.hex, .bin, .uf2)
  keymaps/via/     VIA JSON exports
  keymaps/vial/    Vial JSON exports
  docs/notes.md    board-specific quirks, flash steps, changelog
```

## Naming conventions

- **Firmware**: `YYYY-MM-DD_<vendor>-<model>_<fw-origin>_<variant>.<ext>`
- **Keymap JSON**: `YYYY-MM-DD_<variant>.json`

## Adding a new keyboard

1. Create `keyboards/<vendor>/<model>/{firmware,keymaps/via,docs}/`.
2. Add `docs/notes.md` with vendor, model, MCU/controller, firmware origin, current firmware path, and a changelog entry.
3. Flash the board, then export the VIA/Vial layout and save it with a dated filename.
4. Update the keyboard index table in `README.md`.

For the full workflow (gathering details, templates, README row), use the `add-keyboard` skill.

## Notable board notes

- **Mode 65 / Mode Envoy / Modmusings Encoure** (`keyboards/modedesigns/65/`): These three keyboards share an identical PCB; firmware and keymaps are 100% interchangeable across all three. VIA only (not Vial). 4-layer layout: 0 = base QWERTY, 1 = Fn/media, 2 = Mac-style, 3 = extra Fn.
- **Rama Works U80** (`keyboards/ramaworks/U80/`): Wilba Tech VIA build. Flash with QMK Toolbox; enter bootloader per U80 instructions.
