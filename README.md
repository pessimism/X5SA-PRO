# X5SA-PRO
Tronxy X5SA-PRO 3D Printer
My early 2022 manufactured unit (you can see the date coded number on the stepper motors) came with a CXY-V6-191121 running Marlin 2.0.9.2 and a custom Tronxy LCD UI, an Ender 3 style hotend, Titan extruder and TMC stepper drivers.  X and Y motor mounts are metal instead of acrylic.

## gcode


## Cura - Cura specific files
- startup.gccode - Startup gccode to paste into Cura to initialize printer before starting a print.  Includes trick from [CHEP youtube video](https://www.youtube.com/watch?v=nQLJrSf4aXE) to heat up bed and hotend simultaneously to start print.  Thanks Chuck!

## Manual gcode commands
These need to be run from a USB console interface to the printer such as provided by repetier-host
|Command   | Description  |
|---|---|
|*1 M503|Print Configuration|
|M512|Print Firmware Information|
|   |   |
|   |   |
|   |   |

*1 My unit shipped with Marlin 2.0.9.2 which is one release too old to have SD card save functionality for the configuration so you are limited to running it by USB

