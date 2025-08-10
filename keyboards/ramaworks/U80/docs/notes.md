# Rama Works U80 Notes

- Vendor: `ramaworks`
- Model: `U80`
- MCU/Controller: Wilba Tech (VIA-enabled)
- Firmware origin: `wilba-tech` (VIA build)
- Current firmware: `../firmware/2025-08-10_ramaworks-U80_wilba-tech_via.hex`
- Current VIA layout: `../keymaps/via/2025-08-10_ph.json`

## Usage
- Flash with QMK Toolbox/Web Flasher. Enter bootloader per U80 instructions.
- After flashing, load the VIA JSON in VIA if the board is not auto-detected.

## Layout variants
- Base: `ph`
- Add more variants by exporting new VIA JSONs (date them and describe changes).

## Notes
- Media keys on layer 1: previous/play-next as per VIA mapping.
- Arrow cluster is standard; adjust `MO(1)` layer access as needed.
- Update this section with quirks, stabilizer tuning, or RGB configs.

## Changelog
- 2025-08-10: Initial import of VIA JSON and wilba-tech VIA firmware.
