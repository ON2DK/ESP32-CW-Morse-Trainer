# Build notes - ESP32 CW Morse Trainer V2

## Recommended assembly order

1. Inspect the bare PCB and confirm there are no damaged tracks or plated holes.
2. Fit low-profile resistors and diodes first.
3. Fit capacitors and other small components.
4. Fit IC sockets and the LM386 section.
5. Fit the TSR 1-2450 DC/DC converter.
6. Fit headers, screw terminals, encoder and other taller parts.
7. Fit the buzzer last if this makes access easier during soldering.
8. Inspect all solder joints before applying power.

## First power-up

Do not install the ESP32 DevKit or TFT for the first supply check.

- Check for shorts between supply rails and GND.
- Apply 12 V through the normal input.
- Switch the main POWER switch ON.
- Verify the switched 12 V rail.
- Verify the 5 V output of the TSR 1-2450.
- Confirm the POWER LED behaves as expected.

Only after the power rails are correct should the ESP32 DevKit and display be connected.

## Programming

The USB connector on the ESP32 DevKit is used for programming. Keep the external 12 V supply switched OFF while programming through USB.

## Mechanical checks

Before final enclosure assembly:

- confirm the four M3 mounting positions;
- keep the ESP32 antenna area clear of metal and wiring;
- check connector access;
- verify the actual TFT module dimensions before cutting or printing a display window.

## Production check

Before ordering boards, open the Gerber package in a viewer and inspect:

- F.Cu and B.Cu;
- F.Mask and B.Mask;
- silkscreen text and connector labels;
- Edge.Cuts;
- PTH and NPTH drill files.
