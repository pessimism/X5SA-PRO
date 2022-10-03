G91 ; Set Positioning to Relative
M83 ; Set Extruder to Relative
G92 E0 ; Reset Extruder
G1 E-4 F3000 ; Retract 4mm of filament
G1 Z0.2 ; Raise nozzle .2mm
G90 ; Set positioning to absolute
G1 X{machine_width} Y{machine_depth} ; Park print head
G91 ; Set Positioning to Relative
G1 Z10 ; Raise nozzle 10mm
M106 S0 ; Turn off part fan
M104 S0 ; Set nozzle temp to zero
M140 S0 ; set bed temp to zero
M84 X Y Z E ; Disable X Y Z and E steppers
G90 ; Reset to absolute positioning
;M997 ; Reboot printer