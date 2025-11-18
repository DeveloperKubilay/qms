; HEADER_BLOCK_START
; BambuStudio 02.03.01.51
; model printing time: 36m 28s; total estimated time: 42m 45s
; total layer number: 20
; total filament length [mm] : 1199.36,1401.64
; total filament volume [cm^3] : 2884.80,3371.34
; total filament weight [g] : 3.58,4.18
; model label id: 390,401
; filament_density: 1.24,1.24
; filament_diameter: 1.75,1.75
; max_z_height: 4.20
; filament: 1,2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 70,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0
; change_filament_gcode = ;===== A1 20250822 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if nozzle_temperature[previous_extruder] > 142 && next_extruder < 255}\nM104 S{nozzle_temperature[previous_extruder]}\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S{nozzle_temperature[next_extruder]}\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200
; close_fan_the_first_x_layers = 1,1
; complete_print_exhaust_fan_speed = 70,70
; cool_plate_temp = 35,35
; cool_plate_temp_initial_layer = 35,35
; counter_coef_1 = 0,0
; counter_coef_2 = 0.008,0.008
; counter_coef_3 = -0.041,-0.041
; counter_limit_max = 0.033,0.033
; counter_limit_min = -0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0.075
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0
; enable_prime_tower = 1
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0
; eng_plate_temp_initial_layer = 0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80,80
; fan_direction = undefine
; fan_max_speed = 80,80
; fan_min_speed = 60,60
; filament_adaptive_volumetric_speed = 0,0
; filament_adhesiveness_category = 100,100
; filament_change_length = 10,10
; filament_colour = #898989;#FFFF00
; filament_colour_type = 1;1
; filament_cost = 450,450
; filament_density = 1.24,1.24
; filament_diameter = 1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.99,0.99
; filament_flush_temp = 0,0
; filament_flush_volumetric_speed = 0,0
; filament_ids = Pa2d5013;Pa2d5013
; filament_is_support = 0,0
; filament_map = 1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12,12
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_multi_colour = #898989;#FFFF00
; filament_notes = 
; filament_pre_cooling_temperature = 0,0
; filament_prime_volume = 45,45
; filament_printable = 3,3
; filament_ramming_travel_time = 0,0
; filament_ramming_volumetric_speed = -1,-1
; filament_scarf_gap = 15%,15%
; filament_scarf_height = 10%,10%
; filament_scarf_length = 10,10
; filament_scarf_seam_type = none,none
; filament_self_index = 1,2
; filament_settings_id = "Microzey PLA creality @Bambu Lab A1 0.4 nozzle";"Microzey PLA creality @Bambu Lab A1 0.4 nozzle(Küre.3mf)"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA
; filament_velocity_adaptation_factor = 1,1
; filament_vendor = Microzey;Microzey
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,362,266,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0,0
; hole_coef_2 = -0.008,-0.008
; hole_coef_3 = 0.23415,0.23415
; hole_limit_max = 0.22,0.22
; hole_limit_min = 0.088,0.088
; host_type = octoprint
; hot_plate_temp = 75,75
; hot_plate_temp_initial_layer = 70,70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10,10
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0
; machine_end_gcode = ;===== date: 20231229 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20250822 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM109 S{flush_temperatures[initial_no_support_extruder]} H300\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of "draw extrinsic para cali paint"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220,220
; nozzle_temperature_initial_layer = 210,210
; nozzle_temperature_range_high = 220,220
; nozzle_temperature_range_low = 190,190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,50%
; overhang_threshold_participating_cooling = 95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 8,8
; slow_down_min_speed = 20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45
; supertack_plate_temp_initial_layer = 45,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45
; template_custom_gcode = 
; textured_plate_temp = 75,75
; textured_plate_temp_initial_layer = 70,70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = ;
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 216.972
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R42
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20250822 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S70

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S210

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S210
    M104 S250
    M400
    T0
    G1 X-48.2 F3000
    M400

    M620.1 E F299.339 T220
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A

M109 S220 H300
G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S210
G92 E0
M73 P1 R42
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P1 R41
G1 X-48.2 F3000
M73 P2 R41
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F300
    M983 F5 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P3 R41
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F5 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P13 R36
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S160

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P14 R36
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S70; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X11.7983 Y125.947 I122.027 J118.316
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S210 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S210

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S210
    G0 X128 E8  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.2 F42000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 1/21
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 390
G1 E-.8 F1800
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
G1 X127.04 Y126.985 F42000
M204 S6000
G1 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X127.297 Y126.792 E.01207
G1 X127.529 Y126.684 E.00965
G1 X127.762 Y126.623 E.00904
G1 X128.075 Y126.606 E.01181
G1 X128.389 Y126.66 E.01196
G1 X128.632 Y126.755 E.00985
G1 X128.838 Y126.883 E.00912
G1 X129.018 Y127.044 E.00906
G1 X129.208 Y127.298 E.01194
G1 X129.311 Y127.515 E.00904
G1 X129.372 Y127.739 E.00876
G1 X129.398 Y127.999 E.00983
G1 X129.375 Y128.247 E.00937
G1 X129.283 Y128.55 E.01191
G1 X129.168 Y128.766 E.0092
G1 X128.959 Y129.016 E.01224
G1 X128.722 Y129.195 E.01118
G1 X128.495 Y129.307 E.00954
G1 X128.25 Y129.375 E.00957
G1 X127.992 Y129.398 E.00975
G1 X127.753 Y129.375 E.00903
G1 X127.45 Y129.283 E.01192
G1 X127.234 Y129.168 E.0092
G1 X126.984 Y128.959 E.01224
G1 X126.805 Y128.722 E.01118
G1 X126.693 Y128.495 E.00954
G1 X126.625 Y128.25 E.00957
G1 X126.602 Y127.992 E.00975
G1 X126.625 Y127.753 E.00903
G1 X126.717 Y127.45 E.01192
G1 X126.832 Y127.234 E.0092
G1 X127.002 Y127.031 E.00996
M204 S6000
G1 X127.315 Y127.358 F42000
G1 F3000
M204 S500
G1 X127.506 Y127.201 E.00932
G1 X127.725 Y127.102 E.00903
G1 X128.031 Y127.062 E.01162
G1 X128.369 Y127.137 E.01302
G1 X128.642 Y127.315 E.01227
G1 X128.799 Y127.506 E.00932
G1 X128.881 Y127.67 E.00691
G1 X128.938 Y128.025 E.01353
G1 X128.871 Y128.35 E.01247
G1 X128.738 Y128.579 E.00996
G1 X128.611 Y128.715 E.00701
G1 X128.297 Y128.89 E.01353
G1 X127.972 Y128.938 E.01237
G1 X127.65 Y128.871 E.01237
G1 X127.421 Y128.738 E.00996
G1 X127.285 Y128.611 E.00701
G1 X127.11 Y128.297 E.01353
G1 X127.062 Y127.972 E.01237
G1 X127.129 Y127.65 E.01237
G1 X127.282 Y127.409 E.01076
M204 S6000
G1 X128.05 Y127.642 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X127.99 Y127.638 I-.056 J.357 E.0832
; WIPE_START
G1 X128.181 Y127.686 E-.07489
G1 X128.278 Y127.767 E-.04784
G1 X128.341 Y127.876 E-.04785
G1 X128.362 Y128.003 E-.04885
G1 X128.314 Y128.181 E-.07019
G1 X128.233 Y128.278 E-.04784
G1 X128.121 Y128.341 E-.04888
G1 X128 Y128.362 E-.04674
G1 X127.819 Y128.314 E-.07126
G1 X127.722 Y128.233 E-.04784
G1 X127.659 Y128.121 E-.04888
G1 X127.638 Y128 E-.04675
G1 X127.686 Y127.819 E-.07126
G1 X127.755 Y127.736 E-.04091
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 1 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer1 end: 390,401
M625
M204 S6000
G1 X37.024 Y238.006 F42000
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S6000
G1  X37.524 Y239.006  
M204 S500
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186 F3000
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.663 Y220.401   I1.763 J-0.728 E0.0904
G1 E-0.8000 F1800
M204 S6000
G1  X17.409 Y218.611   F600
G1 E0.8000 F1800
M204 S500
G3  X20.133 Y216.972   I2.971 J1.853 E0.1254 F3000
G3  X22.558 Y218.499   I-3.985 J9.017 E0.1093
G2  X24.704 Y219.006   I2.178 J-4.424 E0.0845
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
M204 S6000
G1  X39.353 Y237.786  
M204 S500
G3  X36.137 Y241.040   I-19.312 J-15.868 E0.1741
G3  X32.360 Y240.267   I-1.481 J-2.378 E0.1616
G2  X29.840 Y239.463   I-2.537 J3.603 E0.1021
G2  X24.036 Y239.515   I-2.566 J37.644 E0.2208
G2  X20.919 Y241.269   I1.473 J6.266 E0.1378
G3  X18.133 Y240.797   I-1.061 J-2.199 E0.1145
G3  X14.968 Y237.513   I16.267 J-18.842 E0.1736
G3  X15.789 Y233.914   I2.263 J-1.377 E0.1552
G2  X16.567 Y231.555   I-3.235 J-2.375 E0.0960
G2  X16.517 Y225.825   I-36.060 J-2.549 E0.2180
G2  X14.808 Y222.913   I-5.688 J1.381 E0.1301
G3  X15.195 Y220.226   I2.087 J-1.071 E0.1100
G3  X18.411 Y216.972   I19.312 J15.868 E0.1741
G3  X22.188 Y217.745   I1.481 J2.378 E0.1616
G2  X24.709 Y218.549   I2.538 J-3.603 E0.1021
G2  X30.512 Y218.497   I2.565 J-37.660 E0.2208
G2  X33.629 Y216.743   I-1.473 J-6.266 E0.1378
G3  X34.915 Y216.504   I1.077 J2.210 E0.0503
G3  X36.415 Y217.215   I-0.231 J2.425 E0.0644
G3  X39.580 Y220.499   I-16.267 J18.842 E0.1736
G3  X38.759 Y224.098   I-2.263 J1.377 E0.1552
G2  X37.981 Y226.456   I3.235 J2.375 E0.0959
G2  X38.031 Y232.187   I36.045 J2.550 E0.2181
G2  X39.740 Y235.099   I5.688 J-1.381 E0.1301
G3  X39.353 Y237.786   I-2.087 J1.071 E0.1100
M204 S6000
G1  X39.686 Y238.098  
M204 S500
G3  X36.410 Y241.407   I-19.543 J-16.075 E0.1772
G3  X32.095 Y240.639   I-1.766 J-2.587 E0.1845
G2  X29.836 Y239.920   I-2.271 J3.224 E0.0915
G2  X24.106 Y239.967   I-2.562 J37.368 E0.2180
G2  X21.121 Y241.679   I2.026 J6.990 E0.1320
G3  X17.812 Y241.123   I-1.262 J-2.616 E0.1360
G3  X14.595 Y237.778   I16.483 J-19.070 E0.1766
G3  X15.503 Y233.528   I2.830 J-1.617 E0.1808
G2  X16.110 Y231.550   I-2.905 J-1.974 E0.0798
G2  X16.065 Y225.897   I-35.826 J-2.544 E0.2151
G2  X14.403 Y223.126   I-6.287 J1.886 E0.1241
G3  X14.862 Y219.914   I2.499 J-1.283 E0.1315
G3  X18.138 Y216.605   I19.539 J16.071 E0.1772
G3  X22.453 Y217.373   I1.766 J2.587 E0.1845
G2  X24.713 Y218.092   I2.271 J-3.224 E0.0915
G2  X30.442 Y218.045   I2.561 J-37.386 E0.2180
G2  X33.427 Y216.333   I-2.026 J-6.990 E0.1320
G3  X34.957 Y216.048   I1.281 J2.630 E0.0599
G3  X36.736 Y216.889   I-0.275 J2.884 E0.0763
G3  X39.953 Y220.234   I-16.478 J19.065 E0.1766
G3  X39.045 Y224.484   I-2.830 J1.617 E0.1808
G2  X38.438 Y226.461   I2.905 J1.974 E0.0798
G2  X38.483 Y232.115   I35.808 J2.545 E0.2151
G2  X40.145 Y234.886   I6.287 J-1.886 E0.1241
M73 P15 R36
G3  X39.686 Y238.099   I-2.499 J1.283 E0.1315
M204 S6000
G1  X40.020 Y238.411  
M204 S500
G3  X36.684 Y241.774   I-19.798 J-16.307 E0.1803
G3  X31.720 Y240.937   I-2.028 J-3.112 E0.2102
G2  X29.832 Y240.377   I-1.882 J2.883 E0.0759
G2  X24.177 Y240.418   I-2.558 J37.154 E0.2151
G2  X21.324 Y242.089   I2.537 J7.604 E0.1266
G3  X17.491 Y241.448   I-1.463 J-3.032 E0.1574
G3  X14.222 Y238.042   I16.723 J-19.322 E0.1797
G3  X15.125 Y233.270   I2.988 J-1.906 E0.2033
G2  X15.653 Y231.546   I-2.526 J-1.716 E0.0696
G2  X15.614 Y225.970   I-35.661 J-2.540 E0.2121
G2  X13.998 Y223.339   I-6.768 J2.343 E0.1183
G3  X14.528 Y219.601   I2.911 J-1.494 E0.1529
G3  X17.864 Y216.238   I19.802 J16.311 E0.1803
G3  X22.828 Y217.075   I2.028 J3.112 E0.2102
G2  X24.717 Y217.635   I1.882 J-2.883 E0.0760
G2  X30.371 Y217.594   I2.557 J-37.175 E0.2151
G2  X33.224 Y215.923   I-2.537 J-7.604 E0.1266
G3  X34.998 Y215.593   I1.485 J3.049 E0.0694
G3  X37.057 Y216.564   I-0.318 J3.342 E0.0882
G3  X40.326 Y219.970   I-16.719 J19.318 E0.1797
G3  X39.423 Y224.742   I-2.989 J1.906 E0.2033
G2  X38.895 Y226.466   I2.526 J1.716 E0.0696
G2  X38.934 Y232.042   I35.640 J2.540 E0.2122
G2  X40.550 Y234.673   I6.769 J-2.344 E0.1183
G3  X40.020 Y238.411   I-2.911 J1.494 E0.1529
M204 S6000
G1  X40.353 Y238.724  
M204 S500
G3  X36.957 Y242.140   I-20.069 J-16.554 E0.1833
G3  X31.373 Y241.259   I-2.291 J-3.617 E0.2347
G2  X29.828 Y240.834   I-1.547 J2.608 E0.0616
G2  X24.247 Y240.870   I-2.554 J36.997 E0.2123
G2  X21.527 Y242.499   I2.593 J7.418 E0.1214
G3  X17.170 Y241.774   I-1.664 J-3.449 E0.1789
G3  X13.848 Y238.306   I16.979 J-19.589 E0.1828
G3  X14.803 Y232.927   I3.459 J-2.160 E0.2275
G2  X15.196 Y231.541   I-2.244 J-1.384 E0.0554
G2  X15.163 Y226.043   I-35.591 J-2.535 E0.2092
G2  X13.593 Y223.551   I-6.553 J2.387 E0.1128
G3  X14.195 Y219.288   I3.322 J-1.706 E0.1744
G3  X17.591 Y215.872   I20.075 J16.560 E0.1833
G3  X23.175 Y216.753   I2.291 J3.617 E0.2347
G2  X24.721 Y217.178   I1.547 J-2.608 E0.0617
G2  X30.301 Y217.142   I2.553 J-37.021 E0.2123
G2  X33.021 Y215.513   I-2.593 J-7.418 E0.1214
G3  X35.040 Y215.137   I1.690 J3.469 E0.0790
G3  X37.378 Y216.238   I-0.361 J3.801 E0.1002
G3  X40.700 Y219.706   I-16.975 J19.585 E0.1828
G3  X39.745 Y225.085   I-3.458 J2.161 E0.2275
G2  X39.352 Y226.470   I2.244 J1.384 E0.0554
G2  X39.385 Y231.969   I35.566 J2.536 E0.2092
G2  X40.955 Y234.461   I6.554 J-2.388 E0.1128
G3  X40.353 Y238.724   I-3.322 J1.706 E0.1744
M204 S6000
G1  X40.687 Y239.037  
M204 S500
G3  X37.231 Y242.507   I-20.359 J-16.820 E0.1864
G3  X31.137 Y241.651   I-2.581 J-3.738 E0.2569
G2  X29.823 Y241.291   I-1.310 J2.208 E0.0524
G2  X24.318 Y241.322   I-2.549 J36.943 E0.2095
G2  X21.729 Y242.909   I3.404 J8.455 E0.1159
G3  X16.849 Y242.100   I-1.866 J-3.866 E0.2004
G3  X13.475 Y238.570   I17.252 J-19.872 E0.1858
G3  X14.459 Y232.612   I3.845 J-2.426 E0.2510
G2  X14.739 Y231.536   I-1.864 J-1.059 E0.0427
G2  X14.711 Y226.116   I-35.687 J-2.530 E0.2062
G2  X13.188 Y223.764   I-7.395 J3.120 E0.1070
G3  X13.861 Y218.975   I3.734 J-1.917 E0.1959
G3  X17.317 Y215.505   I20.368 J16.829 E0.1864
G3  X23.411 Y216.361   I2.581 J3.738 E0.2569
G2  X24.725 Y216.721   I1.310 J-2.208 E0.0524
G2  X30.230 Y216.690   I2.549 J-36.972 E0.2094
G2  X32.819 Y215.103   I-3.404 J-8.455 E0.1159
G3  X35.081 Y214.682   I1.894 J3.888 E0.0885
G3  X37.699 Y215.912   I-0.405 J4.260 E0.1121
G3  X41.073 Y219.442   I-17.248 J19.869 E0.1858
G3  X40.089 Y225.400   I-3.845 J2.426 E0.2510
G2  X39.809 Y226.475   I1.863 J1.059 E0.0427
G2  X39.837 Y231.896   I35.656 J2.531 E0.2063
G2  X41.360 Y234.248   I7.384 J-3.113 E0.1070
G3  X40.687 Y239.037   I-3.734 J1.917 E0.1959
M204 S6000
G1  X41.020 Y239.350  
M204 S500
G3  X37.504 Y242.874   I-20.658 J-17.094 E0.1895
G3  X30.833 Y242.003   I-2.846 J-4.185 E0.2797
G2  X29.819 Y241.748   I-0.996 J1.821 E0.0401
G2  X24.388 Y241.773   I-2.545 J37.064 E0.2066
G2  X22.256 Y243.143   I1.806 J5.155 E0.0972
G3  X16.529 Y242.425   I-2.401 J-4.047 E0.2362
G3  X13.102 Y238.835   I17.534 J-20.165 E0.1889
G3  X14.094 Y232.327   I4.182 J-2.692 E0.2734
G2  X14.282 Y231.532   I-1.535 J-0.782 E0.0313
G2  X14.260 Y226.188   I-36.082 J-2.526 E0.2033
G2  X12.964 Y224.290   I-4.464 J1.656 E0.0882
G3  X13.528 Y218.663   I3.907 J-2.450 E0.2314
G3  X17.044 Y215.138   I20.663 J17.100 E0.1895
G3  X23.715 Y216.009   I2.846 J4.184 E0.2797
G2  X24.730 Y216.264   I0.996 J-1.821 E0.0402
G2  X30.160 Y216.239   I2.544 J-37.100 E0.2066
G2  X32.292 Y214.869   I-1.806 J-5.156 E0.0972
G3  X35.123 Y214.226   I2.475 J4.343 E0.1119
G3  X38.019 Y215.587   I-0.448 J4.718 E0.1241
G3  X41.446 Y219.177   I-17.533 J20.163 E0.1889
G3  X40.454 Y225.685   I-4.182 J2.692 E0.2734
G2  X40.266 Y226.479   I1.535 J0.782 E0.0313
G2  X40.288 Y231.824   I36.042 J2.526 E0.2033
G2  X41.584 Y233.722   I4.466 J-1.657 E0.0882
G3  X41.020 Y239.350   I-3.907 J2.450 E0.2314
M204 S6000
G1  X41.354 Y239.662  
M204 S500
G3  X37.777 Y243.241   I-20.961 J-17.372 E0.1926
G3  X30.502 Y242.348   I-3.112 J-4.732 E0.3030
G2  X29.815 Y242.205   I-0.667 J1.483 E0.0269
G2  X24.458 Y242.225   I-2.541 J37.498 E0.2038
G2  X22.134 Y243.729   I7.839 J14.657 E0.1053
G3  X16.208 Y242.751   I-2.268 J-4.700 E0.2433
G3  X12.728 Y239.099   I17.820 J-20.460 E0.1920
G3  X13.729 Y232.029   I4.709 J-2.939 E0.2948
G2  X13.825 Y231.527   I-1.181 J-0.485 E0.0196
G2  X13.815 Y226.308   I-41.700 J-2.535 E0.1985
G2  X12.379 Y224.189   I-11.494 J6.249 E0.0974
G3  X13.194 Y218.350   I4.558 J-2.340 E0.2388
G3  X16.771 Y214.771   I20.966 J17.378 E0.1926
G3  X24.046 Y215.664   I3.112 J4.733 E0.3030
G2  X24.734 Y215.807   I0.666 J-1.483 E0.0269
G2  X30.090 Y215.787   I2.540 J-37.545 E0.2037
G2  X32.413 Y214.283   I-7.839 J-14.657 E0.1053
G3  X35.164 Y213.771   I2.303 J4.728 E0.1076
G3  X38.340 Y215.261   I-0.492 J5.177 E0.1360
G3  X41.820 Y218.913   I-17.824 J20.464 E0.1920
G3  X40.819 Y225.983   I-4.709 J2.939 E0.2948
G2  X40.723 Y226.484   I1.181 J0.485 E0.0195
G2  X40.733 Y231.704   I41.675 J2.536 E0.1985
G2  X42.169 Y233.823   I11.491 J-6.248 E0.0974
G3  X41.354 Y239.662   I-4.558 J2.340 E0.2388
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z.6 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z3.2 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E17
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
M73 P17 R35
G1 E1.3314 F50
G1 E11.9826 F299.339
M73 P18 R35
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
M73 P18 R34
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z3.2
M106 P1 S0

M204 S500



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
M73 P19 R34
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S0
G1 X9.798 Y219.506 F42000
G1 Z.2

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y219.506 Z.6
G1 X17.524 Y219.506 Z.6
G1 Z.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0,575000
M204 S500
G1  X20.524 Y219.506  E0.1311 F990
G1 E-0.8000 F1800
M204 S6000
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S500
G1  X37.024  E0.7212 F990
G1  Y220.006  E0.0219
G1  X17.524  E0.8523 F1125
G1  Y220.506  E0.0219
G1  X37.024  E0.8523 F1374
G1  Y221.006  E0.0219
G1  X17.524  E0.8523 F2625
G1  Y221.506  E0.0219
G1  X37.024  E0.8523 F2675
G1  Y222.006  E0.0219
G1  X17.524  E0.8523 F2725
G1  Y222.506  E0.0219
G1  X37.024  E0.8523 F2775
G1  Y223.006  E0.0219
G1  X17.524  E0.8523 F2825
G1  Y223.506  E0.0219
G1  X37.024  E0.8523 F2875
G1  Y224.006  E0.0219
G1  X17.524  E0.8523 F2925
G1  Y224.506  E0.0219
G1  X37.024  E0.8523 F2975
G1  Y225.006  E0.0219
G1  X17.524  E0.8523 F3000
G1  Y225.506  E0.0219
G1  X37.024  E0.8523
G1  Y226.006  E0.0219
G1  X17.524  E0.8523
G1  Y226.506  E0.0219
M73 P20 R34
G1  X37.024  E0.8523
G1  Y227.006  E0.0219
G1  X17.524  E0.8523
G1  Y227.506  E0.0219
G1  X37.024  E0.8523
G1  Y228.006  E0.0219
G1  X17.524  E0.8523
G1  Y228.506  E0.0219
G1  X37.024  E0.8523
G1  Y229.006  E0.0219
G1  X17.524  E0.8523
G1  Y229.506  E0.0219
G1  X37.024  E0.8523
G1  Y230.006  E0.0219
G1  X17.524  E0.8523
G1  Y230.506  E0.0219
G1  X37.024  E0.8523
G1  Y231.006  E0.0219
G1  X17.524  E0.8523
G1  Y231.506  E0.0219
G1  X37.024  E0.8523
G1  Y232.006  E0.0219
G1  X17.524  E0.8523
G1  Y232.506  E0.0219
G1  X37.024  E0.8523
G1  Y233.006  E0.0219
G1  X17.524  E0.8523
G1  Y233.506  E0.0219
G1  X37.024  E0.8523
G1  Y234.006  E0.0219
G1  X17.524  E0.8523
G1  Y234.506  E0.0219
G1  X37.024  E0.8523
G1  Y235.006  E0.0219
G1  X17.524  E0.8523
G1  Y235.506  E0.0219
G1  X37.024  E0.8523
G1  Y236.006  E0.0219
G1  X17.524  E0.8523
G1  Y236.506  E0.0219
G1  X37.024  E0.8523
G1  Y237.006  E0.0219
G1  X17.524  E0.8523
G1  Y237.506  E0.0219
G1  X37.024  E0.8523
G1  Y238.006  E0.0219
G1  X17.524  E0.8523
G1  Y238.506  E0.0219
M73 P20 R33
G1  X37.024  E0.8523
; LINE_WIDTH: 0,500000
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F3000
M204 S500
G1 X35.024 Y238.506 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S6000
G1 X131.062 Y129.603
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X130.881 Y129.363 E.01131
G1 X130.778 Y129.148 E.00896
G1 X130.714 Y128.916 E.00906
G1 X130.692 Y128.663 E.00955
G1 X130.714 Y128.43 E.0088
G1 X130.804 Y128.133 E.01171
G1 X130.914 Y127.928 E.00871
G1 X131.125 Y127.677 E.01236
G1 X131.37 Y127.492 E.01156
G1 X131.597 Y127.387 E.00942
G1 X131.824 Y127.327 E.00881
G1 X132.131 Y127.311 E.01158
G1 X132.448 Y127.366 E.01209
G1 X132.672 Y127.455 E.00907
G1 X132.874 Y127.58 E.00893
G1 X133.049 Y127.737 E.00885
G1 X133.236 Y127.986 E.01171
G1 X133.333 Y128.191 E.00854
G1 X133.401 Y128.44 E.00972
G1 X133.421 Y128.679 E.00903
G1 X133.399 Y128.913 E.00882
G1 X133.309 Y129.21 E.01171
G1 X133.199 Y129.414 E.00871
G1 X132.988 Y129.666 E.01236
G1 X132.748 Y129.847 E.01131
G1 X132.533 Y129.95 E.00896
G1 X132.301 Y130.014 E.00906
G1 X132.048 Y130.036 E.00955
G1 X131.815 Y130.014 E.0088
G1 X131.518 Y129.924 E.01171
G1 X131.314 Y129.814 E.00871
G1 X131.108 Y129.642 E.01011
M204 S6000
G1 X131.444 Y129.34 F42000
G1 F3000
M204 S500
G1 X131.332 Y129.216 E.00626
G1 X131.223 Y129.027 E.00821
G1 X131.152 Y128.723 E.01175
G1 X131.189 Y128.41 E.01184
G1 X131.217 Y128.333 E.00309
G1 X131.395 Y128.053 E.01248
G1 X131.562 Y127.912 E.00824
G1 X131.717 Y127.83 E.00658
G1 X132.005 Y127.767 E.01111
G1 X132.337 Y127.811 E.01258
G1 X132.414 Y127.839 E.00309
G1 X132.664 Y127.997 E.01111
G1 X132.781 Y128.127 E.00657
G1 X132.888 Y128.312 E.00807
G1 X132.961 Y128.619 E.01187
G1 X132.924 Y128.932 E.01187
G1 X132.896 Y129.01 E.00309
G1 X132.731 Y129.279 E.01186
G1 X132.601 Y129.396 E.00658
G1 X132.412 Y129.505 E.00821
G1 X132.108 Y129.576 E.01175
G1 X131.795 Y129.539 E.01184
G1 X131.718 Y129.511 E.00309
G1 X131.493 Y129.373 E.00993
M204 S6000
G1 X132.056 Y128.999 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X132.057 Y128.342 I-.002 J-.328 E.03895
G1 X132.11 Y128.347 E.00202
G3 X132.116 Y128.993 I-.055 J.324 E.0344
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X131.892 Y128.956 E-.08644
G1 X131.804 Y128.883 E-.0434
G1 X131.747 Y128.783 E-.04381
G1 X131.727 Y128.671 E-.04309
G1 X131.772 Y128.507 E-.06473
G1 X131.845 Y128.419 E-.04342
G1 X131.944 Y128.362 E-.04345
G1 X132.057 Y128.342 E-.04345
G1 X132.11 Y128.347 E-.02043
G1 X132.221 Y128.386 E-.04476
G1 X132.309 Y128.46 E-.04343
G1 X132.364 Y128.556 E-.04211
G1 X132.386 Y128.671 E-.04473
G1 X132.366 Y128.784 E-.04341
G1 X132.268 Y128.924 E-.06473
G1 X132.168 Y128.981 E-.04381
G1 X132.166 Y128.981 E-.00082
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 2/21
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S173.4
; open powerlost recovery
M1003 S1
M104 S220 ; set nozzle temperature
M140 S75 ; set bed temperature
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.541 J-1.09 P1  F42000
G1 X132.056 Y129.036 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X131.992 Y128.307 I-.005 J-.367 E.0368
G3 X132.074 Y128.303 I.053 J.23 E.00277
G3 X132.116 Y129.03 I-.023 J.366 E.03566
M204 S10000
G1 X132.057 Y129.433 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G3 X131.795 Y127.954 I-.007 J-.761 E.0664
G3 X132.109 Y127.912 I.263 J.78 E.00987
G3 X132.116 Y129.43 I-.059 J.759 E.07035
M106 S173.4
; WIPE_START
M204 S6000
G1 X131.795 Y129.389 E-.123
G1 X131.566 Y129.256 E-.10079
G1 X131.395 Y129.053 E-.10079
G1 X131.304 Y128.804 E-.10077
G1 X131.305 Y128.539 E-.10078
G1 X131.395 Y128.29 E-.10077
G1 X131.566 Y128.086 E-.10078
G1 X131.639 Y128.044 E-.03234
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 2 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer2 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z3.4 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E16
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
M73 P23 R32
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z3.4
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
M73 P24 R32
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S173.4
G1 X22.403 Y211.75 F42000
M204 S10000
G1 Z.4
G1 X30.036 Y211.75 Z.8
G1 X44.749 Y211.75 Z.8
G1 X44.749 Y238.256

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y238.256
G1 Z.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
G1  X17.524  E0.6271 F1782
G1  Y237.506  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X17.524  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X17.524  E0.7411
G1  Y224.006  E0.0285
G1  X37.024  E0.7411
G1  Y223.256  E0.0285
G1  X17.524  E0.7411
G1  Y222.506  E0.0285
G1  X37.024  E0.7411
G1  Y221.756  E0.0285
G1  X17.524  E0.7411
G1  Y221.006  E0.0285
G1  X37.024  E0.7411
G1  Y220.256  E0.0285
G1  X17.524  E0.7411
G1  Y219.506  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.383 Y239.151  
M204 S6000
G3  X34.874 Y241.053   I-3.832 J-2.449 E0.1222
G3  X32.472 Y239.790   I0.308 J-3.502 E0.1059
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
M73 P25 R32
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.123 Y237.357   I-1.746 J0.726 E0.0771
M204 S10000
G1  X39.353 Y237.786  
M204 S6000
G3  X36.137 Y241.040   I-19.312 J-15.868 E0.1741
G3  X32.360 Y240.267   I-1.481 J-2.378 E0.1616
G2  X29.840 Y239.463   I-2.537 J3.603 E0.1021
G2  X24.036 Y239.515   I-2.566 J37.644 E0.2208
G2  X20.919 Y241.269   I1.473 J6.266 E0.1378
G3  X18.133 Y240.797   I-1.061 J-2.199 E0.1145
G3  X14.968 Y237.513   I16.267 J-18.842 E0.1736
G3  X15.789 Y233.914   I2.263 J-1.377 E0.1552
G2  X16.567 Y231.555   I-3.235 J-2.375 E0.0960
G2  X16.517 Y225.825   I-36.060 J-2.549 E0.2180
G2  X14.808 Y222.913   I-5.688 J1.381 E0.1301
G3  X15.195 Y220.226   I2.087 J-1.071 E0.1100
G3  X18.411 Y216.972   I19.312 J15.868 E0.1741
G3  X22.188 Y217.745   I1.481 J2.378 E0.1616
G2  X24.709 Y218.549   I2.538 J-3.603 E0.1021
G2  X30.512 Y218.497   I2.565 J-37.660 E0.2208
G2  X33.629 Y216.743   I-1.473 J-6.266 E0.1378
G3  X36.415 Y217.215   I1.061 J2.199 E0.1145
G3  X39.580 Y220.499   I-16.267 J18.842 E0.1736
G3  X38.759 Y224.098   I-2.263 J1.377 E0.1552
G2  X37.981 Y226.456   I3.235 J2.375 E0.0959
G2  X38.031 Y232.187   I36.045 J2.550 E0.2181
G2  X39.740 Y235.099   I5.688 J-1.381 E0.1301
G3  X39.353 Y237.786   I-2.087 J1.071 E0.1100
M204 S10000
G1  X39.686 Y238.098  
M204 S6000
G3  X36.585 Y241.265   I-41.845 J-37.873 E0.1685
G3  X32.095 Y240.639   I-1.949 J-2.438 E0.1929
G2  X29.836 Y239.920   I-2.271 J3.224 E0.0915
G2  X24.106 Y239.967   I-2.562 J37.368 E0.2180
G2  X21.121 Y241.679   I2.026 J6.990 E0.1320
G3  X17.812 Y241.123   I-1.262 J-2.616 E0.1360
G3  X14.595 Y237.778   I16.483 J-19.070 E0.1766
G3  X15.503 Y233.528   I2.830 J-1.617 E0.1808
G2  X16.110 Y231.550   I-2.905 J-1.974 E0.0798
G2  X16.065 Y225.897   I-35.826 J-2.544 E0.2151
G2  X14.403 Y223.126   I-6.287 J1.886 E0.1241
G3  X14.862 Y219.913   I2.499 J-1.283 E0.1315
G3  X18.138 Y216.605   I19.538 J16.071 E0.1772
G3  X22.453 Y217.373   I1.766 J2.587 E0.1845
G2  X24.713 Y218.092   I2.271 J-3.224 E0.0915
G2  X30.442 Y218.045   I2.561 J-37.386 E0.2180
G2  X33.427 Y216.333   I-2.026 J-6.990 E0.1320
G3  X36.736 Y216.889   I1.262 J2.616 E0.1360
G3  X39.953 Y220.234   I-16.478 J19.065 E0.1766
G3  X39.045 Y224.484   I-2.830 J1.617 E0.1808
G2  X38.438 Y226.461   I2.905 J1.974 E0.0798
G2  X38.483 Y232.115   I35.808 J2.545 E0.2151
G2  X40.145 Y234.886   I6.287 J-1.886 E0.1241
G3  X39.686 Y238.099   I-2.499 J1.283 E0.1315
M204 S10000
G1  X40.020 Y238.411  
M204 S6000
G3  X36.887 Y241.610   I-42.279 J-38.284 E0.1702
G3  X31.720 Y240.937   I-2.246 J-2.928 E0.2199
G2  X29.832 Y240.377   I-1.882 J2.883 E0.0759
G2  X24.177 Y240.418   I-2.558 J37.154 E0.2151
G2  X21.324 Y242.089   I2.537 J7.604 E0.1266
G3  X17.491 Y241.448   I-1.463 J-3.032 E0.1574
G3  X14.222 Y238.042   I16.723 J-19.322 E0.1797
G3  X15.125 Y233.270   I2.988 J-1.906 E0.2033
G2  X15.653 Y231.546   I-2.526 J-1.716 E0.0696
G2  X15.614 Y225.970   I-35.661 J-2.540 E0.2121
G2  X13.998 Y223.339   I-6.768 J2.343 E0.1183
G3  X14.528 Y219.601   I2.911 J-1.494 E0.1529
G3  X17.864 Y216.238   I19.801 J16.310 E0.1803
G3  X22.828 Y217.075   I2.028 J3.112 E0.2102
G2  X24.717 Y217.635   I1.882 J-2.883 E0.0760
G2  X30.371 Y217.594   I2.557 J-37.175 E0.2151
G2  X33.224 Y215.923   I-2.537 J-7.604 E0.1266
G3  X37.057 Y216.564   I1.463 J3.032 E0.1574
G3  X40.326 Y219.970   I-16.719 J19.318 E0.1797
M73 P25 R31
G3  X39.423 Y224.742   I-2.989 J1.906 E0.2033
G2  X38.895 Y226.466   I2.526 J1.716 E0.0696
G2  X38.934 Y232.042   I35.640 J2.540 E0.2122
G2  X40.550 Y234.673   I6.769 J-2.344 E0.1183
G3  X40.020 Y238.411   I-2.911 J1.494 E0.1529
M204 S10000
G1  X40.353 Y238.724  
M204 S6000
G3  X36.957 Y242.140   I-20.069 J-16.554 E0.1833
G3  X31.373 Y241.259   I-2.291 J-3.617 E0.2347
G2  X29.828 Y240.834   I-1.547 J2.608 E0.0616
G2  X24.247 Y240.870   I-2.554 J36.997 E0.2123
G2  X21.527 Y242.499   I2.593 J7.418 E0.1214
G3  X17.170 Y241.774   I-1.664 J-3.449 E0.1789
G3  X13.848 Y238.306   I16.979 J-19.589 E0.1828
G3  X14.803 Y232.927   I3.459 J-2.160 E0.2275
G2  X15.196 Y231.541   I-2.244 J-1.384 E0.0554
G2  X15.163 Y226.043   I-35.591 J-2.535 E0.2092
G2  X13.593 Y223.551   I-6.553 J2.387 E0.1128
G3  X14.195 Y219.288   I3.322 J-1.706 E0.1744
G3  X17.591 Y215.872   I20.075 J16.560 E0.1833
G3  X23.175 Y216.753   I2.291 J3.617 E0.2347
G2  X24.721 Y217.178   I1.547 J-2.608 E0.0617
G2  X30.301 Y217.142   I2.553 J-37.021 E0.2123
G2  X33.021 Y215.513   I-2.593 J-7.418 E0.1214
G3  X37.378 Y216.238   I1.664 J3.449 E0.1789
G3  X40.700 Y219.706   I-16.979 J19.589 E0.1828
G3  X39.745 Y225.085   I-3.458 J2.161 E0.2275
G2  X39.352 Y226.470   I2.244 J1.384 E0.0554
G2  X39.385 Y231.969   I35.566 J2.536 E0.2092
G2  X40.955 Y234.461   I6.554 J-2.388 E0.1128
G3  X40.353 Y238.724   I-3.322 J1.706 E0.1744
M204 S10000
G1  X40.687 Y239.037  
M204 S6000
G3  X37.489 Y242.298   I-43.086 J-39.046 E0.1736
G3  X31.137 Y241.651   I-2.850 J-3.527 E0.2692
G2  X29.823 Y241.291   I-1.310 J2.208 E0.0524
G2  X24.318 Y241.322   I-2.549 J36.943 E0.2095
G2  X21.729 Y242.909   I3.404 J8.455 E0.1159
G3  X16.849 Y242.100   I-1.866 J-3.866 E0.2004
G3  X13.475 Y238.570   I17.252 J-19.872 E0.1858
G3  X14.459 Y232.612   I3.845 J-2.426 E0.2510
G2  X14.739 Y231.536   I-1.864 J-1.059 E0.0427
G2  X14.711 Y226.116   I-35.687 J-2.530 E0.2062
G2  X13.188 Y223.764   I-7.395 J3.120 E0.1070
G3  X13.861 Y218.975   I3.734 J-1.917 E0.1959
G3  X17.317 Y215.505   I20.365 J16.825 E0.1864
G3  X23.411 Y216.361   I2.581 J3.738 E0.2569
G2  X24.725 Y216.721   I1.310 J-2.208 E0.0524
G2  X30.230 Y216.690   I2.549 J-36.972 E0.2094
G2  X32.819 Y215.103   I-3.404 J-8.455 E0.1159
G3  X37.699 Y215.912   I1.866 J3.866 E0.2004
G3  X41.073 Y219.442   I-17.248 J19.869 E0.1858
G3  X40.089 Y225.400   I-3.845 J2.426 E0.2510
G2  X39.809 Y226.475   I1.863 J1.059 E0.0427
G2  X39.837 Y231.896   I35.656 J2.531 E0.2063
G2  X41.360 Y234.248   I7.384 J-3.113 E0.1070
G3  X40.687 Y239.037   I-3.734 J1.917 E0.1959
; WIPE_TOWER_END

; WIPE_START
G1 F600
M204 S6000
G1 X40.874 Y238.828 E-.10667
G1 X40.935 Y238.749 E-.03795
G1 X41.073 Y238.571 E-.08565
G1 X41.25 Y238.298 E-.12367
G1 X41.406 Y238.012 E-.12373
G1 X41.538 Y237.714 E-.1237
G1 X41.647 Y237.408 E-.12367
G1 X41.671 Y237.319 E-.03496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.08 Y127.549
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X128 Y127.542 I-.08 J.45 E.09354
G1 X128.02 Y127.544 E.00066
M204 S10000
G1 X128.114 Y127.159 F42000
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X128.148 Y127.163 E.00114
G3 X127.852 Y127.162 I-.152 J.836 E.16886
G3 X128.009 Y127.149 I.113 J.439 E.00531
G1 X128.054 Y127.153 E.0015
M106 S173.4
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F600
M204 S6000
G1 X128.148 Y127.163 E-.03577
G1 X128.291 Y127.2 E-.05634
G1 X128.426 Y127.263 E-.0564
G1 X128.547 Y127.348 E-.05639
G1 X128.652 Y127.453 E-.05642
G1 X128.737 Y127.574 E-.05639
G1 X128.8 Y127.709 E-.0564
G1 X128.838 Y127.852 E-.05639
G1 X128.851 Y128 E-.05642
G1 X128.838 Y128.148 E-.05636
G1 X128.8 Y128.291 E-.05641
G1 X128.737 Y128.426 E-.0564
G1 X128.652 Y128.547 E-.05639
G1 X128.564 Y128.636 E-.04753
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 3/21
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S165.75
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I1.159 J-.372 P1  F42000
G1 X128.128 Y127.276 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X128 Y127.265 I-.128 J.722 E.15018
G1 X128.068 Y127.271 E.00228
M204 S10000
G1 X128.194 Y126.888 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1200
M204 S5000
G1 X128.196 Y126.889 E.00008
G3 X127.804 Y126.888 I-.197 J1.109 E.20747
G1 X128.003 Y126.872 E.00619
G1 X128.134 Y126.883 E.00408
M106 S165.75
; WIPE_START
M204 S6000
G1 X128.196 Y126.889 E-.02371
G1 X128.386 Y126.939 E-.07474
G1 X128.564 Y127.023 E-.07475
G1 X128.725 Y127.135 E-.07477
G1 X128.865 Y127.275 E-.07478
G1 X128.977 Y127.436 E-.07474
G1 X129.061 Y127.614 E-.07476
G1 X129.112 Y127.804 E-.07478
G1 X129.129 Y128 E-.07474
G1 X129.112 Y128.196 E-.07475
G1 X129.068 Y128.357 E-.06348
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I.548 J-1.087 P1  F42000
G1 X128.252 Y127.945 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55525
G1 F7026.721
M204 S6000
G1 X128.177 Y127.803 E.00678
G1 X127.996 Y127.732 E.0082
G1 X127.828 Y127.794 E.00755
G1 X127.737 Y127.949 E.00756
G1 X127.794 Y128.172 E.00972
G1 X127.953 Y128.264 E.00774
G1 X128.13 Y128.234 E.00755
G1 X128.263 Y128.051 E.00954
G1 X128.258 Y128.005 E.00193
; WIPE_START
G1 X128.263 Y128.051 E-.02206
G1 X128.13 Y128.234 E-.1089
G1 X127.953 Y128.264 E-.0862
G1 X127.794 Y128.172 E-.08838
G1 X127.737 Y127.949 E-.11092
G1 X127.828 Y127.794 E-.08627
G1 X127.996 Y127.732 E-.08621
G1 X128.177 Y127.803 E-.09361
G1 X128.252 Y127.945 E-.07745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 3 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer3 end: 390,401
M625
G1 X37.024 Y238.006 F42000
M204 S10000
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.524 Y239.006  
M204 S6000
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186 F5400
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.139 Y218.611   E0.0569
G1 E-0.8000 F1800
M204 S10000
G1  X38.885 Y220.401   F600
G1 E0.8000 F1800
M204 S6000
G3  X38.499 Y223.687   I-1.399 J1.502 E0.1462 F5400
G2  X37.524 Y226.452   I3.448 J2.771 E0.1136
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
M204 S10000
G1  X39.353 Y237.786  
M204 S6000
G3  X36.137 Y241.040   I-19.312 J-15.868 E0.1741
G3  X32.360 Y240.267   I-1.481 J-2.378 E0.1616
G2  X29.840 Y239.463   I-2.537 J3.603 E0.1021
G2  X24.036 Y239.515   I-2.566 J37.644 E0.2208
G2  X20.919 Y241.269   I1.473 J6.266 E0.1378
G3  X18.133 Y240.797   I-1.061 J-2.199 E0.1145
G3  X14.968 Y237.513   I16.267 J-18.842 E0.1736
G3  X15.789 Y233.914   I2.263 J-1.377 E0.1552
G2  X16.567 Y231.555   I-3.235 J-2.375 E0.0960
G2  X16.517 Y225.825   I-36.060 J-2.549 E0.2180
G2  X14.808 Y222.913   I-5.688 J1.381 E0.1301
G3  X15.195 Y220.226   I2.087 J-1.071 E0.1100
G3  X18.411 Y216.972   I19.312 J15.868 E0.1741
G3  X22.188 Y217.745   I1.481 J2.378 E0.1616
G2  X24.709 Y218.549   I2.538 J-3.603 E0.1021
G2  X30.512 Y218.497   I2.565 J-37.660 E0.2208
G2  X33.629 Y216.743   I-1.473 J-6.266 E0.1378
G3  X34.915 Y216.504   I1.077 J2.210 E0.0503
G3  X36.415 Y217.215   I-0.231 J2.425 E0.0644
G3  X39.580 Y220.499   I-16.261 J18.836 E0.1736
G3  X38.759 Y224.098   I-2.263 J1.377 E0.1552
G2  X37.981 Y226.456   I3.235 J2.375 E0.0959
G2  X38.031 Y232.187   I36.045 J2.550 E0.2181
G2  X39.740 Y235.099   I5.688 J-1.381 E0.1301
G3  X39.353 Y237.786   I-2.087 J1.071 E0.1100
M204 S10000
G1  X39.686 Y238.098  
M204 S6000
G3  X36.410 Y241.407   I-19.543 J-16.075 E0.1772
G3  X32.095 Y240.639   I-1.766 J-2.587 E0.1845
G2  X29.836 Y239.920   I-2.271 J3.224 E0.0915
G2  X24.106 Y239.967   I-2.562 J37.368 E0.2180
G2  X21.121 Y241.679   I2.026 J6.990 E0.1320
G3  X17.812 Y241.123   I-1.262 J-2.616 E0.1360
G3  X14.595 Y237.778   I16.483 J-19.070 E0.1766
G3  X15.503 Y233.528   I2.830 J-1.617 E0.1808
G2  X16.110 Y231.550   I-2.905 J-1.974 E0.0798
G2  X16.065 Y225.897   I-35.826 J-2.544 E0.2151
G2  X14.403 Y223.126   I-6.287 J1.886 E0.1241
G3  X14.862 Y219.913   I2.499 J-1.283 E0.1315
G3  X18.138 Y216.605   I19.538 J16.071 E0.1772
G3  X22.453 Y217.373   I1.766 J2.587 E0.1845
G2  X24.713 Y218.092   I2.271 J-3.224 E0.0915
G2  X30.442 Y218.045   I2.561 J-37.386 E0.2180
G2  X33.427 Y216.333   I-2.026 J-6.990 E0.1320
G3  X34.957 Y216.048   I1.281 J2.630 E0.0599
G3  X36.736 Y216.889   I-0.275 J2.884 E0.0763
G3  X39.953 Y220.234   I-16.477 J19.065 E0.1766
G3  X39.045 Y224.484   I-2.830 J1.617 E0.1808
G2  X38.438 Y226.461   I2.905 J1.974 E0.0798
G2  X38.483 Y232.115   I35.808 J2.545 E0.2151
G2  X40.145 Y234.886   I6.287 J-1.886 E0.1241
G3  X39.686 Y238.099   I-2.499 J1.283 E0.1315
M204 S10000
G1  X40.020 Y238.411  
M204 S6000
G3  X36.684 Y241.774   I-19.798 J-16.307 E0.1803
G3  X31.720 Y240.937   I-2.028 J-3.112 E0.2102
G2  X29.832 Y240.377   I-1.882 J2.883 E0.0759
G2  X24.177 Y240.418   I-2.558 J37.154 E0.2151
G2  X21.324 Y242.089   I2.537 J7.604 E0.1266
G3  X17.491 Y241.448   I-1.463 J-3.032 E0.1574
G3  X14.222 Y238.042   I16.723 J-19.322 E0.1797
G3  X15.125 Y233.270   I2.988 J-1.906 E0.2033
G2  X15.653 Y231.546   I-2.526 J-1.716 E0.0696
G2  X15.614 Y225.970   I-35.661 J-2.540 E0.2121
G2  X13.998 Y223.339   I-6.768 J2.343 E0.1183
G3  X14.528 Y219.601   I2.911 J-1.494 E0.1529
G3  X17.864 Y216.238   I19.801 J16.310 E0.1803
G3  X22.828 Y217.075   I2.028 J3.112 E0.2102
G2  X24.717 Y217.635   I1.882 J-2.883 E0.0760
G2  X30.371 Y217.594   I2.557 J-37.175 E0.2151
G2  X33.224 Y215.923   I-2.537 J-7.604 E0.1266
G3  X34.998 Y215.593   I1.485 J3.049 E0.0694
G3  X37.057 Y216.564   I-0.318 J3.342 E0.0882
G3  X40.326 Y219.970   I-16.713 J19.313 E0.1797
G3  X39.423 Y224.742   I-2.989 J1.906 E0.2033
G2  X38.895 Y226.466   I2.526 J1.716 E0.0696
G2  X38.934 Y232.042   I35.640 J2.540 E0.2122
G2  X40.550 Y234.673   I6.769 J-2.344 E0.1183
G3  X40.020 Y238.411   I-2.911 J1.494 E0.1529
M204 S10000
G1  X40.353 Y238.724  
M204 S6000
G3  X36.957 Y242.140   I-20.069 J-16.554 E0.1833
G3  X31.373 Y241.259   I-2.291 J-3.617 E0.2347
G2  X29.828 Y240.834   I-1.547 J2.608 E0.0616
G2  X24.247 Y240.870   I-2.554 J36.997 E0.2123
G2  X21.527 Y242.499   I2.593 J7.418 E0.1214
G3  X17.170 Y241.774   I-1.664 J-3.449 E0.1789
G3  X13.848 Y238.306   I16.979 J-19.589 E0.1828
G3  X14.803 Y232.927   I3.459 J-2.160 E0.2275
G2  X15.196 Y231.541   I-2.244 J-1.384 E0.0554
G2  X15.163 Y226.043   I-35.591 J-2.535 E0.2092
G2  X13.593 Y223.551   I-6.553 J2.387 E0.1128
G3  X14.195 Y219.288   I3.322 J-1.706 E0.1744
G3  X17.591 Y215.872   I20.075 J16.560 E0.1833
G3  X23.175 Y216.753   I2.291 J3.617 E0.2347
G2  X24.721 Y217.178   I1.547 J-2.608 E0.0617
G2  X30.301 Y217.142   I2.553 J-37.021 E0.2123
G2  X33.021 Y215.513   I-2.593 J-7.418 E0.1214
G3  X35.040 Y215.137   I1.690 J3.469 E0.0790
G3  X37.378 Y216.238   I-0.361 J3.801 E0.1002
G3  X40.700 Y219.706   I-16.974 J19.584 E0.1828
G3  X39.745 Y225.085   I-3.458 J2.161 E0.2275
G2  X39.352 Y226.470   I2.244 J1.384 E0.0554
G2  X39.385 Y231.969   I35.566 J2.536 E0.2092
G2  X40.955 Y234.461   I6.554 J-2.388 E0.1128
G3  X40.353 Y238.724   I-3.322 J1.706 E0.1744
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #3
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z3.6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E15
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
M73 P27 R30
G1 E-2 F1800
M73 P28 R30
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z3.6
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
M73 P29 R30
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S165.75
G1 X36.87 Y211.75 F42000
G1 Z.6
G1 X44.503 Y211.75 Z1
G1 X44.749 Y211.75 Z1
G1 X44.749 Y219.506

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y219.506
G1 Z.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y219.506  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
M73 P29 R29
G1  X17.524  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y221.006  E0.0285
G1  X17.524  E0.7411 F2473
G1  Y221.756  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X37.024  E0.7411 F4925
M73 P30 R29
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y227.756  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y229.256  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X17.524  E0.7411
G1  Y233.756  E0.0285
G1  X37.024  E0.7411
G1  Y234.506  E0.0285
G1  X17.524  E0.7411
G1  Y235.256  E0.0285
G1  X37.024  E0.7411
G1  Y236.006  E0.0285
G1  X17.524  E0.7411
G1  Y236.756  E0.0285
G1  X37.024  E0.7411
G1  Y237.506  E0.0285
G1  X17.524  E0.7411
G1  Y238.256  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F7026.721
M204 S6000
G1 X35.024 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.057 Y129.289
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X131.949 Y128.062 I-.009 J-.617 E.06199
G3 X132.097 Y128.056 I.09 J.415 E.00498
G3 X132.116 Y129.285 I-.05 J.615 E.061
M204 S10000
G1 X132.057 Y129.682 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1560
M204 S5000
G3 X131.71 Y127.72 I-.009 J-1.01 E.08811
G3 X132.131 Y127.666 I.347 J1.03 E.01326
G3 X132.116 Y129.68 I-.084 J1.007 E.09378
M106 S165.75
M204 S10000
G1 X132.238 Y128.738 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43173
G1 F9259.022
M204 S6000
G2 X132.148 Y128.488 I-.202 J-.069 E.00915
G1 X131.959 Y128.491 E.00606
G1 X131.863 Y128.588 E.00437
G1 X131.858 Y128.734 E.00468
G1 X131.97 Y128.866 E.00554
G1 X132.164 Y128.84 E.00624
G1 X132.202 Y128.787 E.00212
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9259.022
G1 X132.164 Y128.84 E-.04233
G1 X131.97 Y128.866 E-.12444
G1 X131.858 Y128.734 E-.11036
G1 X131.863 Y128.588 E-.09329
G1 X131.959 Y128.491 E-.08717
G1 X132.148 Y128.488 E-.1207
G1 X132.215 Y128.544 E-.05526
G1 X132.237 Y128.604 E-.04075
G1 X132.238 Y128.738 E-.0857
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 4/21
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S175.95
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-1.181 J-.293 P1  F42000
G1 X132.057 Y129.469 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X131.918 Y127.885 I-.007 J-.797 E.07974
G3 X132.076 Y127.875 I.109 J.442 E.00533
G3 X132.116 Y129.466 I-.026 J.797 E.08078
M204 S10000
G1 X132.064 Y129.863 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2520
M204 S5000
G1 X132.057 Y129.862 E.00022
G3 X131.649 Y127.551 I-.009 J-1.19 E.10366
G3 X132.11 Y127.484 I.42 J1.264 E.01454
G3 X132.263 Y129.842 I-.062 J1.188 E.10736
G1 X132.123 Y129.857 E.00436
; WIPE_START
M204 S6000
G1 X132.057 Y129.862 E-.02548
G1 X131.85 Y129.845 E-.0789
G1 X131.649 Y129.791 E-.07896
G1 X131.461 Y129.704 E-.07895
G1 X131.29 Y129.585 E-.07894
G1 X131.143 Y129.438 E-.07895
G1 X131.024 Y129.267 E-.07898
G1 X130.923 Y129.027 E-.09909
G1 X130.883 Y128.878 E-.05855
G1 X130.865 Y128.671 E-.07896
G1 X130.87 Y128.608 E-.02425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I.028 J1.217 P1  F42000
G1 X132.429 Y128.572 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.402 Y128.472 E.0032
G1 X132.256 Y128.326 E.0064
G1 X131.991 Y128.273 E.0084
G2 X131.711 Y128.472 I.193 J.568 E.0108
G1 X131.658 Y128.671 E.00641
G1 X131.711 Y128.871 E.00641
G1 X131.857 Y129.017 E.00641
G1 X132.057 Y129.07 E.00641
G1 X132.256 Y129.017 E.00641
G1 X132.402 Y128.871 E.00641
G1 X132.455 Y128.671 E.00641
G1 X132.444 Y128.629 E.00135
; WIPE_START
G1 X132.455 Y128.671 E-.01649
G1 X132.402 Y128.871 E-.07848
G1 X132.256 Y129.017 E-.07845
G1 X132.057 Y129.07 E-.07844
G1 X131.857 Y129.017 E-.07848
G1 X131.711 Y128.871 E-.07845
G1 X131.658 Y128.671 E-.07845
G1 X131.711 Y128.472 E-.07848
G1 X131.815 Y128.368 E-.05576
G1 X131.991 Y128.273 E-.07591
G1 X132.152 Y128.305 E-.06261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 4 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer4 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z3.8 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E14
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
M73 P32 R28
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
M73 P33 R28
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z3.8
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S175.95
G1 X9.798 Y238.256 F42000
M204 S10000
G1 Z.8

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y238.256 Z1.2
G1 X17.524 Y238.256 Z1.2
G1 Z.8
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X20.524 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
G1  X37.024  E0.6271 F1782
M73 P34 R28
G1  Y237.506  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X37.024  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X17.524  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5025
G1  Y230.756  E0.0285
G1  X37.024  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X37.024  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X37.024  E0.7411
G1  Y224.006  E0.0285
G1  X17.524  E0.7411
G1  Y223.256  E0.0285
G1  X37.024  E0.7411
G1  Y222.506  E0.0285
G1  X17.524  E0.7411
G1  Y221.756  E0.0285
G1  X37.024  E0.7411
G1  Y221.006  E0.0285
G1  X17.524  E0.7411
G1  Y220.256  E0.0285
G1  X37.024  E0.7411
G1  Y219.506  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X15.425 Y237.357  
M204 S6000
G3  X16.049 Y234.325   I1.667 J-1.237 E0.1327
M73 P34 R27
G2  X17.024 Y231.559   I-3.448 J-2.771 E0.1136
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G3  X18.684 Y217.339   I19.122 J15.700 E0.1711
G3  X21.923 Y218.118   I1.175 J2.236 E0.1382
G2  X24.704 Y219.006   I2.804 J-3.982 E0.1127
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.165 Y239.151   E0.0701
M204 S10000
G1  X18.133 Y240.797  
M204 S6000
G3  X14.968 Y237.513   I16.266 J-18.841 E0.1736
G3  X15.789 Y233.914   I2.263 J-1.377 E0.1552
G2  X16.567 Y231.555   I-3.235 J-2.375 E0.0960
G2  X16.517 Y225.825   I-36.060 J-2.549 E0.2180
G2  X14.808 Y222.913   I-5.688 J1.381 E0.1301
G3  X15.195 Y220.226   I2.087 J-1.071 E0.1100
G3  X18.411 Y216.972   I19.312 J15.868 E0.1741
G3  X22.188 Y217.745   I1.481 J2.378 E0.1616
G2  X24.709 Y218.549   I2.538 J-3.603 E0.1021
G2  X30.512 Y218.497   I2.565 J-37.660 E0.2208
G2  X33.629 Y216.743   I-1.473 J-6.266 E0.1378
G3  X34.915 Y216.504   I1.077 J2.210 E0.0503
G3  X36.415 Y217.215   I-0.231 J2.425 E0.0644
G3  X39.580 Y220.499   I-16.267 J18.842 E0.1736
G3  X38.759 Y224.098   I-2.263 J1.377 E0.1552
G2  X37.981 Y226.456   I3.235 J2.375 E0.0959
G2  X38.031 Y232.187   I36.045 J2.550 E0.2181
G2  X39.740 Y235.099   I5.688 J-1.381 E0.1301
G3  X39.353 Y237.786   I-2.087 J1.071 E0.1100
G3  X36.137 Y241.040   I-19.312 J-15.868 E0.1741
G3  X32.360 Y240.267   I-1.481 J-2.378 E0.1616
G2  X29.840 Y239.463   I-2.537 J3.603 E0.1021
G2  X24.036 Y239.515   I-2.566 J37.644 E0.2208
G2  X20.919 Y241.269   I1.473 J6.266 E0.1378
G3  X18.133 Y240.797   I-1.061 J-2.199 E0.1145
M204 S10000
G1  X17.812 Y241.123  
M204 S6000
G3  X14.595 Y237.778   I16.481 J-19.068 E0.1766
G3  X15.503 Y233.528   I2.830 J-1.617 E0.1808
G2  X16.110 Y231.550   I-2.905 J-1.974 E0.0798
G2  X16.065 Y225.897   I-35.826 J-2.544 E0.2151
G2  X14.403 Y223.126   I-6.287 J1.886 E0.1241
G3  X14.862 Y219.913   I2.499 J-1.283 E0.1315
G3  X18.138 Y216.605   I19.538 J16.071 E0.1772
G3  X22.453 Y217.373   I1.766 J2.587 E0.1845
G2  X24.713 Y218.092   I2.271 J-3.224 E0.0915
G2  X30.442 Y218.045   I2.561 J-37.386 E0.2180
G2  X33.427 Y216.333   I-2.026 J-6.990 E0.1320
G3  X34.957 Y216.048   I1.281 J2.630 E0.0599
G3  X36.736 Y216.889   I-0.275 J2.884 E0.0763
G3  X39.953 Y220.234   I-16.478 J19.065 E0.1766
G3  X39.045 Y224.484   I-2.830 J1.617 E0.1808
G2  X38.438 Y226.461   I2.905 J1.974 E0.0798
G2  X38.483 Y232.115   I35.808 J2.545 E0.2151
G2  X40.145 Y234.886   I6.287 J-1.886 E0.1241
G3  X39.686 Y238.099   I-2.499 J1.283 E0.1315
G3  X36.410 Y241.407   I-19.543 J-16.075 E0.1772
G3  X32.095 Y240.639   I-1.766 J-2.587 E0.1845
G2  X29.836 Y239.920   I-2.271 J3.224 E0.0915
G2  X24.106 Y239.967   I-2.562 J37.368 E0.2180
G2  X21.121 Y241.679   I2.026 J6.990 E0.1320
G3  X17.812 Y241.123   I-1.262 J-2.616 E0.1360
M204 S10000
G1  X17.491 Y241.448  
M204 S6000
G3  X14.222 Y238.042   I16.717 J-19.316 E0.1797
G3  X15.125 Y233.270   I2.988 J-1.906 E0.2033
G2  X15.653 Y231.546   I-2.526 J-1.716 E0.0696
G2  X15.614 Y225.970   I-35.661 J-2.540 E0.2121
G2  X13.998 Y223.339   I-6.768 J2.343 E0.1183
G3  X14.528 Y219.601   I2.911 J-1.494 E0.1529
G3  X17.864 Y216.238   I19.801 J16.310 E0.1803
G3  X22.828 Y217.075   I2.028 J3.112 E0.2102
G2  X24.717 Y217.635   I1.882 J-2.883 E0.0760
G2  X30.371 Y217.594   I2.557 J-37.175 E0.2151
G2  X33.224 Y215.923   I-2.537 J-7.604 E0.1266
G3  X34.998 Y215.593   I1.485 J3.049 E0.0694
G3  X37.057 Y216.564   I-0.318 J3.342 E0.0882
G3  X40.326 Y219.970   I-16.719 J19.318 E0.1797
G3  X39.423 Y224.742   I-2.989 J1.906 E0.2033
G2  X38.895 Y226.466   I2.526 J1.716 E0.0696
G2  X38.934 Y232.042   I35.640 J2.540 E0.2122
G2  X40.550 Y234.673   I6.769 J-2.344 E0.1183
G3  X40.020 Y238.411   I-2.911 J1.494 E0.1529
G3  X36.684 Y241.774   I-19.798 J-16.307 E0.1803
G3  X31.720 Y240.937   I-2.028 J-3.112 E0.2102
G2  X29.832 Y240.377   I-1.882 J2.883 E0.0759
G2  X24.177 Y240.418   I-2.558 J37.154 E0.2151
G2  X21.324 Y242.089   I2.537 J7.604 E0.1266
G3  X17.491 Y241.448   I-1.463 J-3.032 E0.1574
; WIPE_TOWER_END

; WIPE_START
G1 F9547.299
M204 S6000
G1 X17.661 Y241.61 E-.08896
G1 X17.864 Y241.774 E-.0992
G1 X18.079 Y241.922 E-.09918
G1 X18.305 Y242.052 E-.09921
G1 X18.541 Y242.164 E-.09919
G1 X18.785 Y242.257 E-.09919
G1 X19.035 Y242.331 E-.0992
G1 X19.23 Y242.373 E-.07587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.162 Y127.079
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X128 Y127.065 I-.162 J.919 E.19104
G1 X128.103 Y127.074 E.00345
M204 S10000
G1 X128.241 Y126.696 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X128.454 Y126.754 E.00685
G3 X128 Y126.671 I-.46 J1.244 E.24431
G1 X128.181 Y126.687 E.00565
; WIPE_START
M204 S6000
G1 X128.454 Y126.754 E-.10648
G1 X128.664 Y126.849 E-.08796
G1 X128.854 Y126.982 E-.08799
G1 X129.018 Y127.146 E-.08802
G1 X129.151 Y127.336 E-.088
G1 X129.249 Y127.546 E-.08801
G1 X129.308 Y127.769 E-.08803
G1 X129.329 Y128 E-.08799
G1 X129.32 Y128.098 E-.03752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I.065 J-1.215 P1  F42000
G1 X127.469 Y128 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.533 Y128.27 E.00861
G1 X127.734 Y128.46 E.0086
G1 X128 Y128.539 E.0086
G1 X128.266 Y128.46 E.0086
G1 X128.467 Y128.27 E.0086
G1 X128.531 Y128 E.00861
G1 X128.467 Y127.73 E.0086
G1 X128.265 Y127.54 E.00861
G1 X128 Y127.461 E.0086
G1 X127.734 Y127.54 E.0086
G1 X127.533 Y127.73 E.0086
G1 X127.483 Y127.942 E.00674
M204 S10000
G1 X128.171 Y128 F42000
; LINE_WIDTH: 0.385449
G1 F10510.065
M204 S6000
G1 X128.112 Y127.867 E.00411
G1 X127.97 Y127.831 E.00412
G1 X127.849 Y127.913 E.00411
G1 X127.839 Y128.059 E.00412
G1 X127.94 Y128.163 E.00411
G1 X128.086 Y128.148 E.00412
G1 X128.154 Y128.054 E.00328
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10510.065
G1 X128.086 Y128.148 E-.08901
G1 X127.94 Y128.163 E-.11187
G1 X127.839 Y128.059 E-.11173
G1 X127.849 Y127.913 E-.11196
G1 X127.97 Y127.831 E-.1118
G1 X128.112 Y127.867 E-.11186
G1 X128.171 Y128 E-.11178
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 5/21
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S165.75
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I1.217 J.009 P1  F42000
G1 X128.179 Y126.938 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.369 Y126.986 E.00657
G3 X127.629 Y126.98 I-.377 J1.015 E.20266
G3 X128.12 Y126.925 I.372 J1.102 E.0167
M204 S10000
G1 X128.225 Y126.541 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2880
M204 S5000
G1 X128.256 Y126.55 E.00098
G3 X127.261 Y126.719 I-.264 J1.452 E.25585
G3 X128.157 Y126.535 I.724 J1.247 E.02891
G1 X128.166 Y126.536 E.00027
; WIPE_START
M204 S6000
G1 X128.256 Y126.55 E-.03462
G1 X128.506 Y126.61 E-.09781
G1 X128.739 Y126.719 E-.09794
G1 X128.95 Y126.867 E-.09792
G1 X129.133 Y127.049 E-.09796
G1 X129.281 Y127.261 E-.09798
G1 X129.39 Y127.494 E-.09792
G1 X129.456 Y127.743 E-.09795
G1 X129.465 Y127.848 E-.0399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.669 Y127.918 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.598 Y127.657 E.0084
G2 X128.677 Y128.124 I-.595 J.341 E.11876
G1 X128.671 Y127.978 E.00451
M204 S10000
G1 X128.237 Y127.937 F42000
; LINE_WIDTH: 0.529574
G1 F7397.461
M204 S6000
G1 X128.161 Y127.807 E.00602
G1 X127.999 Y127.749 E.0069
G1 X127.839 Y127.808 E.00682
G1 X127.753 Y127.956 E.00687
G1 X127.783 Y128.125 E.00688
G1 X127.914 Y128.236 E.00687
G1 X128.086 Y128.236 E.00687
G1 X128.217 Y128.125 E.00687
G1 X128.231 Y127.997 E.00518
; WIPE_START
G1 X128.217 Y128.125 E-.06639
G1 X128.086 Y128.236 E-.0881
G1 X127.914 Y128.236 E-.08807
G1 X127.783 Y128.125 E-.08809
G1 X127.753 Y127.956 E-.08812
G1 X127.839 Y127.808 E-.08809
G1 X127.999 Y127.749 E-.08746
G1 X128.161 Y127.807 E-.08847
G1 X128.237 Y127.937 E-.0772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 5 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer5 end: 390,401
M625
M204 S10000
G1 X17.524 Y238.006 F42000
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X17.024 Y239.006  
M204 S6000
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148 F5400
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.663 Y220.401   I1.763 J-0.728 E0.0904
G1 E-0.8000 F1800
M204 S10000
G1  X17.409 Y218.611   F600
G1 E0.8000 F1800
M204 S6000
G3  X20.133 Y216.972   I2.971 J1.853 E0.1254 F5400
G3  X22.558 Y218.499   I-3.985 J9.017 E0.1093
G2  X24.704 Y219.006   I2.178 J-4.424 E0.0845
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
M204 S10000
G1  X18.133 Y240.797  
M204 S6000
G3  X14.968 Y237.513   I16.267 J-18.842 E0.1736
G3  X15.789 Y233.914   I2.263 J-1.377 E0.1552
G2  X16.567 Y231.555   I-3.235 J-2.375 E0.0960
G2  X16.517 Y225.825   I-36.060 J-2.549 E0.2180
G2  X14.808 Y222.913   I-5.688 J1.381 E0.1301
G3  X15.195 Y220.226   I2.087 J-1.071 E0.1100
G3  X18.411 Y216.972   I19.312 J15.868 E0.1741
G3  X22.188 Y217.745   I1.481 J2.378 E0.1616
M73 P35 R27
G2  X24.709 Y218.549   I2.538 J-3.603 E0.1021
G2  X30.512 Y218.497   I2.565 J-37.660 E0.2208
G2  X33.629 Y216.743   I-1.473 J-6.266 E0.1378
G3  X34.915 Y216.504   I1.077 J2.210 E0.0503
G3  X36.415 Y217.215   I-0.231 J2.425 E0.0644
G3  X39.580 Y220.499   I-16.267 J18.842 E0.1736
G3  X38.759 Y224.098   I-2.263 J1.377 E0.1552
G2  X37.981 Y226.456   I3.235 J2.375 E0.0959
G2  X38.031 Y232.187   I36.045 J2.550 E0.2181
G2  X39.740 Y235.099   I5.688 J-1.381 E0.1301
G3  X39.353 Y237.786   I-2.087 J1.071 E0.1100
G3  X36.137 Y241.040   I-19.312 J-15.868 E0.1741
G3  X32.360 Y240.267   I-1.481 J-2.378 E0.1616
G2  X29.840 Y239.463   I-2.537 J3.603 E0.1021
G2  X24.036 Y239.515   I-2.566 J37.644 E0.2208
G2  X20.919 Y241.269   I1.473 J6.266 E0.1378
G3  X18.133 Y240.797   I-1.061 J-2.199 E0.1145
M204 S10000
G1  X17.812 Y241.123  
M204 S6000
G3  X14.595 Y237.778   I16.483 J-19.070 E0.1766
G3  X15.503 Y233.528   I2.830 J-1.617 E0.1808
G2  X16.110 Y231.550   I-2.905 J-1.974 E0.0798
G2  X16.065 Y225.897   I-35.826 J-2.544 E0.2151
G2  X14.403 Y223.126   I-6.287 J1.886 E0.1241
G3  X14.862 Y219.914   I2.499 J-1.283 E0.1315
G3  X18.138 Y216.605   I19.539 J16.071 E0.1772
G3  X22.453 Y217.373   I1.766 J2.587 E0.1845
G2  X24.713 Y218.092   I2.271 J-3.224 E0.0915
G2  X30.442 Y218.045   I2.561 J-37.386 E0.2180
G2  X33.427 Y216.333   I-2.026 J-6.990 E0.1320
G3  X34.957 Y216.048   I1.281 J2.630 E0.0599
G3  X36.736 Y216.889   I-0.275 J2.884 E0.0763
G3  X39.953 Y220.234   I-16.478 J19.065 E0.1766
G3  X39.045 Y224.484   I-2.830 J1.617 E0.1808
G2  X38.438 Y226.461   I2.905 J1.974 E0.0798
G2  X38.483 Y232.115   I35.808 J2.545 E0.2151
G2  X40.145 Y234.886   I6.287 J-1.886 E0.1241
G3  X39.686 Y238.099   I-2.499 J1.283 E0.1315
G3  X36.410 Y241.407   I-19.543 J-16.075 E0.1772
G3  X32.095 Y240.639   I-1.766 J-2.587 E0.1845
G2  X29.836 Y239.920   I-2.271 J3.224 E0.0915
G2  X24.106 Y239.967   I-2.562 J37.368 E0.2180
G2  X21.121 Y241.679   I2.026 J6.990 E0.1320
G3  X17.812 Y241.123   I-1.262 J-2.616 E0.1360
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #5
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.4 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z4 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E13
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
M73 P37 R26
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z4
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
M73 P38 R26
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S165.75
G1 X9.798 Y219.506 F42000
G1 Z1

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y219.506 Z1.4
G1 X17.524 Y219.506 Z1.4
G1 Z1
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X20.524 Y219.506  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
M73 P39 R26
G1  X37.024  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y221.006  E0.0285
G1  X37.024  E0.7411 F2473
G1  Y221.756  E0.0285
M73 P39 R25
G1  X17.524  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5075
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5125
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5175
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X37.024  E0.7411
G1  Y233.756  E0.0285
G1  X17.524  E0.7411
G1  Y234.506  E0.0285
G1  X37.024  E0.7411
G1  Y235.256  E0.0285
G1  X17.524  E0.7411
G1  Y236.006  E0.0285
G1  X37.024  E0.7411
G1  Y236.756  E0.0285
G1  X17.524  E0.7411
G1  Y237.506  E0.0285
G1  X37.024  E0.7411
G1  Y238.256  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F7397.461
M204 S6000
G1 X19.524 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.057 Y129.603
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X132.057 Y127.737 I0 J-.933 E.09822
G1 X132.219 Y127.751 E.00546
G3 X132.117 Y129.601 I-.162 J.919 E.09075
M204 S10000
G1 X132.038 Y129.998 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X131.827 Y129.975 E.00658
G3 X132.057 Y127.343 I.23 J-1.306 E.12211
G1 X132.287 Y127.363 E.00719
G3 X132.097 Y129.994 I-.23 J1.306 E.12084
M204 S10000
G1 X132.322 Y129.131 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.523 Y128.941 E.0086
G1 X132.587 Y128.671 E.0086
G1 X132.523 Y128.402 E.0086
G1 X132.322 Y128.212 E.0086
G1 X132.057 Y128.132 E.00859
G1 X131.791 Y128.212 E.0086
G1 X131.59 Y128.402 E.0086
G1 X131.526 Y128.671 E.0086
G1 X131.59 Y128.941 E.0086
G1 X131.791 Y129.131 E.0086
G1 X132.057 Y129.21 E.00859
G1 X132.264 Y129.148 E.00674
M204 S10000
G1 X132.228 Y128.671 F42000
; LINE_WIDTH: 0.38517
G1 F10518.627
M204 S6000
G1 X132.168 Y128.538 E.00411
G1 X132.027 Y128.503 E.00411
G1 X131.906 Y128.585 E.00411
G1 X131.896 Y128.73 E.00411
G1 X131.997 Y128.835 E.00411
G1 X132.142 Y128.82 E.00411
G1 X132.21 Y128.726 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10518.627
G1 X132.142 Y128.82 E-.08888
G1 X131.997 Y128.835 E-.11185
G1 X131.896 Y128.73 E-.11181
G1 X131.906 Y128.585 E-.1119
G1 X132.027 Y128.503 E-.11183
G1 X132.168 Y128.538 E-.1119
G1 X132.228 Y128.671 E-.11183
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 6/21
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S175.95
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-1.2 J-.2 P1  F42000
G1 X132.057 Y129.698 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X132.235 Y127.659 I.003 J-1.027 E.11395
G3 X132.408 Y129.637 I-.184 J1.013 E.08996
G3 X132.117 Y129.697 I-.349 J-.966 E.01001
M204 S10000
G1 X132.084 Y130.091 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X132.057 Y130.091 E.00085
G3 X131.57 Y127.336 I-.006 J-1.419 E.12342
G3 X132.261 Y127.268 I.493 J1.472 E.02172
G3 X132.303 Y130.068 I-.211 J1.404 E.12397
G1 X132.143 Y130.085 E.00497
; WIPE_START
M204 S6000
G1 X132.057 Y130.091 E-.03314
G1 X131.81 Y130.071 E-.09408
G1 X131.57 Y130.007 E-.09417
G1 X131.346 Y129.903 E-.09418
G1 X131.143 Y129.76 E-.09414
G1 X130.968 Y129.585 E-.09417
G1 X130.825 Y129.382 E-.09419
G1 X130.721 Y129.158 E-.09414
G1 X130.675 Y128.985 E-.0678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.533 Y128.271 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X132.642 Y128.458 I-.473 J.398 E.11377
G1 X132.563 Y128.323 E.00485
M204 S10000
G1 X132.223 Y128.532 F42000
; LINE_WIDTH: 0.47701
G1 F8293.211
M204 S6000
G1 X132.094 Y128.458 E.00531
G1 X131.948 Y128.483 E.00531
G1 X131.853 Y128.597 E.0053
G1 X131.853 Y128.746 E.00531
G1 X131.948 Y128.859 E.00531
G1 X132.094 Y128.885 E.0053
G1 X132.223 Y128.811 E.00531
G1 X132.274 Y128.671 E.00531
G1 X132.243 Y128.588 E.00316
; WIPE_START
G1 X132.274 Y128.671 E-.05268
G1 X132.223 Y128.811 E-.08841
G1 X132.094 Y128.885 E-.08843
G1 X131.948 Y128.859 E-.08834
G1 X131.853 Y128.746 E-.08848
G1 X131.853 Y128.597 E-.08841
G1 X131.948 Y128.483 E-.08837
G1 X132.094 Y128.458 E-.08845
G1 X132.223 Y128.532 E-.08843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 6 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer6 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z4.2 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E12
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
M73 P42 R24
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z4.2
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S175.95
G1 X22.403 Y211.75 F42000
M204 S10000
G1 Z1.2
G1 X30.036 Y211.75 Z1.6
G1 X44.749 Y211.75 Z1.6
G1 X44.749 Y238.256

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y238.256
G1 Z1.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
M73 P43 R24
G1  X34.024 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
G1  X17.524  E0.6271 F1782
G1  Y237.506  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X17.524  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X17.524  E0.7411
G1  Y224.006  E0.0285
G1  X37.024  E0.7411
G1  Y223.256  E0.0285
G1  X17.524  E0.7411
G1  Y222.506  E0.0285
G1  X37.024  E0.7411
G1  Y221.756  E0.0285
G1  X17.524  E0.7411
G1  Y221.006  E0.0285
G1  X37.024  E0.7411
G1  Y220.256  E0.0285
G1  X17.524  E0.7411
G1  Y219.506  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.383 Y239.151  
M204 S6000
G3  X34.874 Y241.053   I-3.832 J-2.449 E0.1222
G3  X32.472 Y239.790   I0.308 J-3.502 E0.1059
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
M73 P43 R23
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
M73 P44 R23
G3  X39.123 Y237.357   I-1.746 J0.726 E0.0771
M204 S10000
G1  X39.353 Y237.786  
M204 S6000
G3  X36.137 Y241.040   I-19.312 J-15.868 E0.1741
G3  X32.360 Y240.267   I-1.481 J-2.378 E0.1616
G2  X29.840 Y239.463   I-2.537 J3.603 E0.1021
G2  X24.036 Y239.515   I-2.566 J37.644 E0.2208
G2  X20.919 Y241.269   I1.473 J6.266 E0.1378
G3  X18.133 Y240.797   I-1.061 J-2.199 E0.1145
G3  X14.968 Y237.513   I16.267 J-18.842 E0.1736
G3  X15.789 Y233.914   I2.263 J-1.377 E0.1552
G2  X16.567 Y231.555   I-3.235 J-2.375 E0.0960
G2  X16.517 Y225.825   I-36.060 J-2.549 E0.2180
G2  X14.808 Y222.913   I-5.688 J1.381 E0.1301
G3  X15.195 Y220.226   I2.087 J-1.071 E0.1100
G3  X18.411 Y216.972   I19.312 J15.868 E0.1741
G3  X22.188 Y217.745   I1.481 J2.378 E0.1616
G2  X24.709 Y218.549   I2.538 J-3.603 E0.1021
G2  X30.512 Y218.497   I2.565 J-37.660 E0.2208
G2  X33.629 Y216.743   I-1.473 J-6.266 E0.1378
G3  X36.415 Y217.215   I1.061 J2.199 E0.1145
G3  X39.580 Y220.499   I-16.267 J18.842 E0.1736
G3  X38.759 Y224.098   I-2.263 J1.377 E0.1552
G2  X37.981 Y226.456   I3.235 J2.375 E0.0959
G2  X38.031 Y232.187   I36.045 J2.550 E0.2181
G2  X39.740 Y235.099   I5.688 J-1.381 E0.1301
G3  X39.353 Y237.786   I-2.087 J1.071 E0.1100
; WIPE_TOWER_END

; WIPE_START
G1 F8293.211
M204 S6000
G1 X39.468 Y237.658 E-.0657
G1 X39.486 Y237.635 E-.01067
G1 X39.579 Y237.513 E-.05839
G1 X39.678 Y237.361 E-.0691
G1 X39.765 Y237.201 E-.06911
G1 X39.839 Y237.035 E-.0691
G1 X39.9 Y236.864 E-.06909
G1 X39.947 Y236.688 E-.06909
G1 X39.981 Y236.51 E-.0691
G1 X40 Y236.329 E-.0691
G1 X40.005 Y236.147 E-.06909
G1 X39.995 Y235.965 E-.0691
G1 X39.994 Y235.957 E-.00337
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.202 Y126.81
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.209 Y126.814 E.00026
G3 X127.79 Y126.81 I-.219 J1.186 E.23974
G3 X128.023 Y126.794 I.163 J.65 E.00787
G1 X128.143 Y126.804 E.00402
M204 S10000
G1 X128.237 Y126.419 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4800
M204 S5000
G1 X128.277 Y126.428 E.00129
G3 X127.199 Y126.613 I-.284 J1.573 E.27719
G3 X128.057 Y126.403 I.785 J1.354 E.0278
G1 X128.177 Y126.414 E.00372
M204 S10000
G1 X127.862 Y127.215 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.721 Y127.237 E.00445
G1 X127.478 Y127.378 E.00871
G1 X127.297 Y127.594 E.00875
G1 X127.2 Y127.861 E.00881
G1 X127.2 Y128.141 E.0087
G1 X127.297 Y128.406 E.00876
G1 X127.478 Y128.622 E.00875
G1 X127.722 Y128.763 E.00876
G1 X128 Y128.812 E.00876
G1 X128.278 Y128.763 E.00875
G1 X128.522 Y128.622 E.00876
G1 X128.703 Y128.406 E.00876
G1 X128.8 Y128.141 E.00876
G2 X128.612 Y127.485 I-.992 J-.071 E.02163
G2 X128.148 Y127.213 I-.618 J.522 E.01702
G1 X127.922 Y127.214 E.00699
M204 S10000
G1 X127.789 Y128.366 F42000
G1 F9547.299
M204 S6000
G1 X128 Y128.429 E.00684
G1 X128.212 Y128.366 E.00685
G1 X128.372 Y128.215 E.00684
G1 X128.423 Y127.999 E.00687
G1 X128.372 Y127.785 E.00684
G1 X128.203 Y127.629 E.00715
G1 X128.015 Y127.572 E.00608
G1 X127.785 Y127.636 E.00741
G1 X127.628 Y127.785 E.00672
G1 X127.577 Y128.001 E.00688
G1 X127.628 Y128.215 E.00684
G1 X127.745 Y128.325 E.00499
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.628 Y128.215 E-.06115
G1 X127.577 Y128.001 E-.08368
G1 X127.628 Y127.785 E-.08421
G1 X127.785 Y127.636 E-.08231
G1 X128.015 Y127.572 E-.09075
G1 X128.203 Y127.629 E-.07439
G1 X128.372 Y127.785 E-.08752
G1 X128.423 Y127.999 E-.08368
G1 X128.372 Y128.215 E-.08405
G1 X128.318 Y128.266 E-.02826
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 7/21
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S168.3
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I1.214 J-.085 P1  F42000
G1 X128.21 Y126.717 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.226 Y126.718 E.00056
G3 X128.445 Y129.223 I-.233 J1.282 E.11388
G3 X128 Y126.699 I-.441 J-1.223 E.15184
G1 X128.15 Y126.712 E.00503
M204 S10000
G1 X128.319 Y126.342 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.578 Y126.411 E.00833
G3 X127.706 Y126.331 I-.586 J1.588 E.30255
G3 X128.261 Y126.328 I.287 J1.581 E.01732
; WIPE_START
M204 S6000
G1 X128.578 Y126.411 E-.12476
G1 X128.847 Y126.532 E-.11213
G1 X129.089 Y126.702 E-.1123
G1 X129.298 Y126.911 E-.11227
G1 X129.468 Y127.153 E-.11224
G1 X129.593 Y127.42 E-.11228
G1 X129.643 Y127.608 E-.07402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.892 Y128 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.892 Y127.843 E.00488
G1 X128.784 Y127.547 E.00976
G1 X128.582 Y127.306 E.00976
G1 X128.31 Y127.149 E.00976
G1 X128 Y127.094 E.00976
G1 X127.69 Y127.149 E.00976
G1 X127.418 Y127.306 E.00976
G1 X127.216 Y127.547 E.00976
G1 X127.108 Y127.843 E.00976
G1 X127.108 Y128.157 E.00976
G1 X127.216 Y128.453 E.00976
G1 X127.418 Y128.694 E.00976
G1 X127.69 Y128.851 E.00976
G1 X128 Y128.906 E.00976
G1 X128.31 Y128.851 E.00976
G1 X128.582 Y128.694 E.00976
G1 X128.784 Y128.453 E.00976
G1 X128.892 Y128.157 E.00976
G1 X128.892 Y128.06 E.00302
M204 S10000
G1 X128.163 Y128 F42000
; LINE_WIDTH: 0.369053
G1 F11038.444
M204 S6000
G1 X128.106 Y127.873 E.00373
G1 X127.972 Y127.839 E.00373
G1 X127.857 Y127.917 E.00373
G1 X127.847 Y128.056 E.00373
G1 X127.943 Y128.156 E.00373
G1 X128.082 Y128.141 E.00373
G1 X128.145 Y128.054 E.00289
M204 S10000
G1 X127.485 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.547 Y128.261 E.00834
G1 X127.743 Y128.446 E.00834
G1 X128 Y128.523 E.00833
G1 X128.257 Y128.446 E.00834
G1 X128.453 Y128.261 E.00834
G1 X128.515 Y128 E.00834
G1 X128.453 Y127.739 E.00834
G1 X128.257 Y127.554 E.00834
G1 X128 Y127.477 E.00834
G1 X127.743 Y127.554 E.00834
G1 X127.547 Y127.739 E.00834
G1 X127.499 Y127.942 E.00648
; WIPE_START
G1 X127.547 Y127.739 E-.07929
G1 X127.743 Y127.554 E-.10204
G1 X128 Y127.477 E-.10209
G1 X128.257 Y127.554 E-.10205
G1 X128.453 Y127.739 E-.10207
G1 X128.515 Y128 E-.10208
G1 X128.453 Y128.261 E-.10209
G1 X128.322 Y128.385 E-.06829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 7 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer7 end: 390,401
M625
M204 S10000
G1 X37.024 Y238.006 F42000
G1 Z1.4
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.524 Y239.006  
M204 S6000
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186 F5400
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.139 Y218.611   E0.0569
G1 E-0.8000 F1800
M204 S10000
G1  X38.885 Y220.401   F600
G1 E0.8000 F1800
M204 S6000
G3  X38.499 Y223.687   I-1.399 J1.502 E0.1462 F5400
G2  X37.524 Y226.452   I3.448 J2.771 E0.1136
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #7
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.8 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z4.4 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E11
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M73 P46 R22
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z4.4
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
M73 P47 R22
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S168.3
G1 X36.87 Y211.75 F42000
G1 Z1.4
G1 X44.503 Y211.75 Z1.8
G1 X44.749 Y211.75 Z1.8
G1 X44.749 Y219.506

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y219.506
G1 Z1.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y219.506  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
M73 P48 R22
G1  X17.524  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y221.006  E0.0285
G1  X17.524  E0.7411 F2473
G1  Y221.756  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y227.756  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y229.256  E0.0285
M73 P48 R21
G1  X37.024  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X17.524  E0.7411
G1  Y233.756  E0.0285
G1  X37.024  E0.7411
G1  Y234.506  E0.0285
G1  X17.524  E0.7411
G1  Y235.256  E0.0285
G1  X37.024  E0.7411
G1  Y236.006  E0.0285
G1  X17.524  E0.7411
G1  Y236.756  E0.0285
G1  X37.024  E0.7411
G1  Y237.506  E0.0285
G1  X17.524  E0.7411
G1  Y238.256  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F9547.299
M204 S6000
G1 X35.024 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.057 Y129.763
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X131.509 Y127.724 I-.007 J-1.091 E.09619
G3 X132.142 Y127.585 I.534 J.919 E.02207
G3 X132.116 Y129.761 I-.093 J1.087 E.10953
M204 S10000
G1 X132.09 Y130.156 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X132.057 Y130.158 E.00104
G3 X131.1 Y127.532 I-.007 J-1.485 E.11304
G3 X132.176 Y127.194 I.96 J1.175 E.03587
G3 X132.314 Y130.134 I-.127 J1.479 E.13256
G1 X132.15 Y130.15 E.00514
; WIPE_START
M204 S6000
G1 X132.057 Y130.158 E-.0355
G1 X131.798 Y130.137 E-.0985
G1 X131.548 Y130.07 E-.09856
G1 X131.313 Y129.96 E-.09852
G1 X131.1 Y129.811 E-.09858
G1 X130.917 Y129.628 E-.09856
G1 X130.768 Y129.415 E-.09852
G1 X130.658 Y129.18 E-.09858
G1 X130.635 Y129.092 E-.03467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.733 Y128.547 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X132.41 Y128.07 I-.857 J.232 E.0182
G1 X132.016 Y127.981 E.01254
G1 X131.707 Y128.066 E.00995
G2 X132.744 Y128.606 I.345 J.602 E.09217
M204 S10000
G1 X132.304 Y128.623 F42000
; LINE_WIDTH: 0.536826
G1 F7288.839
M204 S6000
G1 X132.228 Y128.486 E.00635
G1 X132.017 Y128.417 E.00904
G1 X131.86 Y128.507 E.00735
G1 X131.8 Y128.671 E.00713
G1 X131.86 Y128.836 E.00713
G1 X132.012 Y128.924 E.00713
G1 X132.185 Y128.893 E.00713
G1 X132.297 Y128.759 E.00713
G1 X132.301 Y128.683 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7288.839
G1 X132.297 Y128.759 E-.03841
G1 X132.185 Y128.893 E-.08806
G1 X132.012 Y128.924 E-.08811
G1 X131.86 Y128.836 E-.0881
G1 X131.8 Y128.671 E-.08807
G1 X131.86 Y128.507 E-.08813
G1 X132.017 Y128.417 E-.09084
G1 X132.228 Y128.486 E-.11175
G1 X132.304 Y128.623 E-.07853
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 8/21
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S178.5
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-1.192 J-.245 P1  F42000
G1 X132.06 Y129.812 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X132.057 Y129.808 E.00018
G3 X132.056 Y127.53 I0 J-1.139 E.11988
G1 X132.255 Y127.548 E.00667
G3 X132.254 Y129.791 I-.198 J1.121 E.10657
G1 X132.12 Y129.806 E.00452
M204 S10000
G1 X132.094 Y130.203 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X132.057 Y130.201 E.00118
G3 X131.79 Y127.16 I-.009 J-1.531 E.14158
G3 X132.076 Y127.139 I.204 J.799 E.00896
G3 X132.322 Y130.177 I-.029 J1.531 E.1399
G1 X132.154 Y130.196 E.00525
; WIPE_START
M204 S6000
G1 X132.057 Y130.201 E-.03711
G1 X131.79 Y130.183 E-.1015
G1 X131.532 Y130.113 E-.10165
G1 X131.289 Y130 E-.10161
G1 X131.07 Y129.847 E-.10166
G1 X130.881 Y129.658 E-.10165
M73 P49 R21
G1 X130.728 Y129.439 E-.10166
G1 X130.615 Y129.196 E-.10162
G1 X130.607 Y129.167 E-.01154
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.323 Y128.671 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X131.367 Y128.42 I.728 J-.001 E.13409
G1 X131.333 Y128.612 E.00605
M204 S10000
G1 X132.099 Y128.671 F42000
; LINE_WIDTH: 0.379336
G1 F10701.037
M204 S6000
G1 X132.035 Y128.708 E.00202
G1 X132.035 Y128.635 E.00202
G1 X132.078 Y128.635 E.00117
G1 X132.014 Y128.672 E.00202
G1 X132.078 Y128.708 E.00202
G1 X132.09 Y128.687 E.00067
M204 S10000
G1 X132.413 Y128.671 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.37 Y128.49 E.00578
G1 X132.18 Y128.331 E.00769
G1 X131.933 Y128.331 E.00769
G1 X131.743 Y128.49 E.00769
G1 X131.7 Y128.734 E.0077
G1 X131.824 Y128.949 E.00769
G1 X132.057 Y129.034 E.00769
G1 X132.289 Y128.949 E.00769
G1 X132.413 Y128.731 E.00777
; WIPE_START
G1 X132.289 Y128.949 E-.09516
G1 X132.057 Y129.034 E-.09417
G1 X131.824 Y128.949 E-.09417
G1 X131.7 Y128.734 E-.09417
G1 X131.743 Y128.49 E-.09421
G1 X131.933 Y128.331 E-.09418
G1 X132.18 Y128.331 E-.09416
G1 X132.37 Y128.49 E-.09417
G1 X132.374 Y128.505 E-.00562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 8 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer8 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #8
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z4.6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E10
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M73 P51 R20
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z4.6
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S178.5
G1 X9.798 Y238.256 F42000
M204 S10000
G1 Z1.6

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y238.256 Z2
G1 X17.524 Y238.256 Z2
G1 Z1.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X20.524 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
M73 P52 R20
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
G1  X37.024  E0.6271 F1782
G1  Y237.506  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X37.024  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X17.524  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5025
G1  Y230.756  E0.0285
G1  X37.024  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X37.024  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X37.024  E0.7411
G1  Y224.006  E0.0285
G1  X17.524  E0.7411
G1  Y223.256  E0.0285
G1  X37.024  E0.7411
G1  Y222.506  E0.0285
G1  X17.524  E0.7411
M73 P53 R20
G1  Y221.756  E0.0285
G1  X37.024  E0.7411
G1  Y221.006  E0.0285
G1  X17.524  E0.7411
G1  Y220.256  E0.0285
G1  X37.024  E0.7411
G1  Y219.506  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X15.425 Y237.357  
M204 S6000
G3  X16.049 Y234.325   I1.667 J-1.237 E0.1327
G2  X17.024 Y231.559   I-3.448 J-2.771 E0.1136
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G3  X18.684 Y217.339   I19.122 J15.700 E0.1711
G3  X21.923 Y218.118   I1.175 J2.236 E0.1382
G2  X24.704 Y219.006   I2.804 J-3.982 E0.1127
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.165 Y239.151   E0.0701
; WIPE_TOWER_END

; WIPE_START
G1 F9547.299
M204 S6000
G1 X18.454 Y240.472 E-.70126
G1 X18.565 Y240.577 E-.05825
G1 X18.566 Y240.578 E-.00049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.215 Y126.654
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
M73 P53 R19
G1 X128.236 Y126.662 E.00074
G3 X127.318 Y126.818 I-.244 J1.34 E.25493
G3 X128.099 Y126.644 I.666 J1.146 E.02725
G1 X128.156 Y126.649 E.00191
M204 S10000
G1 X128.249 Y126.263 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.304 Y126.275 E.00174
G3 X126.653 Y126.87 I-.311 J1.727 E.28524
G3 X128.133 Y126.253 I1.334 J1.117 E.05173
G1 X128.19 Y126.258 E.00177
; WIPE_START
M204 S6000
G1 X128.304 Y126.275 E-.04397
G1 X128.601 Y126.347 E-.11628
G1 X128.879 Y126.477 E-.11649
G1 X129.13 Y126.653 E-.11648
G1 X129.347 Y126.87 E-.11648
G1 X129.523 Y127.121 E-.11652
G1 X129.653 Y127.399 E-.11646
G1 X129.664 Y127.443 E-.01732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.955 Y128 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.955 Y127.832 E.00522
G1 X128.839 Y127.515 E.01045
G1 X128.623 Y127.258 E.01045
G1 X128.331 Y127.089 E.01045
G1 X128 Y127.031 E.01045
G1 X127.669 Y127.089 E.01045
G1 X127.377 Y127.258 E.01045
G1 X127.161 Y127.515 E.01045
G1 X127.045 Y127.832 E.01045
G1 X127.045 Y128.168 E.01045
G1 X127.161 Y128.485 E.01045
G1 X127.377 Y128.742 E.01045
G1 X127.669 Y128.911 E.01045
G1 X128 Y128.969 E.01045
G1 X128.331 Y128.911 E.01045
G1 X128.623 Y128.743 E.01045
G1 X128.839 Y128.485 E.01045
G1 X128.955 Y128.168 E.01045
G1 X128.955 Y128.06 E.00337
M204 S10000
G1 X127.817 Y128.067 F42000
; LINE_WIDTH: 0.431809
G1 F9257.146
M204 S6000
G1 X127.933 Y128.186 E.0053
G1 X128.097 Y128.168 E.0053
G1 X128.194 Y128.034 E.0053
G1 X128.127 Y127.849 E.00632
G1 X127.966 Y127.808 E.0053
G1 X127.829 Y127.901 E.0053
G1 X127.822 Y128.007 E.00339
M204 S10000
G1 X127.711 Y128.5 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128 Y128.586 E.00935
G1 X128.289 Y128.5 E.00935
G1 X128.508 Y128.293 E.00936
G1 X128.577 Y128 E.00936
G1 X128.508 Y127.707 E.00935
G1 X128.289 Y127.5 E.00936
G1 X128 Y127.414 E.00935
G1 X127.711 Y127.5 E.00935
G1 X127.492 Y127.707 E.00935
G1 X127.423 Y128 E.00936
G1 X127.492 Y128.293 E.00935
G1 X127.668 Y128.459 E.00749
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.492 Y128.293 E-.09175
G1 X127.423 Y128 E-.11451
G1 X127.492 Y127.707 E-.11454
G1 X127.711 Y127.5 E-.11446
G1 X128 Y127.414 E-.11452
G1 X128.289 Y127.5 E-.11448
G1 X128.472 Y127.673 E-.09572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 9/21
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S168.3
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2 I1.185 J-.278 P1  F42000
G1 X128.22 Y126.601 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.246 Y126.604 E.00088
G3 X128.003 Y126.582 I-.245 J1.394 E.28979
G1 X128.16 Y126.596 E.00529
M204 S10000
G1 X128.254 Y126.211 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.315 Y126.216 E.00188
G3 X128.003 Y126.189 I-.313 J1.781 E.34292
G1 X128.194 Y126.205 E.00596
; WIPE_START
M204 S6000
G1 X128.315 Y126.216 E-.04584
G1 X128.62 Y126.298 E-.12
G1 X128.906 Y126.431 E-.11998
G1 X129.164 Y126.612 E-.12001
G1 X129.388 Y126.836 E-.12001
G1 X129.569 Y127.094 E-.11999
G1 X129.696 Y127.367 E-.11418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.007 Y128 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X129.007 Y127.822 E.00551
G1 X128.885 Y127.489 E.01102
G1 X128.657 Y127.217 E.01102
G1 X128.35 Y127.039 E.01102
G1 X128.002 Y126.978 E.01094
G1 X127.65 Y127.039 E.0111
G1 X127.343 Y127.217 E.01101
G1 X127.115 Y127.489 E.01102
G1 X126.994 Y127.82 E.01094
G1 X126.993 Y128.178 E.0111
G1 X127.115 Y128.511 E.01102
G1 X127.341 Y128.781 E.01094
G1 X127.651 Y128.961 E.0111
G1 X128 Y129.022 E.01101
G1 X128.35 Y128.961 E.01102
G1 X128.657 Y128.783 E.01102
G1 X128.886 Y128.511 E.01104
G1 X129.007 Y128.178 E.011
G1 X129.007 Y128.06 E.00365
M204 S10000
G1 X127.891 Y128.191 F42000
; LINE_WIDTH: 0.48375
G1 F8166.413
M204 S6000
G1 X128.038 Y128.217 E.00544
G1 X128.169 Y128.141 E.00549
G1 X128.221 Y128 E.00546
G1 X128.169 Y127.858 E.00548
G1 X128.039 Y127.783 E.00545
G1 X127.889 Y127.809 E.00552
G1 X127.793 Y127.924 E.00544
G1 X127.793 Y128.077 E.00554
G1 X127.852 Y128.146 E.00329
M204 S10000
G1 X127.686 Y128.545 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X127.517 Y128.404 I.31 J-.542 E.11499
G1 X127.64 Y128.507 E.00497
; WIPE_START
G1 X127.517 Y128.404 E-.06083
G1 X127.409 Y128.217 E-.08229
G1 X127.371 Y128.001 E-.08337
G1 X127.408 Y127.784 E-.08359
G1 X127.517 Y127.596 E-.08233
G1 X127.685 Y127.455 E-.08338
G1 X127.89 Y127.38 E-.08307
G1 X128.11 Y127.38 E-.08359
G1 X128.314 Y127.454 E-.08231
G1 X128.385 Y127.514 E-.03524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 9 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer9 end: 390,401
M625
M204 S10000
G1 X17.524 Y238.006 F42000
G1 Z1.8
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X17.024 Y239.006  
M204 S6000
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148 F5400
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.663 Y220.401   I1.763 J-0.728 E0.0904
G1 E-0.8000 F1800
M204 S10000
G1  X17.409 Y218.611   F600
G1 E0.8000 F1800
M204 S6000
G3  X20.133 Y216.972   I2.971 J1.853 E0.1254 F5400
G3  X22.558 Y218.499   I-3.985 J9.017 E0.1093
G2  X24.704 Y219.006   I2.178 J-4.424 E0.0845
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #9
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2.2 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z4.8 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E9
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M73 P55 R18
G1 Z4.8
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
M73 P56 R18
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S168.3
G1 X9.798 Y219.506 F42000
G1 Z1.8

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y219.506 Z2.2
G1 X17.524 Y219.506 Z2.2
G1 Z1.8
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X20.524 Y219.506  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
G1  X37.024  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y221.006  E0.0285
M73 P57 R18
G1  X37.024  E0.7411 F2473
G1  Y221.756  E0.0285
G1  X17.524  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5075
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5125
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5175
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X37.024  E0.7411
G1  Y233.756  E0.0285
G1  X17.524  E0.7411
G1  Y234.506  E0.0285
G1  X37.024  E0.7411
G1  Y235.256  E0.0285
G1  X17.524  E0.7411
G1  Y236.006  E0.0285
G1  X37.024  E0.7411
G1  Y236.756  E0.0285
G1  X17.524  E0.7411
G1  Y237.506  E0.0285
G1  X37.024  E0.7411
G1  Y238.256  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F9547.299
M204 S6000
M73 P57 R17
G1 X19.524 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.051 Y129.829
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X131.856 Y129.81 E.00657
G3 X132.057 Y127.513 I.193 J-1.14 E.11552
G1 X132.242 Y127.529 E.00625
G3 X132.11 Y129.825 I-.193 J1.14 E.1132
M204 S10000
G1 X132.096 Y130.22 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
M73 P58 R17
G1 X132.057 Y130.219 E.00124
G3 X131.526 Y127.213 I-.007 J-1.549 E.13469
G3 X132.277 Y127.139 I.538 J1.605 E.02362
G3 X132.325 Y130.195 I-.227 J1.532 E.13534
G1 X132.156 Y130.213 E.00528
; WIPE_START
M204 S6000
G1 X132.057 Y130.219 E-.03792
G1 X131.787 Y130.2 E-.10268
G1 X131.526 Y130.13 E-.1028
G1 X131.281 Y130.016 E-.10278
G1 X131.059 Y129.86 E-.10284
G1 X130.868 Y129.669 E-.10278
G1 X130.712 Y129.447 E-.10282
G1 X130.598 Y129.202 E-.1028
G1 X130.596 Y129.196 E-.0026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.357 Y128.939 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X132.761 Y128.931 I.701 J-.284 E.05595
G2 X132.806 Y128.652 I-.777 J-.266 E.0088
G2 X131.345 Y128.88 I-.746 J.015 E.07894
M204 S10000
G1 X132.079 Y128.63 F42000
; LINE_WIDTH: 0.41082
G1 F9785.268
M204 S6000
G1 X132.01 Y128.67 E.00241
G1 X132.067 Y128.703 E.00199
M204 S10000
G1 X132.429 Y128.656 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X132.386 Y128.482 E.00555
G1 X132.187 Y128.315 E.00807
G1 X131.927 Y128.314 E.00809
G1 X131.728 Y128.482 E.00807
G1 X131.683 Y128.734 E.00797
G1 X131.811 Y128.962 E.00811
G1 X132.057 Y129.051 E.0081
G1 X132.301 Y128.962 E.00807
G1 X132.429 Y128.716 E.00862
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X132.301 Y128.962 E-.10549
G1 X132.057 Y129.051 E-.09878
G1 X131.811 Y128.962 E-.0992
G1 X131.683 Y128.734 E-.09933
G1 X131.728 Y128.482 E-.09759
G1 X131.927 Y128.314 E-.09875
G1 X132.187 Y128.315 E-.099
G1 X132.312 Y128.42 E-.06186
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 10/21
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M106 S178.5
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-1.198 J-.213 P1  F42000
G1 X132.062 Y129.824 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X132.057 Y129.823 E.0002
G3 X131.48 Y127.673 I-.007 J-1.151 E.10141
G3 X132.133 Y127.525 I.562 J.968 E.02279
G3 X132.256 Y129.805 I-.084 J1.148 E.11137
G1 X132.122 Y129.818 E.00452
M204 S10000
G1 X132.097 Y130.214 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X132.057 Y130.217 E.00125
G3 X131.062 Y127.487 I-.007 J-1.543 E.1175
G3 X132.167 Y127.135 I.998 J1.223 E.03686
G3 X132.325 Y130.192 I-.118 J1.539 E.13824
G1 X132.156 Y130.209 E.00525
; WIPE_START
M204 S6000
G1 X132.057 Y130.217 E-.03807
G1 X131.788 Y130.194 E-.1024
G1 X131.528 Y130.125 E-.10244
G1 X131.283 Y130.011 E-.10245
G1 X131.062 Y129.856 E-.10242
G1 X130.872 Y129.666 E-.10245
G1 X130.717 Y129.445 E-.10246
G1 X130.603 Y129.2 E-.10244
G1 X130.6 Y129.188 E-.00487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.802 Y128.67 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X132.218 Y127.939 I-.763 J.012 E.03125
G1 X131.794 Y127.962 E.01318
G2 X132.802 Y128.73 I.259 J.706 E.09991
M204 S10000
G1 X132.425 Y128.67 F42000
G1 F9547.299
M204 S6000
G1 X132.381 Y128.484 E.00592
G1 X132.178 Y128.316 E.00816
G1 X131.917 Y128.326 E.00813
G1 X131.733 Y128.483 E.0075
G1 X131.688 Y128.736 E.00797
G1 X131.816 Y128.958 E.00796
G1 X132.057 Y129.046 E.00795
G1 X132.297 Y128.958 E.00795
G1 X132.425 Y128.73 E.00813
; WIPE_START
G1 X132.297 Y128.958 E-.0995
G1 X132.057 Y129.046 E-.09731
G1 X131.816 Y128.958 E-.09731
G1 X131.688 Y128.736 E-.09744
G1 X131.733 Y128.483 E-.09759
G1 X131.917 Y128.326 E-.09178
G1 X132.178 Y128.316 E-.09953
G1 X132.339 Y128.45 E-.07955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 10 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer10 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #10
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E8
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z5
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
M73 P60 R16
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S178.5
G1 X22.403 Y211.75 F42000
M204 S10000
G1 Z2
G1 X30.036 Y211.75 Z2.4
G1 X44.749 Y211.75 Z2.4
G1 X44.749 Y238.256

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y238.256
G1 Z2
M73 P61 R16
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
G1  X17.524  E0.6271 F1782
G1  Y237.506  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X17.524  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5175
M73 P62 R16
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X17.524  E0.7411
G1  Y224.006  E0.0285
G1  X37.024  E0.7411
G1  Y223.256  E0.0285
G1  X17.524  E0.7411
G1  Y222.506  E0.0285
G1  X37.024  E0.7411
G1  Y221.756  E0.0285
G1  X17.524  E0.7411
G1  Y221.006  E0.0285
G1  X37.024  E0.7411
G1  Y220.256  E0.0285
G1  X17.524  E0.7411
G1  Y219.506  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.383 Y239.151  
M204 S6000
G3  X34.874 Y241.053   I-3.832 J-2.449 E0.1222
G3  X32.472 Y239.790   I0.308 J-3.502 E0.1059
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.123 Y237.357   I-1.746 J0.726 E0.0771
; WIPE_TOWER_END

; WIPE_START
G1 F9547.299
M204 S6000
G1 X39.206 Y237.249 E-.05158
G1 X39.285 Y237.127 E-.05544
G1 X39.355 Y236.999 E-.05545
G1 X39.415 Y236.865 E-.05544
G1 X39.463 Y236.728 E-.05545
G1 X39.501 Y236.587 E-.05545
G1 X39.528 Y236.444 E-.05545
G1 X39.543 Y236.298 E-.05544
G1 X39.547 Y236.153 E-.05545
G1 X39.54 Y236.007 E-.05545
G1 X39.521 Y235.862 E-.05545
G1 X39.491 Y235.719 E-.05544
G1 X39.449 Y235.58 E-.05545
G1 X39.409 Y235.474 E-.04306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.222 Y126.584
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.248 Y126.592 E.00093
G3 X127.282 Y126.757 I-.257 J1.409 E.26813
G3 X128.151 Y126.578 I.702 J1.21 E.03024
G1 X128.162 Y126.579 E.00037
M204 S10000
G1 X128.256 Y126.193 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.316 Y126.206 E.00192
G3 X126.599 Y126.824 I-.323 J1.797 E.29669
G3 X128.185 Y126.187 I1.388 J1.163 E.05526
G1 X128.196 Y126.188 E.00034
; WIPE_START
M204 S6000
G1 X128.316 Y126.206 E-.04622
G1 X128.626 Y126.281 E-.12094
G1 X128.915 Y126.416 E-.12117
G1 X129.176 Y126.599 E-.12115
G1 X129.401 Y126.824 E-.12118
G1 X129.584 Y127.085 E-.12112
G1 X129.704 Y127.344 E-.10822
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.024 Y128 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X129.024 Y127.819 E.00561
G1 X128.9 Y127.48 E.01121
G1 X128.668 Y127.203 E.01121
G1 X128.356 Y127.023 E.01121
G1 X128 Y126.96 E.01121
G1 X127.644 Y127.023 E.01121
G1 X127.332 Y127.203 E.01121
G1 X127.1 Y127.48 E.01121
G1 X126.976 Y127.819 E.01121
G1 X126.976 Y128.181 E.01121
G1 X127.1 Y128.52 E.01121
G1 X127.332 Y128.797 E.01121
G1 X127.644 Y128.977 E.01121
G1 X128 Y129.04 E.01121
G1 X128.356 Y128.977 E.01121
G1 X128.668 Y128.797 E.01121
G1 X128.9 Y128.52 E.01121
G1 X129.024 Y128.181 E.01121
G1 X129.024 Y128.06 E.00374
M204 S10000
G1 X128.04 Y128.226 F42000
; LINE_WIDTH: 0.50125
G1 F7854.603
M204 S6000
G1 X128.176 Y128.147 E.00591
G1 X128.229 Y128 E.00592
G1 X128.176 Y127.853 E.00591
G1 X128.04 Y127.774 E.00592
G1 X127.885 Y127.802 E.00592
G1 X127.785 Y127.922 E.00591
G1 X127.785 Y128.078 E.00592
G1 X127.886 Y128.199 E.00592
G1 X127.981 Y128.215 E.00365
M204 S10000
G1 X128.112 Y128.637 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X127.888 Y128.637 I-.112 J-.632 E.1182
G1 X128.052 Y128.637 E.00511
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.888 Y128.637 E-.06258
G1 X127.677 Y128.56 E-.08532
G1 X127.504 Y128.416 E-.08543
G1 X127.392 Y128.221 E-.08534
G1 X127.353 Y128 E-.08542
G1 X127.392 Y127.779 E-.08537
G1 X127.504 Y127.584 E-.08537
G1 X127.677 Y127.44 E-.08536
G1 X127.888 Y127.363 E-.08538
G1 X127.926 Y127.363 E-.01445
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 11/21
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S168.3
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I1.138 J.431 P1  F42000
G1 X128.224 Y126.575 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.251 Y126.577 E.00089
G3 X128 Y126.555 I-.251 J1.42 E.29519
G1 X128.165 Y126.57 E.00553
M204 S10000
G1 X128.259 Y126.184 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.319 Y126.193 E.00189
G3 X127.371 Y126.272 I-.325 J1.805 E.32787
G3 X128.028 Y126.164 I.707 J2.24 E.02072
G1 X128.199 Y126.179 E.00533
; WIPE_START
M204 S6000
G1 X128.319 Y126.193 E-.04587
G1 X128.629 Y126.272 E-.12168
G1 X128.919 Y126.408 E-.12177
G1 X129.182 Y126.592 E-.12176
G1 X129.408 Y126.818 E-.12182
G1 X129.592 Y127.081 E-.12172
G1 X129.709 Y127.332 E-.10538
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.234 Y128 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51042
G1 F7700.534
M204 S6000
G1 X128.179 Y127.85 E.00616
G1 X128.041 Y127.77 E.00615
G1 X127.883 Y127.797 E.00615
G1 X127.78 Y127.92 E.00616
G1 X127.78 Y128.08 E.00616
G1 X127.883 Y128.202 E.00615
G1 X128.041 Y128.23 E.00616
G1 X128.179 Y128.15 E.00615
G1 X128.213 Y128.056 E.00384
M204 S10000
G1 X128.656 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X128.616 Y128.224 I-.651 J.001 E.11988
G1 X128.646 Y128.059 E.00521
M204 S10000
G1 X129.033 Y128 F42000
G1 F9547.299
M204 S6000
G1 X129.033 Y127.818 E.00565
G1 X128.908 Y127.475 E.01131
G1 X128.674 Y127.196 E.01131
G1 X128.359 Y127.014 E.01131
G1 X128 Y126.951 E.01131
G1 X127.641 Y127.014 E.01131
G1 X127.326 Y127.196 E.0113
G1 X127.091 Y127.475 E.01131
G1 X126.967 Y127.818 E.01131
G1 X126.967 Y128.182 E.01131
G1 X127.092 Y128.525 E.01131
G1 X127.326 Y128.804 E.01131
G1 X127.641 Y128.986 E.01131
G1 X128 Y129.049 E.01131
G1 X128.359 Y128.986 E.01131
G1 X128.674 Y128.804 E.0113
G1 X128.908 Y128.525 E.01131
G1 X129.033 Y128.182 E.01131
G1 X129.033 Y128.06 E.00379
; WIPE_START
G1 X129.033 Y128.182 E-.04644
G1 X128.908 Y128.525 E-.13844
G1 X128.674 Y128.804 E-.1385
G1 X128.359 Y128.986 E-.13839
G1 X128 Y129.049 E-.13844
G1 X127.641 Y128.986 E-.13843
G1 X127.593 Y128.958 E-.02136
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 11 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer11 end: 390,401
M625
M204 S10000
G1 X37.024 Y238.006 F42000
G1 Z2.2
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.524 Y239.006  
M204 S6000
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186 F5400
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.139 Y218.611   E0.0569
G1 E-0.8000 F1800
M204 S10000
G1  X38.885 Y220.401   F600
G1 E0.8000 F1800
M204 S6000
G3  X38.499 Y223.687   I-1.399 J1.502 E0.1462 F5400
G2  X37.524 Y226.452   I3.448 J2.771 E0.1136
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #11
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2.6 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z5.2 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E7
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
M73 P62 R15
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z5.2
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
M73 P64 R15
  G1 X-38.2 F18000 ;wipe and shake
M73 P64 R14
  G1 X-48.2 F3000
M73 P65 R14
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S168.3
G1 X36.87 Y211.75 F42000
G1 Z2.2
G1 X44.503 Y211.75 Z2.6
G1 X44.749 Y211.75 Z2.6
G1 X44.749 Y219.506

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y219.506
G1 Z2.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y219.506  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
G1  X17.524  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y221.006  E0.0285
M73 P66 R14
G1  X17.524  E0.7411 F2473
G1  Y221.756  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y227.756  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y229.256  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X17.524  E0.7411
G1  Y233.756  E0.0285
G1  X37.024  E0.7411
G1  Y234.506  E0.0285
G1  X17.524  E0.7411
G1  Y235.256  E0.0285
G1  X37.024  E0.7411
M73 P67 R14
G1  Y236.006  E0.0285
G1  X17.524  E0.7411
G1  Y236.756  E0.0285
G1  X37.024  E0.7411
G1  Y237.506  E0.0285
G1  X17.524  E0.7411
G1  Y238.256  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F9547.299
M204 S6000
G1 X35.024 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.061 Y129.802
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X132.057 Y129.798 E.00021
G3 X132.057 Y127.54 I0 J-1.129 E.11885
G1 X132.253 Y127.557 E.00661
G3 X132.252 Y129.781 I-.196 J1.112 E.10566
G1 X132.121 Y129.796 E.00443
M204 S10000
G1 X132.018 Y130.193 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X131.792 Y130.17 E.00703
G3 X131.792 Y127.17 I.262 J-1.5 E.13216
G3 X132.061 Y127.147 I.199 J.754 E.00844
G3 X132.078 Y130.193 I-.007 J1.523 E.14755
; WIPE_START
M204 S6000
G1 X131.792 Y130.17 E-.10874
G1 X131.535 Y130.104 E-.10091
G1 X131.294 Y129.992 E-.101
G1 X131.076 Y129.839 E-.10099
G1 X130.889 Y129.651 E-.10101
G1 X130.736 Y129.434 E-.10097
G1 X130.624 Y129.193 E-.10104
G1 X130.593 Y129.078 E-.04536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.376 Y128.919 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X131.332 Y128.671 I.675 J-.247 E.13233
G1 X131.366 Y128.86 E.00595
M204 S10000
G1 X132.076 Y128.637 F42000
; LINE_WIDTH: 0.3601
G1 F11350.023
M204 S6000
G1 X132.017 Y128.671 E.00179
G1 X132.059 Y128.696 E.00126
M204 S10000
G1 X132.404 Y128.671 F42000
; LINE_WIDTH: 0.41999
M73 P67 R13
G1 F9547.299
M204 S6000
G1 X132.362 Y128.495 E.00563
G1 X132.177 Y128.34 E.00749
G1 X131.936 Y128.34 E.00748
G1 X131.751 Y128.495 E.00748
G1 X131.709 Y128.733 E.00748
G1 X131.83 Y128.941 E.00749
G1 X132.057 Y129.024 E.00748
G1 X132.283 Y128.941 E.00748
G1 X132.404 Y128.731 E.00752
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X132.283 Y128.941 E-.09203
G1 X132.057 Y129.024 E-.09162
G1 X131.83 Y128.941 E-.09162
G1 X131.709 Y128.733 E-.09166
G1 X131.751 Y128.495 E-.09163
G1 X131.936 Y128.34 E-.09162
G1 X132.177 Y128.34 E-.09161
G1 X132.362 Y128.495 E-.09164
G1 X132.378 Y128.563 E-.02657
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 12/21
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S178.5
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-1.175 J-.317 P1  F42000
G1 X132.058 Y129.749 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X132.057 Y129.745 E.00012
G3 X131.869 Y127.61 I-.005 J-1.075 E.10726
G3 X132.221 Y127.608 I.181 J.995 E.01185
G3 X132.243 Y129.728 I-.17 J1.062 E.10103
G1 X132.117 Y129.742 E.00424
M204 S10000
G1 X132.092 Y130.139 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X132.057 Y130.139 E.00109
G3 X131.553 Y127.289 I-.008 J-1.468 E.12774
G3 X132.255 Y127.218 I.508 J1.514 E.02208
G3 X132.311 Y130.115 I-.207 J1.453 E.12852
G1 X132.151 Y130.133 E.00499
; WIPE_START
M204 S6000
G1 X132.057 Y130.139 E-.03611
G1 X131.801 Y130.12 E-.09734
G1 X131.553 Y130.054 E-.09743
G1 X131.321 Y129.945 E-.09747
G1 X131.111 Y129.798 E-.09741
G1 X130.93 Y129.617 E-.09747
G1 X130.782 Y129.407 E-.09744
G1 X130.674 Y129.175 E-.09744
G1 X130.646 Y129.068 E-.04189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.173 Y128.01 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X132.393 Y128.09 I-.114 J.657 E.12266
G1 X132.23 Y128.031 E.00539
M204 S10000
G1 X132.098 Y128.434 F42000
; LINE_WIDTH: 0.52564
G1 F7457.739
M204 S6000
G1 X131.936 Y128.462 E.00654
G1 X131.83 Y128.589 E.00656
G1 X131.83 Y128.754 E.00657
G1 X131.936 Y128.881 E.00657
G1 X132.098 Y128.909 E.00654
G1 X132.242 Y128.826 E.0066
G1 X132.298 Y128.671 E.00656
G1 X132.241 Y128.516 E.00659
G1 X132.15 Y128.463 E.00417
; WIPE_START
G1 X132.241 Y128.516 E-.05593
G1 X132.298 Y128.671 E-.08835
G1 X132.242 Y128.826 E-.08792
G1 X132.098 Y128.909 E-.08842
G1 X131.936 Y128.881 E-.08766
G1 X131.83 Y128.754 E-.08804
G1 X131.83 Y128.589 E-.08807
G1 X131.936 Y128.462 E-.08794
G1 X132.098 Y128.434 E-.08768
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 12 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer12 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #12
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z5.4 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E6
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z5.4
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
M73 P69 R13
  G1 X-38.2 F12000 ;wipe and shake
M73 P69 R12
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S178.5
G1 X9.798 Y238.256 F42000
M204 S10000
G1 Z2.4

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y238.256 Z2.8
G1 X17.524 Y238.256 Z2.8
M73 P70 R12
G1 Z2.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X20.524 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
G1  X37.024  E0.6271 F1782
G1  Y237.506  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X37.024  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X17.524  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5025
G1  Y230.756  E0.0285
M73 P71 R12
G1  X37.024  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X37.024  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X37.024  E0.7411
G1  Y224.006  E0.0285
G1  X17.524  E0.7411
G1  Y223.256  E0.0285
G1  X37.024  E0.7411
G1  Y222.506  E0.0285
G1  X17.524  E0.7411
G1  Y221.756  E0.0285
G1  X37.024  E0.7411
G1  Y221.006  E0.0285
G1  X17.524  E0.7411
G1  Y220.256  E0.0285
G1  X37.024  E0.7411
G1  Y219.506  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X15.425 Y237.357  
M204 S6000
G3  X16.049 Y234.325   I1.667 J-1.237 E0.1327
G2  X17.024 Y231.559   I-3.448 J-2.771 E0.1136
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G3  X18.684 Y217.339   I19.122 J15.700 E0.1711
G3  X21.923 Y218.118   I1.175 J2.236 E0.1382
G2  X24.704 Y219.006   I2.804 J-3.982 E0.1127
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.165 Y239.151   E0.0701
; WIPE_TOWER_END

; WIPE_START
G1 F7457.739
M204 S6000
G1 X18.454 Y240.472 E-.70126
G1 X18.565 Y240.577 E-.05825
G1 X18.566 Y240.578 E-.00049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.241 Y126.601
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.486 Y126.664 E.00849
G3 X127.512 Y126.659 I-.494 J1.336 E.26662
G3 X128.182 Y126.588 I.493 J1.467 E.02277
M204 S10000
G1 X128.255 Y126.201 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.315 Y126.213 E.00189
G3 X126.83 Y126.605 I-.322 J1.789 E.30526
G3 X128.196 Y126.196 I1.177 J1.443 E.04543
; WIPE_START
M204 S6000
G1 X128.315 Y126.213 E-.04592
G1 X128.623 Y126.289 E-.12044
G1 X128.91 Y126.423 E-.12059
G1 X129.17 Y126.605 E-.12064
G1 X129.395 Y126.83 E-.1206
G1 X129.577 Y127.09 E-.12064
G1 X129.701 Y127.355 E-.11116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.016 Y128 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X129.016 Y127.821 E.00556
G1 X128.893 Y127.484 E.01112
G1 X128.663 Y127.21 E.01112
G1 X128.356 Y127.032 E.01103
G1 X128 Y126.968 E.01122
G1 X127.647 Y127.031 E.01111
G1 X127.337 Y127.21 E.01112
G1 X127.107 Y127.484 E.01112
G1 X126.984 Y127.821 E.01112
G1 X126.984 Y128.179 E.01112
G1 X127.107 Y128.516 E.01112
G1 X127.337 Y128.79 E.01112
G1 X127.647 Y128.969 E.01112
G1 X128 Y129.032 E.01112
G1 X128.353 Y128.969 E.01112
G1 X128.663 Y128.79 E.01112
G1 X128.893 Y128.516 E.01112
G1 X129.016 Y128.179 E.01112
G1 X129.016 Y128.06 E.00371
M204 S10000
G1 X128.038 Y127.778 F42000
; LINE_WIDTH: 0.49302
G1 F7998.223
M204 S6000
G1 X127.887 Y127.805 E.00566
G1 X127.788 Y127.923 E.0057
G1 X127.788 Y128.077 E.00571
G1 X127.887 Y128.195 E.00571
G1 X128.039 Y128.222 E.0057
G1 X128.173 Y128.145 E.00571
G1 X128.225 Y128 E.00571
G1 X128.172 Y127.854 E.00575
G1 X128.09 Y127.808 E.00348
M204 S10000
G1 X128.11 Y127.371 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X128.32 Y127.447 I-.107 J.625 E.11667
G1 X128.167 Y127.392 E.00507
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X128.32 Y127.447 E-.0621
G1 X128.488 Y127.588 E-.08339
G1 X128.6 Y127.781 E-.08477
G1 X128.639 Y128 E-.08431
G1 X128.6 Y128.218 E-.08438
G1 X128.489 Y128.411 E-.08427
G1 X128.319 Y128.553 E-.08434
G1 X128.111 Y128.629 E-.08433
G1 X127.889 Y128.629 E-.08428
G1 X127.83 Y128.608 E-.02383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 13/21
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S168.3
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I1.194 J.235 P1  F42000
G1 X128.22 Y126.626 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.241 Y126.631 E.00074
G3 X127.523 Y126.69 I-.248 J1.368 E.26826
G3 X128.035 Y126.609 I.514 J1.591 E.01743
G1 X128.16 Y126.62 E.00421
M204 S10000
G1 X128.254 Y126.235 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.309 Y126.245 E.00175
G3 X126.851 Y126.631 I-.316 J1.756 E.29958
G3 X128.069 Y126.219 I1.163 J1.432 E.04076
G1 X128.194 Y126.23 E.0039
; WIPE_START
M204 S6000
G1 X128.309 Y126.245 E-.04415
G1 X128.611 Y126.321 E-.11824
G1 X128.894 Y126.452 E-.11839
G1 X129.149 Y126.631 E-.11835
G1 X129.369 Y126.851 E-.11838
G1 X129.548 Y127.106 E-.11841
G1 X129.679 Y127.389 E-.11835
G1 X129.683 Y127.403 E-.00574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.983 Y127.999 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.983 Y127.827 E.00535
G1 X128.864 Y127.501 E.01076
G1 X128.641 Y127.236 E.01076
G1 X128.341 Y127.062 E.01078
G1 X128.03 Y127.005 E.0098
G1 X127.657 Y127.063 E.01172
G1 X127.359 Y127.236 E.0107
G1 X127.136 Y127.501 E.01075
G1 X127.017 Y127.829 E.01083
G1 X127.017 Y128.173 E.01069
G1 X127.136 Y128.499 E.01076
G1 X127.359 Y128.764 E.01076
G1 X127.659 Y128.938 E.01076
G1 X128.001 Y128.998 E.01078
G1 X128.312 Y128.945 E.0098
G1 X128.643 Y128.763 E.01172
G1 X128.864 Y128.499 E.0107
G1 X128.983 Y128.173 E.01076
G1 X128.983 Y128.059 E.00355
M204 S10000
G1 X128.114 Y128.172 F42000
; LINE_WIDTH: 0.45643
G1 F8705.956
M204 S6000
G1 X128.21 Y128.037 E.00564
G2 X127.863 Y127.836 I-.221 J-.019 E.0171
G1 X127.79 Y127.964 E.00501
G1 X127.815 Y128.107 E.00493
G1 X127.961 Y128.207 E.00603
G1 X128.056 Y128.185 E.0033
M204 S10000
G1 X127.431 Y128.208 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.605 Y128.471 E.00979
G1 X127.893 Y128.596 E.00974
G1 X128.186 Y128.584 E.00911
G1 X128.399 Y128.467 E.00755
G1 X128.57 Y128.205 E.0097
G1 X128.606 Y127.999 E.0065
G1 X128.533 Y127.693 E.00978
G1 X128.305 Y127.477 E.00974
G1 X128.025 Y127.387 E.00911
G1 X127.785 Y127.425 E.00754
G1 X127.535 Y127.612 E.00968
G1 X127.394 Y127.895 E.00982
G1 X127.424 Y128.148 E.00792
; WIPE_START
G1 X127.394 Y127.895 E-.09693
G1 X127.535 Y127.612 E-.12021
G1 X127.785 Y127.425 E-.1185
G1 X128.025 Y127.387 E-.09235
G1 X128.305 Y127.477 E-.11154
G1 X128.533 Y127.693 E-.1193
G1 X128.594 Y127.951 E-.10116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 13 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer13 end: 390,401
M625
M204 S10000
G1 X17.524 Y238.006 F42000
G1 Z2.6
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X17.024 Y239.006  
M204 S6000
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148 F5400
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.663 Y220.401   I1.763 J-0.728 E0.0904
G1 E-0.8000 F1800
M204 S10000
G1  X17.409 Y218.611   F600
G1 E0.8000 F1800
M204 S6000
G3  X20.133 Y216.972   I2.971 J1.853 E0.1254 F5400
G3  X22.558 Y218.499   I-3.985 J9.017 E0.1093
G2  X24.704 Y219.006   I2.178 J-4.424 E0.0845
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #13
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z5.6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E5
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z5.6
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S168.3
M73 P74 R11
G1 X9.798 Y219.506 F42000
G1 Z2.6

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


M73 P74 R10
G1 X17.431 Y219.506 Z3
G1 X17.524 Y219.506 Z3
G1 Z2.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X20.524 Y219.506  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
G1  X37.024  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y221.006  E0.0285
G1  X37.024  E0.7411 F2473
M73 P75 R10
G1  Y221.756  E0.0285
G1  X17.524  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5075
G1  Y227.756  E0.0285
M73 P76 R10
G1  X17.524  E0.7411 F5125
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5175
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X37.024  E0.7411
G1  Y233.756  E0.0285
G1  X17.524  E0.7411
G1  Y234.506  E0.0285
G1  X37.024  E0.7411
G1  Y235.256  E0.0285
G1  X17.524  E0.7411
G1  Y236.006  E0.0285
G1  X37.024  E0.7411
G1  Y236.756  E0.0285
G1  X17.524  E0.7411
G1  Y237.506  E0.0285
G1  X37.024  E0.7411
G1  Y238.256  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F9547.299
M204 S6000
G1 X19.524 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.056 Y129.667
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X131.715 Y127.733 I-.009 J-.996 E.09377
G3 X132.124 Y127.678 I.344 J1.021 E.01392
G3 X132.116 Y129.665 I-.076 J.993 E.09998
M204 S10000
G1 X132.086 Y130.061 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X132.057 Y130.063 E.00091
G3 X131.36 Y127.465 I-.009 J-1.39 E.11346
G3 X132.158 Y127.288 I.679 J1.169 E.02578
G3 X132.298 Y130.04 I-.11 J1.385 E.12428
G1 X132.145 Y130.055 E.00475
; WIPE_START
M204 S6000
G1 X132.057 Y130.063 E-.03393
G1 X131.815 Y130.043 E-.0922
G1 X131.58 Y129.98 E-.09224
G1 X131.36 Y129.877 E-.09224
G1 X131.161 Y129.738 E-.09222
G1 X130.99 Y129.567 E-.09226
G1 X130.851 Y129.368 E-.09223
G1 X130.748 Y129.148 E-.09224
G1 X130.693 Y128.943 E-.08044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.602 Y128.289 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X131.462 Y128.567 E.00965
G1 X131.462 Y128.761 E.00603
G1 X131.605 Y129.068 E.01051
G1 X131.86 Y129.232 E.00942
G1 X132.161 Y129.265 E.00941
G1 X132.44 Y129.125 E.00968
G1 X132.623 Y128.878 E.00956
G1 X132.641 Y128.564 E.00976
G1 X132.519 Y128.284 E.00948
G1 X132.363 Y128.153 E.0063
G1 X132.093 Y128.075 E.00872
G1 X131.846 Y128.107 E.00773
G1 X131.65 Y128.253 E.0076
M204 S10000
G1 X131.869 Y128.721 F42000
; LINE_WIDTH: 0.43843
G1 F9102.172
M204 S6000
G1 X131.968 Y128.86 E.00555
G1 X132.13 Y128.866 E.00529
G1 X132.255 Y128.744 E.00568
G1 X132.26 Y128.631 E.00368
G1 X132.177 Y128.501 E.005
G1 X131.973 Y128.48 E.00669
G1 X131.864 Y128.594 E.00512
G1 X131.867 Y128.661 E.0022
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9102.172
G1 X131.864 Y128.594 E-.04262
G1 X131.973 Y128.48 E-.0993
G1 X132.177 Y128.501 E-.12966
G1 X132.26 Y128.631 E-.09696
G1 X132.255 Y128.744 E-.07132
G1 X132.13 Y128.866 E-.11004
G1 X131.968 Y128.86 E-.10248
G1 X131.869 Y128.721 E-.10763
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 14/21
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S178.5
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3 I-1.188 J.264 P1  F42000
G1 X132.057 Y129.563 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X132.057 Y127.777 I0 J-.893 E.09401
G1 X132.212 Y127.79 E.00523
G3 X132.117 Y129.561 I-.155 J.879 E.08678
M204 S10000
G1 X132.078 Y129.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X132.057 Y129.955 E.00067
G3 X131.616 Y127.461 I-.006 J-1.285 E.11173
G3 X132.082 Y127.385 I.485 J1.52 E.0147
G3 X132.279 Y129.935 I-.031 J1.285 E.11725
G1 X132.137 Y129.951 E.00443
; WIPE_START
M204 S6000
G1 X132.057 Y129.955 E-.03078
G1 X131.833 Y129.94 E-.08519
G1 X131.616 Y129.882 E-.08534
G1 X131.412 Y129.787 E-.08534
G1 X131.228 Y129.658 E-.08532
G1 X131.07 Y129.5 E-.08536
G1 X130.941 Y129.316 E-.08534
G1 X130.846 Y129.112 E-.08532
G1 X130.788 Y128.895 E-.08536
G1 X130.777 Y128.773 E-.04664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.565 Y128.671 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X131.624 Y128.921 E.00796
G1 X131.811 Y129.097 E.00796
G1 X132.057 Y129.17 E.00796
G1 X132.302 Y129.097 E.00796
G1 X132.489 Y128.921 E.00796
G1 X132.548 Y128.671 E.00796
G1 X132.489 Y128.422 E.00796
G1 X132.302 Y128.246 E.00796
G1 X132.057 Y128.172 E.00796
G1 X131.811 Y128.246 E.00796
G1 X131.624 Y128.422 E.00796
G1 X131.579 Y128.613 E.0061
M204 S10000
G1 X132.094 Y128.606 F42000
; LINE_WIDTH: 0.64852
G1 F5944.518
M204 S6000
G2 X132.102 Y128.723 I-.035 J.061 E.01512
; WIPE_START
G1 X132.094 Y128.737 E-.03747
G1 X132.019 Y128.737 E-.18063
G1 X131.981 Y128.671 E-.18063
G1 X132.019 Y128.606 E-.18063
G1 X132.094 Y128.606 E-.18063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 14 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer14 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #14
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z5.8 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E4
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z5.8
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S178.5
G1 X22.403 Y211.75 F42000
M204 S10000
G1 Z2.8
M73 P78 R9
G1 X30.036 Y211.75 Z3.2
G1 X44.749 Y211.75 Z3.2
M73 P79 R8
G1 X44.749 Y238.256

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y238.256
G1 Z2.8
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
G1  X17.524  E0.6271 F1782
G1  Y237.506  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X17.524  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y232.256  E0.0285
M73 P80 R8
G1  X17.524  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X17.524  E0.7411
G1  Y224.006  E0.0285
G1  X37.024  E0.7411
G1  Y223.256  E0.0285
G1  X17.524  E0.7411
G1  Y222.506  E0.0285
G1  X37.024  E0.7411
G1  Y221.756  E0.0285
G1  X17.524  E0.7411
G1  Y221.006  E0.0285
G1  X37.024  E0.7411
G1  Y220.256  E0.0285
G1  X17.524  E0.7411
G1  Y219.506  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.383 Y239.151  
M204 S6000
G3  X34.874 Y241.053   I-3.832 J-2.449 E0.1222
G3  X32.472 Y239.790   I0.308 J-3.502 E0.1059
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.123 Y237.357   I-1.746 J0.726 E0.0771
; WIPE_TOWER_END

; WIPE_START
G1 F5944.518
M204 S6000
G1 X39.206 Y237.249 E-.05158
G1 X39.285 Y237.127 E-.05544
G1 X39.355 Y236.999 E-.05545
G1 X39.415 Y236.865 E-.05544
G1 X39.463 Y236.728 E-.05545
G1 X39.501 Y236.587 E-.05545
G1 X39.528 Y236.444 E-.05545
G1 X39.543 Y236.298 E-.05544
G1 X39.547 Y236.153 E-.05545
G1 X39.54 Y236.007 E-.05545
G1 X39.521 Y235.862 E-.05545
G1 X39.491 Y235.719 E-.05544
G1 X39.449 Y235.58 E-.05545
G1 X39.409 Y235.474 E-.04306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.213 Y126.679
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.233 Y126.68 E.00066
G3 X128 Y126.66 I-.233 J1.317 E.27376
G1 X128.153 Y126.673 E.00516
M204 S10000
G1 X128.31 Y126.301 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.591 Y126.375 E.00904
G3 X127.407 Y126.371 I-.597 J1.625 E.30009
G3 X128.251 Y126.288 I.604 J1.808 E.02656
; WIPE_START
M204 S6000
G1 X128.591 Y126.375 E-.1334
G1 X128.867 Y126.499 E-.11471
G1 X129.114 Y126.672 E-.11482
G1 X129.328 Y126.886 E-.11482
G1 X129.501 Y127.133 E-.11485
G1 X129.629 Y127.407 E-.11482
G1 X129.665 Y127.541 E-.05257
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.93 Y128 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.93 Y127.836 E.00509
G1 X128.818 Y127.528 E.01018
G1 X128.607 Y127.277 E.01018
G1 X128.323 Y127.113 E.01018
G1 X128 Y127.056 E.01018
G1 X127.677 Y127.113 E.01018
G1 X127.393 Y127.277 E.01018
G1 X127.182 Y127.528 E.01018
G1 X127.07 Y127.836 E.01018
G1 X127.07 Y128.164 E.01018
G1 X127.182 Y128.472 E.01018
G1 X127.393 Y128.723 E.01018
G1 X127.677 Y128.887 E.01018
G1 X128 Y128.944 E.01018
G1 X128.323 Y128.887 E.01018
G1 X128.607 Y128.723 E.01018
G1 X128.818 Y128.472 E.01018
G1 X128.93 Y128.164 E.01018
G1 X128.93 Y128.06 E.00323
M204 S10000
G1 X128.091 Y128.158 F42000
; LINE_WIDTH: 0.40714
G1 F9884.136
M204 S6000
G1 X128.182 Y128.032 E.00465
G1 X128.182 Y128 E.00097
G1 X128.119 Y127.858 E.00465
G1 X127.968 Y127.821 E.00465
G1 X127.84 Y127.908 E.00465
G1 X127.829 Y128.062 E.00465
G1 X127.937 Y128.174 E.00465
G1 X128.031 Y128.164 E.00285
M204 S10000
G1 X127.447 Y128 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.514 Y128.281 E.00895
G1 X127.724 Y128.479 E.00896
G1 X128 Y128.561 E.00895
G1 X128.276 Y128.479 E.00896
G1 X128.486 Y128.281 E.00895
G1 X128.553 Y128 E.00896
G1 X128.486 Y127.719 E.00895
G1 X128.276 Y127.521 E.00896
G1 X128 Y127.439 E.00895
G1 X127.724 Y127.521 E.00895
G1 X127.514 Y127.719 E.00895
G1 X127.461 Y127.942 E.00709
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.514 Y127.719 E-.08685
G1 X127.724 Y127.521 E-.10962
G1 X128 Y127.439 E-.10963
G1 X128.276 Y127.521 E-.10959
G1 X128.486 Y127.719 E-.10965
G1 X128.553 Y128 E-.10957
G1 X128.486 Y128.281 E-.10967
G1 X128.457 Y128.309 E-.01543
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 15/21
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S168.3
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I1.202 J-.193 P1  F42000
G1 X128.208 Y126.76 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.217 Y126.767 E.00039
G3 X127.371 Y126.911 I-.225 J1.235 E.23493
G3 X128.085 Y126.75 I.613 J1.056 E.0249
G1 X128.148 Y126.755 E.00211
M204 S10000
G1 X128.242 Y126.37 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.286 Y126.381 E.0014
G3 X126.939 Y126.735 I-.293 J1.622 E.27676
G3 X128.119 Y126.359 I1.066 J1.306 E.03938
G1 X128.182 Y126.365 E.00195
; WIPE_START
M204 S6000
G1 X128.286 Y126.381 E-.03983
G1 X128.565 Y126.448 E-.1092
G1 X128.826 Y126.57 E-.10935
G1 X129.061 Y126.735 E-.10941
G1 X129.265 Y126.939 E-.10937
G1 X129.43 Y127.174 E-.10938
G1 X129.552 Y127.435 E-.10937
G1 X129.595 Y127.598 E-.06408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.039 Y127.944 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59848
G1 F6479.948
M204 S6000
G2 X128.043 Y128.056 I-.031 J.057 E.01251
M204 S10000
G1 X128.01 Y127.533 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.754 Y127.597 E.00819
G1 X127.58 Y127.766 E.00751
G1 X127.533 Y128.096 E.01035
G1 X127.641 Y128.307 E.00735
G1 X127.836 Y128.45 E.00751
G1 X128.083 Y128.464 E.00768
G1 X128.308 Y128.367 E.00761
G1 X128.444 Y128.16 E.00768
G1 X128.472 Y127.998 E.0051
G1 X128.415 Y127.76 E.00759
G1 X128.201 Y127.571 E.00887
G1 X128.069 Y127.545 E.00419
M204 S10000
G1 X127.962 Y127.159 F42000
G1 F9547.299
M204 S6000
G1 X127.701 Y127.192 E.00815
G1 X127.446 Y127.34 E.00915
G1 X127.252 Y127.571 E.00937
G2 X127.153 Y128.154 I1.266 J.516 E.01851
G1 X127.254 Y128.431 E.00915
G1 X127.446 Y128.66 E.00929
G1 X127.705 Y128.81 E.00929
G1 X128 Y128.862 E.00929
G1 X128.295 Y128.81 E.00929
G1 X128.554 Y128.66 E.00929
G1 X128.747 Y128.431 E.00929
G1 X128.849 Y128.15 E.00929
G1 X128.849 Y127.85 E.00929
G1 X128.746 Y127.569 E.00929
G1 X128.554 Y127.34 E.00929
G1 X128.293 Y127.189 E.00937
G1 X128.022 Y127.164 E.00845
; WIPE_START
G1 X128.293 Y127.189 E-.10347
G1 X128.554 Y127.34 E-.11467
G1 X128.746 Y127.569 E-.11375
G1 X128.849 Y127.85 E-.11376
G1 X128.849 Y128.15 E-.11377
G1 X128.747 Y128.431 E-.11373
G1 X128.6 Y128.606 E-.08684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 15 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer15 end: 390,401
M625
M204 S10000
G1 X37.024 Y238.006 F42000
G1 Z3
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.524 Y239.006  
M204 S6000
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186 F5400
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.139 Y218.611   E0.0569
G1 E-0.8000 F1800
M204 S10000
G1  X38.885 Y220.401   F600
G1 E0.8000 F1800
M204 S6000
G3  X38.499 Y223.687   I-1.399 J1.502 E0.1462 F5400
G2  X37.524 Y226.452   I3.448 J2.771 E0.1136
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #15
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3.4 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E3
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
M73 P81 R8
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z6
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S168.3
G1 X36.87 Y211.75 F42000
G1 Z3
G1 X44.503 Y211.75 Z3.4
G1 X44.749 Y211.75 Z3.4
M73 P83 R7
G1 X44.749 Y219.506

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y219.506
G1 Z3
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y219.506  E0.1140 F1782
M73 P83 R6
G1 E-0.8000 F1800
M204 S10000
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
G1  X17.524  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y221.006  E0.0285
M73 P84 R6
G1  X17.524  E0.7411 F2473
G1  Y221.756  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X37.024  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y227.756  E0.0285
M73 P85 R6
G1  X37.024  E0.7411 F5125
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y229.256  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X17.524  E0.7411
G1  Y233.756  E0.0285
G1  X37.024  E0.7411
G1  Y234.506  E0.0285
G1  X17.524  E0.7411
G1  Y235.256  E0.0285
G1  X37.024  E0.7411
G1  Y236.006  E0.0285
G1  X17.524  E0.7411
G1  Y236.756  E0.0285
G1  X37.024  E0.7411
G1  Y237.506  E0.0285
G1  X17.524  E0.7411
G1  Y238.256  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F9547.299
M204 S6000
G1 X35.024 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.056 Y129.423
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X132.057 Y127.917 I-.002 J-.753 E.07945
G1 X132.183 Y127.928 E.00425
G3 X132.116 Y129.421 I-.129 J.742 E.07288
M204 S10000
G1 X132.046 Y129.819 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X131.858 Y129.798 E.00588
G3 X132.057 Y127.523 I.196 J-1.129 E.10572
G1 X132.25 Y127.54 E.00604
G3 X132.106 Y129.814 I-.196 J1.129 E.10402
; WIPE_START
M204 S6000
G1 X131.858 Y129.798 E-.09434
G1 X131.664 Y129.75 E-.07594
G1 X131.482 Y129.666 E-.07605
G1 X131.323 Y129.554 E-.07389
G1 X131.177 Y129.409 E-.07839
G1 X131.062 Y129.246 E-.07589
G1 X130.977 Y129.064 E-.07604
G1 X130.926 Y128.871 E-.07607
G1 X130.908 Y128.671 E-.07607
G1 X130.921 Y128.521 E-.05731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.366 Y128.818 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X132.394 Y128.606 I-.164 J-.13 E.00697
G1 X132.33 Y128.442 E.00547
G1 X132.115 Y128.32 E.00767
G1 X131.907 Y128.363 E.0066
G1 X131.748 Y128.493 E.00638
G1 X131.705 Y128.733 E.00757
G1 X131.83 Y128.947 E.00767
G1 X132.031 Y129.013 E.00658
G1 X132.234 Y128.981 E.00637
G1 X132.328 Y128.865 E.00462
M204 S10000
G1 X132.075 Y128.638 F42000
; LINE_WIDTH: 0.351
G1 F11685.277
M204 S6000
G1 X132.017 Y128.672 E.00169
G1 X132.057 Y128.694 E.00115
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11685.277
G1 X132.017 Y128.672 E-.30702
G1 X132.075 Y128.638 E-.45298
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 16/21
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S178.5
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.4 I-1.216 J-.038 P1  F42000
G1 X132.057 Y129.226 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X132.056 Y128.115 I0 J-.555 E.05847
G1 X132.153 Y128.123 E.00325
G3 X132.116 Y129.223 I-.097 J.547 E.05321
M204 S10000
G1 X132.057 Y129.619 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X132.057 Y127.721 I-.004 J-.949 E.09274
G1 X132.214 Y127.735 E.00491
G3 X132.116 Y129.617 I-.161 J.935 E.08551
M204 S10000
G1 X132.218 Y128.644 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.37083
G1 F10978.622
M204 S6000
G1 X132.16 Y128.544 E.00311
G1 X132.035 Y128.494 E.00365
G1 X131.899 Y128.594 E.00456
G1 X131.905 Y128.759 E.00445
G1 X132.045 Y128.847 E.00445
G1 X132.199 Y128.779 E.00456
G1 X132.21 Y128.703 E.00206
; WIPE_START
G1 X132.199 Y128.779 E-.05843
G1 X132.045 Y128.847 E-.12912
G1 X131.905 Y128.759 E-.12595
G1 X131.899 Y128.594 E-.12602
G1 X132.035 Y128.494 E-.12915
G1 X132.16 Y128.544 E-.10339
G1 X132.218 Y128.644 E-.08794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 16 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer16 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #16
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z6.2 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E2
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z6.2
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S178.5
G1 X9.798 Y238.256 F42000
M204 S10000
G1 Z3.2

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y238.256 Z3.6
G1 X17.524 Y238.256 Z3.6
G1 Z3.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
M73 P87 R5
G1  X20.524 Y238.256  E0.1140 F1782
M73 P88 R5
G1 E-0.8000 F1800
M204 S10000
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
G1  X37.024  E0.6271 F1782
M73 P88 R4
G1  Y237.506  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X37.024  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X17.524  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y234.506  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X17.524  E0.7411 F5025
M73 P89 R4
G1  Y230.756  E0.0285
G1  X37.024  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X17.524  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X37.024  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X37.024  E0.7411
G1  Y224.006  E0.0285
G1  X17.524  E0.7411
G1  Y223.256  E0.0285
G1  X37.024  E0.7411
G1  Y222.506  E0.0285
G1  X17.524  E0.7411
G1  Y221.756  E0.0285
G1  X37.024  E0.7411
G1  Y221.006  E0.0285
G1  X17.524  E0.7411
G1  Y220.256  E0.0285
G1  X37.024  E0.7411
G1  Y219.506  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X15.425 Y237.357  
M204 S6000
G3  X16.049 Y234.325   I1.667 J-1.237 E0.1327
G2  X17.024 Y231.559   I-3.448 J-2.771 E0.1136
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G3  X18.684 Y217.339   I19.122 J15.700 E0.1711
G3  X21.923 Y218.118   I1.175 J2.236 E0.1382
G2  X24.704 Y219.006   I2.804 J-3.982 E0.1127
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.165 Y239.151   E0.0701
; WIPE_TOWER_END

; WIPE_START
G1 F10978.622
M204 S6000
G1 X18.454 Y240.472 E-.70126
G1 X18.565 Y240.577 E-.05825
G1 X18.566 Y240.578 E-.00049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.199 Y126.858
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.201 Y126.858 E.00009
G3 X128 Y126.84 I-.201 J1.14 E.23696
G1 X128.139 Y126.852 E.00466
M204 S10000
G1 X128.233 Y126.467 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.27 Y126.47 E.00115
G3 X127.73 Y126.47 I-.27 J1.528 E.28586
G1 X128 Y126.447 E.00842
G1 X128.173 Y126.462 E.00538
; WIPE_START
M204 S6000
G1 X128.27 Y126.47 E-.03687
G1 X128.531 Y126.54 E-.10287
G1 X128.777 Y126.655 E-.10291
G1 X128.998 Y126.81 E-.10287
G1 X129.19 Y127.002 E-.10289
G1 X129.345 Y127.223 E-.10291
G1 X129.46 Y127.469 E-.10286
G1 X129.53 Y127.73 E-.1029
G1 X129.53 Y127.738 E-.0029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.707 Y128.257 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X128.576 Y128.484 I-.702 J-.254 E.13748
G1 X128.677 Y128.309 E.00625
M204 S10000
G1 X128.375 Y128 F42000
G1 F9547.299
M204 S6000
G1 X128.33 Y127.809 E.00608
G1 X128.13 Y127.642 E.00809
G1 X127.87 Y127.642 E.00809
G1 X127.67 Y127.809 E.00809
G1 X127.625 Y128.066 E.00809
G1 X127.755 Y128.292 E.00809
G1 X128 Y128.381 E.00809
G1 X128.245 Y128.292 E.00809
G1 X128.375 Y128.06 E.00826
M204 S10000
G1 X128.023 Y127.96 F42000
; LINE_WIDTH: 0.41646
G1 F9637.523
M204 S6000
G1 X127.953 Y128 E.00249
G1 X128.012 Y128.034 E.00208
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9637.523
G1 X127.953 Y128 E-.34591
G1 X128.023 Y127.96 E-.41409
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 17/21
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S168.3
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I1.206 J.161 P1  F42000
G1 X128.153 Y126.994 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X127.823 Y126.996 I-.158 J1.005 E.20316
G3 X128.093 Y126.985 I.171 J.932 E.00909
M204 S10000
G1 X128.225 Y126.612 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.481 Y126.677 E.0082
G3 X127.517 Y126.672 I-.49 J1.323 E.24453
G3 X128.167 Y126.601 I.488 J1.451 E.02045
; WIPE_START
M204 S6000
G1 X128.481 Y126.677 E-.12314
G1 X128.707 Y126.776 E-.09344
G1 X128.908 Y126.917 E-.09365
G1 X129.083 Y127.092 E-.0936
G1 X129.224 Y127.293 E-.09365
M73 P90 R4
G1 X129.328 Y127.517 E-.09358
G1 X129.392 Y127.755 E-.09363
G1 X129.409 Y127.952 E-.07532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.423 Y127.79 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G2 X128.47 Y127.604 I.577 J.21 E.07992
G1 X128.215 Y127.414 E.00987
G1 X128 Y127.376 E.00679
G1 X127.693 Y127.468 E.00993
G2 X127.453 Y127.738 I.25 J.465 E.01146
M204 S10000
G1 X128.036 Y127.79 F42000
; LINE_WIDTH: 0.46874
G1 F8454.277
M204 S6000
G1 X127.893 Y127.816 E.00508
G1 X127.8 Y127.927 E.0051
G1 X127.8 Y128.073 E.00511
G1 X127.894 Y128.185 E.00511
G1 X128.037 Y128.21 E.0051
G1 X128.163 Y128.137 E.00511
G1 X128.213 Y128 E.00511
G1 X128.163 Y127.862 E.00514
G1 X128.088 Y127.82 E.003
; WIPE_START
G1 X128.163 Y127.862 E-.0519
G1 X128.213 Y128 E-.08901
G1 X128.163 Y128.137 E-.08857
G1 X128.037 Y128.21 E-.08846
G1 X127.894 Y128.185 E-.08844
G1 X127.8 Y128.073 E-.08859
G1 X127.8 Y127.927 E-.08847
G1 X127.893 Y127.816 E-.08844
G1 X128.036 Y127.79 E-.0881
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 17 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer17 end: 390,401
M625
M204 S10000
G1 X17.524 Y238.006 F42000
G1 Z3.4
G1 E.8 F1800
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X17.024 Y239.006  
M204 S6000
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148 F5400
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.663 Y220.401   I1.763 J-0.728 E0.0904
G1 E-0.8000 F1800
M204 S10000
G1  X17.409 Y218.611   F600
G1 E0.8000 F1800
M204 S6000
G3  X20.133 Y216.972   I2.971 J1.853 E0.1254 F5400
G3  X22.558 Y218.499   I-3.985 J9.017 E0.1093
G2  X24.704 Y219.006   I2.178 J-4.424 E0.0845
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G1 E0.0000
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.020 Y237.473   I-1.716 J0.731 E0.0832
G1  X37.524 Y239.006   E0.0814
G3  X35.176 Y241.001   I-4.711 J-3.166 E0.1186
G3  X32.472 Y239.790   I-0.174 J-3.236 E0.1170
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
; WIPE_TOWER_END
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #17
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3.8 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S1A
M204 S9000
G1 Z6.4 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T1
M73 E1
M620.1 E F299.339 T220
M620.10 A1 F299.339 L133.14 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339
G1 E0.857403 F50
G1 E9.86014 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
G1 E11.9826 F299.339
G1 E1.3314 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z6.4
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S168.3
G1 X9.798 Y219.506 F42000
G1 Z3.4

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X17.431 Y219.506 Z3.8
G1 X17.524 Y219.506 Z3.8
G1 Z3.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X20.524 Y219.506  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
M73 P92 R3
G1  X16.024  F600
G1  X20.524  F240
G1 E0.8000 F1800
M204 S6000
G1  X37.024  E0.6271 F1782
G1  Y220.256  E0.0285
G1  X17.524  E0.7411 F2025
G1  Y221.006  E0.0285
G1  X37.024  E0.7411 F2473
M73 P93 R2
G1  Y221.756  E0.0285
G1  X17.524  E0.7411 F4725
G1  Y222.506  E0.0285
G1  X37.024  E0.7411 F4775
G1  Y223.256  E0.0285
G1  X17.524  E0.7411 F4825
G1  Y224.006  E0.0285
G1  X37.024  E0.7411 F4875
G1  Y224.756  E0.0285
G1  X17.524  E0.7411 F4925
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F4975
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5025
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5075
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5125
G1  Y228.506  E0.0285
M73 P94 R2
G1  X37.024  E0.7411 F5175
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5225
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5275
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5325
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5375
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F5400
G1  Y233.006  E0.0285
G1  X37.024  E0.7411
G1  Y233.756  E0.0285
G1  X17.524  E0.7411
G1  Y234.506  E0.0285
G1  X37.024  E0.7411
G1  Y235.256  E0.0285
G1  X17.524  E0.7411
G1  Y236.006  E0.0285
G1  X37.024  E0.7411
G1  Y236.756  E0.0285
G1  X17.524  E0.7411
G1  Y237.506  E0.0285
G1  X37.024  E0.7411
G1  Y238.256  E0.0285
G1  X17.524  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F8454.277
M204 S6000
G1 X19.524 Y238.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G1 X132.056 Y128.948
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X132.008 Y128.947 E.00163
G3 X132.057 Y128.39 I.048 J-.276 E.02791
G1 X132.105 Y128.395 E.00162
G3 X132.116 Y128.945 I-.048 J.276 E.02588
M204 S10000
G1 X132.056 Y129.343 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X132.057 Y127.997 I0 J-.673 E.06567
G1 X132.173 Y128.007 E.00363
G3 X132.116 Y129.341 I-.117 J.663 E.06016
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.826 Y129.305 E-.1112
G1 X131.623 Y129.188 E-.08903
G1 X131.54 Y129.105 E-.04468
G1 X131.423 Y128.902 E-.08905
G1 X131.382 Y128.671 E-.08905
G1 X131.423 Y128.441 E-.089
G1 X131.472 Y128.334 E-.04466
G1 X131.623 Y128.155 E-.08905
G1 X131.826 Y128.037 E-.08905
G1 X131.891 Y128.026 E-.02523
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 401
M625
; layer num/total_layer_count: 18/21
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S178.5
; OBJECT_ID: 401
; start printing object, unique label id: 401
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z3.8 I-1.192 J.246 P1  F42000
G1 X132.056 Y128.828 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
; LAYER_HEIGHT: 0.2
G1 F10727.314
M204 S5000
G3 X132.057 Y128.514 I-.005 J-.157 E.01393
G1 X132.073 Y128.515 E.00045
G3 X132.116 Y128.814 I-.022 J.156 E.01118
; WIPE_START
M204 S6000
G1 X131.978 Y128.808 E-.10826
G1 X131.934 Y128.77 E-.04522
G1 X131.899 Y128.671 E-.08202
G1 X131.92 Y128.593 E-.06386
G1 X131.955 Y128.551 E-.04285
G1 X132.057 Y128.514 E-.08441
G1 X132.073 Y128.515 E-.01279
G1 X132.177 Y128.57 E-.09237
G1 X132.214 Y128.671 E-.08442
G1 X132.193 Y128.75 E-.06386
G1 X132.158 Y128.792 E-.04288
G1 X132.116 Y128.814 E-.03706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 401
M625
; object ids of layer 18 start: 390,401
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer18 end: 390,401
M625
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
;--------------------
; CP TOOLCHANGE START
; toolchange #18
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1 20250822 =======================
M1007 S0 ; turn off mass estimation
G392 S0
M620 S0A
M204 S9000
G1 Z6.6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X267 F18000


M620.11 S0

M400

M620.1 E F299.339 T220
M620.10 A0 F299.339
T0
M73 E0
M620.1 E F299.339 T220
M620.10 A1 F299.339 L93.2282 H0.4 T220

G1 Y128 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M106 P1 S60

G1 E23.7 F299.339 ; do not need pulsatile flushing for start part
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339
G1 E0.458282 F50
G1 E5.27024 F299.339

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
G1 E8.39053 F299.339
G1 E0.932282 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S220
G1 E6 F299.339 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
G1 X-38.2 F18000
G1 X-48.2 F3000
M400
G1 Z6.6
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F5 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S4
  G1 X-38.2 F18000
  G1 X-48.2 F3000
  G1 X-38.2 F18000 ;wipe and shake
  G1 X-48.2 F3000
  G1 X-38.2 F12000 ;wipe and shake
  G1 X-48.2 F3000
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S178.5
G1 X22.403 Y211.75 F42000
M204 S10000
G1 Z3.6
G1 X30.036 Y211.75 Z4
G1 X44.749 Y211.75 Z4
G1 X44.749 Y238.256

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 X37.024 Y238.256
G1 Z3.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X34.024 Y238.256  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
M73 P97 R1
G1  X38.524  F600
G1  X34.024  F240
G1 E0.8000 F1800
M204 S6000
G1  X17.524  E0.6271 F1782
G1  Y237.506  E0.0285
G1  X37.024  E0.7411 F2025
G1  Y236.756  E0.0285
G1  X17.524  E0.7411 F2473
G1  Y236.006  E0.0285
G1  X37.024  E0.7411 F4725
G1  Y235.256  E0.0285
G1  X17.524  E0.7411 F4775
G1  Y234.506  E0.0285
M73 P97 R0
G1  X37.024  E0.7411 F4825
G1  Y233.756  E0.0285
G1  X17.524  E0.7411 F4875
G1  Y233.006  E0.0285
G1  X37.024  E0.7411 F4925
G1  Y232.256  E0.0285
G1  X17.524  E0.7411 F4975
G1  Y231.506  E0.0285
G1  X37.024  E0.7411 F5025
M73 P98 R0
G1  Y230.756  E0.0285
G1  X17.524  E0.7411 F5075
G1  Y230.006  E0.0285
G1  X37.024  E0.7411 F5125
G1  Y229.256  E0.0285
G1  X17.524  E0.7411 F5175
G1  Y228.506  E0.0285
G1  X37.024  E0.7411 F5225
G1  Y227.756  E0.0285
G1  X17.524  E0.7411 F5275
G1  Y227.006  E0.0285
G1  X37.024  E0.7411 F5325
G1  Y226.256  E0.0285
G1  X17.524  E0.7411 F5375
G1  Y225.506  E0.0285
G1  X37.024  E0.7411 F5400
G1  Y224.756  E0.0285
G1  X17.524  E0.7411
G1  Y224.006  E0.0285
G1  X37.024  E0.7411
G1  Y223.256  E0.0285
G1  X17.524  E0.7411
G1  Y222.506  E0.0285
G1  X37.024  E0.7411
G1  Y221.756  E0.0285
G1  X17.524  E0.7411
G1  Y221.006  E0.0285
G1  X37.024  E0.7411
G1  Y220.256  E0.0285
G1  X17.524  E0.7411
G1  Y219.506  E0.0285
G1  X37.024  E0.7411
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y238.006   F5400,000000
; LAYER_HEIGHT: 0,200000
; FEATURE: Prime tower
; LINE_WIDTH: 0,500000
; WIPE_TOWER_START
M204 S10000
G1  X37.383 Y239.151  
M204 S6000
G3  X34.874 Y241.053   I-3.832 J-2.449 E0.1222
G3  X32.472 Y239.790   I0.308 J-3.502 E0.1059
G2  X29.845 Y239.006   I-2.634 J4.034 E0.1057
G2  X23.966 Y239.063   I-2.570 J37.958 E0.2237
G2  X20.576 Y240.921   I2.376 J8.355 E0.1481
G3  X18.454 Y240.472   I-0.723 J-1.822 E0.0874
G1  X17.024 Y239.006   E0.0778
G3  X15.084 Y236.728   I3.775 J-5.179 E0.1148
G3  X16.258 Y234.043   I2.976 J-0.298 E0.1164
G2  X17.024 Y231.559   I-3.662 J-2.489 E0.1002
G2  X16.968 Y225.752   I-36.349 J-2.553 E0.2210
G2  X15.151 Y222.569   I-7.554 J2.203 E0.1406
G3  X15.528 Y220.539   I1.716 J-0.731 E0.0832
G1  X18.454 Y217.540   E0.1592
G3  X21.774 Y218.007   I1.469 J1.596 E0.1457
G2  X24.704 Y219.006   I2.936 J-3.814 E0.1198
G2  X30.582 Y218.949   I2.570 J-37.971 E0.2236
G2  X33.972 Y217.091   I-2.376 J-8.355 E0.1481
G3  X36.094 Y217.540   I0.723 J1.822 E0.0874
G1  X37.524 Y219.006   E0.0778
G3  X39.464 Y221.284   I-3.775 J5.179 E0.1148
G3  X38.290 Y223.969   I-2.976 J0.298 E0.1164
G2  X37.524 Y226.452   I3.662 J2.489 E0.1002
G2  X37.580 Y232.260   I36.336 J2.554 E0.2210
G2  X39.397 Y235.443   I7.554 J-2.203 E0.1406
G3  X39.123 Y237.357   I-1.746 J0.726 E0.0771
; WIPE_TOWER_END

; WIPE_START
G1 F10727.314
M204 S6000
G1 X39.206 Y237.249 E-.05158
G1 X39.285 Y237.127 E-.05544
G1 X39.355 Y236.999 E-.05545
G1 X39.415 Y236.865 E-.05544
G1 X39.463 Y236.728 E-.05545
G1 X39.501 Y236.587 E-.05545
G1 X39.528 Y236.444 E-.05545
G1 X39.543 Y236.298 E-.05544
G1 X39.547 Y236.153 E-.05545
G1 X39.54 Y236.007 E-.05545
G1 X39.521 Y235.862 E-.05545
G1 X39.491 Y235.719 E-.05544
G1 X39.449 Y235.58 E-.05545
G1 X39.409 Y235.474 E-.04306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G1 X128.112 Y127.174
G1 Z3.6
M73 P99 R0
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X128.286 Y127.214 E.00599
G3 X127.712 Y127.209 I-.294 J.786 E.15705
G3 X128.053 Y127.163 I.289 J.856 E.0116
M204 S10000
G1 X128.204 Y126.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.214 Y126.789 E.00035
G3 X127.382 Y126.93 I-.221 J1.213 E.21368
G3 X128.097 Y126.773 I.602 J1.037 E.02307
G1 X128.144 Y126.777 E.00148
; WIPE_START
M204 S6000
G1 X128.214 Y126.789 E-.02669
G1 X128.422 Y126.839 E-.08167
G1 X128.618 Y126.93 E-.08183
G1 X128.794 Y127.054 E-.08182
G1 X128.946 Y127.206 E-.08183
G1 X129.07 Y127.382 E-.08179
G1 X129.161 Y127.578 E-.08184
G1 X129.216 Y127.785 E-.08181
G1 X129.235 Y128 E-.08182
G1 X129.217 Y128.207 E-.07889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.001 Y128.439 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X128.223 Y128.386 E.00709
G1 X128.381 Y128.218 E.00716
G1 X128.433 Y128.074 E.00475
G1 X128.419 Y127.848 E.00705
G1 X128.29 Y127.67 E.00683
G1 X128.022 Y127.558 E.00901
G1 X127.777 Y127.614 E.00779
G1 X127.619 Y127.782 E.00716
G1 X127.554 Y128 E.00707
G1 X127.62 Y128.22 E.00713
G1 X127.777 Y128.386 E.00709
G1 X127.942 Y128.425 E.00527
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.777 Y128.386 E-.06457
G1 X127.62 Y128.22 E-.08681
G1 X127.554 Y128 E-.08735
G1 X127.619 Y127.782 E-.0865
G1 X127.777 Y127.614 E-.08771
G1 X128.022 Y127.558 E-.0954
G1 X128.29 Y127.67 E-.11031
G1 X128.419 Y127.848 E-.08358
G1 X128.428 Y127.999 E-.05777
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 390
M625
; layer num/total_layer_count: 19/21
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S204
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4 I1.051 J-.614 P1  F42000
G1 X128.08 Y127.403 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S6000
G1 X128.208 Y127.429 E.00435
G3 X127.894 Y127.399 I-.213 J.566 E.11672
G3 X128.012 Y127.391 I.082 J.325 E.00397
G1 X128.021 Y127.393 E.00033
M204 S10000
G1 X128.174 Y127.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X127.657 Y127.057 I-.181 J.984 E.17891
G3 X128.046 Y127 I.353 J1.063 E.01227
G3 X128.114 Y127.006 I-.053 J.999 E.00213
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.343 Y127.057 E-.08912
G1 X128.502 Y127.131 E-.06647
G1 X128.645 Y127.231 E-.0665
G1 X128.769 Y127.355 E-.06648
G1 X128.869 Y127.498 E-.06645
G1 X128.943 Y127.657 E-.0665
G1 X128.988 Y127.826 E-.06648
G1 X129.004 Y128 E-.06645
G1 X128.988 Y128.174 E-.0665
G1 X128.943 Y128.343 E-.06647
G1 X128.869 Y128.502 E-.06647
G1 X128.86 Y128.515 E-.0061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.799 Y128.001 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42159
G1 F1200
M204 S6000
G1 X127.887 Y128.168 E.00587
G1 X128.087 Y128.19 E.00629
G1 X128.2 Y128.066 E.00522
G1 X128.148 Y127.853 E.00681
G1 X128.001 Y127.791 E.00499
G1 X127.852 Y127.856 E.00508
G1 X127.819 Y127.945 E.00294
; WIPE_START
G1 F9506.96
G1 X127.852 Y127.856 E-.06014
G1 X128.001 Y127.791 E-.10371
G1 X128.148 Y127.853 E-.10194
G1 X128.2 Y128.066 E-.13914
G1 X128.087 Y128.19 E-.10662
G1 X127.887 Y128.168 E-.12846
G1 X127.799 Y128.001 E-.11998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 19 start: 390
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer19 end: 390
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 20/21
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 390
; start printing object, unique label id: 390
M624 AQAAAAAAAAA=
G1 X128.064 Y127.339 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S5000
G1 X128.227 Y127.376 E.0052
G3 X127.884 Y127.341 I-.237 J.624 E.11932
G3 X128.004 Y127.331 I.096 J.43 E.00377
M204 S10000
G1 X128.43 Y127.836 F42000
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X127.836 Y128.43 E.02606
G1 X127.57 Y128.163
G1 X128.163 Y127.57 E.02606
M204 S10000
G1 X128.448 Y128.109 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10843
G1 F1200
M204 S6000
G3 X128.377 Y128.218 I-.657 J-.349 E.0007
; LINE_WIDTH: 0.133454
G3 X128.154 Y128.422 I-.88 J-.738 E.00226
; LINE_WIDTH: 0.0957026
G1 X128.109 Y128.448 E.00022
M204 S10000
G1 X128.407 Y127.784 F42000
; LINE_WIDTH: 0.0964007
G1 F1200
M204 S6000
G2 X128.216 Y127.593 I-.861 J.671 E.00119
M204 S10000
G1 X127.891 Y127.552 F42000
; LINE_WIDTH: 0.108368
G1 F1200
M204 S6000
G2 X127.782 Y127.623 I.349 J.656 E.0007
; LINE_WIDTH: 0.133364
G2 X127.578 Y127.846 I.738 J.88 E.00226
; LINE_WIDTH: 0.0956652
G1 X127.552 Y127.891 E.00022
; WIPE_START
G1 F15000
G1 X127.578 Y127.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 390
M625
; object ids of layer 20 start: 390
M624 AQAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer20 end: 390
M625
; close powerlost recovery
M1003 S0
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z4.5 F900 ; lower z a little
G1 X0 Y128.319 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z104 F600
    G1 Z102

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

