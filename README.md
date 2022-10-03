# X5SA-PRO
Tronxy X5SA-PRO 3D Printer
My early 2022 manufactured unit (you can see the date coded number on the stepper motors) came with a CXY-V6-191121 running Marlin 2.0.9.2 and a custom Tronxy LCD UI, an Ender 3 style hotend, Titan extruder and TMC stepper drivers.  X and Y motor mounts are metal instead of acrylic.

## gcode


## Cura - Cura specific files
- startup.gccode - Startup gccode to paste into Cura to initialize printer before starting a print.  Includes trick from [CHEP youtube video](https://www.youtube.com/watch?v=nQLJrSf4aXE) to heat up bed and hotend simultaneously to start print.  Thanks Chuck!  I've also added tweaks specifically to prevent the printer from oozing a lot of filament while it finishes warming up.
- endprint.gcode - gcode to paste into Cura to run at the end of a print.  Can customize to move bed and print head aside, etc.

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

## Post build calibration
- Set Z-offset, this will vary between your filament, temperature and initial layer height.  Find the best compromise to get good first layer adhesion.  You want to aim for the lowest possible value.  You are limited by the touch UI to the nearest 0.1mm.

- Calibrate e-steps, mine was underextruding by about 10% out of the box
    - Put a paper clip horizontally on the filament where it enters the filament sensor
    - Send the following gcode:
        ``` gcode
        M109 S168
        G92 E100
        G1 F220 E0
        ```
        This preheats the nozzle and ejects what the printer believes to be 100mm of filament.  
    - Measure how much came out between the entrance of the filament sensor and your paperclip.
    - Get your current esteps value from your M503 output:

        09:23:22.629 : echo:; Steps per unit:

        09:23:22.632 : echo:  M92 X160.00 Y160.00 Z800.00 **E766.22**

    - Use [this calculator](https://www.th3dstudio.com/estep-calculator/) along with your old esteps and measured filament length to get your new value
    - Save it to the printer (my new value was 851.36):
        ``` gcode
        M92 E851.36
        M500
        ```
    - Feed your filament back up to the hot end