# keeb-utils

Compiled firmware files and VIA/Vial keybinding exports for multiple custom keyboards. No source or build files are tracked—only artifacts and JSON layouts.

## How this repo is organized

- `keyboards/<vendor>/<model>/`
  - `firmware/`: Compiled firmware artifacts (`.hex`, `.bin`, `.uf2`)
  - `keymaps/via/`: VIA JSON exports
  - `keymaps/vial/`: Vial JSON exports
  - `docs/`: Notes and photos for the specific board
- `scripts/`: Optional helpers (e.g., JSON validation)
- `tools/json_schemas/`: Optional VIA/Vial JSON schemas
- `.github/workflows/`: Optional CI to validate keymaps
  - `validate-keymaps.yml`: Validates VIA/Vial JSONs with `scripts/validate_keymaps.sh` on push/PR

## Naming conventions

- Firmware files:
  - `YYYY-MM-DD_<vendor>-<model>_<fw-origin>_<variant>.<ext>`
  - Examples:
    - `2025-01-12_cannonkeys-annon_qmk-configurator_mac.hex`
    - `2025-01-12_aki-southpaw_vendor_stock_default.uf2`
- Keymap JSON:
  - `YYYY-MM-DD_<variant>.json`
  - Examples: `2025-01-12_default.json`, `2025-01-12_mac.json`, `2025-01-12_gaming.json`

## Typical workflow

1. Flash or update the keyboard using the vendor tool or QMK Toolbox / Web Flasher.
2. Export the current layout from VIA or Vial.
3. Save it under:
   - `keyboards/<vendor>/<model>/keymaps/via/` or `keymaps/vial/`
   - Use the naming conventions above.
4. Store the exact firmware file you flashed in `firmware/` with a dated filename.

## Keyboard index

| Vendor | Model | Firmware origin | VIA/Vial | Notes |
|-------:|:-----:|:----------------|:--------:|:------|
| ramaworks | U80 | wilba-tech | VIA | [keymap](keyboards/ramaworks/U80/keymaps/via/2025-08-10_ph.json), [firmware](keyboards/ramaworks/U80/firmware/2025-08-10_ramaworks-U80_wilba-tech_via.hex), [notes](keyboards/ramaworks/U80/docs/notes.md) |

## Optional validation

- You can validate VIA/Vial JSONs against schemas:
  ```bash
  scripts/validate_keymaps.sh
  ```
 - CI runs this on push/PR via `.github/workflows/validate-keymaps.yml`.

## Notes & tips

- Keep firmware and JSONs dated to track changes over time.
- Put board-specific quirks, boot/flash steps, and wiring in `docs/notes.md`.

## License

See `LICENSE`.
