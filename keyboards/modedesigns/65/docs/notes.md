# Mode 65 / Mode Envoy / Modmusings Encoure

## Overview
This directory contains firmware and keymaps for keyboards that share the same Mode PCB design. The following keyboards are **completely interchangeable** in terms of firmware and keymaps:

- **Mode 65** (Mode Designs)
- **Mode Envoy** (Mode Designs) 
- **Modmusings Encoure** (Modmusings)

All three keyboards use identical PCBs from Mode Designs, meaning they run the same firmware and accept the same keymaps without any modifications.

## Key Features
- 65% layout with arrow keys
- RGB backlighting
- VIA compatible (not Vial)
- Hot-swappable switches
- USB-C connectivity
- Shared PCB design across all three models

## Firmware Compatibility
- **Same firmware works on all three keyboards**
- Compatible with VIA (not Vial)
- Uses standard QMK firmware
- Vendor ID: Mode Designs
- **Keymaps are 100% interchangeable** between Mode 65, Mode Envoy, and Modmusings Encoure

## Keymap Notes
- Default layout includes 4 layers
- Layer 0: Base layer with standard QWERTY
- Layer 1: Function keys and media controls
- Layer 2: Alternative layout (Mac-style)
- Layer 3: Additional function layer
- **Same keymap file works on all three keyboards**

## Flashing Instructions
1. Put keyboard in bootloader mode (usually Fn + B or similar)
2. Use QMK Toolbox or web flasher
3. Flash the appropriate firmware file (same file works for all three)
4. Import keymap JSON into VIA

## Interchangeable Keyboards
- **Mode 65** (Mode Designs)
- **Mode Envoy** (Mode Designs)
- **Modmusings Encoure** (Modmusings)

**Important**: Since all three keyboards share the same PCB design, any firmware or keymap created for one will work identically on the other two. The only differences are the case designs and branding - the electronics and firmware are identical.

