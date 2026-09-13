# ESP32 CW Morse Trainer V2

Open-source ESP32 Morse/CW trainer designed by **ON2DK**.

The ESP32 CW Morse Trainer V2 is a stand-alone Morse trainer built around a **38-pin ESP32 DevKit with ESP32-WROOM-32D**. It is intended for CW practice without connecting a transceiver.

![ESP32 CW Trainer V2 front PCB](Images/ESP32_CW_TRAINER_V2%20front%20PCB.png)

![ESP32 CW Trainer V2 back PCB](Images/ESP32_CW_TRAINER_V2%20back%20PCB.png)

## Main features

- 38-pin ESP32 DevKit with ESP32-WROOM-32D
- ST7789 240 x 320 SPI TFT support
- Paddle input
- Straight-key input
- Rotary encoder with push switch for menu/settings
- LM386 audio/sidetone section with buzzer
- Free CW practice
- Koch training
- Lesson selection and visible Koch characters
- Session score and total score
- Student profile/settings stored in ESP32 Preferences
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

## Downloads and repository structure

- `KiCad/` - editable KiCad source package: `ESP32_CW_TRAINER_V2_KiCad_Source.zip`
- `Gerber/` - production package: `ESP32_CW_TRAINER_V2_Gerber.zip`
- `Firmware/` - Arduino IDE firmware and firmware notes
- `Enclosure/` - STL files for front panel, rear panel, bottom and lid, plus editable OpenSCAD source
- `Documentation/` - project logbook, BOM and build notes
- `Images/` - front and back PCB images

## Firmware

The V2 Arduino IDE firmware is available as:

- `Firmware/ESP32_CW_TRAINER_V2.ino`

The firmware has been reconciled with the definitive Trainer V2 PCB GPIO mapping and includes ST7789 display support, rotary-encoder control, paddle input, straight-key input, sidetone/audio and the existing Morse Trainer functions such as free practice, Koch training, lessons, scores and Preferences storage.

### Definitive V2 GPIO mapping

| Function | ESP32 GPIO |
|---|---:|
| TFT SCK | 18 |
| TFT MOSI | 23 |
| TFT DC | 2 |
| TFT RESET | 13 |
| TFT CS | 5 |
| TFT BACKLIGHT | 27 |
| Encoder CLK | 16 |
| Encoder DT | 17 |
| Encoder SW | 26 |
| Paddle DIT | 35 |
| Paddle DAH | 32 |
| Straight key | 4 |
| Audio / buzzer | 25 |

**GPIO35 is input-only and does not provide an internal pull-up. The Trainer V2 hardware must therefore provide the required external input bias for the DIT input.**

The current V2 firmware was successfully **compiled/verified in Arduino IDE on 13 September 2026** with **ESP32 Dev Module** selected. Arduino IDE reported approximately:

- Program storage: **1,014,070 bytes (77%)**
- Dynamic memory: **49,416 bytes (15%)**
- Dynamic memory remaining for local variables: approximately **278,264 bytes**

Successful compilation confirms that the current sketch builds with the installed ESP32/Arduino libraries. It does **not** replace practical testing on the assembled Trainer V2 PCB.

## Enclosure files

The enclosure folder contains the current mechanical design for the CW Trainer V2, including a front-panel opening for the 2.8-inch TFT so that only the display area is visible.

Current files include:

- `ESP32_CW_TRAINER_V2_Frontpaneel.stl`
- `ESP32_CW_TRAINER_V2_Achterpaneel.stl`
- `ESP32_CW_TRAINER_V2_Kast_Bodem.stl`
- `ESP32_CW_TRAINER_V2_Kast_Deksel.stl`
- `ESP32_CW_TRAINER_V2_Kast.scad`

The TFT opening should be checked against the exact physical TFT module before final printing.

## Documentation

The final project logbook with BOM is available under `Documentation/` as:

`ESP32_CW_TRAINER_V2_Projectlogboek_DEFINITIEF_MET_BOM.docx`

## Production files

Before ordering a PCB, inspect the Gerbers in a Gerber viewer and verify board outline, drill files, silkscreen, masks and both copper layers.

## Power and programming

Normal operation uses the separate **12 V DC input**. The on-board USB connector of the ESP32 DevKit is intended for programming.

During USB programming, switch the external 12 V supply **OFF**.

Power path:

`12 V DC -> 0.5 A polyfuse -> POWER switch -> TSR 1-2450 -> 5 V -> ESP32 DevKit`

The red POWER LED is connected to the switched 12 V side, so it only lights when the main power switch is ON.

## Important build notes

Always compare the physical pinout and dimensions of purchased components with the KiCad footprints before soldering. In particular, check polarity of LEDs, diodes and electrolytic capacitors, connector orientation and pin order, transistor pinouts, ESP32 DevKit orientation and clear space around the ESP32 antenna area.

Test the 5 V supply before fitting sensitive modules such as the ESP32 and TFT.

## Project status

- Hardware V2: complete / production files prepared
- KiCad electrical checks: passed
- Enclosure: available; final TFT fit to be verified
- Documentation/BOM: available
- V2 firmware: compiles successfully with definitive GPIO mapping
- Practical assembled-PCB firmware/hardware testing: pending
