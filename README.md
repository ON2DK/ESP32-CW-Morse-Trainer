# ESP32 CW Morse Trainer

Open-source ESP32 Morse/CW trainer designed by **ON2DK**.

This project is a stand-alone Morse trainer built around a **38-pin ESP32 DevKit with ESP32-WROOM-32D**. It is intended for practising CW without connecting a transceiver.

## Main features

- ESP32-WROOM-32D DevKit, 38-pin version
- ST7789 240x320 SPI TFT support
- Paddle input
- Straight-key input
- Rotary encoder with push switch for menu/settings
- Audio/sidetone section with LM386 and buzzer
- Separate 12 V DC input
- TSR 1-2450 12 V to 5 V DC/DC converter
- POWER LED on the switched 12 V supply
- USB on the ESP32 DevKit for programming
- Predominantly through-hole construction

## PCB status

The hardware design has been completed and checked in KiCad. The latest production version is intended as a 2-layer FR-4 PCB. The PCB layout was checked with KiCad DRC and schematic/PCB parity before generating the production files.

The buzzer position was adjusted in the final layout to make its connector easier to access.

## Repository structure

- `KiCad/` - editable KiCad project files and project-local footprints
- `Gerber/` - production Gerber and drill files
- `Firmware/` - Arduino IDE firmware
- `Enclosure/` - 3D-printable enclosure files and OpenSCAD sources
- `Documentation/` - project logbook, BOM and build notes
- `Images/` - PCB, schematic and 3D-view images

## Power and programming

Normal operation uses the separate **12 V DC input**. The on-board USB connector of the ESP32 DevKit is intended for programming. During USB programming, the external 12 V supply should be switched off.

## Important build note

Always compare the physical pinout and dimensions of purchased components with the KiCad footprints before soldering. Pay particular attention to polarized parts, connectors and transistor pinouts.

## Project status

Hardware: complete / production files prepared.

Firmware and documentation may continue to evolve in later revisions.
