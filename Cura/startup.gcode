;------------------------------------------
;*** Start Dual Nozzle/Bed Preheating ***
M140 S{material_bed_temperature_layer_0} ; start preheating the bed
M104 S{material_print_temperature_layer_0} T0 ; start preheating hotend
G28 ; home
M190 S{material_bed_temperature_layer_0} ; heat to Cura Bed setting 
M109 S{material_print_temperature_layer_0} T0 ; heat to Cura Hotend
;*** End Preheating ***
;-------------------------------------------------
G92 E0 ; Reset Extruder
G28 ; Home all axes