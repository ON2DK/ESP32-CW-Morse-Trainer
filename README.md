# ESP32 CW Morse Trainer V2

Open-source ESP32 Morse/CW trainer designed by **ON2DK**.

The ESP32 CW Morse Trainer V2 is a stand-alone Morse trainer built around a **38-pin ESP32 DevKit with ESP32-WROOM-32D**. It is intended for CW practice without connecting a transceiver.

## Main features

- 38-pin ESP32 DevKit with ESP32-WROOM-32D
- ST7789 240 x 320 SPI TFT support
- Paddle input
- Straight-key input
- Rotary encoder with push switch for menu/settings
- LM386 audio/sidetone section with buzzer
- Separate 12 V DC input
- TSR 1-2450 12 V to 5 V DC/DC converter
- POWER LED on the switched 12 V supply
- USB on the ESP32 DevKit for programming
- Predominantly through-hole construction

## PCB status

The hardware design is complete and the final PCB was checked in KiCad before generating the production files.

- 2-layer PCB: F.Cu + B.Cu
- Target material: FR-4, 1.6 mm
- PCB size: approximately **189.25 x 114.50 mm**
- 4 x M3 mounting holes
- KiCad DRC: **0 violations / 0 errors / 0 warnings** at final electrical check
- Unconnected items: **0**
- Schematic/PCB parity: **0**

The buzzer position was adjusted in the final layout to improve connector access.

## Repository structure

- `KiCad/` - KiCad source package
- `Gerber/` - production Gerber and drill package
- `Firmware/` - Arduino IDE firmware and firmware notes
- `Enclosure/` - enclosure files and mechanical notes
- `Documentation/` - build and project documentation
- `Images/` - PCB, schematic and 3D-view images

## Production files

The current production package is available in:

- `Gerber/ESP32_CW_TRAINER_V2_Gerber.zip`

The editable KiCad source package is available in:

- `KiCad/ESP32_CW_TRAINER_V2_KiCad_Source.zip`

Before ordering a PCB, inspect the Gerbers in a Gerber viewer and verify board outline, drill files, silkscreen, masks and both copper layers.

## Power and programming

Normal operation uses the separate **12 V DC input**. The on-board USB connector of the ESP32 DevKit is intended for programming.

During USB programming, switch the external 12 V supply **OFF**.

Power path:

`12 V DC -> 0.5 A polyfuse -> POWER switch -> TSR 1-2450 -> 5 V -> ESP32 DevKit`

The red POWER LED is connected to the switched 12 V side, so it only lights when the main power switch is ON.

## Important build notes

Always compare the physical pinout and dimensions of purchased components with the KiCad footprints before soldering. In particular, check:

- polarity of LEDs, diodes and electrolytic capacitors;
- connector orientation and pin order;
- transistor pinouts;
- ESP32 DevKit orientation;
- clear space around the ESP32 antenna area.

Test the 5 V supply before fitting sensitive modules such as the ESP32 and TFT.

## Firmware

The hardware is designed for the ESP32 Morse Trainer firmware line using an ST7789 240 x 320 display. Firmware is kept separately under `Firmware/` so software revisions can evolve without changing the production PCB files.

## Project status

**Hardware V2: complete / production files prepared.**

Firmware, enclosure and documentation may continue to receive updates.
