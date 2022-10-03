M17 X Y Z E ; Enable X Y Z and E steppers, stop code from previous print may have disabled them
G28 ; home
M140 S{material_bed_temperature_layer_0} ; Asynchronously start preheating the bed and continue
M109 S168 ; While bed is warming, wait for hotend to preheat to 168 so we can retract, 168 is minimum extrude temp in firmware
G92 E4 ; set extruder's current value to 4 mm
G1 F220 E0 ; retract extruder 4 mm to prevent oozing during remainder of warmup
M104 S{material_print_temperature_layer_0} T0 ; Asynchronously start heating hotend from 168 preheat temp to target print temp
M190 S{material_bed_temperature_layer_0} ; Wait for bed to reach target temperature
M109 S{material_print_temperature_layer_0} T0 ; Wait for hotend to finish heating to target print temp
G1 F220 E5 ; undo retraction and prime a little extra, Cura automatically resets the extruder after this