Kohaku — notes

- Vendor: SingaKBD
- Model: Kohaku (65%)
- MCU: ATmega32U4

Key facts

- Firmware origin: QMK (official)
- Keymap software: VIA only
- Bootloader: Hold Esc while connecting to USB to enter DFU mode

Workflow

1) Flash firmware via QMK Toolbox: hold Esc, connect USB, select .hex, flash.
2) Configure with VIA; export layout JSON.
3) Save keymap under `keymaps/via/` with a dated filename.
4) Store the exact firmware you flashed under `firmware/` with a dated filename.

Changelog

- 2026-03-03: Board added to repo.
