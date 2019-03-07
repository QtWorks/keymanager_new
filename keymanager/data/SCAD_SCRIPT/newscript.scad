include <newdata.txt>

/////////////////WRITE
//Write
        pi=3.1415926535897932384626433832795028841971693993751058209;
        pi2=pi*2;




//default settings
        center=false;
        h = 4;			 //mm letter height
        t = 1; 			//mm letter thickness
        space =1; 			//extra space between characters in (character widths)
        rotate=0;			// text rotation (clockwise)
        font = "Letters.dxf";	//default for aditional fonts



module write(word){

rotate(rotate,[0,0,-1]){
        for (r = [0:len(word)]){   // count off each character
                // if the letter is lower case, add an underscore to the end for file lookup
                if ((word[r] == "a" ) || (word[r]== "b")  || (word[r]== "c")
                  || (word[r]== "d") || (word[r]== "e") || (word[r]== "f")
                  || (word[r]== "g") || (word[r]== "h")  || (word[r]== "i")
                  || (word[r]== "j") || (word[r]== "k") || (word[r]== "l")
                  || (word[r]== "m") || (word[r]== "n") || (word[r]== "o")
                  || (word[r]== "p") || (word[r]== "q") || (word[r]== "r")
                  || (word[r]== "s") || (word[r]== "t") || (word[r]== "u")
                  || (word[r]== "v") || (word[r]== "w") || (word[r]== "x")
                  || (word[r]== "y" )|| (word[r]== "z")){
                        if (center == true)  {
                                translate([0,-h/2,0]){
                                        scale([.125*h,.125*h,t]){
                                                translate([ (-len(word)*5.5*space/2) + (r*5.5*space),0,0])
                                                linear_extrude(height=1,convexity=10,center=true){
                                                        import(file = font,layer=str(word[r],"_"));
                                                }
                                        }
                                }
                        }else{
                                translate([0,0,t/2]){
                                        scale([.125*h,.125*h,t]){
                                                translate([r*5.5*space,0,0])
                                                linear_extrude(height=1,convexity=10,center=true){
                                                        import(file = font,layer=str(word[r],"_"));
                                                }
                                        }
                                }
                        }

                }else{
                        if (center == true)  {
                                translate([0,-h/2,0]){
                                        scale([.125*h,.125*h,t]){
                                                translate([ (-len(word)*5.5*space/2) + (r*5.5*space),0,0])
                                                linear_extrude(height=1,convexity=10,center=true){
                                                        import(file = font,layer=str(word[r]));
                                                }
                                        }
                                }
                        }else{
                                translate([0,0,t/2]){
                                        scale([.125*h,.125*h,t]){
                                                translate([r*5.5*space,0,0])
                                                linear_extrude(height=1,convexity=10,center=true){
                                                        import(file = font,layer=str(word[r]));
                                                }
                                        }
                                }
                        }
                }
        }
}
}
////////////////////////////WRITE END

//SETTINGS
$fn=qt_fn_qt;
epsilon = qt_epsilon_qt ;
tolerance = qt_tolerance_qt ;
show_chosen_cuts_level2 = qt_show_chosen_cuts_level2_qt ;
show_chosen_cuts_level4 = qt_show_chosen_cuts_level4_qt ;


// PLAN :
// LEVEL 1 IS BLANKS + ADDITIONS LEVEL 1 (non moving ball bearing, profile wing...)
// LEVEL 2 IS KEY CUTS + CUTS LEVEL 2
// LEVEL 3 IS ADDITIONS OF LEVEL 3 (including key head and shoulder)
// LEVEL 4 IS CUTS OF LEVEL 4 CUTTING THROUGH EVERYTHING


/////////////////////////////
//WHAT TO USE (LEVEL 1 2 3 4)
//WHAT TO USE LEVEL 1 BLANK + EXTRA MATERIAL
//BLANK
type_of_key = qt_type_of_key_qt ;//can be regular, dimple, round_pump, round_stl, lever_simple, lever_double, abloy_classic, abloy_disklock, abloy_protec, abus_plus, fichet_787, expert_stl

//WHAT EXTRA MATERIAL TO USE LEVEL 1
    extra_material_level1_shape01_use =          qt_extra_material_level1_shape01_use_qt;
    extra_material_level1_shape02_use =          qt_extra_material_level1_shape02_use_qt;
    extra_material_level1_shape03_use =          qt_extra_material_level1_shape03_use_qt;
    extra_material_level1_shape04_use =          qt_extra_material_level1_shape04_use_qt;
    extra_material_level1_shape05_use =          qt_extra_material_level1_shape05_use_qt;
    extra_material_level1_shape06_use =          qt_extra_material_level1_shape06_use_qt;
    extra_material_level1_shape07_use =          qt_extra_material_level1_shape07_use_qt;
    extra_material_level1_shape08_use =          qt_extra_material_level1_shape08_use_qt;
    extra_material_level1_shape09_use =          qt_extra_material_level1_shape09_use_qt;
    extra_material_level1_shape10_use =          qt_extra_material_level1_shape10_use_qt;

//WHAT TO USE LEVEL 2 KEY CUTS + EXTRA CUTTINGS

regular_row1_cut_use =                        qt_regular_row1_cut_use_qt;
regular_row2_cut_use =                        qt_regular_row2_cut_use_qt;
regular_row3_cut_use =                        qt_regular_row3_cut_use_qt;
regular_row4_cut_use =                        qt_regular_row4_cut_use_qt;
regular_row5_cut_use =                        qt_regular_row5_cut_use_qt;
regular_row6_cut_use =                        qt_regular_row6_cut_use_qt;
regular_sonic_cut_use =                       qt_regular_sonic_cut_use_qt;

dimple_row1_cut_use =                         qt_dimple_row1_cut_use_qt;
dimple_row2_cut_use =                         qt_dimple_row2_cut_use_qt;
dimple_row3_cut_use =                         qt_dimple_row3_cut_use_qt;
dimple_row4_cut_use =                         qt_dimple_row4_cut_use_qt;
dimple_row5_cut_use =                         qt_dimple_row5_cut_use_qt;
dimple_row6_cut_use =                         qt_dimple_row6_cut_use_qt;
dimple_sonic_cut_use =                        qt_dimple_sonic_cut_use_qt;

round_pump_cut_use =                          qt_round_pump_cut_use_qt;
lever_simple_lock_cut_use =                          qt_lever_simple_lock_cut_use_qt;
lever_double_lock_cut_use =                          qt_lever_double_lock_cut_use_qt;
    lever_double_lock_row1_cut_use =                     qt_lever_double_lock_row1_cut_use_qt;
    lever_double_lock_row2_cut_use =                     qt_lever_double_lock_row2_cut_use_qt;
abloy_classic_cut_use =                       qt_abloy_classic_cut_use_qt;
abloy_disklock_cut_use =                      qt_abloy_disklock_cut_use_qt;
abloy_protec_cut_use =                        qt_abloy_protec_cut_use_qt;
abus_plus_cut =                               qt_abus_plus_cut_qt;
abus_x_plus_cut =                             qt_abus_x_plus_cut_qt;
universal_disk_use =                          qt_universal_disk_use_qt;
fichet_787_cut_use =                          qt_fichet_787_cut_use_qt;
diamant_cut_use =                             qt_diamant_cut_use_qt;
verso_cut_use =                               qt_verso_cut_use_qt;
lagard_2200_2270_cut_use =                    qt_lagard_2200_2270_cut_use_qt;
m2b_cut_use =                                 qt_m2b_cut_use_qt;
m3b_cut_use =                                 qt_m3b_cut_use_qt;
mxb_cut_use =                                 qt_mxb_cut_use_qt;
monopole_cut_use =                            qt_monopole_cut_use_qt;


    extra_cut_level2_shape01_use =                qt_extra_cut_level2_shape01_use_qt;
    extra_cut_level2_shape02_use =                qt_extra_cut_level2_shape02_use_qt;
    extra_cut_level2_shape03_use =                qt_extra_cut_level2_shape03_use_qt;
    extra_cut_level2_shape04_use =                qt_extra_cut_level2_shape04_use_qt;
    extra_cut_level2_shape05_use =                qt_extra_cut_level2_shape05_use_qt;
    extra_cut_level2_shape06_use =                qt_extra_cut_level2_shape06_use_qt;
    extra_cut_level2_shape07_use =                qt_extra_cut_level2_shape07_use_qt;
    extra_cut_level2_shape08_use =                qt_extra_cut_level2_shape08_use_qt;
    extra_cut_level2_shape09_use =                qt_extra_cut_level2_shape09_use_qt;
    extra_cut_level2_shape10_use =                qt_extra_cut_level2_shape10_use_qt;




//WHAT TO USE LEVEL 3 EXTRA ADDITIONS (KEY HEAD, UL INSERT)
//Key Head and Shoulder
automatic_key_head_and_shoulder = qt_automatic_key_head_and_shoulder_qt;
key_head_text_line1             = qt_key_head_text_line1_qt;
key_head_text_line2             = qt_key_head_text_line2_qt;
key_head_text_line3             = qt_key_head_text_line3_qt;
key_head_text_line4             = qt_key_head_text_line4_qt;


//EXTRA MATERIAL LEVEL 3
    extra_material_level3_shape01_use =          qt_extra_material_level3_shape01_use_qt;
    extra_material_level3_shape02_use =          qt_extra_material_level3_shape02_use_qt;
    extra_material_level3_shape03_use =          qt_extra_material_level3_shape03_use_qt;
    extra_material_level3_shape04_use =          qt_extra_material_level3_shape04_use_qt;
    extra_material_level3_shape05_use =          qt_extra_material_level3_shape05_use_qt;
    extra_material_level3_shape06_use =          qt_extra_material_level3_shape06_use_qt;
    extra_material_level3_shape07_use =          qt_extra_material_level3_shape07_use_qt;
    extra_material_level3_shape08_use =          qt_extra_material_level3_shape08_use_qt;
    extra_material_level3_shape09_use =          qt_extra_material_level3_shape09_use_qt;
    extra_material_level3_shape10_use =          qt_extra_material_level3_shape10_use_qt;

regular_sonic_insert_use =                   qt_regular_sonic_insert_use_qt;
dimple_sonic_insert_use =                    qt_dimple_sonic_insert_use_qt;


//WHAT TO USE LEVEL 4 EXTRA CUTS THROUGH EVERYTHING
    extra_cut_level4_shape01_use =                qt_extra_cut_level4_shape01_use_qt;
    extra_cut_level4_shape02_use =                qt_extra_cut_level4_shape02_use_qt;
    extra_cut_level4_shape03_use =                qt_extra_cut_level4_shape03_use_qt;
    extra_cut_level4_shape04_use =                qt_extra_cut_level4_shape04_use_qt;
    extra_cut_level4_shape05_use =                qt_extra_cut_level4_shape05_use_qt;
    extra_cut_level4_shape06_use =                qt_extra_cut_level4_shape06_use_qt;
    extra_cut_level4_shape07_use =                qt_extra_cut_level4_shape07_use_qt;
    extra_cut_level4_shape08_use =                qt_extra_cut_level4_shape08_use_qt;
    extra_cut_level4_shape09_use =                qt_extra_cut_level4_shape09_use_qt;
    extra_cut_level4_shape10_use =                qt_extra_cut_level4_shape10_use_qt;


//END OF ALL WHAT TO USE




///////////////////
//VARIABLES FROM QT
//LEVEL 1 VARIABLES BLANKS + EXTRA MATERIALS

//VARIABLES OF BLANKS
//VARIABLES OF REGULAR BLANK (Level 1)
regular_length = qt_regular_length_qt;
regular_height = qt_regular_height_qt;
regular_thickness = qt_regular_thickness_qt;
regular_auto_tip = qt_regular_auto_tip_qt;
regular_dxf_name = qt_regular_dxf_name_qt;
regular_stl_name = qt_regular_stl_name_qt;


//VARIABLES OF DIMPLE AND LASER BLANK (LEVEL 1)
dimple_make_reversible  = qt_dimple_make_reversible_qt; //YES NO
dimple_length = qt_dimple_length_qt;
dimple_width = qt_dimple_width_qt;
dimple_thickness = qt_dimple_thickness_qt;
dimple_dxf_name = qt_dimple_dxf_name_qt;
dimple_stl_name = qt_dimple_stl_name_qt;

//PARAMETERS OF ROUND PUMP BLANK
round_pump_length = qt_round_pump_length_qt;
round_pump_diameter = qt_round_pump_diameter_qt;
round_pump_tip_hole_diameter = qt_round_pump_tip_hole_diameter_qt;
round_pump_tip_hole_depth = qt_round_pump_tip_hole_depth_qt;
round_pump_outward_tensioner_length = qt_round_pump_outward_tensioner_length_qt;
round_pump_outward_tensioner_height = qt_round_pump_outward_tensioner_height_qt;
round_pump_outward_tensioner_thickness = qt_round_pump_outward_tensioner_thickness_qt;
round_pump_inward_tensioner_length = qt_round_pump_inward_tensioner_length_qt;
round_pump_inward_tensioner_height = qt_round_pump_inward_tensioner_height_qt;
round_pump_inward_tensioner_thickness = qt_round_pump_inward_tensioner_thickness_qt;

//PARAMETERS OF LEVER LOCK SIMPLE BLANK
lever_simple_body_length = qt_lever_simple_body_length_qt;
lever_simple_body_diameter = qt_lever_simple_body_diameter_qt;
lever_simple_blade_length = qt_lever_simple_blade_length_qt;
lever_simple_blade_height = qt_lever_simple_blade_height_qt; //from the middle
lever_simple_blade_thickness = qt_lever_simple_blade_thickness_qt;
lever_simple_tip_length = qt_lever_simple_tip_length_qt;
lever_simple_tip_hole_diameter = qt_lever_simple_tip_hole_diameter_qt;
lever_simple_tip_hole_depth = qt_lever_simple_tip_hole_depth_qt;

//PARAMETERS OF LEVER LOCK DOUBLE BLANK
lever_double_body_length = qt_lever_double_body_length_qt;
lever_double_body_diameter = qt_lever_double_body_diameter_qt;
lever_double_blade_length = qt_lever_double_blade_length_qt;
lever_double_blade_height = qt_lever_double_blade_height_qt; //from the middle
lever_double_blade_offset = qt_lever_double_blade_offset_qt;
lever_double_blade_thickness = qt_lever_double_blade_thickness_qt;
lever_double_tip_length = qt_lever_double_tip_length_qt;
lever_double_tip_hole_diameter = qt_lever_double_tip_hole_diameter_qt;
lever_double_tip_hole_depth = qt_lever_double_tip_hole_depth_qt;

//PARAMETERS OF ABLOY CLASSIC
abloy_classic_length =    qt_abloy_classic_length_qt;
abloy_classic_height =    qt_abloy_classic_height_qt;
abloy_classic_thickness = qt_abloy_classic_thickness_qt;
abloy_classic_dxf_name =  qt_abloy_classic_dxf_name_qt;
abloy_classic_stl_name =  qt_abloy_classic_stl_name_qt;


//PARAMETERS OF ABLOY DISKLOCK
abloy_disklock_length =   qt_abloy_disklock_length_qt; //DEFAULT 34


//PARAMETERS OF ABLOY PROTEC
abloy_protec_length =     qt_abloy_protec_length_qt;


//PARAMETERS OF ABUS PLUS
abus_plus_length =        qt_abus_plus_length_qt;

//PARAMETERS OF ABUS X PLUS
abus_x_plus_length =        qt_abus_x_plus_length_qt;

//PARAMETERS OF UNIVERSAL DISK TUMBLER KEY BLANK
universal_disk_key_width = qt_universal_disk_key_width_qt;
universal_disk_key_height = qt_universal_disk_key_height_qt;
universal_disk_blank_length = qt_universal_disk_blank_length_qt;
universal_disk_dxf_name = qt_universal_disk_dxf_name_qt;


//PARAMETERS OF VERSO
verso_length =        qt_verso_length_qt;


//PARAMETERS OF LAGARD 2200 2270
lagard_2200_2270_length =        qt_lagard_2200_2270_length_qt;

//PARAMETERS OF M2B
m2b_length =        qt_m2b_length_qt;

//PARAMETERS OF M3B
m3b_length =        qt_m3b_length_qt;

//PARAMETERS OF MXB
mxb_length =        qt_mxb_length_qt;

//PARAMETERS OF MONOPOLE
monopole_length =        qt_monopole_length_qt;


//PARAMETERS OF FICHET 787
fichet_787_height =             10 ; // CONSTANT DEFAULT 10
fichet_787_thickness =          5 ; // CONSTANT DEFAULT 5
fichet_787_profile_depth =      5.8 ;
fichet_787_profile_angle =      8 ;
fichet_787_profile_thickness =  1 ;
fichet_787_dist_from_tip =      5 ; //round cut from tip of the key
fichet_787_mill_thickness =     1.01 ; // in mm, thickness of the cutting wheel
fichet_787_dist_cut =           1 ; //distance between 2 cuts
fichet_787_dist_top =           9.5; //height of the top disc
fichet_787_dist_cut_1 = fichet_787_dist_top ;
fichet_787_dist_cut_2 = fichet_787_dist_cut_1 - fichet_787_dist_cut ;
fichet_787_dist_cut_3 = fichet_787_dist_cut_2 - fichet_787_dist_cut ;
fichet_787_dist_cut_4 = fichet_787_dist_cut_3 - fichet_787_dist_cut ;
fichet_787_dist_cut_5 = fichet_787_dist_cut_4 - fichet_787_dist_cut ;
fichet_787_dist_cut_6 = fichet_787_dist_cut_5 - fichet_787_dist_cut ;
fichet_787_dist_cut_7 = fichet_787_dist_cut_6 - fichet_787_dist_cut ;
fichet_787_dist_cut_8 = fichet_787_dist_cut_7 - fichet_787_dist_cut ;
fichet_787_dist_cut_9 = fichet_787_dist_cut_8 - fichet_787_dist_cut ;
fichet_787_dist_cut_10 = fichet_787_dist_cut_9 - fichet_787_dist_cut ;

//PARAMETERS OF EXPERT STL
expert_stl_name =           qt_expert_stl_name_qt;
expert_stl_set_dimensions = qt_expert_stl_set_dimensions_qt;
expert_stl_dx =             qt_expert_stl_dx_qt;
expert_stl_dy =             qt_expert_stl_dy_qt;
expert_stl_dz =             qt_expert_stl_dz_qt;
expert_stl_rx =             qt_expert_stl_rx_qt;
expert_stl_ry =             qt_expert_stl_ry_qt;
expert_stl_rz =             qt_expert_stl_rz_qt;
expert_stl_tx =             qt_expert_stl_tx_qt;
expert_stl_ty =             qt_expert_stl_ty_qt;
expert_stl_tz =             qt_expert_stl_tz_qt;


//END OF BLANKS VARIABLES LEVEL 1

//VARIABLES FOR ADDITION MATERIAL (Level 1, being cut by Cuts Level 2 and 4)
//EXTRA material
//SHAPE 01 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_01_model = qt_extra_material_level1_shape_01_model_qt;
extra_material_level1_shape_01_cube_centered = qt_extra_material_level1_shape_01_cube_centered_qt;
extra_material_level1_shape_01_cube_dimensions = qt_extra_material_level1_shape_01_cube_dimensions_qt;
extra_material_level1_shape_01_cube_rotation = qt_extra_material_level1_shape_01_cube_rotation_qt;
extra_material_level1_shape_01_cube_translate = qt_extra_material_level1_shape_01_cube_translate_qt;

extra_material_level1_shape_01_cylinder_centered = qt_extra_material_level1_shape_01_cylinder_centered_qt;
extra_material_level1_shape_01_cylinder_diameter = qt_extra_material_level1_shape_01_cylinder_diameter_qt;
extra_material_level1_shape_01_cylinder_height = qt_extra_material_level1_shape_01_cylinder_height_qt;
extra_material_level1_shape_01_cylinder_number_of_faces = qt_extra_material_level1_shape_01_cylinder_number_of_faces_qt;
extra_material_level1_shape_01_cylinder_rotation = qt_extra_material_level1_shape_01_cylinder_rotation_qt;
extra_material_level1_shape_01_cylinder_translate = qt_extra_material_level1_shape_01_cylinder_translate_qt;

extra_material_level1_shape_01_sphere_diameter = qt_extra_material_level1_shape_01_sphere_diameter_qt;
extra_material_level1_shape_01_sphere_number_of_faces = qt_extra_material_level1_shape_01_sphere_number_of_faces_qt;
extra_material_level1_shape_01_sphere_translate = qt_extra_material_level1_shape_01_sphere_translate_qt;

extra_material_level1_shape_01_stl_name = qt_extra_material_level1_shape_01_stl_name_qt;
extra_material_level1_shape_01_stl_rotation = qt_extra_material_level1_shape_01_stl_rotation_qt;
extra_material_level1_shape_01_stl_translate = qt_extra_material_level1_shape_01_stl_translate_qt;


//SHAPE 02 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_02_model = qt_extra_material_level1_shape_02_model_qt;
extra_material_level1_shape_02_cube_centered = qt_extra_material_level1_shape_02_cube_centered_qt;
extra_material_level1_shape_02_cube_dimensions = qt_extra_material_level1_shape_02_cube_dimensions_qt;
extra_material_level1_shape_02_cube_rotation = qt_extra_material_level1_shape_02_cube_rotation_qt;
extra_material_level1_shape_02_cube_translate = qt_extra_material_level1_shape_02_cube_translate_qt;

extra_material_level1_shape_02_cylinder_centered = qt_extra_material_level1_shape_02_cylinder_centered_qt;
extra_material_level1_shape_02_cylinder_diameter = qt_extra_material_level1_shape_02_cylinder_diameter_qt;
extra_material_level1_shape_02_cylinder_height = qt_extra_material_level1_shape_02_cylinder_height_qt;
extra_material_level1_shape_02_cylinder_number_of_faces = qt_extra_material_level1_shape_02_cylinder_number_of_faces_qt;
extra_material_level1_shape_02_cylinder_rotation = qt_extra_material_level1_shape_02_cylinder_rotation_qt;
extra_material_level1_shape_02_cylinder_translate = qt_extra_material_level1_shape_02_cylinder_translate_qt;

extra_material_level1_shape_02_sphere_diameter = qt_extra_material_level1_shape_02_sphere_diameter_qt;
extra_material_level1_shape_02_sphere_number_of_faces = qt_extra_material_level1_shape_02_sphere_number_of_faces_qt;
extra_material_level1_shape_02_sphere_translate = qt_extra_material_level1_shape_02_sphere_translate_qt;

extra_material_level1_shape_02_stl_name = qt_extra_material_level1_shape_02_stl_name_qt;
extra_material_level1_shape_02_stl_rotation = qt_extra_material_level1_shape_02_stl_rotation_qt;
extra_material_level1_shape_02_stl_translate = qt_extra_material_level1_shape_02_stl_translate_qt;


//SHAPE 03 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_03_model = qt_extra_material_level1_shape_03_model_qt;
extra_material_level1_shape_03_cube_centered = qt_extra_material_level1_shape_03_cube_centered_qt;
extra_material_level1_shape_03_cube_dimensions = qt_extra_material_level1_shape_03_cube_dimensions_qt;
extra_material_level1_shape_03_cube_rotation = qt_extra_material_level1_shape_03_cube_rotation_qt;
extra_material_level1_shape_03_cube_translate = qt_extra_material_level1_shape_03_cube_translate_qt;

extra_material_level1_shape_03_cylinder_centered = qt_extra_material_level1_shape_03_cylinder_centered_qt;
extra_material_level1_shape_03_cylinder_diameter = qt_extra_material_level1_shape_03_cylinder_diameter_qt;
extra_material_level1_shape_03_cylinder_height = qt_extra_material_level1_shape_03_cylinder_height_qt;
extra_material_level1_shape_03_cylinder_number_of_faces = qt_extra_material_level1_shape_03_cylinder_number_of_faces_qt;
extra_material_level1_shape_03_cylinder_rotation = qt_extra_material_level1_shape_03_cylinder_rotation_qt;
extra_material_level1_shape_03_cylinder_translate = qt_extra_material_level1_shape_03_cylinder_translate_qt;

extra_material_level1_shape_03_sphere_diameter = qt_extra_material_level1_shape_03_sphere_diameter_qt;
extra_material_level1_shape_03_sphere_number_of_faces = qt_extra_material_level1_shape_03_sphere_number_of_faces_qt;
extra_material_level1_shape_03_sphere_translate = qt_extra_material_level1_shape_03_sphere_translate_qt;

extra_material_level1_shape_03_stl_name = qt_extra_material_level1_shape_03_stl_name_qt;
extra_material_level1_shape_03_stl_rotation = qt_extra_material_level1_shape_03_stl_rotation_qt;
extra_material_level1_shape_03_stl_translate = qt_extra_material_level1_shape_03_stl_translate_qt;


//SHAPE 04 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_04_model = qt_extra_material_level1_shape_04_model_qt;
extra_material_level1_shape_04_cube_centered = qt_extra_material_level1_shape_04_cube_centered_qt;
extra_material_level1_shape_04_cube_dimensions = qt_extra_material_level1_shape_04_cube_dimensions_qt;
extra_material_level1_shape_04_cube_rotation = qt_extra_material_level1_shape_04_cube_rotation_qt;
extra_material_level1_shape_04_cube_translate = qt_extra_material_level1_shape_04_cube_translate_qt;

extra_material_level1_shape_04_cylinder_centered = qt_extra_material_level1_shape_04_cylinder_centered_qt;
extra_material_level1_shape_04_cylinder_diameter = qt_extra_material_level1_shape_04_cylinder_diameter_qt;
extra_material_level1_shape_04_cylinder_height = qt_extra_material_level1_shape_04_cylinder_height_qt;
extra_material_level1_shape_04_cylinder_number_of_faces = qt_extra_material_level1_shape_04_cylinder_number_of_faces_qt;
extra_material_level1_shape_04_cylinder_rotation = qt_extra_material_level1_shape_04_cylinder_rotation_qt;
extra_material_level1_shape_04_cylinder_translate = qt_extra_material_level1_shape_04_cylinder_translate_qt;

extra_material_level1_shape_04_sphere_diameter = qt_extra_material_level1_shape_04_sphere_diameter_qt;
extra_material_level1_shape_04_sphere_number_of_faces = qt_extra_material_level1_shape_04_sphere_number_of_faces_qt;
extra_material_level1_shape_04_sphere_translate = qt_extra_material_level1_shape_04_sphere_translate_qt;

extra_material_level1_shape_04_stl_name = qt_extra_material_level1_shape_04_stl_name_qt;
extra_material_level1_shape_04_stl_rotation = qt_extra_material_level1_shape_04_stl_rotation_qt;
extra_material_level1_shape_04_stl_translate = qt_extra_material_level1_shape_04_stl_translate_qt;


//SHAPE 05 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_05_model = qt_extra_material_level1_shape_05_model_qt;
extra_material_level1_shape_05_cube_centered = qt_extra_material_level1_shape_05_cube_centered_qt;
extra_material_level1_shape_05_cube_dimensions = qt_extra_material_level1_shape_05_cube_dimensions_qt;
extra_material_level1_shape_05_cube_rotation = qt_extra_material_level1_shape_05_cube_rotation_qt;
extra_material_level1_shape_05_cube_translate = qt_extra_material_level1_shape_05_cube_translate_qt;

extra_material_level1_shape_05_cylinder_centered = qt_extra_material_level1_shape_05_cylinder_centered_qt;
extra_material_level1_shape_05_cylinder_diameter = qt_extra_material_level1_shape_05_cylinder_diameter_qt;
extra_material_level1_shape_05_cylinder_height = qt_extra_material_level1_shape_05_cylinder_height_qt;
extra_material_level1_shape_05_cylinder_number_of_faces = qt_extra_material_level1_shape_05_cylinder_number_of_faces_qt;
extra_material_level1_shape_05_cylinder_rotation = qt_extra_material_level1_shape_05_cylinder_rotation_qt;
extra_material_level1_shape_05_cylinder_translate = qt_extra_material_level1_shape_05_cylinder_translate_qt;

extra_material_level1_shape_05_sphere_diameter = qt_extra_material_level1_shape_05_sphere_diameter_qt;
extra_material_level1_shape_05_sphere_number_of_faces = qt_extra_material_level1_shape_05_sphere_number_of_faces_qt;
extra_material_level1_shape_05_sphere_translate = qt_extra_material_level1_shape_05_sphere_translate_qt;

extra_material_level1_shape_05_stl_name = qt_extra_material_level1_shape_05_stl_name_qt;
extra_material_level1_shape_05_stl_rotation = qt_extra_material_level1_shape_05_stl_rotation_qt;
extra_material_level1_shape_05_stl_translate = qt_extra_material_level1_shape_05_stl_translate_qt;


//SHAPE 06 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_06_model = qt_extra_material_level1_shape_06_model_qt;
extra_material_level1_shape_06_cube_centered = qt_extra_material_level1_shape_06_cube_centered_qt;
extra_material_level1_shape_06_cube_dimensions = qt_extra_material_level1_shape_06_cube_dimensions_qt;
extra_material_level1_shape_06_cube_rotation = qt_extra_material_level1_shape_06_cube_rotation_qt;
extra_material_level1_shape_06_cube_translate = qt_extra_material_level1_shape_06_cube_translate_qt;

extra_material_level1_shape_06_cylinder_centered = qt_extra_material_level1_shape_06_cylinder_centered_qt;
extra_material_level1_shape_06_cylinder_diameter = qt_extra_material_level1_shape_06_cylinder_diameter_qt;
extra_material_level1_shape_06_cylinder_height = qt_extra_material_level1_shape_06_cylinder_height_qt;
extra_material_level1_shape_06_cylinder_number_of_faces = qt_extra_material_level1_shape_06_cylinder_number_of_faces_qt;
extra_material_level1_shape_06_cylinder_rotation = qt_extra_material_level1_shape_06_cylinder_rotation_qt;
extra_material_level1_shape_06_cylinder_translate = qt_extra_material_level1_shape_06_cylinder_translate_qt;

extra_material_level1_shape_06_sphere_diameter = qt_extra_material_level1_shape_06_sphere_diameter_qt;
extra_material_level1_shape_06_sphere_number_of_faces = qt_extra_material_level1_shape_06_sphere_number_of_faces_qt;
extra_material_level1_shape_06_sphere_translate = qt_extra_material_level1_shape_06_sphere_translate_qt;

extra_material_level1_shape_06_stl_name = qt_extra_material_level1_shape_06_stl_name_qt;
extra_material_level1_shape_06_stl_rotation = qt_extra_material_level1_shape_06_stl_rotation_qt;
extra_material_level1_shape_06_stl_translate = qt_extra_material_level1_shape_06_stl_translate_qt;


//SHAPE 07 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_07_model = qt_extra_material_level1_shape_07_model_qt;
extra_material_level1_shape_07_cube_centered = qt_extra_material_level1_shape_07_cube_centered_qt;
extra_material_level1_shape_07_cube_dimensions = qt_extra_material_level1_shape_07_cube_dimensions_qt;
extra_material_level1_shape_07_cube_rotation = qt_extra_material_level1_shape_07_cube_rotation_qt;
extra_material_level1_shape_07_cube_translate = qt_extra_material_level1_shape_07_cube_translate_qt;

extra_material_level1_shape_07_cylinder_centered = qt_extra_material_level1_shape_07_cylinder_centered_qt;
extra_material_level1_shape_07_cylinder_diameter = qt_extra_material_level1_shape_07_cylinder_diameter_qt;
extra_material_level1_shape_07_cylinder_height = qt_extra_material_level1_shape_07_cylinder_height_qt;
extra_material_level1_shape_07_cylinder_number_of_faces = qt_extra_material_level1_shape_07_cylinder_number_of_faces_qt;
extra_material_level1_shape_07_cylinder_rotation = qt_extra_material_level1_shape_07_cylinder_rotation_qt;
extra_material_level1_shape_07_cylinder_translate = qt_extra_material_level1_shape_07_cylinder_translate_qt;

extra_material_level1_shape_07_sphere_diameter = qt_extra_material_level1_shape_07_sphere_diameter_qt;
extra_material_level1_shape_07_sphere_number_of_faces = qt_extra_material_level1_shape_07_sphere_number_of_faces_qt;
extra_material_level1_shape_07_sphere_translate = qt_extra_material_level1_shape_07_sphere_translate_qt;

extra_material_level1_shape_07_stl_name = qt_extra_material_level1_shape_07_stl_name_qt;
extra_material_level1_shape_07_stl_rotation = qt_extra_material_level1_shape_07_stl_rotation_qt;
extra_material_level1_shape_07_stl_translate = qt_extra_material_level1_shape_07_stl_translate_qt;


//SHAPE 08 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_08_model = qt_extra_material_level1_shape_08_model_qt;
extra_material_level1_shape_08_cube_centered = qt_extra_material_level1_shape_08_cube_centered_qt;
extra_material_level1_shape_08_cube_dimensions = qt_extra_material_level1_shape_08_cube_dimensions_qt;
extra_material_level1_shape_08_cube_rotation = qt_extra_material_level1_shape_08_cube_rotation_qt;
extra_material_level1_shape_08_cube_translate = qt_extra_material_level1_shape_08_cube_translate_qt;

extra_material_level1_shape_08_cylinder_centered = qt_extra_material_level1_shape_08_cylinder_centered_qt;
extra_material_level1_shape_08_cylinder_diameter = qt_extra_material_level1_shape_08_cylinder_diameter_qt;
extra_material_level1_shape_08_cylinder_height = qt_extra_material_level1_shape_08_cylinder_height_qt;
extra_material_level1_shape_08_cylinder_number_of_faces = qt_extra_material_level1_shape_08_cylinder_number_of_faces_qt;
extra_material_level1_shape_08_cylinder_rotation = qt_extra_material_level1_shape_08_cylinder_rotation_qt;
extra_material_level1_shape_08_cylinder_translate = qt_extra_material_level1_shape_08_cylinder_translate_qt;

extra_material_level1_shape_08_sphere_diameter = qt_extra_material_level1_shape_08_sphere_diameter_qt;
extra_material_level1_shape_08_sphere_number_of_faces = qt_extra_material_level1_shape_08_sphere_number_of_faces_qt;
extra_material_level1_shape_08_sphere_translate = qt_extra_material_level1_shape_08_sphere_translate_qt;

extra_material_level1_shape_08_stl_name = qt_extra_material_level1_shape_08_stl_name_qt;
extra_material_level1_shape_08_stl_rotation = qt_extra_material_level1_shape_08_stl_rotation_qt;
extra_material_level1_shape_08_stl_translate = qt_extra_material_level1_shape_08_stl_translate_qt;

//SHAPE 09 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_09_model = qt_extra_material_level1_shape_09_model_qt;
extra_material_level1_shape_09_cube_centered = qt_extra_material_level1_shape_09_cube_centered_qt;
extra_material_level1_shape_09_cube_dimensions = qt_extra_material_level1_shape_09_cube_dimensions_qt;
extra_material_level1_shape_09_cube_rotation = qt_extra_material_level1_shape_09_cube_rotation_qt;
extra_material_level1_shape_09_cube_translate = qt_extra_material_level1_shape_09_cube_translate_qt;

extra_material_level1_shape_09_cylinder_centered = qt_extra_material_level1_shape_09_cylinder_centered_qt;
extra_material_level1_shape_09_cylinder_diameter = qt_extra_material_level1_shape_09_cylinder_diameter_qt;
extra_material_level1_shape_09_cylinder_height = qt_extra_material_level1_shape_09_cylinder_height_qt;
extra_material_level1_shape_09_cylinder_number_of_faces = qt_extra_material_level1_shape_09_cylinder_number_of_faces_qt;
extra_material_level1_shape_09_cylinder_rotation = qt_extra_material_level1_shape_09_cylinder_rotation_qt;
extra_material_level1_shape_09_cylinder_translate = qt_extra_material_level1_shape_09_cylinder_translate_qt;

extra_material_level1_shape_09_sphere_diameter = qt_extra_material_level1_shape_09_sphere_diameter_qt;
extra_material_level1_shape_09_sphere_number_of_faces = qt_extra_material_level1_shape_09_sphere_number_of_faces_qt;
extra_material_level1_shape_09_sphere_translate = qt_extra_material_level1_shape_09_sphere_translate_qt;

extra_material_level1_shape_09_stl_name = qt_extra_material_level1_shape_09_stl_name_qt;
extra_material_level1_shape_09_stl_rotation = qt_extra_material_level1_shape_09_stl_rotation_qt;
extra_material_level1_shape_09_stl_translate = qt_extra_material_level1_shape_09_stl_translate_qt;


//SHAPE 10 ADDITION MATERIAL (Level 1)
extra_material_level1_shape_10_model = qt_extra_material_level1_shape_10_model_qt;
extra_material_level1_shape_10_cube_centered = qt_extra_material_level1_shape_10_cube_centered_qt;
extra_material_level1_shape_10_cube_dimensions = qt_extra_material_level1_shape_10_cube_dimensions_qt;
extra_material_level1_shape_10_cube_rotation = qt_extra_material_level1_shape_10_cube_rotation_qt;
extra_material_level1_shape_10_cube_translate = qt_extra_material_level1_shape_10_cube_translate_qt;

extra_material_level1_shape_10_cylinder_centered = qt_extra_material_level1_shape_10_cylinder_centered_qt;
extra_material_level1_shape_10_cylinder_diameter = qt_extra_material_level1_shape_10_cylinder_diameter_qt;
extra_material_level1_shape_10_cylinder_height = qt_extra_material_level1_shape_10_cylinder_height_qt;
extra_material_level1_shape_10_cylinder_number_of_faces = qt_extra_material_level1_shape_10_cylinder_number_of_faces_qt;
extra_material_level1_shape_10_cylinder_rotation = qt_extra_material_level1_shape_10_cylinder_rotation_qt;
extra_material_level1_shape_10_cylinder_translate = qt_extra_material_level1_shape_10_cylinder_translate_qt;

extra_material_level1_shape_10_sphere_diameter = qt_extra_material_level1_shape_10_sphere_diameter_qt;
extra_material_level1_shape_10_sphere_number_of_faces = qt_extra_material_level1_shape_10_sphere_number_of_faces_qt;
extra_material_level1_shape_10_sphere_translate = qt_extra_material_level1_shape_10_sphere_translate_qt;

extra_material_level1_shape_10_stl_name = qt_extra_material_level1_shape_10_stl_name_qt;
extra_material_level1_shape_10_stl_rotation = qt_extra_material_level1_shape_10_stl_rotation_qt;
extra_material_level1_shape_10_stl_translate = qt_extra_material_level1_shape_10_stl_translate_qt;


////
// VARIABLES FOR LEVEL 2 KEY CUTTINGS AND EXTRA CUTTINGS

//VARIABLES OF REGULAR CUTTINGS
//VARIABLES OF ROW1
regular_row1_number_of_pins = qt_regular_row1_number_of_pins_qt;
regular_row1_offset_on_x = qt_regular_row1_offset_on_x_qt;
regular_row1_offset_on_z = qt_regular_row1_offset_on_z_qt;
regular_row1_angle_on_y = qt_regular_row1_angle_on_y_qt;
regular_row1_mirror = qt_regular_row1_mirror_qt;
regular_row1_linked = qt_regular_row1_linked_qt;
regular_row1_link_root_addition = qt_regular_row1_link_root_addition_qt;
regular_row1_shoulder_distance = qt_regular_row1_shoulder_distance_qt;
regular_row1_interpin_space = qt_regular_row1_interpin_space_qt;
//VARIABLES OF ROW1 CUT SHAPE
regular_row1_cut_to_use = qt_regular_row1_cut_to_use_qt;
regular_row1_prism_root_x = qt_regular_row1_prism_root_x_qt;
regular_row1_prism_root_y = qt_regular_row1_prism_root_y_qt;
regular_row1_prism_angle_x = qt_regular_row1_prism_angle_x_qt;
regular_row1_prism_angle_y = qt_regular_row1_prism_angle_y_qt;
regular_row1_prism_height = qt_regular_row1_prism_height_qt;
regular_row1_cone_height = qt_regular_row1_cone_height_qt;
regular_row1_cone_bottom_diameter = qt_regular_row1_cone_bottom_diameter_qt;
regular_row1_cone_angle = qt_regular_row1_cone_angle_qt;
regular_row1_cone_number_of_faces = qt_regular_row1_cone_number_of_faces_qt;
regular_row1_laser_mill_height = qt_regular_row1_laser_mill_height_qt;
regular_row1_laser_mill_diameter = qt_regular_row1_laser_mill_diameter_qt;
regular_row1_laser_mill_number_of_faces = qt_regular_row1_laser_mill_number_of_faces_qt;
regular_row1_laser_mill_center = qt_regular_row1_laser_mill_center_qt;
regular_row1_stl_mill_name = qt_regular_row1_stl_mill_name_qt;
//VARIABLES OF ROW1 CUTS DEPTH, SPACES AND ANGLE ON Z
regular_row1_cut01_depth = qt_regular_row1_cut01_depth_qt;
regular_row1_cut01_distance = qt_regular_row1_cut01_distance_qt;
regular_row1_cut01_angle = qt_regular_row1_cut01_angle_qt;
regular_row1_cut02_depth = qt_regular_row1_cut02_depth_qt;
regular_row1_cut02_distance = qt_regular_row1_cut02_distance_qt;
regular_row1_cut02_angle = qt_regular_row1_cut02_angle_qt;
regular_row1_cut03_depth = qt_regular_row1_cut03_depth_qt;
regular_row1_cut03_distance = qt_regular_row1_cut03_distance_qt;
regular_row1_cut03_angle = qt_regular_row1_cut03_angle_qt;
regular_row1_cut04_depth = qt_regular_row1_cut04_depth_qt;
regular_row1_cut04_distance = qt_regular_row1_cut04_distance_qt;
regular_row1_cut04_angle = qt_regular_row1_cut04_angle_qt;
regular_row1_cut05_depth = qt_regular_row1_cut05_depth_qt;
regular_row1_cut05_distance = qt_regular_row1_cut05_distance_qt;
regular_row1_cut05_angle = qt_regular_row1_cut05_angle_qt;
regular_row1_cut06_depth = qt_regular_row1_cut06_depth_qt;
regular_row1_cut06_distance = qt_regular_row1_cut06_distance_qt;
regular_row1_cut06_angle = qt_regular_row1_cut06_angle_qt;
regular_row1_cut07_depth = qt_regular_row1_cut07_depth_qt;
regular_row1_cut07_distance = qt_regular_row1_cut07_distance_qt;
regular_row1_cut07_angle = qt_regular_row1_cut07_angle_qt;
regular_row1_cut08_depth = qt_regular_row1_cut08_depth_qt;
regular_row1_cut08_distance = qt_regular_row1_cut08_distance_qt;
regular_row1_cut08_angle = qt_regular_row1_cut08_angle_qt;
regular_row1_cut09_depth = qt_regular_row1_cut09_depth_qt;
regular_row1_cut09_distance = qt_regular_row1_cut09_distance_qt;
regular_row1_cut09_angle = qt_regular_row1_cut09_angle_qt;
regular_row1_cut10_depth = qt_regular_row1_cut10_depth_qt;
regular_row1_cut10_distance = qt_regular_row1_cut10_distance_qt;
regular_row1_cut10_angle = qt_regular_row1_cut10_angle_qt;
regular_row1_cut11_depth = qt_regular_row1_cut11_depth_qt;
regular_row1_cut11_distance = qt_regular_row1_cut11_distance_qt;
regular_row1_cut11_angle = qt_regular_row1_cut11_angle_qt;
regular_row1_cut12_depth = qt_regular_row1_cut12_depth_qt;
regular_row1_cut12_distance = qt_regular_row1_cut12_distance_qt;
regular_row1_cut12_angle = qt_regular_row1_cut12_angle_qt;
regular_row1_cut13_depth = qt_regular_row1_cut13_depth_qt;
regular_row1_cut13_distance = qt_regular_row1_cut13_distance_qt;
regular_row1_cut13_angle = qt_regular_row1_cut13_angle_qt;
regular_row1_cut14_depth = qt_regular_row1_cut14_depth_qt;
regular_row1_cut14_distance = qt_regular_row1_cut14_distance_qt;
regular_row1_cut14_angle = qt_regular_row1_cut14_angle_qt;
regular_row1_cut15_depth = qt_regular_row1_cut15_depth_qt;
regular_row1_cut15_distance = qt_regular_row1_cut15_distance_qt;
regular_row1_cut15_angle = qt_regular_row1_cut15_angle_qt;
regular_row1_cut16_depth = qt_regular_row1_cut16_depth_qt;
regular_row1_cut16_distance = qt_regular_row1_cut16_distance_qt;
regular_row1_cut16_angle = qt_regular_row1_cut16_angle_qt;
regular_row1_cut17_depth = qt_regular_row1_cut17_depth_qt;
regular_row1_cut17_distance = qt_regular_row1_cut17_distance_qt;
regular_row1_cut17_angle = qt_regular_row1_cut17_angle_qt;
regular_row1_cut18_depth = qt_regular_row1_cut18_depth_qt;
regular_row1_cut18_distance = qt_regular_row1_cut18_distance_qt;
regular_row1_cut18_angle = qt_regular_row1_cut18_angle_qt;
regular_row1_cut19_depth = qt_regular_row1_cut19_depth_qt;
regular_row1_cut19_distance = qt_regular_row1_cut19_distance_qt;
regular_row1_cut19_angle = qt_regular_row1_cut19_angle_qt;
regular_row1_cut20_depth = qt_regular_row1_cut20_depth_qt;
regular_row1_cut20_distance = qt_regular_row1_cut20_distance_qt;
regular_row1_cut20_angle = qt_regular_row1_cut20_angle_qt;
regular_row1_cut21_depth = qt_regular_row1_cut21_depth_qt;
regular_row1_cut21_distance = qt_regular_row1_cut21_distance_qt;
regular_row1_cut21_angle = qt_regular_row1_cut21_angle_qt;
regular_row1_cut22_depth = qt_regular_row1_cut22_depth_qt;
regular_row1_cut22_distance = qt_regular_row1_cut22_distance_qt;
regular_row1_cut22_angle = qt_regular_row1_cut22_angle_qt;

//VARIABLES OF ROW2
regular_row2_number_of_pins = qt_regular_row2_number_of_pins_qt;
regular_row2_offset_on_x = qt_regular_row2_offset_on_x_qt;
regular_row2_offset_on_z = qt_regular_row2_offset_on_z_qt;
regular_row2_angle_on_y = qt_regular_row2_angle_on_y_qt;
regular_row2_mirror = qt_regular_row2_mirror_qt;
regular_row2_linked = qt_regular_row2_linked_qt;
regular_row2_link_root_addition = qt_regular_row2_link_root_addition_qt;
regular_row2_shoulder_distance = qt_regular_row2_shoulder_distance_qt;
regular_row2_interpin_space = qt_regular_row2_interpin_space_qt;
//VARIABLES OF ROW2 CUT SHAPE
regular_row2_cut_to_use = qt_regular_row2_cut_to_use_qt;
regular_row2_prism_root_x = qt_regular_row2_prism_root_x_qt;
regular_row2_prism_root_y = qt_regular_row2_prism_root_y_qt;
regular_row2_prism_angle_x = qt_regular_row2_prism_angle_x_qt;
regular_row2_prism_angle_y = qt_regular_row2_prism_angle_y_qt;
regular_row2_prism_height = qt_regular_row2_prism_height_qt;
regular_row2_cone_height = qt_regular_row2_cone_height_qt;
regular_row2_cone_bottom_diameter = qt_regular_row2_cone_bottom_diameter_qt;
regular_row2_cone_angle = qt_regular_row2_cone_angle_qt;
regular_row2_cone_number_of_faces = qt_regular_row2_cone_number_of_faces_qt;
regular_row2_laser_mill_height = qt_regular_row2_laser_mill_height_qt;
regular_row2_laser_mill_diameter = qt_regular_row2_laser_mill_diameter_qt;
regular_row2_laser_mill_number_of_faces = qt_regular_row2_laser_mill_number_of_faces_qt;
regular_row2_laser_mill_center = qt_regular_row2_laser_mill_center_qt;
regular_row2_stl_mill_name = qt_regular_row2_stl_mill_name_qt;
//VARIABLES OF ROW2 CUTS DEPTH, SPACES AND ANGLE ON Z
regular_row2_cut01_depth = qt_regular_row2_cut01_depth_qt;
regular_row2_cut01_distance = qt_regular_row2_cut01_distance_qt;
regular_row2_cut01_angle = qt_regular_row2_cut01_angle_qt;
regular_row2_cut02_depth = qt_regular_row2_cut02_depth_qt;
regular_row2_cut02_distance = qt_regular_row2_cut02_distance_qt;
regular_row2_cut02_angle = qt_regular_row2_cut02_angle_qt;
regular_row2_cut03_depth = qt_regular_row2_cut03_depth_qt;
regular_row2_cut03_distance = qt_regular_row2_cut03_distance_qt;
regular_row2_cut03_angle = qt_regular_row2_cut03_angle_qt;
regular_row2_cut04_depth = qt_regular_row2_cut04_depth_qt;
regular_row2_cut04_distance = qt_regular_row2_cut04_distance_qt;
regular_row2_cut04_angle = qt_regular_row2_cut04_angle_qt;
regular_row2_cut05_depth = qt_regular_row2_cut05_depth_qt;
regular_row2_cut05_distance = qt_regular_row2_cut05_distance_qt;
regular_row2_cut05_angle = qt_regular_row2_cut05_angle_qt;
regular_row2_cut06_depth = qt_regular_row2_cut06_depth_qt;
regular_row2_cut06_distance = qt_regular_row2_cut06_distance_qt;
regular_row2_cut06_angle = qt_regular_row2_cut06_angle_qt;
regular_row2_cut07_depth = qt_regular_row2_cut07_depth_qt;
regular_row2_cut07_distance = qt_regular_row2_cut07_distance_qt;
regular_row2_cut07_angle = qt_regular_row2_cut07_angle_qt;
regular_row2_cut08_depth = qt_regular_row2_cut08_depth_qt;
regular_row2_cut08_distance = qt_regular_row2_cut08_distance_qt;
regular_row2_cut08_angle = qt_regular_row2_cut08_angle_qt;
regular_row2_cut09_depth = qt_regular_row2_cut09_depth_qt;
regular_row2_cut09_distance = qt_regular_row2_cut09_distance_qt;
regular_row2_cut09_angle = qt_regular_row2_cut09_angle_qt;
regular_row2_cut10_depth = qt_regular_row2_cut10_depth_qt;
regular_row2_cut10_distance = qt_regular_row2_cut10_distance_qt;
regular_row2_cut10_angle = qt_regular_row2_cut10_angle_qt;
regular_row2_cut11_depth = qt_regular_row2_cut11_depth_qt;
regular_row2_cut11_distance = qt_regular_row2_cut11_distance_qt;
regular_row2_cut11_angle = qt_regular_row2_cut11_angle_qt;
regular_row2_cut12_depth = qt_regular_row2_cut12_depth_qt;
regular_row2_cut12_distance = qt_regular_row2_cut12_distance_qt;
regular_row2_cut12_angle = qt_regular_row2_cut12_angle_qt;
regular_row2_cut13_depth = qt_regular_row2_cut13_depth_qt;
regular_row2_cut13_distance = qt_regular_row2_cut13_distance_qt;
regular_row2_cut13_angle = qt_regular_row2_cut13_angle_qt;
regular_row2_cut14_depth = qt_regular_row2_cut14_depth_qt;
regular_row2_cut14_distance = qt_regular_row2_cut14_distance_qt;
regular_row2_cut14_angle = qt_regular_row2_cut14_angle_qt;
regular_row2_cut15_depth = qt_regular_row2_cut15_depth_qt;
regular_row2_cut15_distance = qt_regular_row2_cut15_distance_qt;
regular_row2_cut15_angle = qt_regular_row2_cut15_angle_qt;
regular_row2_cut16_depth = qt_regular_row2_cut16_depth_qt;
regular_row2_cut16_distance = qt_regular_row2_cut16_distance_qt;
regular_row2_cut16_angle = qt_regular_row2_cut16_angle_qt;
regular_row2_cut17_depth = qt_regular_row2_cut17_depth_qt;
regular_row2_cut17_distance = qt_regular_row2_cut17_distance_qt;
regular_row2_cut17_angle = qt_regular_row2_cut17_angle_qt;
regular_row2_cut18_depth = qt_regular_row2_cut18_depth_qt;
regular_row2_cut18_distance = qt_regular_row2_cut18_distance_qt;
regular_row2_cut18_angle = qt_regular_row2_cut18_angle_qt;
regular_row2_cut19_depth = qt_regular_row2_cut19_depth_qt;
regular_row2_cut19_distance = qt_regular_row2_cut19_distance_qt;
regular_row2_cut19_angle = qt_regular_row2_cut19_angle_qt;
regular_row2_cut20_depth = qt_regular_row2_cut20_depth_qt;
regular_row2_cut20_distance = qt_regular_row2_cut20_distance_qt;
regular_row2_cut20_angle = qt_regular_row2_cut20_angle_qt;
regular_row2_cut21_depth = qt_regular_row2_cut21_depth_qt;
regular_row2_cut21_distance = qt_regular_row2_cut21_distance_qt;
regular_row2_cut21_angle = qt_regular_row2_cut21_angle_qt;
regular_row2_cut22_depth = qt_regular_row2_cut22_depth_qt;
regular_row2_cut22_distance = qt_regular_row2_cut22_distance_qt;
regular_row2_cut22_angle = qt_regular_row2_cut22_angle_qt;

//VARIABLES OF ROW3
regular_row3_number_of_pins = qt_regular_row3_number_of_pins_qt;
regular_row3_offset_on_x = qt_regular_row3_offset_on_x_qt;
regular_row3_offset_on_z = qt_regular_row3_offset_on_z_qt;
regular_row3_angle_on_y = qt_regular_row3_angle_on_y_qt;
regular_row3_mirror = qt_regular_row3_mirror_qt;
regular_row3_linked = qt_regular_row3_linked_qt;
regular_row3_link_root_addition = qt_regular_row3_link_root_addition_qt;
regular_row3_shoulder_distance = qt_regular_row3_shoulder_distance_qt;
regular_row3_interpin_space = qt_regular_row3_interpin_space_qt;
//VARIABLES OF ROW3 CUT SHAPE
regular_row3_cut_to_use = qt_regular_row3_cut_to_use_qt;
regular_row3_prism_root_x = qt_regular_row3_prism_root_x_qt;
regular_row3_prism_root_y = qt_regular_row3_prism_root_y_qt;
regular_row3_prism_angle_x = qt_regular_row3_prism_angle_x_qt;
regular_row3_prism_angle_y = qt_regular_row3_prism_angle_y_qt;
regular_row3_prism_height = qt_regular_row3_prism_height_qt;
regular_row3_cone_height = qt_regular_row3_cone_height_qt;
regular_row3_cone_bottom_diameter = qt_regular_row3_cone_bottom_diameter_qt;
regular_row3_cone_angle = qt_regular_row3_cone_angle_qt;
regular_row3_cone_number_of_faces = qt_regular_row3_cone_number_of_faces_qt;
regular_row3_laser_mill_height = qt_regular_row3_laser_mill_height_qt;
regular_row3_laser_mill_diameter = qt_regular_row3_laser_mill_diameter_qt;
regular_row3_laser_mill_number_of_faces = qt_regular_row3_laser_mill_number_of_faces_qt;
regular_row3_laser_mill_center = qt_regular_row3_laser_mill_center_qt;
regular_row3_stl_mill_name = qt_regular_row3_stl_mill_name_qt;
//VARIABLES OF ROW3 CUTS DEPTH, SPACES AND ANGLE ON Z
regular_row3_cut01_depth = qt_regular_row3_cut01_depth_qt;
regular_row3_cut01_distance = qt_regular_row3_cut01_distance_qt;
regular_row3_cut01_angle = qt_regular_row3_cut01_angle_qt;
regular_row3_cut02_depth = qt_regular_row3_cut02_depth_qt;
regular_row3_cut02_distance = qt_regular_row3_cut02_distance_qt;
regular_row3_cut02_angle = qt_regular_row3_cut02_angle_qt;
regular_row3_cut03_depth = qt_regular_row3_cut03_depth_qt;
regular_row3_cut03_distance = qt_regular_row3_cut03_distance_qt;
regular_row3_cut03_angle = qt_regular_row3_cut03_angle_qt;
regular_row3_cut04_depth = qt_regular_row3_cut04_depth_qt;
regular_row3_cut04_distance = qt_regular_row3_cut04_distance_qt;
regular_row3_cut04_angle = qt_regular_row3_cut04_angle_qt;
regular_row3_cut05_depth = qt_regular_row3_cut05_depth_qt;
regular_row3_cut05_distance = qt_regular_row3_cut05_distance_qt;
regular_row3_cut05_angle = qt_regular_row3_cut05_angle_qt;
regular_row3_cut06_depth = qt_regular_row3_cut06_depth_qt;
regular_row3_cut06_distance = qt_regular_row3_cut06_distance_qt;
regular_row3_cut06_angle = qt_regular_row3_cut06_angle_qt;
regular_row3_cut07_depth = qt_regular_row3_cut07_depth_qt;
regular_row3_cut07_distance = qt_regular_row3_cut07_distance_qt;
regular_row3_cut07_angle = qt_regular_row3_cut07_angle_qt;
regular_row3_cut08_depth = qt_regular_row3_cut08_depth_qt;
regular_row3_cut08_distance = qt_regular_row3_cut08_distance_qt;
regular_row3_cut08_angle = qt_regular_row3_cut08_angle_qt;
regular_row3_cut09_depth = qt_regular_row3_cut09_depth_qt;
regular_row3_cut09_distance = qt_regular_row3_cut09_distance_qt;
regular_row3_cut09_angle = qt_regular_row3_cut09_angle_qt;
regular_row3_cut10_depth = qt_regular_row3_cut10_depth_qt;
regular_row3_cut10_distance = qt_regular_row3_cut10_distance_qt;
regular_row3_cut10_angle = qt_regular_row3_cut10_angle_qt;
regular_row3_cut11_depth = qt_regular_row3_cut11_depth_qt;
regular_row3_cut11_distance = qt_regular_row3_cut11_distance_qt;
regular_row3_cut11_angle = qt_regular_row3_cut11_angle_qt;
regular_row3_cut12_depth = qt_regular_row3_cut12_depth_qt;
regular_row3_cut12_distance = qt_regular_row3_cut12_distance_qt;
regular_row3_cut12_angle = qt_regular_row3_cut12_angle_qt;
regular_row3_cut13_depth = qt_regular_row3_cut13_depth_qt;
regular_row3_cut13_distance = qt_regular_row3_cut13_distance_qt;
regular_row3_cut13_angle = qt_regular_row3_cut13_angle_qt;
regular_row3_cut14_depth = qt_regular_row3_cut14_depth_qt;
regular_row3_cut14_distance = qt_regular_row3_cut14_distance_qt;
regular_row3_cut14_angle = qt_regular_row3_cut14_angle_qt;
regular_row3_cut15_depth = qt_regular_row3_cut15_depth_qt;
regular_row3_cut15_distance = qt_regular_row3_cut15_distance_qt;
regular_row3_cut15_angle = qt_regular_row3_cut15_angle_qt;
regular_row3_cut16_depth = qt_regular_row3_cut16_depth_qt;
regular_row3_cut16_distance = qt_regular_row3_cut16_distance_qt;
regular_row3_cut16_angle = qt_regular_row3_cut16_angle_qt;
regular_row3_cut17_depth = qt_regular_row3_cut17_depth_qt;
regular_row3_cut17_distance = qt_regular_row3_cut17_distance_qt;
regular_row3_cut17_angle = qt_regular_row3_cut17_angle_qt;
regular_row3_cut18_depth = qt_regular_row3_cut18_depth_qt;
regular_row3_cut18_distance = qt_regular_row3_cut18_distance_qt;
regular_row3_cut18_angle = qt_regular_row3_cut18_angle_qt;
regular_row3_cut19_depth = qt_regular_row3_cut19_depth_qt;
regular_row3_cut19_distance = qt_regular_row3_cut19_distance_qt;
regular_row3_cut19_angle = qt_regular_row3_cut19_angle_qt;
regular_row3_cut20_depth = qt_regular_row3_cut20_depth_qt;
regular_row3_cut20_distance = qt_regular_row3_cut20_distance_qt;
regular_row3_cut20_angle = qt_regular_row3_cut20_angle_qt;
regular_row3_cut21_depth = qt_regular_row3_cut21_depth_qt;
regular_row3_cut21_distance = qt_regular_row3_cut21_distance_qt;
regular_row3_cut21_angle = qt_regular_row3_cut21_angle_qt;
regular_row3_cut22_depth = qt_regular_row3_cut22_depth_qt;
regular_row3_cut22_distance = qt_regular_row3_cut22_distance_qt;
regular_row3_cut22_angle = qt_regular_row3_cut22_angle_qt;

//VARIABLES OF ROW4
regular_row4_number_of_pins = qt_regular_row4_number_of_pins_qt;
regular_row4_offset_on_x = qt_regular_row4_offset_on_x_qt;
regular_row4_offset_on_z = qt_regular_row4_offset_on_z_qt;
regular_row4_angle_on_y = qt_regular_row4_angle_on_y_qt;
regular_row4_mirror = qt_regular_row4_mirror_qt;
regular_row4_linked = qt_regular_row4_linked_qt;
regular_row4_link_root_addition = qt_regular_row4_link_root_addition_qt;
regular_row4_shoulder_distance = qt_regular_row4_shoulder_distance_qt;
regular_row4_interpin_space = qt_regular_row4_interpin_space_qt;
//VARIABLES OF ROW4 CUT SHAPE
regular_row4_cut_to_use = qt_regular_row4_cut_to_use_qt;
regular_row4_prism_root_x = qt_regular_row4_prism_root_x_qt;
regular_row4_prism_root_y = qt_regular_row4_prism_root_y_qt;
regular_row4_prism_angle_x = qt_regular_row4_prism_angle_x_qt;
regular_row4_prism_angle_y = qt_regular_row4_prism_angle_y_qt;
regular_row4_prism_height = qt_regular_row4_prism_height_qt;
regular_row4_cone_height = qt_regular_row4_cone_height_qt;
regular_row4_cone_bottom_diameter = qt_regular_row4_cone_bottom_diameter_qt;
regular_row4_cone_angle = qt_regular_row4_cone_angle_qt;
regular_row4_cone_number_of_faces = qt_regular_row4_cone_number_of_faces_qt;
regular_row4_laser_mill_height = qt_regular_row4_laser_mill_height_qt;
regular_row4_laser_mill_diameter = qt_regular_row4_laser_mill_diameter_qt;
regular_row4_laser_mill_number_of_faces = qt_regular_row4_laser_mill_number_of_faces_qt;
regular_row4_laser_mill_center = qt_regular_row4_laser_mill_center_qt;
regular_row4_stl_mill_name = qt_regular_row4_stl_mill_name_qt;
//VARIABLES OF ROW4 CUTS DEPTH, SPACES AND ANGLE ON Z
regular_row4_cut01_depth = qt_regular_row4_cut01_depth_qt;
regular_row4_cut01_distance = qt_regular_row4_cut01_distance_qt;
regular_row4_cut01_angle = qt_regular_row4_cut01_angle_qt;
regular_row4_cut02_depth = qt_regular_row4_cut02_depth_qt;
regular_row4_cut02_distance = qt_regular_row4_cut02_distance_qt;
regular_row4_cut02_angle = qt_regular_row4_cut02_angle_qt;
regular_row4_cut03_depth = qt_regular_row4_cut03_depth_qt;
regular_row4_cut03_distance = qt_regular_row4_cut03_distance_qt;
regular_row4_cut03_angle = qt_regular_row4_cut03_angle_qt;
regular_row4_cut04_depth = qt_regular_row4_cut04_depth_qt;
regular_row4_cut04_distance = qt_regular_row4_cut04_distance_qt;
regular_row4_cut04_angle = qt_regular_row4_cut04_angle_qt;
regular_row4_cut05_depth = qt_regular_row4_cut05_depth_qt;
regular_row4_cut05_distance = qt_regular_row4_cut05_distance_qt;
regular_row4_cut05_angle = qt_regular_row4_cut05_angle_qt;
regular_row4_cut06_depth = qt_regular_row4_cut06_depth_qt;
regular_row4_cut06_distance = qt_regular_row4_cut06_distance_qt;
regular_row4_cut06_angle = qt_regular_row4_cut06_angle_qt;
regular_row4_cut07_depth = qt_regular_row4_cut07_depth_qt;
regular_row4_cut07_distance = qt_regular_row4_cut07_distance_qt;
regular_row4_cut07_angle = qt_regular_row4_cut07_angle_qt;
regular_row4_cut08_depth = qt_regular_row4_cut08_depth_qt;
regular_row4_cut08_distance = qt_regular_row4_cut08_distance_qt;
regular_row4_cut08_angle = qt_regular_row4_cut08_angle_qt;
regular_row4_cut09_depth = qt_regular_row4_cut09_depth_qt;
regular_row4_cut09_distance = qt_regular_row4_cut09_distance_qt;
regular_row4_cut09_angle = qt_regular_row4_cut09_angle_qt;
regular_row4_cut10_depth = qt_regular_row4_cut10_depth_qt;
regular_row4_cut10_distance = qt_regular_row4_cut10_distance_qt;
regular_row4_cut10_angle = qt_regular_row4_cut10_angle_qt;
regular_row4_cut11_depth = qt_regular_row4_cut11_depth_qt;
regular_row4_cut11_distance = qt_regular_row4_cut11_distance_qt;
regular_row4_cut11_angle = qt_regular_row4_cut11_angle_qt;
regular_row4_cut12_depth = qt_regular_row4_cut12_depth_qt;
regular_row4_cut12_distance = qt_regular_row4_cut12_distance_qt;
regular_row4_cut12_angle = qt_regular_row4_cut12_angle_qt;
regular_row4_cut13_depth = qt_regular_row4_cut13_depth_qt;
regular_row4_cut13_distance = qt_regular_row4_cut13_distance_qt;
regular_row4_cut13_angle = qt_regular_row4_cut13_angle_qt;
regular_row4_cut14_depth = qt_regular_row4_cut14_depth_qt;
regular_row4_cut14_distance = qt_regular_row4_cut14_distance_qt;
regular_row4_cut14_angle = qt_regular_row4_cut14_angle_qt;
regular_row4_cut15_depth = qt_regular_row4_cut15_depth_qt;
regular_row4_cut15_distance = qt_regular_row4_cut15_distance_qt;
regular_row4_cut15_angle = qt_regular_row4_cut15_angle_qt;
regular_row4_cut16_depth = qt_regular_row4_cut16_depth_qt;
regular_row4_cut16_distance = qt_regular_row4_cut16_distance_qt;
regular_row4_cut16_angle = qt_regular_row4_cut16_angle_qt;
regular_row4_cut17_depth = qt_regular_row4_cut17_depth_qt;
regular_row4_cut17_distance = qt_regular_row4_cut17_distance_qt;
regular_row4_cut17_angle = qt_regular_row4_cut17_angle_qt;
regular_row4_cut18_depth = qt_regular_row4_cut18_depth_qt;
regular_row4_cut18_distance = qt_regular_row4_cut18_distance_qt;
regular_row4_cut18_angle = qt_regular_row4_cut18_angle_qt;
regular_row4_cut19_depth = qt_regular_row4_cut19_depth_qt;
regular_row4_cut19_distance = qt_regular_row4_cut19_distance_qt;
regular_row4_cut19_angle = qt_regular_row4_cut19_angle_qt;
regular_row4_cut20_depth = qt_regular_row4_cut20_depth_qt;
regular_row4_cut20_distance = qt_regular_row4_cut20_distance_qt;
regular_row4_cut20_angle = qt_regular_row4_cut20_angle_qt;
regular_row4_cut21_depth = qt_regular_row4_cut21_depth_qt;
regular_row4_cut21_distance = qt_regular_row4_cut21_distance_qt;
regular_row4_cut21_angle = qt_regular_row4_cut21_angle_qt;
regular_row4_cut22_depth = qt_regular_row4_cut22_depth_qt;
regular_row4_cut22_distance = qt_regular_row4_cut22_distance_qt;
regular_row4_cut22_angle = qt_regular_row4_cut22_angle_qt;

//VARIABLES OF ROW5
regular_row5_number_of_pins = qt_regular_row5_number_of_pins_qt;
regular_row5_offset_on_x = qt_regular_row5_offset_on_x_qt;
regular_row5_offset_on_z = qt_regular_row5_offset_on_z_qt;
regular_row5_angle_on_y = qt_regular_row5_angle_on_y_qt;
regular_row5_mirror = qt_regular_row5_mirror_qt;
regular_row5_linked = qt_regular_row5_linked_qt;
regular_row5_link_root_addition = qt_regular_row5_link_root_addition_qt;
regular_row5_shoulder_distance = qt_regular_row5_shoulder_distance_qt;
regular_row5_interpin_space = qt_regular_row5_interpin_space_qt;
//VARIABLES OF ROW5 CUT SHAPE
regular_row5_cut_to_use = qt_regular_row5_cut_to_use_qt;
regular_row5_prism_root_x = qt_regular_row5_prism_root_x_qt;
regular_row5_prism_root_y = qt_regular_row5_prism_root_y_qt;
regular_row5_prism_angle_x = qt_regular_row5_prism_angle_x_qt;
regular_row5_prism_angle_y = qt_regular_row5_prism_angle_y_qt;
regular_row5_prism_height = qt_regular_row5_prism_height_qt;
regular_row5_cone_height = qt_regular_row5_cone_height_qt;
regular_row5_cone_bottom_diameter = qt_regular_row5_cone_bottom_diameter_qt;
regular_row5_cone_angle = qt_regular_row5_cone_angle_qt;
regular_row5_cone_number_of_faces = qt_regular_row5_cone_number_of_faces_qt;
regular_row5_laser_mill_height = qt_regular_row5_laser_mill_height_qt;
regular_row5_laser_mill_diameter = qt_regular_row5_laser_mill_diameter_qt;
regular_row5_laser_mill_number_of_faces = qt_regular_row5_laser_mill_number_of_faces_qt;
regular_row5_laser_mill_center = qt_regular_row5_laser_mill_center_qt;
regular_row5_stl_mill_name = qt_regular_row5_stl_mill_name_qt;
//VARIABLES OF ROW5 CUTS DEPTH, SPACES AND ANGLE ON Z
regular_row5_cut01_depth = qt_regular_row5_cut01_depth_qt;
regular_row5_cut01_distance = qt_regular_row5_cut01_distance_qt;
regular_row5_cut01_angle = qt_regular_row5_cut01_angle_qt;
regular_row5_cut02_depth = qt_regular_row5_cut02_depth_qt;
regular_row5_cut02_distance = qt_regular_row5_cut02_distance_qt;
regular_row5_cut02_angle = qt_regular_row5_cut02_angle_qt;
regular_row5_cut03_depth = qt_regular_row5_cut03_depth_qt;
regular_row5_cut03_distance = qt_regular_row5_cut03_distance_qt;
regular_row5_cut03_angle = qt_regular_row5_cut03_angle_qt;
regular_row5_cut04_depth = qt_regular_row5_cut04_depth_qt;
regular_row5_cut04_distance = qt_regular_row5_cut04_distance_qt;
regular_row5_cut04_angle = qt_regular_row5_cut04_angle_qt;
regular_row5_cut05_depth = qt_regular_row5_cut05_depth_qt;
regular_row5_cut05_distance = qt_regular_row5_cut05_distance_qt;
regular_row5_cut05_angle = qt_regular_row5_cut05_angle_qt;
regular_row5_cut06_depth = qt_regular_row5_cut06_depth_qt;
regular_row5_cut06_distance = qt_regular_row5_cut06_distance_qt;
regular_row5_cut06_angle = qt_regular_row5_cut06_angle_qt;
regular_row5_cut07_depth = qt_regular_row5_cut07_depth_qt;
regular_row5_cut07_distance = qt_regular_row5_cut07_distance_qt;
regular_row5_cut07_angle = qt_regular_row5_cut07_angle_qt;
regular_row5_cut08_depth = qt_regular_row5_cut08_depth_qt;
regular_row5_cut08_distance = qt_regular_row5_cut08_distance_qt;
regular_row5_cut08_angle = qt_regular_row5_cut08_angle_qt;
regular_row5_cut09_depth = qt_regular_row5_cut09_depth_qt;
regular_row5_cut09_distance = qt_regular_row5_cut09_distance_qt;
regular_row5_cut09_angle = qt_regular_row5_cut09_angle_qt;
regular_row5_cut10_depth = qt_regular_row5_cut10_depth_qt;
regular_row5_cut10_distance = qt_regular_row5_cut10_distance_qt;
regular_row5_cut10_angle = qt_regular_row5_cut10_angle_qt;
regular_row5_cut11_depth = qt_regular_row5_cut11_depth_qt;
regular_row5_cut11_distance = qt_regular_row5_cut11_distance_qt;
regular_row5_cut11_angle = qt_regular_row5_cut11_angle_qt;
regular_row5_cut12_depth = qt_regular_row5_cut12_depth_qt;
regular_row5_cut12_distance = qt_regular_row5_cut12_distance_qt;
regular_row5_cut12_angle = qt_regular_row5_cut12_angle_qt;
regular_row5_cut13_depth = qt_regular_row5_cut13_depth_qt;
regular_row5_cut13_distance = qt_regular_row5_cut13_distance_qt;
regular_row5_cut13_angle = qt_regular_row5_cut13_angle_qt;
regular_row5_cut14_depth = qt_regular_row5_cut14_depth_qt;
regular_row5_cut14_distance = qt_regular_row5_cut14_distance_qt;
regular_row5_cut14_angle = qt_regular_row5_cut14_angle_qt;
regular_row5_cut15_depth = qt_regular_row5_cut15_depth_qt;
regular_row5_cut15_distance = qt_regular_row5_cut15_distance_qt;
regular_row5_cut15_angle = qt_regular_row5_cut15_angle_qt;
regular_row5_cut16_depth = qt_regular_row5_cut16_depth_qt;
regular_row5_cut16_distance = qt_regular_row5_cut16_distance_qt;
regular_row5_cut16_angle = qt_regular_row5_cut16_angle_qt;
regular_row5_cut17_depth = qt_regular_row5_cut17_depth_qt;
regular_row5_cut17_distance = qt_regular_row5_cut17_distance_qt;
regular_row5_cut17_angle = qt_regular_row5_cut17_angle_qt;
regular_row5_cut18_depth = qt_regular_row5_cut18_depth_qt;
regular_row5_cut18_distance = qt_regular_row5_cut18_distance_qt;
regular_row5_cut18_angle = qt_regular_row5_cut18_angle_qt;
regular_row5_cut19_depth = qt_regular_row5_cut19_depth_qt;
regular_row5_cut19_distance = qt_regular_row5_cut19_distance_qt;
regular_row5_cut19_angle = qt_regular_row5_cut19_angle_qt;
regular_row5_cut20_depth = qt_regular_row5_cut20_depth_qt;
regular_row5_cut20_distance = qt_regular_row5_cut20_distance_qt;
regular_row5_cut20_angle = qt_regular_row5_cut20_angle_qt;
regular_row5_cut21_depth = qt_regular_row5_cut21_depth_qt;
regular_row5_cut21_distance = qt_regular_row5_cut21_distance_qt;
regular_row5_cut21_angle = qt_regular_row5_cut21_angle_qt;
regular_row5_cut22_depth = qt_regular_row5_cut22_depth_qt;
regular_row5_cut22_distance = qt_regular_row5_cut22_distance_qt;
regular_row5_cut22_angle = qt_regular_row5_cut22_angle_qt;

//VARIABLES OF ROW6
regular_row6_number_of_pins = qt_regular_row6_number_of_pins_qt;
regular_row6_offset_on_x = qt_regular_row6_offset_on_x_qt;
regular_row6_offset_on_z = qt_regular_row6_offset_on_z_qt;
regular_row6_angle_on_y = qt_regular_row6_angle_on_y_qt;
regular_row6_mirror = qt_regular_row6_mirror_qt;
regular_row6_linked = qt_regular_row6_linked_qt;
regular_row6_link_root_addition = qt_regular_row6_link_root_addition_qt;
regular_row6_shoulder_distance = qt_regular_row6_shoulder_distance_qt;
regular_row6_interpin_space = qt_regular_row6_interpin_space_qt;
//VARIABLES OF ROW6 CUT SHAPE
regular_row6_cut_to_use = qt_regular_row6_cut_to_use_qt;
regular_row6_prism_root_x = qt_regular_row6_prism_root_x_qt;
regular_row6_prism_root_y = qt_regular_row6_prism_root_y_qt;
regular_row6_prism_angle_x = qt_regular_row6_prism_angle_x_qt;
regular_row6_prism_angle_y = qt_regular_row6_prism_angle_y_qt;
regular_row6_prism_height = qt_regular_row6_prism_height_qt;
regular_row6_cone_height = qt_regular_row6_cone_height_qt;
regular_row6_cone_bottom_diameter = qt_regular_row6_cone_bottom_diameter_qt;
regular_row6_cone_angle = qt_regular_row6_cone_angle_qt;
regular_row6_cone_number_of_faces = qt_regular_row6_cone_number_of_faces_qt;
regular_row6_laser_mill_height = qt_regular_row6_laser_mill_height_qt;
regular_row6_laser_mill_diameter = qt_regular_row6_laser_mill_diameter_qt;
regular_row6_laser_mill_number_of_faces = qt_regular_row6_laser_mill_number_of_faces_qt;
regular_row6_laser_mill_center = qt_regular_row6_laser_mill_center_qt;
regular_row6_stl_mill_name = qt_regular_row6_stl_mill_name_qt;
//VARIABLES OF ROW6 CUTS DEPTH, SPACES AND ANGLE ON Z
regular_row6_cut01_depth = qt_regular_row6_cut01_depth_qt;
regular_row6_cut01_distance = qt_regular_row6_cut01_distance_qt;
regular_row6_cut01_angle = qt_regular_row6_cut01_angle_qt;
regular_row6_cut02_depth = qt_regular_row6_cut02_depth_qt;
regular_row6_cut02_distance = qt_regular_row6_cut02_distance_qt;
regular_row6_cut02_angle = qt_regular_row6_cut02_angle_qt;
regular_row6_cut03_depth = qt_regular_row6_cut03_depth_qt;
regular_row6_cut03_distance = qt_regular_row6_cut03_distance_qt;
regular_row6_cut03_angle = qt_regular_row6_cut03_angle_qt;
regular_row6_cut04_depth = qt_regular_row6_cut04_depth_qt;
regular_row6_cut04_distance = qt_regular_row6_cut04_distance_qt;
regular_row6_cut04_angle = qt_regular_row6_cut04_angle_qt;
regular_row6_cut05_depth = qt_regular_row6_cut05_depth_qt;
regular_row6_cut05_distance = qt_regular_row6_cut05_distance_qt;
regular_row6_cut05_angle = qt_regular_row6_cut05_angle_qt;
regular_row6_cut06_depth = qt_regular_row6_cut06_depth_qt;
regular_row6_cut06_distance = qt_regular_row6_cut06_distance_qt;
regular_row6_cut06_angle = qt_regular_row6_cut06_angle_qt;
regular_row6_cut07_depth = qt_regular_row6_cut07_depth_qt;
regular_row6_cut07_distance = qt_regular_row6_cut07_distance_qt;
regular_row6_cut07_angle = qt_regular_row6_cut07_angle_qt;
regular_row6_cut08_depth = qt_regular_row6_cut08_depth_qt;
regular_row6_cut08_distance = qt_regular_row6_cut08_distance_qt;
regular_row6_cut08_angle = qt_regular_row6_cut08_angle_qt;
regular_row6_cut09_depth = qt_regular_row6_cut09_depth_qt;
regular_row6_cut09_distance = qt_regular_row6_cut09_distance_qt;
regular_row6_cut09_angle = qt_regular_row6_cut09_angle_qt;
regular_row6_cut10_depth = qt_regular_row6_cut10_depth_qt;
regular_row6_cut10_distance = qt_regular_row6_cut10_distance_qt;
regular_row6_cut10_angle = qt_regular_row6_cut10_angle_qt;
regular_row6_cut11_depth = qt_regular_row6_cut11_depth_qt;
regular_row6_cut11_distance = qt_regular_row6_cut11_distance_qt;
regular_row6_cut11_angle = qt_regular_row6_cut11_angle_qt;
regular_row6_cut12_depth = qt_regular_row6_cut12_depth_qt;
regular_row6_cut12_distance = qt_regular_row6_cut12_distance_qt;
regular_row6_cut12_angle = qt_regular_row6_cut12_angle_qt;
regular_row6_cut13_depth = qt_regular_row6_cut13_depth_qt;
regular_row6_cut13_distance = qt_regular_row6_cut13_distance_qt;
regular_row6_cut13_angle = qt_regular_row6_cut13_angle_qt;
regular_row6_cut14_depth = qt_regular_row6_cut14_depth_qt;
regular_row6_cut14_distance = qt_regular_row6_cut14_distance_qt;
regular_row6_cut14_angle = qt_regular_row6_cut14_angle_qt;
regular_row6_cut15_depth = qt_regular_row6_cut15_depth_qt;
regular_row6_cut15_distance = qt_regular_row6_cut15_distance_qt;
regular_row6_cut15_angle = qt_regular_row6_cut15_angle_qt;
regular_row6_cut16_depth = qt_regular_row6_cut16_depth_qt;
regular_row6_cut16_distance = qt_regular_row6_cut16_distance_qt;
regular_row6_cut16_angle = qt_regular_row6_cut16_angle_qt;
regular_row6_cut17_depth = qt_regular_row6_cut17_depth_qt;
regular_row6_cut17_distance = qt_regular_row6_cut17_distance_qt;
regular_row6_cut17_angle = qt_regular_row6_cut17_angle_qt;
regular_row6_cut18_depth = qt_regular_row6_cut18_depth_qt;
regular_row6_cut18_distance = qt_regular_row6_cut18_distance_qt;
regular_row6_cut18_angle = qt_regular_row6_cut18_angle_qt;
regular_row6_cut19_depth = qt_regular_row6_cut19_depth_qt;
regular_row6_cut19_distance = qt_regular_row6_cut19_distance_qt;
regular_row6_cut19_angle = qt_regular_row6_cut19_angle_qt;
regular_row6_cut20_depth = qt_regular_row6_cut20_depth_qt;
regular_row6_cut20_distance = qt_regular_row6_cut20_distance_qt;
regular_row6_cut20_angle = qt_regular_row6_cut20_angle_qt;
regular_row6_cut21_depth = qt_regular_row6_cut21_depth_qt;
regular_row6_cut21_distance = qt_regular_row6_cut21_distance_qt;
regular_row6_cut21_angle = qt_regular_row6_cut21_angle_qt;
regular_row6_cut22_depth = qt_regular_row6_cut22_depth_qt;
regular_row6_cut22_distance = qt_regular_row6_cut22_distance_qt;
regular_row6_cut22_angle = qt_regular_row6_cut22_angle_qt;

//VARIABLES OF SONIC
regular_sonic_plug_diameter = qt_regular_sonic_plug_diameter_qt;
regular_sonic_number_of_pins = qt_regular_sonic_number_of_pins_qt;
regular_sonic_offset_on_x = qt_regular_sonic_offset_on_x_qt;
regular_sonic_offset_on_z = qt_regular_sonic_offset_on_z_qt;
regular_sonic_angle_on_y = qt_regular_sonic_angle_on_y_qt;
regular_sonic_mirror = qt_regular_sonic_mirror_qt;
regular_sonic_linked = qt_regular_sonic_linked_qt;
regular_sonic_link_root_addition = qt_regular_sonic_link_root_addition_qt;
regular_sonic_shoulder_distance = qt_regular_sonic_shoulder_distance_qt;
regular_sonic_interpin_space = qt_regular_sonic_interpin_space_qt;
//VARIABLES OF sonic CUT SHAPE
regular_sonic_cut_to_use = qt_regular_sonic_cut_to_use_qt;
regular_sonic_prism_root_x = qt_regular_sonic_prism_root_x_qt;
regular_sonic_prism_root_y = qt_regular_sonic_prism_root_y_qt;
regular_sonic_prism_angle_x = qt_regular_sonic_prism_angle_x_qt;
regular_sonic_prism_angle_y = qt_regular_sonic_prism_angle_y_qt;
regular_sonic_prism_height = qt_regular_sonic_prism_height_qt;
regular_sonic_cone_height = qt_regular_sonic_cone_height_qt;
regular_sonic_cone_bottom_diameter = qt_regular_sonic_cone_bottom_diameter_qt;
regular_sonic_cone_angle = qt_regular_sonic_cone_angle_qt;
regular_sonic_cone_number_of_faces = qt_regular_sonic_cone_number_of_faces_qt;
regular_sonic_laser_mill_height = qt_regular_sonic_laser_mill_height_qt;
regular_sonic_laser_mill_diameter = qt_regular_sonic_laser_mill_diameter_qt;
regular_sonic_laser_mill_number_of_faces = qt_regular_sonic_laser_mill_number_of_faces_qt;
regular_sonic_laser_mill_center = qt_regular_sonic_laser_mill_center_qt;
regular_sonic_stl_mill_name = qt_regular_sonic_stl_mill_name_qt;
//VARIABLES OF sonic CUTS DEPTH, SPACES AND ANGLE ON Z
regular_sonic_cut01_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut01_depth_qt;
regular_sonic_cut01_distance = qt_regular_sonic_cut01_distance_qt;
regular_sonic_cut01_angle = qt_regular_sonic_cut01_angle_qt;
regular_sonic_cut02_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut02_depth_qt;
regular_sonic_cut02_distance = qt_regular_sonic_cut02_distance_qt;
regular_sonic_cut02_angle = qt_regular_sonic_cut02_angle_qt;
regular_sonic_cut03_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut03_depth_qt;
regular_sonic_cut03_distance = qt_regular_sonic_cut03_distance_qt;
regular_sonic_cut03_angle = qt_regular_sonic_cut03_angle_qt;
regular_sonic_cut04_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut04_depth_qt;
regular_sonic_cut04_distance = qt_regular_sonic_cut04_distance_qt;
regular_sonic_cut04_angle = qt_regular_sonic_cut04_angle_qt;
regular_sonic_cut05_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut05_depth_qt;
regular_sonic_cut05_distance = qt_regular_sonic_cut05_distance_qt;
regular_sonic_cut05_angle = qt_regular_sonic_cut05_angle_qt;
regular_sonic_cut06_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut06_depth_qt;
regular_sonic_cut06_distance = qt_regular_sonic_cut06_distance_qt;
regular_sonic_cut06_angle = qt_regular_sonic_cut06_angle_qt;
regular_sonic_cut07_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut07_depth_qt;
regular_sonic_cut07_distance = qt_regular_sonic_cut07_distance_qt;
regular_sonic_cut07_angle = qt_regular_sonic_cut07_angle_qt;
regular_sonic_cut08_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut08_depth_qt;
regular_sonic_cut08_distance = qt_regular_sonic_cut08_distance_qt;
regular_sonic_cut08_angle = qt_regular_sonic_cut08_angle_qt;
regular_sonic_cut09_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut09_depth_qt;
regular_sonic_cut09_distance = qt_regular_sonic_cut09_distance_qt;
regular_sonic_cut09_angle = qt_regular_sonic_cut09_angle_qt;
regular_sonic_cut10_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut10_depth_qt;
regular_sonic_cut10_distance = qt_regular_sonic_cut10_distance_qt;
regular_sonic_cut10_angle = qt_regular_sonic_cut10_angle_qt;
regular_sonic_cut11_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut11_depth_qt;
regular_sonic_cut11_distance = qt_regular_sonic_cut11_distance_qt;
regular_sonic_cut11_angle = qt_regular_sonic_cut11_angle_qt;
regular_sonic_cut12_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut12_depth_qt;
regular_sonic_cut12_distance = qt_regular_sonic_cut12_distance_qt;
regular_sonic_cut12_angle = qt_regular_sonic_cut12_angle_qt;
regular_sonic_cut13_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut13_depth_qt;
regular_sonic_cut13_distance = qt_regular_sonic_cut13_distance_qt;
regular_sonic_cut13_angle = qt_regular_sonic_cut13_angle_qt;
regular_sonic_cut14_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut14_depth_qt;
regular_sonic_cut14_distance = qt_regular_sonic_cut14_distance_qt;
regular_sonic_cut14_angle = qt_regular_sonic_cut14_angle_qt;
regular_sonic_cut15_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut15_depth_qt;
regular_sonic_cut15_distance = qt_regular_sonic_cut15_distance_qt;
regular_sonic_cut15_angle = qt_regular_sonic_cut15_angle_qt;
regular_sonic_cut16_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut16_depth_qt;
regular_sonic_cut16_distance = qt_regular_sonic_cut16_distance_qt;
regular_sonic_cut16_angle = qt_regular_sonic_cut16_angle_qt;
regular_sonic_cut17_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut17_depth_qt;
regular_sonic_cut17_distance = qt_regular_sonic_cut17_distance_qt;
regular_sonic_cut17_angle = qt_regular_sonic_cut17_angle_qt;
regular_sonic_cut18_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut18_depth_qt;
regular_sonic_cut18_distance = qt_regular_sonic_cut18_distance_qt;
regular_sonic_cut18_angle = qt_regular_sonic_cut18_angle_qt;
regular_sonic_cut19_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut19_depth_qt;
regular_sonic_cut19_distance = qt_regular_sonic_cut19_distance_qt;
regular_sonic_cut19_angle = qt_regular_sonic_cut19_angle_qt;
regular_sonic_cut20_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut20_depth_qt;
regular_sonic_cut20_distance = qt_regular_sonic_cut20_distance_qt;
regular_sonic_cut20_angle = qt_regular_sonic_cut20_angle_qt;
regular_sonic_cut21_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut21_depth_qt;
regular_sonic_cut21_distance = qt_regular_sonic_cut21_distance_qt;
regular_sonic_cut21_angle = qt_regular_sonic_cut21_angle_qt;
regular_sonic_cut22_depth = regular_sonic_plug_diameter - qt_regular_sonic_cut22_depth_qt;
regular_sonic_cut22_distance = qt_regular_sonic_cut22_distance_qt;
regular_sonic_cut22_angle = qt_regular_sonic_cut22_angle_qt;








//VARIABLES OF DIMPLE CUTTINGS LEVEL 2
//VARIABLES OF ROW1
dimple_row1_number_of_pins = qt_dimple_row1_number_of_pins_qt;
dimple_row1_offset_on_x = qt_dimple_row1_offset_on_x_qt;
dimple_row1_offset_on_z = qt_dimple_row1_offset_on_z_qt;
dimple_row1_angle_on_y = qt_dimple_row1_angle_on_y_qt;
dimple_row1_mirror = qt_dimple_row1_mirror_qt;
dimple_row1_linked = qt_dimple_row1_linked_qt;
dimple_row1_link_root_addition = qt_dimple_row1_link_root_addition_qt;
dimple_row1_shoulder_distance = qt_dimple_row1_shoulder_distance_qt;
dimple_row1_interpin_space = qt_dimple_row1_interpin_space_qt;
//VARIABLES OF ROW1 CUT SHAPE
dimple_row1_cut_to_use = qt_dimple_row1_cut_to_use_qt;
dimple_row1_prism_root_x = qt_dimple_row1_prism_root_x_qt;
dimple_row1_prism_root_y = qt_dimple_row1_prism_root_y_qt;
dimple_row1_prism_angle_x = qt_dimple_row1_prism_angle_x_qt;
dimple_row1_prism_angle_y = qt_dimple_row1_prism_angle_y_qt;
dimple_row1_prism_height = qt_dimple_row1_prism_height_qt;
dimple_row1_cone_height = qt_dimple_row1_cone_height_qt;
dimple_row1_cone_bottom_diameter = qt_dimple_row1_cone_bottom_diameter_qt;
dimple_row1_cone_angle = qt_dimple_row1_cone_angle_qt;
dimple_row1_cone_number_of_faces = qt_dimple_row1_cone_number_of_faces_qt;
dimple_row1_laser_mill_height = qt_dimple_row1_laser_mill_height_qt;
dimple_row1_laser_mill_diameter = qt_dimple_row1_laser_mill_diameter_qt;
dimple_row1_laser_mill_number_of_faces = qt_dimple_row1_laser_mill_number_of_faces_qt;
dimple_row1_laser_mill_center = qt_dimple_row1_laser_mill_center_qt;
dimple_row1_stl_mill_name = qt_dimple_row1_stl_mill_name_qt;
//VARIABLES OF ROW1 CUTS DEPTH, SPACES AND ANGLE ON Z
dimple_row1_cut01_depth = qt_dimple_row1_cut01_depth_qt;
dimple_row1_cut01_distance = qt_dimple_row1_cut01_distance_qt;
dimple_row1_cut01_angle = qt_dimple_row1_cut01_angle_qt;
dimple_row1_cut02_depth = qt_dimple_row1_cut02_depth_qt;
dimple_row1_cut02_distance = qt_dimple_row1_cut02_distance_qt;
dimple_row1_cut02_angle = qt_dimple_row1_cut02_angle_qt;
dimple_row1_cut03_depth = qt_dimple_row1_cut03_depth_qt;
dimple_row1_cut03_distance = qt_dimple_row1_cut03_distance_qt;
dimple_row1_cut03_angle = qt_dimple_row1_cut03_angle_qt;
dimple_row1_cut04_depth = qt_dimple_row1_cut04_depth_qt;
dimple_row1_cut04_distance = qt_dimple_row1_cut04_distance_qt;
dimple_row1_cut04_angle = qt_dimple_row1_cut04_angle_qt;
dimple_row1_cut05_depth = qt_dimple_row1_cut05_depth_qt;
dimple_row1_cut05_distance = qt_dimple_row1_cut05_distance_qt;
dimple_row1_cut05_angle = qt_dimple_row1_cut05_angle_qt;
dimple_row1_cut06_depth = qt_dimple_row1_cut06_depth_qt;
dimple_row1_cut06_distance = qt_dimple_row1_cut06_distance_qt;
dimple_row1_cut06_angle = qt_dimple_row1_cut06_angle_qt;
dimple_row1_cut07_depth = qt_dimple_row1_cut07_depth_qt;
dimple_row1_cut07_distance = qt_dimple_row1_cut07_distance_qt;
dimple_row1_cut07_angle = qt_dimple_row1_cut07_angle_qt;
dimple_row1_cut08_depth = qt_dimple_row1_cut08_depth_qt;
dimple_row1_cut08_distance = qt_dimple_row1_cut08_distance_qt;
dimple_row1_cut08_angle = qt_dimple_row1_cut08_angle_qt;
dimple_row1_cut09_depth = qt_dimple_row1_cut09_depth_qt;
dimple_row1_cut09_distance = qt_dimple_row1_cut09_distance_qt;
dimple_row1_cut09_angle = qt_dimple_row1_cut09_angle_qt;
dimple_row1_cut10_depth = qt_dimple_row1_cut10_depth_qt;
dimple_row1_cut10_distance = qt_dimple_row1_cut10_distance_qt;
dimple_row1_cut10_angle = qt_dimple_row1_cut10_angle_qt;
dimple_row1_cut11_depth = qt_dimple_row1_cut11_depth_qt;
dimple_row1_cut11_distance = qt_dimple_row1_cut11_distance_qt;
dimple_row1_cut11_angle = qt_dimple_row1_cut11_angle_qt;
dimple_row1_cut12_depth = qt_dimple_row1_cut12_depth_qt;
dimple_row1_cut12_distance = qt_dimple_row1_cut12_distance_qt;
dimple_row1_cut12_angle = qt_dimple_row1_cut12_angle_qt;
dimple_row1_cut13_depth = qt_dimple_row1_cut13_depth_qt;
dimple_row1_cut13_distance = qt_dimple_row1_cut13_distance_qt;
dimple_row1_cut13_angle = qt_dimple_row1_cut13_angle_qt;
dimple_row1_cut14_depth = qt_dimple_row1_cut14_depth_qt;
dimple_row1_cut14_distance = qt_dimple_row1_cut14_distance_qt;
dimple_row1_cut14_angle = qt_dimple_row1_cut14_angle_qt;
dimple_row1_cut15_depth = qt_dimple_row1_cut15_depth_qt;
dimple_row1_cut15_distance = qt_dimple_row1_cut15_distance_qt;
dimple_row1_cut15_angle = qt_dimple_row1_cut15_angle_qt;
dimple_row1_cut16_depth = qt_dimple_row1_cut16_depth_qt;
dimple_row1_cut16_distance = qt_dimple_row1_cut16_distance_qt;
dimple_row1_cut16_angle = qt_dimple_row1_cut16_angle_qt;
dimple_row1_cut17_depth = qt_dimple_row1_cut17_depth_qt;
dimple_row1_cut17_distance = qt_dimple_row1_cut17_distance_qt;
dimple_row1_cut17_angle = qt_dimple_row1_cut17_angle_qt;
dimple_row1_cut18_depth = qt_dimple_row1_cut18_depth_qt;
dimple_row1_cut18_distance = qt_dimple_row1_cut18_distance_qt;
dimple_row1_cut18_angle = qt_dimple_row1_cut18_angle_qt;
dimple_row1_cut19_depth = qt_dimple_row1_cut19_depth_qt;
dimple_row1_cut19_distance = qt_dimple_row1_cut19_distance_qt;
dimple_row1_cut19_angle = qt_dimple_row1_cut19_angle_qt;
dimple_row1_cut20_depth = qt_dimple_row1_cut20_depth_qt;
dimple_row1_cut20_distance = qt_dimple_row1_cut20_distance_qt;
dimple_row1_cut20_angle = qt_dimple_row1_cut20_angle_qt;
dimple_row1_cut21_depth = qt_dimple_row1_cut21_depth_qt;
dimple_row1_cut21_distance = qt_dimple_row1_cut21_distance_qt;
dimple_row1_cut21_angle = qt_dimple_row1_cut21_angle_qt;
dimple_row1_cut22_depth = qt_dimple_row1_cut22_depth_qt;
dimple_row1_cut22_distance = qt_dimple_row1_cut22_distance_qt;
dimple_row1_cut22_angle = qt_dimple_row1_cut22_angle_qt;

//VARIABLES OF ROW2
dimple_row2_number_of_pins = qt_dimple_row2_number_of_pins_qt;
dimple_row2_offset_on_x = qt_dimple_row2_offset_on_x_qt;
dimple_row2_offset_on_z = qt_dimple_row2_offset_on_z_qt;
dimple_row2_angle_on_y = qt_dimple_row2_angle_on_y_qt;
dimple_row2_mirror = qt_dimple_row2_mirror_qt;
dimple_row2_linked = qt_dimple_row2_linked_qt;
dimple_row2_link_root_addition = qt_dimple_row2_link_root_addition_qt;
dimple_row2_shoulder_distance = qt_dimple_row2_shoulder_distance_qt;
dimple_row2_interpin_space = qt_dimple_row2_interpin_space_qt;
//VARIABLES OF ROW2 CUT SHAPE
dimple_row2_cut_to_use = qt_dimple_row2_cut_to_use_qt;
dimple_row2_prism_root_x = qt_dimple_row2_prism_root_x_qt;
dimple_row2_prism_root_y = qt_dimple_row2_prism_root_y_qt;
dimple_row2_prism_angle_x = qt_dimple_row2_prism_angle_x_qt;
dimple_row2_prism_angle_y = qt_dimple_row2_prism_angle_y_qt;
dimple_row2_prism_height = qt_dimple_row2_prism_height_qt;
dimple_row2_cone_height = qt_dimple_row2_cone_height_qt;
dimple_row2_cone_bottom_diameter = qt_dimple_row2_cone_bottom_diameter_qt;
dimple_row2_cone_angle = qt_dimple_row2_cone_angle_qt;
dimple_row2_cone_number_of_faces = qt_dimple_row2_cone_number_of_faces_qt;
dimple_row2_laser_mill_height = qt_dimple_row2_laser_mill_height_qt;
dimple_row2_laser_mill_diameter = qt_dimple_row2_laser_mill_diameter_qt;
dimple_row2_laser_mill_number_of_faces = qt_dimple_row2_laser_mill_number_of_faces_qt;
dimple_row2_laser_mill_center = qt_dimple_row2_laser_mill_center_qt;
dimple_row2_stl_mill_name = qt_dimple_row2_stl_mill_name_qt;
//VARIABLES OF ROW2 CUTS DEPTH, SPACES AND ANGLE ON Z
dimple_row2_cut01_depth = qt_dimple_row2_cut01_depth_qt;
dimple_row2_cut01_distance = qt_dimple_row2_cut01_distance_qt;
dimple_row2_cut01_angle = qt_dimple_row2_cut01_angle_qt;
dimple_row2_cut02_depth = qt_dimple_row2_cut02_depth_qt;
dimple_row2_cut02_distance = qt_dimple_row2_cut02_distance_qt;
dimple_row2_cut02_angle = qt_dimple_row2_cut02_angle_qt;
dimple_row2_cut03_depth = qt_dimple_row2_cut03_depth_qt;
dimple_row2_cut03_distance = qt_dimple_row2_cut03_distance_qt;
dimple_row2_cut03_angle = qt_dimple_row2_cut03_angle_qt;
dimple_row2_cut04_depth = qt_dimple_row2_cut04_depth_qt;
dimple_row2_cut04_distance = qt_dimple_row2_cut04_distance_qt;
dimple_row2_cut04_angle = qt_dimple_row2_cut04_angle_qt;
dimple_row2_cut05_depth = qt_dimple_row2_cut05_depth_qt;
dimple_row2_cut05_distance = qt_dimple_row2_cut05_distance_qt;
dimple_row2_cut05_angle = qt_dimple_row2_cut05_angle_qt;
dimple_row2_cut06_depth = qt_dimple_row2_cut06_depth_qt;
dimple_row2_cut06_distance = qt_dimple_row2_cut06_distance_qt;
dimple_row2_cut06_angle = qt_dimple_row2_cut06_angle_qt;
dimple_row2_cut07_depth = qt_dimple_row2_cut07_depth_qt;
dimple_row2_cut07_distance = qt_dimple_row2_cut07_distance_qt;
dimple_row2_cut07_angle = qt_dimple_row2_cut07_angle_qt;
dimple_row2_cut08_depth = qt_dimple_row2_cut08_depth_qt;
dimple_row2_cut08_distance = qt_dimple_row2_cut08_distance_qt;
dimple_row2_cut08_angle = qt_dimple_row2_cut08_angle_qt;
dimple_row2_cut09_depth = qt_dimple_row2_cut09_depth_qt;
dimple_row2_cut09_distance = qt_dimple_row2_cut09_distance_qt;
dimple_row2_cut09_angle = qt_dimple_row2_cut09_angle_qt;
dimple_row2_cut10_depth = qt_dimple_row2_cut10_depth_qt;
dimple_row2_cut10_distance = qt_dimple_row2_cut10_distance_qt;
dimple_row2_cut10_angle = qt_dimple_row2_cut10_angle_qt;
dimple_row2_cut11_depth = qt_dimple_row2_cut11_depth_qt;
dimple_row2_cut11_distance = qt_dimple_row2_cut11_distance_qt;
dimple_row2_cut11_angle = qt_dimple_row2_cut11_angle_qt;
dimple_row2_cut12_depth = qt_dimple_row2_cut12_depth_qt;
dimple_row2_cut12_distance = qt_dimple_row2_cut12_distance_qt;
dimple_row2_cut12_angle = qt_dimple_row2_cut12_angle_qt;
dimple_row2_cut13_depth = qt_dimple_row2_cut13_depth_qt;
dimple_row2_cut13_distance = qt_dimple_row2_cut13_distance_qt;
dimple_row2_cut13_angle = qt_dimple_row2_cut13_angle_qt;
dimple_row2_cut14_depth = qt_dimple_row2_cut14_depth_qt;
dimple_row2_cut14_distance = qt_dimple_row2_cut14_distance_qt;
dimple_row2_cut14_angle = qt_dimple_row2_cut14_angle_qt;
dimple_row2_cut15_depth = qt_dimple_row2_cut15_depth_qt;
dimple_row2_cut15_distance = qt_dimple_row2_cut15_distance_qt;
dimple_row2_cut15_angle = qt_dimple_row2_cut15_angle_qt;
dimple_row2_cut16_depth = qt_dimple_row2_cut16_depth_qt;
dimple_row2_cut16_distance = qt_dimple_row2_cut16_distance_qt;
dimple_row2_cut16_angle = qt_dimple_row2_cut16_angle_qt;
dimple_row2_cut17_depth = qt_dimple_row2_cut17_depth_qt;
dimple_row2_cut17_distance = qt_dimple_row2_cut17_distance_qt;
dimple_row2_cut17_angle = qt_dimple_row2_cut17_angle_qt;
dimple_row2_cut18_depth = qt_dimple_row2_cut18_depth_qt;
dimple_row2_cut18_distance = qt_dimple_row2_cut18_distance_qt;
dimple_row2_cut18_angle = qt_dimple_row2_cut18_angle_qt;
dimple_row2_cut19_depth = qt_dimple_row2_cut19_depth_qt;
dimple_row2_cut19_distance = qt_dimple_row2_cut19_distance_qt;
dimple_row2_cut19_angle = qt_dimple_row2_cut19_angle_qt;
dimple_row2_cut20_depth = qt_dimple_row2_cut20_depth_qt;
dimple_row2_cut20_distance = qt_dimple_row2_cut20_distance_qt;
dimple_row2_cut20_angle = qt_dimple_row2_cut20_angle_qt;
dimple_row2_cut21_depth = qt_dimple_row2_cut21_depth_qt;
dimple_row2_cut21_distance = qt_dimple_row2_cut21_distance_qt;
dimple_row2_cut21_angle = qt_dimple_row2_cut21_angle_qt;
dimple_row2_cut22_depth = qt_dimple_row2_cut22_depth_qt;
dimple_row2_cut22_distance = qt_dimple_row2_cut22_distance_qt;
dimple_row2_cut22_angle = qt_dimple_row2_cut22_angle_qt;

//VARIABLES OF ROW3
dimple_row3_number_of_pins = qt_dimple_row3_number_of_pins_qt;
dimple_row3_offset_on_x = qt_dimple_row3_offset_on_x_qt;
dimple_row3_offset_on_z = qt_dimple_row3_offset_on_z_qt;
dimple_row3_angle_on_y = qt_dimple_row3_angle_on_y_qt;
dimple_row3_mirror = qt_dimple_row3_mirror_qt;
dimple_row3_linked = qt_dimple_row3_linked_qt;
dimple_row3_link_root_addition = qt_dimple_row3_link_root_addition_qt;
dimple_row3_shoulder_distance = qt_dimple_row3_shoulder_distance_qt;
dimple_row3_interpin_space = qt_dimple_row3_interpin_space_qt;
//VARIABLES OF ROW3 CUT SHAPE
dimple_row3_cut_to_use = qt_dimple_row3_cut_to_use_qt;
dimple_row3_prism_root_x = qt_dimple_row3_prism_root_x_qt;
dimple_row3_prism_root_y = qt_dimple_row3_prism_root_y_qt;
dimple_row3_prism_angle_x = qt_dimple_row3_prism_angle_x_qt;
dimple_row3_prism_angle_y = qt_dimple_row3_prism_angle_y_qt;
dimple_row3_prism_height = qt_dimple_row3_prism_height_qt;
dimple_row3_cone_height = qt_dimple_row3_cone_height_qt;
dimple_row3_cone_bottom_diameter = qt_dimple_row3_cone_bottom_diameter_qt;
dimple_row3_cone_angle = qt_dimple_row3_cone_angle_qt;
dimple_row3_cone_number_of_faces = qt_dimple_row3_cone_number_of_faces_qt;
dimple_row3_laser_mill_height = qt_dimple_row3_laser_mill_height_qt;
dimple_row3_laser_mill_diameter = qt_dimple_row3_laser_mill_diameter_qt;
dimple_row3_laser_mill_number_of_faces = qt_dimple_row3_laser_mill_number_of_faces_qt;
dimple_row3_laser_mill_center = qt_dimple_row3_laser_mill_center_qt;
dimple_row3_stl_mill_name = qt_dimple_row3_stl_mill_name_qt;
//VARIABLES OF ROW3 CUTS DEPTH, SPACES AND ANGLE ON Z
dimple_row3_cut01_depth = qt_dimple_row3_cut01_depth_qt;
dimple_row3_cut01_distance = qt_dimple_row3_cut01_distance_qt;
dimple_row3_cut01_angle = qt_dimple_row3_cut01_angle_qt;
dimple_row3_cut02_depth = qt_dimple_row3_cut02_depth_qt;
dimple_row3_cut02_distance = qt_dimple_row3_cut02_distance_qt;
dimple_row3_cut02_angle = qt_dimple_row3_cut02_angle_qt;
dimple_row3_cut03_depth = qt_dimple_row3_cut03_depth_qt;
dimple_row3_cut03_distance = qt_dimple_row3_cut03_distance_qt;
dimple_row3_cut03_angle = qt_dimple_row3_cut03_angle_qt;
dimple_row3_cut04_depth = qt_dimple_row3_cut04_depth_qt;
dimple_row3_cut04_distance = qt_dimple_row3_cut04_distance_qt;
dimple_row3_cut04_angle = qt_dimple_row3_cut04_angle_qt;
dimple_row3_cut05_depth = qt_dimple_row3_cut05_depth_qt;
dimple_row3_cut05_distance = qt_dimple_row3_cut05_distance_qt;
dimple_row3_cut05_angle = qt_dimple_row3_cut05_angle_qt;
dimple_row3_cut06_depth = qt_dimple_row3_cut06_depth_qt;
dimple_row3_cut06_distance = qt_dimple_row3_cut06_distance_qt;
dimple_row3_cut06_angle = qt_dimple_row3_cut06_angle_qt;
dimple_row3_cut07_depth = qt_dimple_row3_cut07_depth_qt;
dimple_row3_cut07_distance = qt_dimple_row3_cut07_distance_qt;
dimple_row3_cut07_angle = qt_dimple_row3_cut07_angle_qt;
dimple_row3_cut08_depth = qt_dimple_row3_cut08_depth_qt;
dimple_row3_cut08_distance = qt_dimple_row3_cut08_distance_qt;
dimple_row3_cut08_angle = qt_dimple_row3_cut08_angle_qt;
dimple_row3_cut09_depth = qt_dimple_row3_cut09_depth_qt;
dimple_row3_cut09_distance = qt_dimple_row3_cut09_distance_qt;
dimple_row3_cut09_angle = qt_dimple_row3_cut09_angle_qt;
dimple_row3_cut10_depth = qt_dimple_row3_cut10_depth_qt;
dimple_row3_cut10_distance = qt_dimple_row3_cut10_distance_qt;
dimple_row3_cut10_angle = qt_dimple_row3_cut10_angle_qt;
dimple_row3_cut11_depth = qt_dimple_row3_cut11_depth_qt;
dimple_row3_cut11_distance = qt_dimple_row3_cut11_distance_qt;
dimple_row3_cut11_angle = qt_dimple_row3_cut11_angle_qt;
dimple_row3_cut12_depth = qt_dimple_row3_cut12_depth_qt;
dimple_row3_cut12_distance = qt_dimple_row3_cut12_distance_qt;
dimple_row3_cut12_angle = qt_dimple_row3_cut12_angle_qt;
dimple_row3_cut13_depth = qt_dimple_row3_cut13_depth_qt;
dimple_row3_cut13_distance = qt_dimple_row3_cut13_distance_qt;
dimple_row3_cut13_angle = qt_dimple_row3_cut13_angle_qt;
dimple_row3_cut14_depth = qt_dimple_row3_cut14_depth_qt;
dimple_row3_cut14_distance = qt_dimple_row3_cut14_distance_qt;
dimple_row3_cut14_angle = qt_dimple_row3_cut14_angle_qt;
dimple_row3_cut15_depth = qt_dimple_row3_cut15_depth_qt;
dimple_row3_cut15_distance = qt_dimple_row3_cut15_distance_qt;
dimple_row3_cut15_angle = qt_dimple_row3_cut15_angle_qt;
dimple_row3_cut16_depth = qt_dimple_row3_cut16_depth_qt;
dimple_row3_cut16_distance = qt_dimple_row3_cut16_distance_qt;
dimple_row3_cut16_angle = qt_dimple_row3_cut16_angle_qt;
dimple_row3_cut17_depth = qt_dimple_row3_cut17_depth_qt;
dimple_row3_cut17_distance = qt_dimple_row3_cut17_distance_qt;
dimple_row3_cut17_angle = qt_dimple_row3_cut17_angle_qt;
dimple_row3_cut18_depth = qt_dimple_row3_cut18_depth_qt;
dimple_row3_cut18_distance = qt_dimple_row3_cut18_distance_qt;
dimple_row3_cut18_angle = qt_dimple_row3_cut18_angle_qt;
dimple_row3_cut19_depth = qt_dimple_row3_cut19_depth_qt;
dimple_row3_cut19_distance = qt_dimple_row3_cut19_distance_qt;
dimple_row3_cut19_angle = qt_dimple_row3_cut19_angle_qt;
dimple_row3_cut20_depth = qt_dimple_row3_cut20_depth_qt;
dimple_row3_cut20_distance = qt_dimple_row3_cut20_distance_qt;
dimple_row3_cut20_angle = qt_dimple_row3_cut20_angle_qt;
dimple_row3_cut21_depth = qt_dimple_row3_cut21_depth_qt;
dimple_row3_cut21_distance = qt_dimple_row3_cut21_distance_qt;
dimple_row3_cut21_angle = qt_dimple_row3_cut21_angle_qt;
dimple_row3_cut22_depth = qt_dimple_row3_cut22_depth_qt;
dimple_row3_cut22_distance = qt_dimple_row3_cut22_distance_qt;
dimple_row3_cut22_angle = qt_dimple_row3_cut22_angle_qt;

//VARIABLES OF ROW4
dimple_row4_number_of_pins = qt_dimple_row4_number_of_pins_qt;
dimple_row4_offset_on_x = qt_dimple_row4_offset_on_x_qt;
dimple_row4_offset_on_z = qt_dimple_row4_offset_on_z_qt;
dimple_row4_angle_on_y = qt_dimple_row4_angle_on_y_qt;
dimple_row4_mirror = qt_dimple_row4_mirror_qt;
dimple_row4_linked = qt_dimple_row4_linked_qt;
dimple_row4_link_root_addition = qt_dimple_row4_link_root_addition_qt;
dimple_row4_shoulder_distance = qt_dimple_row4_shoulder_distance_qt;
dimple_row4_interpin_space = qt_dimple_row4_interpin_space_qt;
//VARIABLES OF ROW4 CUT SHAPE
dimple_row4_cut_to_use = qt_dimple_row4_cut_to_use_qt;
dimple_row4_prism_root_x = qt_dimple_row4_prism_root_x_qt;
dimple_row4_prism_root_y = qt_dimple_row4_prism_root_y_qt;
dimple_row4_prism_angle_x = qt_dimple_row4_prism_angle_x_qt;
dimple_row4_prism_angle_y = qt_dimple_row4_prism_angle_y_qt;
dimple_row4_prism_height = qt_dimple_row4_prism_height_qt;
dimple_row4_cone_height = qt_dimple_row4_cone_height_qt;
dimple_row4_cone_bottom_diameter = qt_dimple_row4_cone_bottom_diameter_qt;
dimple_row4_cone_angle = qt_dimple_row4_cone_angle_qt;
dimple_row4_cone_number_of_faces = qt_dimple_row4_cone_number_of_faces_qt;
dimple_row4_laser_mill_height = qt_dimple_row4_laser_mill_height_qt;
dimple_row4_laser_mill_diameter = qt_dimple_row4_laser_mill_diameter_qt;
dimple_row4_laser_mill_number_of_faces = qt_dimple_row4_laser_mill_number_of_faces_qt;
dimple_row4_laser_mill_center = qt_dimple_row4_laser_mill_center_qt;
dimple_row4_stl_mill_name = qt_dimple_row4_stl_mill_name_qt;
//VARIABLES OF ROW4 CUTS DEPTH, SPACES AND ANGLE ON Z
dimple_row4_cut01_depth = qt_dimple_row4_cut01_depth_qt;
dimple_row4_cut01_distance = qt_dimple_row4_cut01_distance_qt;
dimple_row4_cut01_angle = qt_dimple_row4_cut01_angle_qt;
dimple_row4_cut02_depth = qt_dimple_row4_cut02_depth_qt;
dimple_row4_cut02_distance = qt_dimple_row4_cut02_distance_qt;
dimple_row4_cut02_angle = qt_dimple_row4_cut02_angle_qt;
dimple_row4_cut03_depth = qt_dimple_row4_cut03_depth_qt;
dimple_row4_cut03_distance = qt_dimple_row4_cut03_distance_qt;
dimple_row4_cut03_angle = qt_dimple_row4_cut03_angle_qt;
dimple_row4_cut04_depth = qt_dimple_row4_cut04_depth_qt;
dimple_row4_cut04_distance = qt_dimple_row4_cut04_distance_qt;
dimple_row4_cut04_angle = qt_dimple_row4_cut04_angle_qt;
dimple_row4_cut05_depth = qt_dimple_row4_cut05_depth_qt;
dimple_row4_cut05_distance = qt_dimple_row4_cut05_distance_qt;
dimple_row4_cut05_angle = qt_dimple_row4_cut05_angle_qt;
dimple_row4_cut06_depth = qt_dimple_row4_cut06_depth_qt;
dimple_row4_cut06_distance = qt_dimple_row4_cut06_distance_qt;
dimple_row4_cut06_angle = qt_dimple_row4_cut06_angle_qt;
dimple_row4_cut07_depth = qt_dimple_row4_cut07_depth_qt;
dimple_row4_cut07_distance = qt_dimple_row4_cut07_distance_qt;
dimple_row4_cut07_angle = qt_dimple_row4_cut07_angle_qt;
dimple_row4_cut08_depth = qt_dimple_row4_cut08_depth_qt;
dimple_row4_cut08_distance = qt_dimple_row4_cut08_distance_qt;
dimple_row4_cut08_angle = qt_dimple_row4_cut08_angle_qt;
dimple_row4_cut09_depth = qt_dimple_row4_cut09_depth_qt;
dimple_row4_cut09_distance = qt_dimple_row4_cut09_distance_qt;
dimple_row4_cut09_angle = qt_dimple_row4_cut09_angle_qt;
dimple_row4_cut10_depth = qt_dimple_row4_cut10_depth_qt;
dimple_row4_cut10_distance = qt_dimple_row4_cut10_distance_qt;
dimple_row4_cut10_angle = qt_dimple_row4_cut10_angle_qt;
dimple_row4_cut11_depth = qt_dimple_row4_cut11_depth_qt;
dimple_row4_cut11_distance = qt_dimple_row4_cut11_distance_qt;
dimple_row4_cut11_angle = qt_dimple_row4_cut11_angle_qt;
dimple_row4_cut12_depth = qt_dimple_row4_cut12_depth_qt;
dimple_row4_cut12_distance = qt_dimple_row4_cut12_distance_qt;
dimple_row4_cut12_angle = qt_dimple_row4_cut12_angle_qt;
dimple_row4_cut13_depth = qt_dimple_row4_cut13_depth_qt;
dimple_row4_cut13_distance = qt_dimple_row4_cut13_distance_qt;
dimple_row4_cut13_angle = qt_dimple_row4_cut13_angle_qt;
dimple_row4_cut14_depth = qt_dimple_row4_cut14_depth_qt;
dimple_row4_cut14_distance = qt_dimple_row4_cut14_distance_qt;
dimple_row4_cut14_angle = qt_dimple_row4_cut14_angle_qt;
dimple_row4_cut15_depth = qt_dimple_row4_cut15_depth_qt;
dimple_row4_cut15_distance = qt_dimple_row4_cut15_distance_qt;
dimple_row4_cut15_angle = qt_dimple_row4_cut15_angle_qt;
dimple_row4_cut16_depth = qt_dimple_row4_cut16_depth_qt;
dimple_row4_cut16_distance = qt_dimple_row4_cut16_distance_qt;
dimple_row4_cut16_angle = qt_dimple_row4_cut16_angle_qt;
dimple_row4_cut17_depth = qt_dimple_row4_cut17_depth_qt;
dimple_row4_cut17_distance = qt_dimple_row4_cut17_distance_qt;
dimple_row4_cut17_angle = qt_dimple_row4_cut17_angle_qt;
dimple_row4_cut18_depth = qt_dimple_row4_cut18_depth_qt;
dimple_row4_cut18_distance = qt_dimple_row4_cut18_distance_qt;
dimple_row4_cut18_angle = qt_dimple_row4_cut18_angle_qt;
dimple_row4_cut19_depth = qt_dimple_row4_cut19_depth_qt;
dimple_row4_cut19_distance = qt_dimple_row4_cut19_distance_qt;
dimple_row4_cut19_angle = qt_dimple_row4_cut19_angle_qt;
dimple_row4_cut20_depth = qt_dimple_row4_cut20_depth_qt;
dimple_row4_cut20_distance = qt_dimple_row4_cut20_distance_qt;
dimple_row4_cut20_angle = qt_dimple_row4_cut20_angle_qt;
dimple_row4_cut21_depth = qt_dimple_row4_cut21_depth_qt;
dimple_row4_cut21_distance = qt_dimple_row4_cut21_distance_qt;
dimple_row4_cut21_angle = qt_dimple_row4_cut21_angle_qt;
dimple_row4_cut22_depth = qt_dimple_row4_cut22_depth_qt;
dimple_row4_cut22_distance = qt_dimple_row4_cut22_distance_qt;
dimple_row4_cut22_angle = qt_dimple_row4_cut22_angle_qt;

//VARIABLES OF ROW5
dimple_row5_number_of_pins = qt_dimple_row5_number_of_pins_qt;
dimple_row5_offset_on_x = qt_dimple_row5_offset_on_x_qt;
dimple_row5_offset_on_z = qt_dimple_row5_offset_on_z_qt;
dimple_row5_angle_on_y = qt_dimple_row5_angle_on_y_qt;
dimple_row5_mirror = qt_dimple_row5_mirror_qt;
dimple_row5_linked = qt_dimple_row5_linked_qt;
dimple_row5_link_root_addition = qt_dimple_row5_link_root_addition_qt;
dimple_row5_shoulder_distance = qt_dimple_row5_shoulder_distance_qt;
dimple_row5_interpin_space = qt_dimple_row5_interpin_space_qt;
//VARIABLES OF ROW5 CUT SHAPE
dimple_row5_cut_to_use = qt_dimple_row5_cut_to_use_qt;
dimple_row5_prism_root_x = qt_dimple_row5_prism_root_x_qt;
dimple_row5_prism_root_y = qt_dimple_row5_prism_root_y_qt;
dimple_row5_prism_angle_x = qt_dimple_row5_prism_angle_x_qt;
dimple_row5_prism_angle_y = qt_dimple_row5_prism_angle_y_qt;
dimple_row5_prism_height = qt_dimple_row5_prism_height_qt;
dimple_row5_cone_height = qt_dimple_row5_cone_height_qt;
dimple_row5_cone_bottom_diameter = qt_dimple_row5_cone_bottom_diameter_qt;
dimple_row5_cone_angle = qt_dimple_row5_cone_angle_qt;
dimple_row5_cone_number_of_faces = qt_dimple_row5_cone_number_of_faces_qt;
dimple_row5_laser_mill_height = qt_dimple_row5_laser_mill_height_qt;
dimple_row5_laser_mill_diameter = qt_dimple_row5_laser_mill_diameter_qt;
dimple_row5_laser_mill_number_of_faces = qt_dimple_row5_laser_mill_number_of_faces_qt;
dimple_row5_laser_mill_center = qt_dimple_row5_laser_mill_center_qt;
dimple_row5_stl_mill_name = qt_dimple_row5_stl_mill_name_qt;
//VARIABLES OF ROW5 CUTS DEPTH, SPACES AND ANGLE ON Z
dimple_row5_cut01_depth = qt_dimple_row5_cut01_depth_qt;
dimple_row5_cut01_distance = qt_dimple_row5_cut01_distance_qt;
dimple_row5_cut01_angle = qt_dimple_row5_cut01_angle_qt;
dimple_row5_cut02_depth = qt_dimple_row5_cut02_depth_qt;
dimple_row5_cut02_distance = qt_dimple_row5_cut02_distance_qt;
dimple_row5_cut02_angle = qt_dimple_row5_cut02_angle_qt;
dimple_row5_cut03_depth = qt_dimple_row5_cut03_depth_qt;
dimple_row5_cut03_distance = qt_dimple_row5_cut03_distance_qt;
dimple_row5_cut03_angle = qt_dimple_row5_cut03_angle_qt;
dimple_row5_cut04_depth = qt_dimple_row5_cut04_depth_qt;
dimple_row5_cut04_distance = qt_dimple_row5_cut04_distance_qt;
dimple_row5_cut04_angle = qt_dimple_row5_cut04_angle_qt;
dimple_row5_cut05_depth = qt_dimple_row5_cut05_depth_qt;
dimple_row5_cut05_distance = qt_dimple_row5_cut05_distance_qt;
dimple_row5_cut05_angle = qt_dimple_row5_cut05_angle_qt;
dimple_row5_cut06_depth = qt_dimple_row5_cut06_depth_qt;
dimple_row5_cut06_distance = qt_dimple_row5_cut06_distance_qt;
dimple_row5_cut06_angle = qt_dimple_row5_cut06_angle_qt;
dimple_row5_cut07_depth = qt_dimple_row5_cut07_depth_qt;
dimple_row5_cut07_distance = qt_dimple_row5_cut07_distance_qt;
dimple_row5_cut07_angle = qt_dimple_row5_cut07_angle_qt;
dimple_row5_cut08_depth = qt_dimple_row5_cut08_depth_qt;
dimple_row5_cut08_distance = qt_dimple_row5_cut08_distance_qt;
dimple_row5_cut08_angle = qt_dimple_row5_cut08_angle_qt;
dimple_row5_cut09_depth = qt_dimple_row5_cut09_depth_qt;
dimple_row5_cut09_distance = qt_dimple_row5_cut09_distance_qt;
dimple_row5_cut09_angle = qt_dimple_row5_cut09_angle_qt;
dimple_row5_cut10_depth = qt_dimple_row5_cut10_depth_qt;
dimple_row5_cut10_distance = qt_dimple_row5_cut10_distance_qt;
dimple_row5_cut10_angle = qt_dimple_row5_cut10_angle_qt;
dimple_row5_cut11_depth = qt_dimple_row5_cut11_depth_qt;
dimple_row5_cut11_distance = qt_dimple_row5_cut11_distance_qt;
dimple_row5_cut11_angle = qt_dimple_row5_cut11_angle_qt;
dimple_row5_cut12_depth = qt_dimple_row5_cut12_depth_qt;
dimple_row5_cut12_distance = qt_dimple_row5_cut12_distance_qt;
dimple_row5_cut12_angle = qt_dimple_row5_cut12_angle_qt;
dimple_row5_cut13_depth = qt_dimple_row5_cut13_depth_qt;
dimple_row5_cut13_distance = qt_dimple_row5_cut13_distance_qt;
dimple_row5_cut13_angle = qt_dimple_row5_cut13_angle_qt;
dimple_row5_cut14_depth = qt_dimple_row5_cut14_depth_qt;
dimple_row5_cut14_distance = qt_dimple_row5_cut14_distance_qt;
dimple_row5_cut14_angle = qt_dimple_row5_cut14_angle_qt;
dimple_row5_cut15_depth = qt_dimple_row5_cut15_depth_qt;
dimple_row5_cut15_distance = qt_dimple_row5_cut15_distance_qt;
dimple_row5_cut15_angle = qt_dimple_row5_cut15_angle_qt;
dimple_row5_cut16_depth = qt_dimple_row5_cut16_depth_qt;
dimple_row5_cut16_distance = qt_dimple_row5_cut16_distance_qt;
dimple_row5_cut16_angle = qt_dimple_row5_cut16_angle_qt;
dimple_row5_cut17_depth = qt_dimple_row5_cut17_depth_qt;
dimple_row5_cut17_distance = qt_dimple_row5_cut17_distance_qt;
dimple_row5_cut17_angle = qt_dimple_row5_cut17_angle_qt;
dimple_row5_cut18_depth = qt_dimple_row5_cut18_depth_qt;
dimple_row5_cut18_distance = qt_dimple_row5_cut18_distance_qt;
dimple_row5_cut18_angle = qt_dimple_row5_cut18_angle_qt;
dimple_row5_cut19_depth = qt_dimple_row5_cut19_depth_qt;
dimple_row5_cut19_distance = qt_dimple_row5_cut19_distance_qt;
dimple_row5_cut19_angle = qt_dimple_row5_cut19_angle_qt;
dimple_row5_cut20_depth = qt_dimple_row5_cut20_depth_qt;
dimple_row5_cut20_distance = qt_dimple_row5_cut20_distance_qt;
dimple_row5_cut20_angle = qt_dimple_row5_cut20_angle_qt;
dimple_row5_cut21_depth = qt_dimple_row5_cut21_depth_qt;
dimple_row5_cut21_distance = qt_dimple_row5_cut21_distance_qt;
dimple_row5_cut21_angle = qt_dimple_row5_cut21_angle_qt;
dimple_row5_cut22_depth = qt_dimple_row5_cut22_depth_qt;
dimple_row5_cut22_distance = qt_dimple_row5_cut22_distance_qt;
dimple_row5_cut22_angle = qt_dimple_row5_cut22_angle_qt;

//VARIABLES OF ROW6
dimple_row6_number_of_pins = qt_dimple_row6_number_of_pins_qt;
dimple_row6_offset_on_x = qt_dimple_row6_offset_on_x_qt;
dimple_row6_offset_on_z = qt_dimple_row6_offset_on_z_qt;
dimple_row6_angle_on_y = qt_dimple_row6_angle_on_y_qt;
dimple_row6_mirror = qt_dimple_row6_mirror_qt;
dimple_row6_linked = qt_dimple_row6_linked_qt;
dimple_row6_link_root_addition = qt_dimple_row6_link_root_addition_qt;
dimple_row6_shoulder_distance = qt_dimple_row6_shoulder_distance_qt;
dimple_row6_interpin_space = qt_dimple_row6_interpin_space_qt;
//VARIABLES OF ROW6 CUT SHAPE
dimple_row6_cut_to_use = qt_dimple_row6_cut_to_use_qt;
dimple_row6_prism_root_x = qt_dimple_row6_prism_root_x_qt;
dimple_row6_prism_root_y = qt_dimple_row6_prism_root_y_qt;
dimple_row6_prism_angle_x = qt_dimple_row6_prism_angle_x_qt;
dimple_row6_prism_angle_y = qt_dimple_row6_prism_angle_y_qt;
dimple_row6_prism_height = qt_dimple_row6_prism_height_qt;
dimple_row6_cone_height = qt_dimple_row6_cone_height_qt;
dimple_row6_cone_bottom_diameter = qt_dimple_row6_cone_bottom_diameter_qt;
dimple_row6_cone_angle = qt_dimple_row6_cone_angle_qt;
dimple_row6_cone_number_of_faces = qt_dimple_row6_cone_number_of_faces_qt;
dimple_row6_laser_mill_height = qt_dimple_row6_laser_mill_height_qt;
dimple_row6_laser_mill_diameter = qt_dimple_row6_laser_mill_diameter_qt;
dimple_row6_laser_mill_number_of_faces = qt_dimple_row6_laser_mill_number_of_faces_qt;
dimple_row6_laser_mill_center = qt_dimple_row6_laser_mill_center_qt;
dimple_row6_stl_mill_name = qt_dimple_row6_stl_mill_name_qt;
//VARIABLES OF ROW6 CUTS DEPTH, SPACES AND ANGLE ON Z
dimple_row6_cut01_depth = qt_dimple_row6_cut01_depth_qt;
dimple_row6_cut01_distance = qt_dimple_row6_cut01_distance_qt;
dimple_row6_cut01_angle = qt_dimple_row6_cut01_angle_qt;
dimple_row6_cut02_depth = qt_dimple_row6_cut02_depth_qt;
dimple_row6_cut02_distance = qt_dimple_row6_cut02_distance_qt;
dimple_row6_cut02_angle = qt_dimple_row6_cut02_angle_qt;
dimple_row6_cut03_depth = qt_dimple_row6_cut03_depth_qt;
dimple_row6_cut03_distance = qt_dimple_row6_cut03_distance_qt;
dimple_row6_cut03_angle = qt_dimple_row6_cut03_angle_qt;
dimple_row6_cut04_depth = qt_dimple_row6_cut04_depth_qt;
dimple_row6_cut04_distance = qt_dimple_row6_cut04_distance_qt;
dimple_row6_cut04_angle = qt_dimple_row6_cut04_angle_qt;
dimple_row6_cut05_depth = qt_dimple_row6_cut05_depth_qt;
dimple_row6_cut05_distance = qt_dimple_row6_cut05_distance_qt;
dimple_row6_cut05_angle = qt_dimple_row6_cut05_angle_qt;
dimple_row6_cut06_depth = qt_dimple_row6_cut06_depth_qt;
dimple_row6_cut06_distance = qt_dimple_row6_cut06_distance_qt;
dimple_row6_cut06_angle = qt_dimple_row6_cut06_angle_qt;
dimple_row6_cut07_depth = qt_dimple_row6_cut07_depth_qt;
dimple_row6_cut07_distance = qt_dimple_row6_cut07_distance_qt;
dimple_row6_cut07_angle = qt_dimple_row6_cut07_angle_qt;
dimple_row6_cut08_depth = qt_dimple_row6_cut08_depth_qt;
dimple_row6_cut08_distance = qt_dimple_row6_cut08_distance_qt;
dimple_row6_cut08_angle = qt_dimple_row6_cut08_angle_qt;
dimple_row6_cut09_depth = qt_dimple_row6_cut09_depth_qt;
dimple_row6_cut09_distance = qt_dimple_row6_cut09_distance_qt;
dimple_row6_cut09_angle = qt_dimple_row6_cut09_angle_qt;
dimple_row6_cut10_depth = qt_dimple_row6_cut10_depth_qt;
dimple_row6_cut10_distance = qt_dimple_row6_cut10_distance_qt;
dimple_row6_cut10_angle = qt_dimple_row6_cut10_angle_qt;
dimple_row6_cut11_depth = qt_dimple_row6_cut11_depth_qt;
dimple_row6_cut11_distance = qt_dimple_row6_cut11_distance_qt;
dimple_row6_cut11_angle = qt_dimple_row6_cut11_angle_qt;
dimple_row6_cut12_depth = qt_dimple_row6_cut12_depth_qt;
dimple_row6_cut12_distance = qt_dimple_row6_cut12_distance_qt;
dimple_row6_cut12_angle = qt_dimple_row6_cut12_angle_qt;
dimple_row6_cut13_depth = qt_dimple_row6_cut13_depth_qt;
dimple_row6_cut13_distance = qt_dimple_row6_cut13_distance_qt;
dimple_row6_cut13_angle = qt_dimple_row6_cut13_angle_qt;
dimple_row6_cut14_depth = qt_dimple_row6_cut14_depth_qt;
dimple_row6_cut14_distance = qt_dimple_row6_cut14_distance_qt;
dimple_row6_cut14_angle = qt_dimple_row6_cut14_angle_qt;
dimple_row6_cut15_depth = qt_dimple_row6_cut15_depth_qt;
dimple_row6_cut15_distance = qt_dimple_row6_cut15_distance_qt;
dimple_row6_cut15_angle = qt_dimple_row6_cut15_angle_qt;
dimple_row6_cut16_depth = qt_dimple_row6_cut16_depth_qt;
dimple_row6_cut16_distance = qt_dimple_row6_cut16_distance_qt;
dimple_row6_cut16_angle = qt_dimple_row6_cut16_angle_qt;
dimple_row6_cut17_depth = qt_dimple_row6_cut17_depth_qt;
dimple_row6_cut17_distance = qt_dimple_row6_cut17_distance_qt;
dimple_row6_cut17_angle = qt_dimple_row6_cut17_angle_qt;
dimple_row6_cut18_depth = qt_dimple_row6_cut18_depth_qt;
dimple_row6_cut18_distance = qt_dimple_row6_cut18_distance_qt;
dimple_row6_cut18_angle = qt_dimple_row6_cut18_angle_qt;
dimple_row6_cut19_depth = qt_dimple_row6_cut19_depth_qt;
dimple_row6_cut19_distance = qt_dimple_row6_cut19_distance_qt;
dimple_row6_cut19_angle = qt_dimple_row6_cut19_angle_qt;
dimple_row6_cut20_depth = qt_dimple_row6_cut20_depth_qt;
dimple_row6_cut20_distance = qt_dimple_row6_cut20_distance_qt;
dimple_row6_cut20_angle = qt_dimple_row6_cut20_angle_qt;
dimple_row6_cut21_depth = qt_dimple_row6_cut21_depth_qt;
dimple_row6_cut21_distance = qt_dimple_row6_cut21_distance_qt;
dimple_row6_cut21_angle = qt_dimple_row6_cut21_angle_qt;
dimple_row6_cut22_depth = qt_dimple_row6_cut22_depth_qt;
dimple_row6_cut22_distance = qt_dimple_row6_cut22_distance_qt;
dimple_row6_cut22_angle = qt_dimple_row6_cut22_angle_qt;

//VARIABLES OF SONIC
dimple_sonic_plug_diameter = qt_dimple_sonic_plug_diameter_qt;
dimple_sonic_number_of_pins = qt_dimple_sonic_number_of_pins_qt;
dimple_sonic_offset_on_x = qt_dimple_sonic_offset_on_x_qt;
dimple_sonic_offset_on_z = qt_dimple_sonic_offset_on_z_qt;
dimple_sonic_angle_on_y = qt_dimple_sonic_angle_on_y_qt;
dimple_sonic_mirror = qt_dimple_sonic_mirror_qt;
dimple_sonic_linked = qt_dimple_sonic_linked_qt;
dimple_sonic_link_root_addition = qt_dimple_sonic_link_root_addition_qt;
dimple_sonic_shoulder_distance = qt_dimple_sonic_shoulder_distance_qt;
dimple_sonic_interpin_space = qt_dimple_sonic_interpin_space_qt;
//VARIABLES OF sonic CUT SHAPE
dimple_sonic_cut_to_use = qt_dimple_sonic_cut_to_use_qt;
dimple_sonic_prism_root_x = qt_dimple_sonic_prism_root_x_qt;
dimple_sonic_prism_root_y = qt_dimple_sonic_prism_root_y_qt;
dimple_sonic_prism_angle_x = qt_dimple_sonic_prism_angle_x_qt;
dimple_sonic_prism_angle_y = qt_dimple_sonic_prism_angle_y_qt;
dimple_sonic_prism_height = qt_dimple_sonic_prism_height_qt;
dimple_sonic_cone_height = qt_dimple_sonic_cone_height_qt;
dimple_sonic_cone_bottom_diameter = qt_dimple_sonic_cone_bottom_diameter_qt;
dimple_sonic_cone_angle = qt_dimple_sonic_cone_angle_qt;
dimple_sonic_cone_number_of_faces = qt_dimple_sonic_cone_number_of_faces_qt;
dimple_sonic_laser_mill_height = qt_dimple_sonic_laser_mill_height_qt;
dimple_sonic_laser_mill_diameter = qt_dimple_sonic_laser_mill_diameter_qt;
dimple_sonic_laser_mill_number_of_faces = qt_dimple_sonic_laser_mill_number_of_faces_qt;
dimple_sonic_laser_mill_center = qt_dimple_sonic_laser_mill_center_qt;
dimple_sonic_stl_mill_name = qt_dimple_sonic_stl_mill_name_qt;
//VARIABLES OF sonic CUTS DEPTH, SPACES AND ANGLE ON Z
dimple_sonic_cut01_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut01_depth_qt;
dimple_sonic_cut01_distance = qt_dimple_sonic_cut01_distance_qt;
dimple_sonic_cut01_angle = qt_dimple_sonic_cut01_angle_qt;
dimple_sonic_cut02_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut02_depth_qt;
dimple_sonic_cut02_distance = qt_dimple_sonic_cut02_distance_qt;
dimple_sonic_cut02_angle = qt_dimple_sonic_cut02_angle_qt;
dimple_sonic_cut03_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut03_depth_qt;
dimple_sonic_cut03_distance = qt_dimple_sonic_cut03_distance_qt;
dimple_sonic_cut03_angle = qt_dimple_sonic_cut03_angle_qt;
dimple_sonic_cut04_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut04_depth_qt;
dimple_sonic_cut04_distance = qt_dimple_sonic_cut04_distance_qt;
dimple_sonic_cut04_angle = qt_dimple_sonic_cut04_angle_qt;
dimple_sonic_cut05_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut05_depth_qt;
dimple_sonic_cut05_distance = qt_dimple_sonic_cut05_distance_qt;
dimple_sonic_cut05_angle = qt_dimple_sonic_cut05_angle_qt;
dimple_sonic_cut06_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut06_depth_qt;
dimple_sonic_cut06_distance = qt_dimple_sonic_cut06_distance_qt;
dimple_sonic_cut06_angle = qt_dimple_sonic_cut06_angle_qt;
dimple_sonic_cut07_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut07_depth_qt;
dimple_sonic_cut07_distance = qt_dimple_sonic_cut07_distance_qt;
dimple_sonic_cut07_angle = qt_dimple_sonic_cut07_angle_qt;
dimple_sonic_cut08_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut08_depth_qt;
dimple_sonic_cut08_distance = qt_dimple_sonic_cut08_distance_qt;
dimple_sonic_cut08_angle = qt_dimple_sonic_cut08_angle_qt;
dimple_sonic_cut09_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut09_depth_qt;
dimple_sonic_cut09_distance = qt_dimple_sonic_cut09_distance_qt;
dimple_sonic_cut09_angle = qt_dimple_sonic_cut09_angle_qt;
dimple_sonic_cut10_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut10_depth_qt;
dimple_sonic_cut10_distance = qt_dimple_sonic_cut10_distance_qt;
dimple_sonic_cut10_angle = qt_dimple_sonic_cut10_angle_qt;
dimple_sonic_cut11_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut11_depth_qt;
dimple_sonic_cut11_distance = qt_dimple_sonic_cut11_distance_qt;
dimple_sonic_cut11_angle = qt_dimple_sonic_cut11_angle_qt;
dimple_sonic_cut12_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut12_depth_qt;
dimple_sonic_cut12_distance = qt_dimple_sonic_cut12_distance_qt;
dimple_sonic_cut12_angle = qt_dimple_sonic_cut12_angle_qt;
dimple_sonic_cut13_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut13_depth_qt;
dimple_sonic_cut13_distance = qt_dimple_sonic_cut13_distance_qt;
dimple_sonic_cut13_angle = qt_dimple_sonic_cut13_angle_qt;
dimple_sonic_cut14_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut14_depth_qt;
dimple_sonic_cut14_distance = qt_dimple_sonic_cut14_distance_qt;
dimple_sonic_cut14_angle = qt_dimple_sonic_cut14_angle_qt;
dimple_sonic_cut15_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut15_depth_qt;
dimple_sonic_cut15_distance = qt_dimple_sonic_cut15_distance_qt;
dimple_sonic_cut15_angle = qt_dimple_sonic_cut15_angle_qt;
dimple_sonic_cut16_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut16_depth_qt;
dimple_sonic_cut16_distance = qt_dimple_sonic_cut16_distance_qt;
dimple_sonic_cut16_angle = qt_dimple_sonic_cut16_angle_qt;
dimple_sonic_cut17_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut17_depth_qt;
dimple_sonic_cut17_distance = qt_dimple_sonic_cut17_distance_qt;
dimple_sonic_cut17_angle = qt_dimple_sonic_cut17_angle_qt;
dimple_sonic_cut18_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut18_depth_qt;
dimple_sonic_cut18_distance = qt_dimple_sonic_cut18_distance_qt;
dimple_sonic_cut18_angle = qt_dimple_sonic_cut18_angle_qt;
dimple_sonic_cut19_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut19_depth_qt;
dimple_sonic_cut19_distance = qt_dimple_sonic_cut19_distance_qt;
dimple_sonic_cut19_angle = qt_dimple_sonic_cut19_angle_qt;
dimple_sonic_cut20_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut20_depth_qt;
dimple_sonic_cut20_distance = qt_dimple_sonic_cut20_distance_qt;
dimple_sonic_cut20_angle = qt_dimple_sonic_cut20_angle_qt;
dimple_sonic_cut21_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut21_depth_qt;
dimple_sonic_cut21_distance = qt_dimple_sonic_cut21_distance_qt;
dimple_sonic_cut21_angle = qt_dimple_sonic_cut21_angle_qt;
dimple_sonic_cut22_depth = ((dimple_sonic_plug_diameter/2)+(dimple_thickness/2)) - qt_dimple_sonic_cut22_depth_qt;
dimple_sonic_cut22_distance = qt_dimple_sonic_cut22_distance_qt;
dimple_sonic_cut22_angle = qt_dimple_sonic_cut22_angle_qt;

//VARIABLES OF ROUND PUMP CUTS LEVEL 2
round_pump_number_of_pins = qt_round_pump_number_of_pins_qt; //including tensioner
round_pump_mill_diameter = qt_round_pump_mill_diameter_qt;
round_pump_mill_distance_frome_center = qt_round_pump_mill_distance_frome_center_qt;
round_pump_cut01_depth_from_tip = qt_round_pump_cut01_depth_from_tip_qt;
round_pump_cut02_depth_from_tip = qt_round_pump_cut02_depth_from_tip_qt;
round_pump_cut03_depth_from_tip = qt_round_pump_cut03_depth_from_tip_qt;
round_pump_cut04_depth_from_tip = qt_round_pump_cut04_depth_from_tip_qt;
round_pump_cut05_depth_from_tip = qt_round_pump_cut05_depth_from_tip_qt;
round_pump_cut06_depth_from_tip = qt_round_pump_cut06_depth_from_tip_qt;
round_pump_cut07_depth_from_tip = qt_round_pump_cut07_depth_from_tip_qt;
round_pump_cut08_depth_from_tip = qt_round_pump_cut08_depth_from_tip_qt;
round_pump_cut09_depth_from_tip = qt_round_pump_cut09_depth_from_tip_qt;
round_pump_cut10_depth_from_tip = qt_round_pump_cut10_depth_from_tip_qt;
round_pump_cut11_depth_from_tip = qt_round_pump_cut11_depth_from_tip_qt;
round_pump_cut12_depth_from_tip = qt_round_pump_cut12_depth_from_tip_qt;

//LEVER LOCK VARIABLES CUTTINGS LEVEL 2
//CONSTANTS :
lever_simple_cut_x = 100;
lever_simple_cut_z = 100;

lever_double_cut_x = 100;
lever_double_cut_z = 100;
//ROW1 OF LEVER LOCK
lever_simple_lock_row1_number_of_levers = 		qt_lever_simple_lock_row1_number_of_levers_qt;
lever_simple_lock_row1_blade_length = 			qt_lever_simple_lock_row1_blade_length_qt;
lever_simple_lock_row1_spaces = 				qt_lever_simple_lock_row1_spaces_qt;
lever_simple_lock_row1_thickness = 			qt_lever_simple_lock_row1_thickness_qt;
lever_simple_lock_row1_angle_on_y = 			qt_lever_simple_lock_row1_angle_on_y_qt;
lever_simple_lock_row1_cut01_depth = 			qt_lever_simple_lock_row1_cut01_depth_qt;
lever_simple_lock_row1_cut01_distance = 		qt_lever_simple_lock_row1_cut01_distance_qt;
lever_simple_lock_row1_cut01_thickness = 		qt_lever_simple_lock_row1_cut01_thickness_qt;
lever_simple_lock_row1_cut02_depth = 			qt_lever_simple_lock_row1_cut02_depth_qt;
lever_simple_lock_row1_cut02_distance = 		qt_lever_simple_lock_row1_cut02_distance_qt;
lever_simple_lock_row1_cut02_thickness = 		qt_lever_simple_lock_row1_cut02_thickness_qt;
lever_simple_lock_row1_cut03_depth = 			qt_lever_simple_lock_row1_cut03_depth_qt;
lever_simple_lock_row1_cut03_distance = 		qt_lever_simple_lock_row1_cut03_distance_qt;
lever_simple_lock_row1_cut03_thickness = 		qt_lever_simple_lock_row1_cut03_thickness_qt;
lever_simple_lock_row1_cut04_depth = 			qt_lever_simple_lock_row1_cut04_depth_qt;
lever_simple_lock_row1_cut04_distance = 		qt_lever_simple_lock_row1_cut04_distance_qt;
lever_simple_lock_row1_cut04_thickness = qt_lever_simple_lock_row1_cut04_thickness_qt;
lever_simple_lock_row1_cut05_depth = qt_lever_simple_lock_row1_cut05_depth_qt;
lever_simple_lock_row1_cut05_distance = qt_lever_simple_lock_row1_cut05_distance_qt;
lever_simple_lock_row1_cut05_thickness = qt_lever_simple_lock_row1_cut05_thickness_qt;
lever_simple_lock_row1_cut06_depth = qt_lever_simple_lock_row1_cut06_depth_qt;
lever_simple_lock_row1_cut06_distance = qt_lever_simple_lock_row1_cut06_distance_qt;
lever_simple_lock_row1_cut06_thickness = qt_lever_simple_lock_row1_cut06_thickness_qt;
lever_simple_lock_row1_cut07_depth = qt_lever_simple_lock_row1_cut07_depth_qt;
lever_simple_lock_row1_cut07_distance = qt_lever_simple_lock_row1_cut07_distance_qt;
lever_simple_lock_row1_cut07_thickness = qt_lever_simple_lock_row1_cut07_thickness_qt;
lever_simple_lock_row1_cut08_depth = qt_lever_simple_lock_row1_cut08_depth_qt;
lever_simple_lock_row1_cut08_distance = qt_lever_simple_lock_row1_cut08_distance_qt;
lever_simple_lock_row1_cut08_thickness = qt_lever_simple_lock_row1_cut08_thickness_qt;
lever_simple_lock_row1_cut09_depth = qt_lever_simple_lock_row1_cut09_depth_qt;
lever_simple_lock_row1_cut09_distance = qt_lever_simple_lock_row1_cut09_distance_qt;
lever_simple_lock_row1_cut09_thickness = qt_lever_simple_lock_row1_cut09_thickness_qt;
lever_simple_lock_row1_cut10_depth = qt_lever_simple_lock_row1_cut10_depth_qt;
lever_simple_lock_row1_cut10_distance = qt_lever_simple_lock_row1_cut10_distance_qt;
lever_simple_lock_row1_cut10_thickness = qt_lever_simple_lock_row1_cut10_thickness_qt;
lever_simple_lock_row1_cut11_depth = qt_lever_simple_lock_row1_cut11_depth_qt;
lever_simple_lock_row1_cut11_distance = qt_lever_simple_lock_row1_cut11_distance_qt;
lever_simple_lock_row1_cut11_thickness = qt_lever_simple_lock_row1_cut11_thickness_qt;
lever_simple_lock_row1_cut12_depth = qt_lever_simple_lock_row1_cut12_depth_qt;
lever_simple_lock_row1_cut12_distance = qt_lever_simple_lock_row1_cut12_distance_qt;
lever_simple_lock_row1_cut12_thickness = qt_lever_simple_lock_row1_cut12_thickness_qt;
lever_simple_lock_row1_cut13_depth = qt_lever_simple_lock_row1_cut13_depth_qt;
lever_simple_lock_row1_cut13_distance = qt_lever_simple_lock_row1_cut13_distance_qt;
lever_simple_lock_row1_cut13_thickness = qt_lever_simple_lock_row1_cut13_thickness_qt;
lever_simple_lock_row1_cut14_depth = qt_lever_simple_lock_row1_cut14_depth_qt;
lever_simple_lock_row1_cut14_distance = qt_lever_simple_lock_row1_cut14_distance_qt;
lever_simple_lock_row1_cut14_thickness = qt_lever_simple_lock_row1_cut14_thickness_qt;
lever_simple_lock_row1_cut15_depth = qt_lever_simple_lock_row1_cut15_depth_qt;
lever_simple_lock_row1_cut15_distance = qt_lever_simple_lock_row1_cut15_distance_qt;
lever_simple_lock_row1_cut15_thickness = qt_lever_simple_lock_row1_cut15_thickness_qt;
lever_simple_lock_row1_cut16_depth = qt_lever_simple_lock_row1_cut16_depth_qt;
lever_simple_lock_row1_cut16_distance = qt_lever_simple_lock_row1_cut16_distance_qt;
lever_simple_lock_row1_cut16_thickness = qt_lever_simple_lock_row1_cut16_thickness_qt;
lever_simple_lock_row1_cut17_depth = qt_lever_simple_lock_row1_cut17_depth_qt;
lever_simple_lock_row1_cut17_distance = qt_lever_simple_lock_row1_cut17_distance_qt;
lever_simple_lock_row1_cut17_thickness = qt_lever_simple_lock_row1_cut17_thickness_qt;
lever_simple_lock_row1_cut18_depth = qt_lever_simple_lock_row1_cut18_depth_qt;
lever_simple_lock_row1_cut18_distance = qt_lever_simple_lock_row1_cut18_distance_qt;
lever_simple_lock_row1_cut18_thickness = qt_lever_simple_lock_row1_cut18_thickness_qt;
lever_simple_lock_row1_cut19_depth = qt_lever_simple_lock_row1_cut19_depth_qt;
lever_simple_lock_row1_cut19_distance = qt_lever_simple_lock_row1_cut19_distance_qt;
lever_simple_lock_row1_cut19_thickness = qt_lever_simple_lock_row1_cut19_thickness_qt;
lever_simple_lock_row1_cut20_depth = qt_lever_simple_lock_row1_cut20_depth_qt;
lever_simple_lock_row1_cut20_distance = qt_lever_simple_lock_row1_cut20_distance_qt;
lever_simple_lock_row1_cut20_thickness = qt_lever_simple_lock_row1_cut20_thickness_qt;


//ROW1 OF LEVER DOUBLE LOCK VARIABLES CUTTINGS LEVEL 2

lever_double_lock_row1_number_of_levers = 		qt_lever_double_lock_row1_number_of_levers_qt;
lever_double_lock_row1_blade_length = 			qt_lever_double_lock_row1_blade_length_qt;
lever_double_lock_row1_spaces = 				qt_lever_double_lock_row1_spaces_qt;
lever_double_lock_row1_thickness = 			qt_lever_double_lock_row1_thickness_qt;
lever_double_lock_row1_angle_on_y = 			qt_lever_double_lock_row1_angle_on_y_qt;
lever_double_lock_row1_cut01_depth = 			qt_lever_double_lock_row1_cut01_depth_qt;
lever_double_lock_row1_cut01_distance = 		qt_lever_double_lock_row1_cut01_distance_qt;
lever_double_lock_row1_cut01_thickness = 		qt_lever_double_lock_row1_cut01_thickness_qt;
lever_double_lock_row1_cut02_depth = 			qt_lever_double_lock_row1_cut02_depth_qt;
lever_double_lock_row1_cut02_distance = 		qt_lever_double_lock_row1_cut02_distance_qt;
lever_double_lock_row1_cut02_thickness = 		qt_lever_double_lock_row1_cut02_thickness_qt;
lever_double_lock_row1_cut03_depth = 			qt_lever_double_lock_row1_cut03_depth_qt;
lever_double_lock_row1_cut03_distance = 		qt_lever_double_lock_row1_cut03_distance_qt;
lever_double_lock_row1_cut03_thickness = 		qt_lever_double_lock_row1_cut03_thickness_qt;
lever_double_lock_row1_cut04_depth = 			qt_lever_double_lock_row1_cut04_depth_qt;
lever_double_lock_row1_cut04_distance = 		qt_lever_double_lock_row1_cut04_distance_qt;
lever_double_lock_row1_cut04_thickness = qt_lever_double_lock_row1_cut04_thickness_qt;
lever_double_lock_row1_cut05_depth = qt_lever_double_lock_row1_cut05_depth_qt;
lever_double_lock_row1_cut05_distance = qt_lever_double_lock_row1_cut05_distance_qt;
lever_double_lock_row1_cut05_thickness = qt_lever_double_lock_row1_cut05_thickness_qt;
lever_double_lock_row1_cut06_depth = qt_lever_double_lock_row1_cut06_depth_qt;
lever_double_lock_row1_cut06_distance = qt_lever_double_lock_row1_cut06_distance_qt;
lever_double_lock_row1_cut06_thickness = qt_lever_double_lock_row1_cut06_thickness_qt;
lever_double_lock_row1_cut07_depth = qt_lever_double_lock_row1_cut07_depth_qt;
lever_double_lock_row1_cut07_distance = qt_lever_double_lock_row1_cut07_distance_qt;
lever_double_lock_row1_cut07_thickness = qt_lever_double_lock_row1_cut07_thickness_qt;
lever_double_lock_row1_cut08_depth = qt_lever_double_lock_row1_cut08_depth_qt;
lever_double_lock_row1_cut08_distance = qt_lever_double_lock_row1_cut08_distance_qt;
lever_double_lock_row1_cut08_thickness = qt_lever_double_lock_row1_cut08_thickness_qt;
lever_double_lock_row1_cut09_depth = qt_lever_double_lock_row1_cut09_depth_qt;
lever_double_lock_row1_cut09_distance = qt_lever_double_lock_row1_cut09_distance_qt;
lever_double_lock_row1_cut09_thickness = qt_lever_double_lock_row1_cut09_thickness_qt;
lever_double_lock_row1_cut10_depth = qt_lever_double_lock_row1_cut10_depth_qt;
lever_double_lock_row1_cut10_distance = qt_lever_double_lock_row1_cut10_distance_qt;
lever_double_lock_row1_cut10_thickness = qt_lever_double_lock_row1_cut10_thickness_qt;
lever_double_lock_row1_cut11_depth = qt_lever_double_lock_row1_cut11_depth_qt;
lever_double_lock_row1_cut11_distance = qt_lever_double_lock_row1_cut11_distance_qt;
lever_double_lock_row1_cut11_thickness = qt_lever_double_lock_row1_cut11_thickness_qt;
lever_double_lock_row1_cut12_depth = qt_lever_double_lock_row1_cut12_depth_qt;
lever_double_lock_row1_cut12_distance = qt_lever_double_lock_row1_cut12_distance_qt;
lever_double_lock_row1_cut12_thickness = qt_lever_double_lock_row1_cut12_thickness_qt;
lever_double_lock_row1_cut13_depth = qt_lever_double_lock_row1_cut13_depth_qt;
lever_double_lock_row1_cut13_distance = qt_lever_double_lock_row1_cut13_distance_qt;
lever_double_lock_row1_cut13_thickness = qt_lever_double_lock_row1_cut13_thickness_qt;
lever_double_lock_row1_cut14_depth = qt_lever_double_lock_row1_cut14_depth_qt;
lever_double_lock_row1_cut14_distance = qt_lever_double_lock_row1_cut14_distance_qt;
lever_double_lock_row1_cut14_thickness = qt_lever_double_lock_row1_cut14_thickness_qt;
lever_double_lock_row1_cut15_depth = qt_lever_double_lock_row1_cut15_depth_qt;
lever_double_lock_row1_cut15_distance = qt_lever_double_lock_row1_cut15_distance_qt;
lever_double_lock_row1_cut15_thickness = qt_lever_double_lock_row1_cut15_thickness_qt;
lever_double_lock_row1_cut16_depth = qt_lever_double_lock_row1_cut16_depth_qt;
lever_double_lock_row1_cut16_distance = qt_lever_double_lock_row1_cut16_distance_qt;
lever_double_lock_row1_cut16_thickness = qt_lever_double_lock_row1_cut16_thickness_qt;
lever_double_lock_row1_cut17_depth = qt_lever_double_lock_row1_cut17_depth_qt;
lever_double_lock_row1_cut17_distance = qt_lever_double_lock_row1_cut17_distance_qt;
lever_double_lock_row1_cut17_thickness = qt_lever_double_lock_row1_cut17_thickness_qt;
lever_double_lock_row1_cut18_depth = qt_lever_double_lock_row1_cut18_depth_qt;
lever_double_lock_row1_cut18_distance = qt_lever_double_lock_row1_cut18_distance_qt;
lever_double_lock_row1_cut18_thickness = qt_lever_double_lock_row1_cut18_thickness_qt;
lever_double_lock_row1_cut19_depth = qt_lever_double_lock_row1_cut19_depth_qt;
lever_double_lock_row1_cut19_distance = qt_lever_double_lock_row1_cut19_distance_qt;
lever_double_lock_row1_cut19_thickness = qt_lever_double_lock_row1_cut19_thickness_qt;
lever_double_lock_row1_cut20_depth = qt_lever_double_lock_row1_cut20_depth_qt;
lever_double_lock_row1_cut20_distance = qt_lever_double_lock_row1_cut20_distance_qt;
lever_double_lock_row1_cut20_thickness = qt_lever_double_lock_row1_cut20_thickness_qt;


//ROW2 OF LEVER DOUBLE LOCK VARIABLES CUTTINGS LEVEL 2
lever_double_lock_row2_number_of_levers = qt_lever_double_lock_row2_number_of_levers_qt;
lever_double_lock_row2_blade_length = qt_lever_double_lock_row2_blade_length_qt;
lever_double_lock_row2_spaces = qt_lever_double_lock_row2_spaces_qt;
lever_double_lock_row2_thickness = qt_lever_double_lock_row2_thickness_qt;
lever_double_lock_row2_angle_on_y = qt_lever_double_lock_row2_angle_on_y_qt;
lever_double_lock_row2_cut01_depth = qt_lever_double_lock_row2_cut01_depth_qt;
lever_double_lock_row2_cut01_distance = qt_lever_double_lock_row2_cut01_distance_qt;
lever_double_lock_row2_cut01_thickness = qt_lever_double_lock_row2_cut01_thickness_qt;
lever_double_lock_row2_cut02_depth = qt_lever_double_lock_row2_cut02_depth_qt;
lever_double_lock_row2_cut02_distance = qt_lever_double_lock_row2_cut02_distance_qt;
lever_double_lock_row2_cut02_thickness = qt_lever_double_lock_row2_cut02_thickness_qt;
lever_double_lock_row2_cut03_depth = qt_lever_double_lock_row2_cut03_depth_qt;
lever_double_lock_row2_cut03_distance = qt_lever_double_lock_row2_cut03_distance_qt;
lever_double_lock_row2_cut03_thickness = qt_lever_double_lock_row2_cut03_thickness_qt;
lever_double_lock_row2_cut04_depth = qt_lever_double_lock_row2_cut04_depth_qt;
lever_double_lock_row2_cut04_distance = qt_lever_double_lock_row2_cut04_distance_qt;
lever_double_lock_row2_cut04_thickness = qt_lever_double_lock_row2_cut04_thickness_qt;
lever_double_lock_row2_cut05_depth = qt_lever_double_lock_row2_cut05_depth_qt;
lever_double_lock_row2_cut05_distance = qt_lever_double_lock_row2_cut05_distance_qt;
lever_double_lock_row2_cut05_thickness = qt_lever_double_lock_row2_cut05_thickness_qt;
lever_double_lock_row2_cut06_depth = qt_lever_double_lock_row2_cut06_depth_qt;
lever_double_lock_row2_cut06_distance = qt_lever_double_lock_row2_cut06_distance_qt;
lever_double_lock_row2_cut06_thickness = qt_lever_double_lock_row2_cut06_thickness_qt;
lever_double_lock_row2_cut07_depth = qt_lever_double_lock_row2_cut07_depth_qt;
lever_double_lock_row2_cut07_distance = qt_lever_double_lock_row2_cut07_distance_qt;
lever_double_lock_row2_cut07_thickness = qt_lever_double_lock_row2_cut07_thickness_qt;
lever_double_lock_row2_cut08_depth = qt_lever_double_lock_row2_cut08_depth_qt;
lever_double_lock_row2_cut08_distance = qt_lever_double_lock_row2_cut08_distance_qt;
lever_double_lock_row2_cut08_thickness = qt_lever_double_lock_row2_cut08_thickness_qt;
lever_double_lock_row2_cut09_depth = qt_lever_double_lock_row2_cut09_depth_qt;
lever_double_lock_row2_cut09_distance = qt_lever_double_lock_row2_cut09_distance_qt;
lever_double_lock_row2_cut09_thickness = qt_lever_double_lock_row2_cut09_thickness_qt;
lever_double_lock_row2_cut10_depth = qt_lever_double_lock_row2_cut10_depth_qt;
lever_double_lock_row2_cut10_distance = qt_lever_double_lock_row2_cut10_distance_qt;
lever_double_lock_row2_cut10_thickness = qt_lever_double_lock_row2_cut10_thickness_qt;
lever_double_lock_row2_cut11_depth = qt_lever_double_lock_row2_cut11_depth_qt;
lever_double_lock_row2_cut11_distance = qt_lever_double_lock_row2_cut11_distance_qt;
lever_double_lock_row2_cut11_thickness = qt_lever_double_lock_row2_cut11_thickness_qt;
lever_double_lock_row2_cut12_depth = qt_lever_double_lock_row2_cut12_depth_qt;
lever_double_lock_row2_cut12_distance = qt_lever_double_lock_row2_cut12_distance_qt;
lever_double_lock_row2_cut12_thickness = qt_lever_double_lock_row2_cut12_thickness_qt;
lever_double_lock_row2_cut13_depth = qt_lever_double_lock_row2_cut13_depth_qt;
lever_double_lock_row2_cut13_distance = qt_lever_double_lock_row2_cut13_distance_qt;
lever_double_lock_row2_cut13_thickness = qt_lever_double_lock_row2_cut13_thickness_qt;
lever_double_lock_row2_cut14_depth = qt_lever_double_lock_row2_cut14_depth_qt;
lever_double_lock_row2_cut14_distance = qt_lever_double_lock_row2_cut14_distance_qt;
lever_double_lock_row2_cut14_thickness = qt_lever_double_lock_row2_cut14_thickness_qt;
lever_double_lock_row2_cut15_depth = qt_lever_double_lock_row2_cut15_depth_qt;
lever_double_lock_row2_cut15_distance = qt_lever_double_lock_row2_cut15_distance_qt;
lever_double_lock_row2_cut15_thickness = qt_lever_double_lock_row2_cut15_thickness_qt;
lever_double_lock_row2_cut16_depth = qt_lever_double_lock_row2_cut16_depth_qt;
lever_double_lock_row2_cut16_distance = qt_lever_double_lock_row2_cut16_distance_qt;
lever_double_lock_row2_cut16_thickness = qt_lever_double_lock_row2_cut16_thickness_qt;
lever_double_lock_row2_cut17_depth = qt_lever_double_lock_row2_cut17_depth_qt;
lever_double_lock_row2_cut17_distance = qt_lever_double_lock_row2_cut17_distance_qt;
lever_double_lock_row2_cut17_thickness = qt_lever_double_lock_row2_cut17_thickness_qt;
lever_double_lock_row2_cut18_depth = qt_lever_double_lock_row2_cut18_depth_qt;
lever_double_lock_row2_cut18_distance = qt_lever_double_lock_row2_cut18_distance_qt;
lever_double_lock_row2_cut18_thickness = qt_lever_double_lock_row2_cut18_thickness_qt;
lever_double_lock_row2_cut19_depth = qt_lever_double_lock_row2_cut19_depth_qt;
lever_double_lock_row2_cut19_distance = qt_lever_double_lock_row2_cut19_distance_qt;
lever_double_lock_row2_cut19_thickness = qt_lever_double_lock_row2_cut19_thickness_qt;
lever_double_lock_row2_cut20_depth = qt_lever_double_lock_row2_cut20_depth_qt;
lever_double_lock_row2_cut20_distance = qt_lever_double_lock_row2_cut20_distance_qt;
lever_double_lock_row2_cut20_thickness = qt_lever_double_lock_row2_cut20_thickness_qt;

//ABLOY CLASSIC VARIABLES CUTTINGS LEVEL 2
abloy_classic_side_of_cutting = qt_abloy_classic_side_of_cutting_qt;
abloy_classic_number_of_discs = qt_abloy_classic_number_of_discs_qt;
abloy_classic_spaces = qt_abloy_classic_spaces_qt;
abloy_classic_mill_thickness = qt_abloy_classic_mill_thickness_qt;
abloy_classic_angle_step = qt_abloy_classic_angle_step_qt;
abloy_classic_distance_from_tip = qt_abloy_classic_distance_from_tip_qt;
abloy_classic_cut01 = qt_abloy_classic_cut01_qt;
abloy_classic_cut02 = qt_abloy_classic_cut02_qt;
abloy_classic_cut03 = qt_abloy_classic_cut03_qt;
abloy_classic_cut04 = qt_abloy_classic_cut04_qt;
abloy_classic_cut05 = qt_abloy_classic_cut05_qt;
abloy_classic_cut06 = qt_abloy_classic_cut06_qt;
abloy_classic_cut07 = qt_abloy_classic_cut07_qt;
abloy_classic_cut08 = qt_abloy_classic_cut08_qt;
abloy_classic_cut09 = qt_abloy_classic_cut09_qt;
abloy_classic_cut10 = qt_abloy_classic_cut10_qt;
abloy_classic_cut11 = qt_abloy_classic_cut11_qt;
abloy_classic_cut12 = qt_abloy_classic_cut12_qt;
abloy_classic_cut13 = qt_abloy_classic_cut13_qt;
abloy_classic_cut14 = qt_abloy_classic_cut14_qt;
abloy_classic_cut15 = qt_abloy_classic_cut15_qt;
abloy_classic_cut16 = qt_abloy_classic_cut16_qt;
abloy_classic_cut17 = qt_abloy_classic_cut17_qt;
abloy_classic_cut18 = qt_abloy_classic_cut18_qt;
abloy_classic_cut19 = qt_abloy_classic_cut19_qt;
abloy_classic_cut20 = qt_abloy_classic_cut20_qt;



//ABLOY DISKLOCK PRO VARIABLES CUTTINGS LEVEL 2
abloy_disklock_number_of_discs = qt_abloy_disklock_number_of_discs_qt;
abloy_disklock_spaces = qt_abloy_disklock_spaces_qt;
abloy_disklock_mill_thickness = qt_abloy_disklock_mill_thickness_qt;
abloy_disklock_distance_from_tip = qt_abloy_disklock_distance_from_tip_qt;
abloy_disklock_groove_at_the_tip = qt_abloy_disklock_groove_at_the_tip_qt;
abloy_disklock_cut01 = qt_abloy_disklock_cut01_qt;
abloy_disklock_cut02 = qt_abloy_disklock_cut02_qt;
abloy_disklock_cut03 = qt_abloy_disklock_cut03_qt;
abloy_disklock_cut04 = qt_abloy_disklock_cut04_qt;
abloy_disklock_cut05 = qt_abloy_disklock_cut05_qt;
abloy_disklock_cut06 = qt_abloy_disklock_cut06_qt;
abloy_disklock_cut07 = qt_abloy_disklock_cut07_qt;
abloy_disklock_cut08 = qt_abloy_disklock_cut08_qt;
abloy_disklock_cut09 = qt_abloy_disklock_cut09_qt;
abloy_disklock_cut10 = qt_abloy_disklock_cut10_qt;
abloy_disklock_cut11 = qt_abloy_disklock_cut11_qt;
abloy_disklock_cut12 = qt_abloy_disklock_cut12_qt;
abloy_disklock_cut13 = qt_abloy_disklock_cut13_qt;
abloy_disklock_cut14 = qt_abloy_disklock_cut14_qt;
abloy_disklock_cut15 = qt_abloy_disklock_cut15_qt;
abloy_disklock_cut16 = qt_abloy_disklock_cut16_qt;
abloy_disklock_cut17 = qt_abloy_disklock_cut17_qt;
abloy_disklock_cut18 = qt_abloy_disklock_cut18_qt;
abloy_disklock_cut19 = qt_abloy_disklock_cut19_qt;
abloy_disklock_cut20 = qt_abloy_disklock_cut20_qt;


//ABLOY PROTEC VARIABLES CUTTINGS LEVEL 2
abloy_protec_number_of_discs = qt_abloy_protec_number_of_discs_qt;
abloy_protec_spaces = qt_abloy_protec_spaces_qt;
abloy_protec_mill_thickness = qt_abloy_protec_mill_thickness_qt;
abloy_protec_distance_from_tip = qt_abloy_protec_distance_from_tip_qt;
abloy_protec_thinner_at_the_tip = qt_abloy_protec_thinner_at_the_tip_qt;
abloy_protec_cut01 = qt_abloy_protec_cut01_qt;
abloy_protec_cut02 = qt_abloy_protec_cut02_qt;
abloy_protec_cut03 = qt_abloy_protec_cut03_qt;
abloy_protec_cut04 = qt_abloy_protec_cut04_qt;
abloy_protec_cut05 = qt_abloy_protec_cut05_qt;
abloy_protec_cut06 = qt_abloy_protec_cut06_qt;
abloy_protec_cut07 = qt_abloy_protec_cut07_qt;
abloy_protec_cut08 = qt_abloy_protec_cut08_qt;
abloy_protec_cut09 = qt_abloy_protec_cut09_qt;
abloy_protec_cut10 = qt_abloy_protec_cut10_qt;
abloy_protec_cut11 = qt_abloy_protec_cut11_qt;
abloy_protec_cut12 = qt_abloy_protec_cut12_qt;
abloy_protec_cut13 = qt_abloy_protec_cut13_qt;
abloy_protec_cut14 = qt_abloy_protec_cut14_qt;
abloy_protec_cut15 = qt_abloy_protec_cut15_qt;
abloy_protec_cut16 = qt_abloy_protec_cut16_qt;
abloy_protec_cut17 = qt_abloy_protec_cut17_qt;
abloy_protec_cut18 = qt_abloy_protec_cut18_qt;
abloy_protec_cut19 = qt_abloy_protec_cut19_qt;
abloy_protec_cut20 = qt_abloy_protec_cut20_qt;


//ABUS PLUS VARIABLES CUTTINGS LEVEL 2
abus_plus_number_of_discs = qt_abus_plus_number_of_discs_qt;
abus_plus_spaces = qt_abus_plus_spaces_qt;
abus_plus_mill_thickness = qt_abus_plus_mill_thickness_qt;
abus_plus_distance_from_tip = qt_abus_plus_distance_from_tip_qt;
abus_plus_cut01 = qt_abus_plus_cut01_qt;
abus_plus_cut02 = qt_abus_plus_cut02_qt;
abus_plus_cut03 = qt_abus_plus_cut03_qt;
abus_plus_cut04 = qt_abus_plus_cut04_qt;
abus_plus_cut05 = qt_abus_plus_cut05_qt;
abus_plus_cut06 = qt_abus_plus_cut06_qt;
abus_plus_cut07 = qt_abus_plus_cut07_qt;
abus_plus_cut08 = qt_abus_plus_cut08_qt;
abus_plus_cut09 = qt_abus_plus_cut09_qt;
abus_plus_cut10 = qt_abus_plus_cut10_qt;
abus_plus_cut11 = qt_abus_plus_cut11_qt;
abus_plus_cut12 = qt_abus_plus_cut12_qt;
abus_plus_cut13 = qt_abus_plus_cut13_qt;
abus_plus_cut14 = qt_abus_plus_cut14_qt;
abus_plus_cut15 = qt_abus_plus_cut15_qt;
abus_plus_cut16 = qt_abus_plus_cut16_qt;
abus_plus_cut17 = qt_abus_plus_cut17_qt;
abus_plus_cut18 = qt_abus_plus_cut18_qt;
abus_plus_cut19 = qt_abus_plus_cut19_qt;
abus_plus_cut20 = qt_abus_plus_cut20_qt;


//ABUS X PLUS VARIABLES CUTTINGS LEVEL 2
abus_x_plus_number_of_discs = qt_abus_x_plus_number_of_discs_qt;
abus_x_plus_spaces = qt_abus_x_plus_spaces_qt;
abus_x_plus_mill_thickness = qt_abus_x_plus_mill_thickness_qt;
abus_x_plus_distance_from_tip = qt_abus_x_plus_distance_from_tip_qt;
abus_x_plus_cut01 = qt_abus_x_plus_cut01_qt;
abus_x_plus_cut02 = qt_abus_x_plus_cut02_qt;
abus_x_plus_cut03 = qt_abus_x_plus_cut03_qt;
abus_x_plus_cut04 = qt_abus_x_plus_cut04_qt;
abus_x_plus_cut05 = qt_abus_x_plus_cut05_qt;
abus_x_plus_cut06 = qt_abus_x_plus_cut06_qt;
abus_x_plus_cut07 = qt_abus_x_plus_cut07_qt;
abus_x_plus_cut08 = qt_abus_x_plus_cut08_qt;
abus_x_plus_cut09 = qt_abus_x_plus_cut09_qt;
abus_x_plus_cut10 = qt_abus_x_plus_cut10_qt;
abus_x_plus_cut11 = qt_abus_x_plus_cut11_qt;
abus_x_plus_cut12 = qt_abus_x_plus_cut12_qt;
abus_x_plus_cut13 = qt_abus_x_plus_cut13_qt;
abus_x_plus_cut14 = qt_abus_x_plus_cut14_qt;
abus_x_plus_cut15 = qt_abus_x_plus_cut15_qt;
abus_x_plus_cut16 = qt_abus_x_plus_cut16_qt;
abus_x_plus_cut17 = qt_abus_x_plus_cut17_qt;
abus_x_plus_cut18 = qt_abus_x_plus_cut18_qt;
abus_x_plus_cut19 = qt_abus_x_plus_cut19_qt;
abus_x_plus_cut20 = qt_abus_x_plus_cut20_qt;

//UNIVERSAL DISK TUMBLER KEY VARIABLES CUTTINGS LEVEL 2
universal_disk_angle_step = qt_universal_disk_angle_step_qt;
universal_disk_tip_thickness = qt_universal_disk_tip_thickness_qt;
universal_disk_dist_pin = qt_universal_disk_dist_pin_qt;
universal_disk_mill_width = qt_universal_disk_mill_width_qt;
universal_disk_move_x = qt_universal_disk_move_x_qt;
universal_disk_reversible = qt_universal_disk_reversible_qt;
universal_disk_auto_tip = qt_universal_disk_auto_tip_qt;
universal_disk_angle_01 = qt_universal_disk_angle_01_qt;
universal_disk_angle_02 = qt_universal_disk_angle_02_qt;
universal_disk_angle_03 = qt_universal_disk_angle_03_qt;
universal_disk_angle_04 = qt_universal_disk_angle_04_qt;
universal_disk_angle_05 = qt_universal_disk_angle_05_qt;
universal_disk_angle_06 = qt_universal_disk_angle_06_qt;
universal_disk_angle_07 = qt_universal_disk_angle_07_qt;
universal_disk_angle_08 = qt_universal_disk_angle_08_qt;
universal_disk_angle_09 = qt_universal_disk_angle_09_qt;
universal_disk_angle_10 = qt_universal_disk_angle_10_qt;
universal_disk_angle_11 = qt_universal_disk_angle_11_qt;
universal_disk_angle_12 = qt_universal_disk_angle_12_qt;
universal_disk_angle_13 = qt_universal_disk_angle_13_qt;
universal_disk_angle_14 = qt_universal_disk_angle_14_qt;
universal_disk_angle_15 = qt_universal_disk_angle_15_qt;
universal_disk_angle_16 = qt_universal_disk_angle_16_qt;
universal_disk_angle_17 = qt_universal_disk_angle_17_qt;
universal_disk_angle_18 = qt_universal_disk_angle_18_qt;
universal_disk_angle_19 = qt_universal_disk_angle_19_qt;
universal_disk_angle_20 = qt_universal_disk_angle_20_qt;


//FICHET 787 PARAMETERS
//CONSTANTS
fichet_787_cut01 = qt_fichet_787_cut01_qt;
fichet_787_cut02 = qt_fichet_787_cut02_qt;
fichet_787_cut03 = qt_fichet_787_cut03_qt;
fichet_787_cut04 = qt_fichet_787_cut04_qt;
fichet_787_cut05 = qt_fichet_787_cut05_qt;
fichet_787_cut06 = qt_fichet_787_cut06_qt;
fichet_787_cut07 = qt_fichet_787_cut07_qt;
fichet_787_cut08 = qt_fichet_787_cut08_qt;
fichet_787_cut09 = qt_fichet_787_cut09_qt;
fichet_787_cut10 = qt_fichet_787_cut10_qt;



//VARIABLES LEVEL 2 CONTINUED
//EXTRA CUTS Level 2 TO APPLY to Blank and Additons of Level 1
//SHAPE 01 EXTRA CUTS Level 2
extra_cut_level2_shape_01_model = qt_extra_cut_level2_shape_01_model_qt;
extra_cut_level2_shape_01_cube_centered = qt_extra_cut_level2_shape_01_cube_centered_qt;
extra_cut_level2_shape_01_cube_dimensions = qt_extra_cut_level2_shape_01_cube_dimensions_qt;
extra_cut_level2_shape_01_cube_rotation = qt_extra_cut_level2_shape_01_cube_rotation_qt;
extra_cut_level2_shape_01_cube_translate = qt_extra_cut_level2_shape_01_cube_translate_qt;

extra_cut_level2_shape_01_cylinder_centered = qt_extra_cut_level2_shape_01_cylinder_centered_qt;
extra_cut_level2_shape_01_cylinder_diameter = qt_extra_cut_level2_shape_01_cylinder_diameter_qt;
extra_cut_level2_shape_01_cylinder_height = qt_extra_cut_level2_shape_01_cylinder_height_qt;
extra_cut_level2_shape_01_cylinder_number_of_faces = qt_extra_cut_level2_shape_01_cylinder_number_of_faces_qt;
extra_cut_level2_shape_01_cylinder_rotation = qt_extra_cut_level2_shape_01_cylinder_rotation_qt;
extra_cut_level2_shape_01_cylinder_translate = qt_extra_cut_level2_shape_01_cylinder_translate_qt;

extra_cut_level2_shape_01_sphere_diameter = qt_extra_cut_level2_shape_01_sphere_diameter_qt;
extra_cut_level2_shape_01_sphere_number_of_faces = qt_extra_cut_level2_shape_01_sphere_number_of_faces_qt;
extra_cut_level2_shape_01_sphere_translate = qt_extra_cut_level2_shape_01_sphere_translate_qt;

extra_cut_level2_shape_01_stl_name = qt_extra_cut_level2_shape_01_stl_name_qt;
extra_cut_level2_shape_01_stl_rotation = qt_extra_cut_level2_shape_01_stl_rotation_qt;
extra_cut_level2_shape_01_stl_translate = qt_extra_cut_level2_shape_01_stl_translate_qt;


//SHAPE 02 EXTRA CUTS Level 2
extra_cut_level2_shape_02_model = qt_extra_cut_level2_shape_02_model_qt;
extra_cut_level2_shape_02_cube_centered = qt_extra_cut_level2_shape_02_cube_centered_qt;
extra_cut_level2_shape_02_cube_dimensions = qt_extra_cut_level2_shape_02_cube_dimensions_qt;
extra_cut_level2_shape_02_cube_rotation = qt_extra_cut_level2_shape_02_cube_rotation_qt;
extra_cut_level2_shape_02_cube_translate = qt_extra_cut_level2_shape_02_cube_translate_qt;

extra_cut_level2_shape_02_cylinder_centered = qt_extra_cut_level2_shape_02_cylinder_centered_qt;
extra_cut_level2_shape_02_cylinder_diameter = qt_extra_cut_level2_shape_02_cylinder_diameter_qt;
extra_cut_level2_shape_02_cylinder_height = qt_extra_cut_level2_shape_02_cylinder_height_qt;
extra_cut_level2_shape_02_cylinder_number_of_faces = qt_extra_cut_level2_shape_02_cylinder_number_of_faces_qt;
extra_cut_level2_shape_02_cylinder_rotation = qt_extra_cut_level2_shape_02_cylinder_rotation_qt;
extra_cut_level2_shape_02_cylinder_translate = qt_extra_cut_level2_shape_02_cylinder_translate_qt;

extra_cut_level2_shape_02_sphere_diameter = qt_extra_cut_level2_shape_02_sphere_diameter_qt;
extra_cut_level2_shape_02_sphere_number_of_faces = qt_extra_cut_level2_shape_02_sphere_number_of_faces_qt;
extra_cut_level2_shape_02_sphere_translate = qt_extra_cut_level2_shape_02_sphere_translate_qt;

extra_cut_level2_shape_02_stl_name = qt_extra_cut_level2_shape_02_stl_name_qt;
extra_cut_level2_shape_02_stl_rotation = qt_extra_cut_level2_shape_02_stl_rotation_qt;
extra_cut_level2_shape_02_stl_translate = qt_extra_cut_level2_shape_02_stl_translate_qt;


//SHAPE 03 EXTRA CUTS Level 2
extra_cut_level2_shape_03_model = qt_extra_cut_level2_shape_03_model_qt;
extra_cut_level2_shape_03_cube_centered = qt_extra_cut_level2_shape_03_cube_centered_qt;
extra_cut_level2_shape_03_cube_dimensions = qt_extra_cut_level2_shape_03_cube_dimensions_qt;
extra_cut_level2_shape_03_cube_rotation = qt_extra_cut_level2_shape_03_cube_rotation_qt;
extra_cut_level2_shape_03_cube_translate = qt_extra_cut_level2_shape_03_cube_translate_qt;

extra_cut_level2_shape_03_cylinder_centered = qt_extra_cut_level2_shape_03_cylinder_centered_qt;
extra_cut_level2_shape_03_cylinder_diameter = qt_extra_cut_level2_shape_03_cylinder_diameter_qt;
extra_cut_level2_shape_03_cylinder_height = qt_extra_cut_level2_shape_03_cylinder_height_qt;
extra_cut_level2_shape_03_cylinder_number_of_faces = qt_extra_cut_level2_shape_03_cylinder_number_of_faces_qt;
extra_cut_level2_shape_03_cylinder_rotation = qt_extra_cut_level2_shape_03_cylinder_rotation_qt;
extra_cut_level2_shape_03_cylinder_translate = qt_extra_cut_level2_shape_03_cylinder_translate_qt;

extra_cut_level2_shape_03_sphere_diameter = qt_extra_cut_level2_shape_03_sphere_diameter_qt;
extra_cut_level2_shape_03_sphere_number_of_faces = qt_extra_cut_level2_shape_03_sphere_number_of_faces_qt;
extra_cut_level2_shape_03_sphere_translate = qt_extra_cut_level2_shape_03_sphere_translate_qt;

extra_cut_level2_shape_03_stl_name = qt_extra_cut_level2_shape_03_stl_name_qt;
extra_cut_level2_shape_03_stl_rotation = qt_extra_cut_level2_shape_03_stl_rotation_qt;
extra_cut_level2_shape_03_stl_translate = qt_extra_cut_level2_shape_03_stl_translate_qt;


//SHAPE 04 EXTRA CUTS Level 2
extra_cut_level2_shape_04_model = qt_extra_cut_level2_shape_04_model_qt;
extra_cut_level2_shape_04_cube_centered = qt_extra_cut_level2_shape_04_cube_centered_qt;
extra_cut_level2_shape_04_cube_dimensions = qt_extra_cut_level2_shape_04_cube_dimensions_qt;
extra_cut_level2_shape_04_cube_rotation = qt_extra_cut_level2_shape_04_cube_rotation_qt;
extra_cut_level2_shape_04_cube_translate = qt_extra_cut_level2_shape_04_cube_translate_qt;

extra_cut_level2_shape_04_cylinder_centered = qt_extra_cut_level2_shape_04_cylinder_centered_qt;
extra_cut_level2_shape_04_cylinder_diameter = qt_extra_cut_level2_shape_04_cylinder_diameter_qt;
extra_cut_level2_shape_04_cylinder_height = qt_extra_cut_level2_shape_04_cylinder_height_qt;
extra_cut_level2_shape_04_cylinder_number_of_faces = qt_extra_cut_level2_shape_04_cylinder_number_of_faces_qt;
extra_cut_level2_shape_04_cylinder_rotation = qt_extra_cut_level2_shape_04_cylinder_rotation_qt;
extra_cut_level2_shape_04_cylinder_translate = qt_extra_cut_level2_shape_04_cylinder_translate_qt;

extra_cut_level2_shape_04_sphere_diameter = qt_extra_cut_level2_shape_04_sphere_diameter_qt;
extra_cut_level2_shape_04_sphere_number_of_faces = qt_extra_cut_level2_shape_04_sphere_number_of_faces_qt;
extra_cut_level2_shape_04_sphere_translate = qt_extra_cut_level2_shape_04_sphere_translate_qt;

extra_cut_level2_shape_04_stl_name = qt_extra_cut_level2_shape_04_stl_name_qt;
extra_cut_level2_shape_04_stl_rotation = qt_extra_cut_level2_shape_04_stl_rotation_qt;
extra_cut_level2_shape_04_stl_translate = qt_extra_cut_level2_shape_04_stl_translate_qt;


//SHAPE 05 EXTRA CUTS Level 2
extra_cut_level2_shape_05_model = qt_extra_cut_level2_shape_05_model_qt;
extra_cut_level2_shape_05_cube_centered = qt_extra_cut_level2_shape_05_cube_centered_qt;
extra_cut_level2_shape_05_cube_dimensions = qt_extra_cut_level2_shape_05_cube_dimensions_qt;
extra_cut_level2_shape_05_cube_rotation = qt_extra_cut_level2_shape_05_cube_rotation_qt;
extra_cut_level2_shape_05_cube_translate = qt_extra_cut_level2_shape_05_cube_translate_qt;

extra_cut_level2_shape_05_cylinder_centered = qt_extra_cut_level2_shape_05_cylinder_centered_qt;
extra_cut_level2_shape_05_cylinder_diameter = qt_extra_cut_level2_shape_05_cylinder_diameter_qt;
extra_cut_level2_shape_05_cylinder_height = qt_extra_cut_level2_shape_05_cylinder_height_qt;
extra_cut_level2_shape_05_cylinder_number_of_faces = qt_extra_cut_level2_shape_05_cylinder_number_of_faces_qt;
extra_cut_level2_shape_05_cylinder_rotation = qt_extra_cut_level2_shape_05_cylinder_rotation_qt;
extra_cut_level2_shape_05_cylinder_translate = qt_extra_cut_level2_shape_05_cylinder_translate_qt;

extra_cut_level2_shape_05_sphere_diameter = qt_extra_cut_level2_shape_05_sphere_diameter_qt;
extra_cut_level2_shape_05_sphere_number_of_faces = qt_extra_cut_level2_shape_05_sphere_number_of_faces_qt;
extra_cut_level2_shape_05_sphere_translate = qt_extra_cut_level2_shape_05_sphere_translate_qt;

extra_cut_level2_shape_05_stl_name = qt_extra_cut_level2_shape_05_stl_name_qt;
extra_cut_level2_shape_05_stl_rotation = qt_extra_cut_level2_shape_05_stl_rotation_qt;
extra_cut_level2_shape_05_stl_translate = qt_extra_cut_level2_shape_05_stl_translate_qt;


//SHAPE 06 EXTRA CUTS Level 2
extra_cut_level2_shape_06_model = qt_extra_cut_level2_shape_06_model_qt;
extra_cut_level2_shape_06_cube_centered = qt_extra_cut_level2_shape_06_cube_centered_qt;
extra_cut_level2_shape_06_cube_dimensions = qt_extra_cut_level2_shape_06_cube_dimensions_qt;
extra_cut_level2_shape_06_cube_rotation = qt_extra_cut_level2_shape_06_cube_rotation_qt;
extra_cut_level2_shape_06_cube_translate = qt_extra_cut_level2_shape_06_cube_translate_qt;

extra_cut_level2_shape_06_cylinder_centered = qt_extra_cut_level2_shape_06_cylinder_centered_qt;
extra_cut_level2_shape_06_cylinder_diameter = qt_extra_cut_level2_shape_06_cylinder_diameter_qt;
extra_cut_level2_shape_06_cylinder_height = qt_extra_cut_level2_shape_06_cylinder_height_qt;
extra_cut_level2_shape_06_cylinder_number_of_faces = qt_extra_cut_level2_shape_06_cylinder_number_of_faces_qt;
extra_cut_level2_shape_06_cylinder_rotation = qt_extra_cut_level2_shape_06_cylinder_rotation_qt;
extra_cut_level2_shape_06_cylinder_translate = qt_extra_cut_level2_shape_06_cylinder_translate_qt;

extra_cut_level2_shape_06_sphere_diameter = qt_extra_cut_level2_shape_06_sphere_diameter_qt;
extra_cut_level2_shape_06_sphere_number_of_faces = qt_extra_cut_level2_shape_06_sphere_number_of_faces_qt;
extra_cut_level2_shape_06_sphere_translate = qt_extra_cut_level2_shape_06_sphere_translate_qt;

extra_cut_level2_shape_06_stl_name = qt_extra_cut_level2_shape_06_stl_name_qt;
extra_cut_level2_shape_06_stl_rotation = qt_extra_cut_level2_shape_06_stl_rotation_qt;
extra_cut_level2_shape_06_stl_translate = qt_extra_cut_level2_shape_06_stl_translate_qt;


//SHAPE 07 EXTRA CUTS Level 2
extra_cut_level2_shape_07_model = qt_extra_cut_level2_shape_07_model_qt;
extra_cut_level2_shape_07_cube_centered = qt_extra_cut_level2_shape_07_cube_centered_qt;
extra_cut_level2_shape_07_cube_dimensions = qt_extra_cut_level2_shape_07_cube_dimensions_qt;
extra_cut_level2_shape_07_cube_rotation = qt_extra_cut_level2_shape_07_cube_rotation_qt;
extra_cut_level2_shape_07_cube_translate = qt_extra_cut_level2_shape_07_cube_translate_qt;

extra_cut_level2_shape_07_cylinder_centered = qt_extra_cut_level2_shape_07_cylinder_centered_qt;
extra_cut_level2_shape_07_cylinder_diameter = qt_extra_cut_level2_shape_07_cylinder_diameter_qt;
extra_cut_level2_shape_07_cylinder_height = qt_extra_cut_level2_shape_07_cylinder_height_qt;
extra_cut_level2_shape_07_cylinder_number_of_faces = qt_extra_cut_level2_shape_07_cylinder_number_of_faces_qt;
extra_cut_level2_shape_07_cylinder_rotation = qt_extra_cut_level2_shape_07_cylinder_rotation_qt;
extra_cut_level2_shape_07_cylinder_translate = qt_extra_cut_level2_shape_07_cylinder_translate_qt;

extra_cut_level2_shape_07_sphere_diameter = qt_extra_cut_level2_shape_07_sphere_diameter_qt;
extra_cut_level2_shape_07_sphere_number_of_faces = qt_extra_cut_level2_shape_07_sphere_number_of_faces_qt;
extra_cut_level2_shape_07_sphere_translate = qt_extra_cut_level2_shape_07_sphere_translate_qt;

extra_cut_level2_shape_07_stl_name = qt_extra_cut_level2_shape_07_stl_name_qt;
extra_cut_level2_shape_07_stl_rotation = qt_extra_cut_level2_shape_07_stl_rotation_qt;
extra_cut_level2_shape_07_stl_translate = qt_extra_cut_level2_shape_07_stl_translate_qt;


//SHAPE 08 EXTRA CUTS Level 2
extra_cut_level2_shape_08_model = qt_extra_cut_level2_shape_08_model_qt;
extra_cut_level2_shape_08_cube_centered = qt_extra_cut_level2_shape_08_cube_centered_qt;
extra_cut_level2_shape_08_cube_dimensions = qt_extra_cut_level2_shape_08_cube_dimensions_qt;
extra_cut_level2_shape_08_cube_rotation = qt_extra_cut_level2_shape_08_cube_rotation_qt;
extra_cut_level2_shape_08_cube_translate = qt_extra_cut_level2_shape_08_cube_translate_qt;

extra_cut_level2_shape_08_cylinder_centered = qt_extra_cut_level2_shape_08_cylinder_centered_qt;
extra_cut_level2_shape_08_cylinder_diameter = qt_extra_cut_level2_shape_08_cylinder_diameter_qt;
extra_cut_level2_shape_08_cylinder_height = qt_extra_cut_level2_shape_08_cylinder_height_qt;
extra_cut_level2_shape_08_cylinder_number_of_faces = qt_extra_cut_level2_shape_08_cylinder_number_of_faces_qt;
extra_cut_level2_shape_08_cylinder_rotation = qt_extra_cut_level2_shape_08_cylinder_rotation_qt;
extra_cut_level2_shape_08_cylinder_translate = qt_extra_cut_level2_shape_08_cylinder_translate_qt;

extra_cut_level2_shape_08_sphere_diameter = qt_extra_cut_level2_shape_08_sphere_diameter_qt;
extra_cut_level2_shape_08_sphere_number_of_faces = qt_extra_cut_level2_shape_08_sphere_number_of_faces_qt;
extra_cut_level2_shape_08_sphere_translate = qt_extra_cut_level2_shape_08_sphere_translate_qt;

extra_cut_level2_shape_08_stl_name = qt_extra_cut_level2_shape_08_stl_name_qt;
extra_cut_level2_shape_08_stl_rotation = qt_extra_cut_level2_shape_08_stl_rotation_qt;
extra_cut_level2_shape_08_stl_translate = qt_extra_cut_level2_shape_08_stl_translate_qt;

//SHAPE 09 EXTRA CUTS Level 2
extra_cut_level2_shape_09_model = qt_extra_cut_level2_shape_09_model_qt;
extra_cut_level2_shape_09_cube_centered = qt_extra_cut_level2_shape_09_cube_centered_qt;
extra_cut_level2_shape_09_cube_dimensions = qt_extra_cut_level2_shape_09_cube_dimensions_qt;
extra_cut_level2_shape_09_cube_rotation = qt_extra_cut_level2_shape_09_cube_rotation_qt;
extra_cut_level2_shape_09_cube_translate = qt_extra_cut_level2_shape_09_cube_translate_qt;

extra_cut_level2_shape_09_cylinder_centered = qt_extra_cut_level2_shape_09_cylinder_centered_qt;
extra_cut_level2_shape_09_cylinder_diameter = qt_extra_cut_level2_shape_09_cylinder_diameter_qt;
extra_cut_level2_shape_09_cylinder_height = qt_extra_cut_level2_shape_09_cylinder_height_qt;
extra_cut_level2_shape_09_cylinder_number_of_faces = qt_extra_cut_level2_shape_09_cylinder_number_of_faces_qt;
extra_cut_level2_shape_09_cylinder_rotation = qt_extra_cut_level2_shape_09_cylinder_rotation_qt;
extra_cut_level2_shape_09_cylinder_translate = qt_extra_cut_level2_shape_09_cylinder_translate_qt;

extra_cut_level2_shape_09_sphere_diameter = qt_extra_cut_level2_shape_09_sphere_diameter_qt;
extra_cut_level2_shape_09_sphere_number_of_faces = qt_extra_cut_level2_shape_09_sphere_number_of_faces_qt;
extra_cut_level2_shape_09_sphere_translate = qt_extra_cut_level2_shape_09_sphere_translate_qt;

extra_cut_level2_shape_09_stl_name = qt_extra_cut_level2_shape_09_stl_name_qt;
extra_cut_level2_shape_09_stl_rotation = qt_extra_cut_level2_shape_09_stl_rotation_qt;
extra_cut_level2_shape_09_stl_translate = qt_extra_cut_level2_shape_09_stl_translate_qt;


//SHAPE 10 EXTRA CUTS Level 2
extra_cut_level2_shape_10_model = qt_extra_cut_level2_shape_10_model_qt;
extra_cut_level2_shape_10_cube_centered = qt_extra_cut_level2_shape_10_cube_centered_qt;
extra_cut_level2_shape_10_cube_dimensions = qt_extra_cut_level2_shape_10_cube_dimensions_qt;
extra_cut_level2_shape_10_cube_rotation = qt_extra_cut_level2_shape_10_cube_rotation_qt;
extra_cut_level2_shape_10_cube_translate = qt_extra_cut_level2_shape_10_cube_translate_qt;

extra_cut_level2_shape_10_cylinder_centered = qt_extra_cut_level2_shape_10_cylinder_centered_qt;
extra_cut_level2_shape_10_cylinder_diameter = qt_extra_cut_level2_shape_10_cylinder_diameter_qt;
extra_cut_level2_shape_10_cylinder_height = qt_extra_cut_level2_shape_10_cylinder_height_qt;
extra_cut_level2_shape_10_cylinder_number_of_faces = qt_extra_cut_level2_shape_10_cylinder_number_of_faces_qt;
extra_cut_level2_shape_10_cylinder_rotation = qt_extra_cut_level2_shape_10_cylinder_rotation_qt;
extra_cut_level2_shape_10_cylinder_translate = qt_extra_cut_level2_shape_10_cylinder_translate_qt;

extra_cut_level2_shape_10_sphere_diameter = qt_extra_cut_level2_shape_10_sphere_diameter_qt;
extra_cut_level2_shape_10_sphere_number_of_faces = qt_extra_cut_level2_shape_10_sphere_number_of_faces_qt;
extra_cut_level2_shape_10_sphere_translate = qt_extra_cut_level2_shape_10_sphere_translate_qt;

extra_cut_level2_shape_10_stl_name = qt_extra_cut_level2_shape_10_stl_name_qt;
extra_cut_level2_shape_10_stl_rotation = qt_extra_cut_level2_shape_10_stl_rotation_qt;
extra_cut_level2_shape_10_stl_translate = qt_extra_cut_level2_shape_10_stl_translate_qt;



//VARIABLES LEVEL 3 being cut by Cuts Level 4 but not by Cuts Level 2
//EXTRA materials


//SHAPE 01 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_01_model = qt_extra_material_level3_shape_01_model_qt;
extra_material_level3_shape_01_cube_centered = qt_extra_material_level3_shape_01_cube_centered_qt;
extra_material_level3_shape_01_cube_dimensions = qt_extra_material_level3_shape_01_cube_dimensions_qt;
extra_material_level3_shape_01_cube_rotation = qt_extra_material_level3_shape_01_cube_rotation_qt;
extra_material_level3_shape_01_cube_translate = qt_extra_material_level3_shape_01_cube_translate_qt;

extra_material_level3_shape_01_cylinder_centered = qt_extra_material_level3_shape_01_cylinder_centered_qt;
extra_material_level3_shape_01_cylinder_diameter = qt_extra_material_level3_shape_01_cylinder_diameter_qt;
extra_material_level3_shape_01_cylinder_height = qt_extra_material_level3_shape_01_cylinder_height_qt;
extra_material_level3_shape_01_cylinder_number_of_faces = qt_extra_material_level3_shape_01_cylinder_number_of_faces_qt;
extra_material_level3_shape_01_cylinder_rotation = qt_extra_material_level3_shape_01_cylinder_rotation_qt;
extra_material_level3_shape_01_cylinder_translate = qt_extra_material_level3_shape_01_cylinder_translate_qt;

extra_material_level3_shape_01_sphere_diameter = qt_extra_material_level3_shape_01_sphere_diameter_qt;
extra_material_level3_shape_01_sphere_number_of_faces = qt_extra_material_level3_shape_01_sphere_number_of_faces_qt;
extra_material_level3_shape_01_sphere_translate = qt_extra_material_level3_shape_01_sphere_translate_qt;

extra_material_level3_shape_01_stl_name = qt_extra_material_level3_shape_01_stl_name_qt;
extra_material_level3_shape_01_stl_rotation = qt_extra_material_level3_shape_01_stl_rotation_qt;
extra_material_level3_shape_01_stl_translate = qt_extra_material_level3_shape_01_stl_translate_qt;


//SHAPE 02 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_02_model = qt_extra_material_level3_shape_02_model_qt;
extra_material_level3_shape_02_cube_centered = qt_extra_material_level3_shape_02_cube_centered_qt;
extra_material_level3_shape_02_cube_dimensions = qt_extra_material_level3_shape_02_cube_dimensions_qt;
extra_material_level3_shape_02_cube_rotation = qt_extra_material_level3_shape_02_cube_rotation_qt;
extra_material_level3_shape_02_cube_translate = qt_extra_material_level3_shape_02_cube_translate_qt;

extra_material_level3_shape_02_cylinder_centered = qt_extra_material_level3_shape_02_cylinder_centered_qt;
extra_material_level3_shape_02_cylinder_diameter = qt_extra_material_level3_shape_02_cylinder_diameter_qt;
extra_material_level3_shape_02_cylinder_height = qt_extra_material_level3_shape_02_cylinder_height_qt;
extra_material_level3_shape_02_cylinder_number_of_faces = qt_extra_material_level3_shape_02_cylinder_number_of_faces_qt;
extra_material_level3_shape_02_cylinder_rotation = qt_extra_material_level3_shape_02_cylinder_rotation_qt;
extra_material_level3_shape_02_cylinder_translate = qt_extra_material_level3_shape_02_cylinder_translate_qt;

extra_material_level3_shape_02_sphere_diameter = qt_extra_material_level3_shape_02_sphere_diameter_qt;
extra_material_level3_shape_02_sphere_number_of_faces = qt_extra_material_level3_shape_02_sphere_number_of_faces_qt;
extra_material_level3_shape_02_sphere_translate = qt_extra_material_level3_shape_02_sphere_translate_qt;

extra_material_level3_shape_02_stl_name = qt_extra_material_level3_shape_02_stl_name_qt;
extra_material_level3_shape_02_stl_rotation = qt_extra_material_level3_shape_02_stl_rotation_qt;
extra_material_level3_shape_02_stl_translate = qt_extra_material_level3_shape_02_stl_translate_qt;


//SHAPE 03 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_03_model = qt_extra_material_level3_shape_03_model_qt;
extra_material_level3_shape_03_cube_centered = qt_extra_material_level3_shape_03_cube_centered_qt;
extra_material_level3_shape_03_cube_dimensions = qt_extra_material_level3_shape_03_cube_dimensions_qt;
extra_material_level3_shape_03_cube_rotation = qt_extra_material_level3_shape_03_cube_rotation_qt;
extra_material_level3_shape_03_cube_translate = qt_extra_material_level3_shape_03_cube_translate_qt;

extra_material_level3_shape_03_cylinder_centered = qt_extra_material_level3_shape_03_cylinder_centered_qt;
extra_material_level3_shape_03_cylinder_diameter = qt_extra_material_level3_shape_03_cylinder_diameter_qt;
extra_material_level3_shape_03_cylinder_height = qt_extra_material_level3_shape_03_cylinder_height_qt;
extra_material_level3_shape_03_cylinder_number_of_faces = qt_extra_material_level3_shape_03_cylinder_number_of_faces_qt;
extra_material_level3_shape_03_cylinder_rotation = qt_extra_material_level3_shape_03_cylinder_rotation_qt;
extra_material_level3_shape_03_cylinder_translate = qt_extra_material_level3_shape_03_cylinder_translate_qt;

extra_material_level3_shape_03_sphere_diameter = qt_extra_material_level3_shape_03_sphere_diameter_qt;
extra_material_level3_shape_03_sphere_number_of_faces = qt_extra_material_level3_shape_03_sphere_number_of_faces_qt;
extra_material_level3_shape_03_sphere_translate = qt_extra_material_level3_shape_03_sphere_translate_qt;

extra_material_level3_shape_03_stl_name = qt_extra_material_level3_shape_03_stl_name_qt;
extra_material_level3_shape_03_stl_rotation = qt_extra_material_level3_shape_03_stl_rotation_qt;
extra_material_level3_shape_03_stl_translate = qt_extra_material_level3_shape_03_stl_translate_qt;


//SHAPE 04 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_04_model = qt_extra_material_level3_shape_04_model_qt;
extra_material_level3_shape_04_cube_centered = qt_extra_material_level3_shape_04_cube_centered_qt;
extra_material_level3_shape_04_cube_dimensions = qt_extra_material_level3_shape_04_cube_dimensions_qt;
extra_material_level3_shape_04_cube_rotation = qt_extra_material_level3_shape_04_cube_rotation_qt;
extra_material_level3_shape_04_cube_translate = qt_extra_material_level3_shape_04_cube_translate_qt;

extra_material_level3_shape_04_cylinder_centered = qt_extra_material_level3_shape_04_cylinder_centered_qt;
extra_material_level3_shape_04_cylinder_diameter = qt_extra_material_level3_shape_04_cylinder_diameter_qt;
extra_material_level3_shape_04_cylinder_height = qt_extra_material_level3_shape_04_cylinder_height_qt;
extra_material_level3_shape_04_cylinder_number_of_faces = qt_extra_material_level3_shape_04_cylinder_number_of_faces_qt;
extra_material_level3_shape_04_cylinder_rotation = qt_extra_material_level3_shape_04_cylinder_rotation_qt;
extra_material_level3_shape_04_cylinder_translate = qt_extra_material_level3_shape_04_cylinder_translate_qt;

extra_material_level3_shape_04_sphere_diameter = qt_extra_material_level3_shape_04_sphere_diameter_qt;
extra_material_level3_shape_04_sphere_number_of_faces = qt_extra_material_level3_shape_04_sphere_number_of_faces_qt;
extra_material_level3_shape_04_sphere_translate = qt_extra_material_level3_shape_04_sphere_translate_qt;

extra_material_level3_shape_04_stl_name = qt_extra_material_level3_shape_04_stl_name_qt;
extra_material_level3_shape_04_stl_rotation = qt_extra_material_level3_shape_04_stl_rotation_qt;
extra_material_level3_shape_04_stl_translate = qt_extra_material_level3_shape_04_stl_translate_qt;


//SHAPE 05 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_05_model = qt_extra_material_level3_shape_05_model_qt;
extra_material_level3_shape_05_cube_centered = qt_extra_material_level3_shape_05_cube_centered_qt;
extra_material_level3_shape_05_cube_dimensions = qt_extra_material_level3_shape_05_cube_dimensions_qt;
extra_material_level3_shape_05_cube_rotation = qt_extra_material_level3_shape_05_cube_rotation_qt;
extra_material_level3_shape_05_cube_translate = qt_extra_material_level3_shape_05_cube_translate_qt;

extra_material_level3_shape_05_cylinder_centered = qt_extra_material_level3_shape_05_cylinder_centered_qt;
extra_material_level3_shape_05_cylinder_diameter = qt_extra_material_level3_shape_05_cylinder_diameter_qt;
extra_material_level3_shape_05_cylinder_height = qt_extra_material_level3_shape_05_cylinder_height_qt;
extra_material_level3_shape_05_cylinder_number_of_faces = qt_extra_material_level3_shape_05_cylinder_number_of_faces_qt;
extra_material_level3_shape_05_cylinder_rotation = qt_extra_material_level3_shape_05_cylinder_rotation_qt;
extra_material_level3_shape_05_cylinder_translate = qt_extra_material_level3_shape_05_cylinder_translate_qt;

extra_material_level3_shape_05_sphere_diameter = qt_extra_material_level3_shape_05_sphere_diameter_qt;
extra_material_level3_shape_05_sphere_number_of_faces = qt_extra_material_level3_shape_05_sphere_number_of_faces_qt;
extra_material_level3_shape_05_sphere_translate = qt_extra_material_level3_shape_05_sphere_translate_qt;

extra_material_level3_shape_05_stl_name = qt_extra_material_level3_shape_05_stl_name_qt;
extra_material_level3_shape_05_stl_rotation = qt_extra_material_level3_shape_05_stl_rotation_qt;
extra_material_level3_shape_05_stl_translate = qt_extra_material_level3_shape_05_stl_translate_qt;


//SHAPE 06 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_06_model = qt_extra_material_level3_shape_06_model_qt;
extra_material_level3_shape_06_cube_centered = qt_extra_material_level3_shape_06_cube_centered_qt;
extra_material_level3_shape_06_cube_dimensions = qt_extra_material_level3_shape_06_cube_dimensions_qt;
extra_material_level3_shape_06_cube_rotation = qt_extra_material_level3_shape_06_cube_rotation_qt;
extra_material_level3_shape_06_cube_translate = qt_extra_material_level3_shape_06_cube_translate_qt;

extra_material_level3_shape_06_cylinder_centered = qt_extra_material_level3_shape_06_cylinder_centered_qt;
extra_material_level3_shape_06_cylinder_diameter = qt_extra_material_level3_shape_06_cylinder_diameter_qt;
extra_material_level3_shape_06_cylinder_height = qt_extra_material_level3_shape_06_cylinder_height_qt;
extra_material_level3_shape_06_cylinder_number_of_faces = qt_extra_material_level3_shape_06_cylinder_number_of_faces_qt;
extra_material_level3_shape_06_cylinder_rotation = qt_extra_material_level3_shape_06_cylinder_rotation_qt;
extra_material_level3_shape_06_cylinder_translate = qt_extra_material_level3_shape_06_cylinder_translate_qt;

extra_material_level3_shape_06_sphere_diameter = qt_extra_material_level3_shape_06_sphere_diameter_qt;
extra_material_level3_shape_06_sphere_number_of_faces = qt_extra_material_level3_shape_06_sphere_number_of_faces_qt;
extra_material_level3_shape_06_sphere_translate = qt_extra_material_level3_shape_06_sphere_translate_qt;

extra_material_level3_shape_06_stl_name = qt_extra_material_level3_shape_06_stl_name_qt;
extra_material_level3_shape_06_stl_rotation = qt_extra_material_level3_shape_06_stl_rotation_qt;
extra_material_level3_shape_06_stl_translate = qt_extra_material_level3_shape_06_stl_translate_qt;


//SHAPE 07 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_07_model = qt_extra_material_level3_shape_07_model_qt;
extra_material_level3_shape_07_cube_centered = qt_extra_material_level3_shape_07_cube_centered_qt;
extra_material_level3_shape_07_cube_dimensions = qt_extra_material_level3_shape_07_cube_dimensions_qt;
extra_material_level3_shape_07_cube_rotation = qt_extra_material_level3_shape_07_cube_rotation_qt;
extra_material_level3_shape_07_cube_translate = qt_extra_material_level3_shape_07_cube_translate_qt;

extra_material_level3_shape_07_cylinder_centered = qt_extra_material_level3_shape_07_cylinder_centered_qt;
extra_material_level3_shape_07_cylinder_diameter = qt_extra_material_level3_shape_07_cylinder_diameter_qt;
extra_material_level3_shape_07_cylinder_height = qt_extra_material_level3_shape_07_cylinder_height_qt;
extra_material_level3_shape_07_cylinder_number_of_faces = qt_extra_material_level3_shape_07_cylinder_number_of_faces_qt;
extra_material_level3_shape_07_cylinder_rotation = qt_extra_material_level3_shape_07_cylinder_rotation_qt;
extra_material_level3_shape_07_cylinder_translate = qt_extra_material_level3_shape_07_cylinder_translate_qt;

extra_material_level3_shape_07_sphere_diameter = qt_extra_material_level3_shape_07_sphere_diameter_qt;
extra_material_level3_shape_07_sphere_number_of_faces = qt_extra_material_level3_shape_07_sphere_number_of_faces_qt;
extra_material_level3_shape_07_sphere_translate = qt_extra_material_level3_shape_07_sphere_translate_qt;

extra_material_level3_shape_07_stl_name = qt_extra_material_level3_shape_07_stl_name_qt;
extra_material_level3_shape_07_stl_rotation = qt_extra_material_level3_shape_07_stl_rotation_qt;
extra_material_level3_shape_07_stl_translate = qt_extra_material_level3_shape_07_stl_translate_qt;


//SHAPE 08 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_08_model = qt_extra_material_level3_shape_08_model_qt;
extra_material_level3_shape_08_cube_centered = qt_extra_material_level3_shape_08_cube_centered_qt;
extra_material_level3_shape_08_cube_dimensions = qt_extra_material_level3_shape_08_cube_dimensions_qt;
extra_material_level3_shape_08_cube_rotation = qt_extra_material_level3_shape_08_cube_rotation_qt;
extra_material_level3_shape_08_cube_translate = qt_extra_material_level3_shape_08_cube_translate_qt;

extra_material_level3_shape_08_cylinder_centered = qt_extra_material_level3_shape_08_cylinder_centered_qt;
extra_material_level3_shape_08_cylinder_diameter = qt_extra_material_level3_shape_08_cylinder_diameter_qt;
extra_material_level3_shape_08_cylinder_height = qt_extra_material_level3_shape_08_cylinder_height_qt;
extra_material_level3_shape_08_cylinder_number_of_faces = qt_extra_material_level3_shape_08_cylinder_number_of_faces_qt;
extra_material_level3_shape_08_cylinder_rotation = qt_extra_material_level3_shape_08_cylinder_rotation_qt;
extra_material_level3_shape_08_cylinder_translate = qt_extra_material_level3_shape_08_cylinder_translate_qt;

extra_material_level3_shape_08_sphere_diameter = qt_extra_material_level3_shape_08_sphere_diameter_qt;
extra_material_level3_shape_08_sphere_number_of_faces = qt_extra_material_level3_shape_08_sphere_number_of_faces_qt;
extra_material_level3_shape_08_sphere_translate = qt_extra_material_level3_shape_08_sphere_translate_qt;

extra_material_level3_shape_08_stl_name = qt_extra_material_level3_shape_08_stl_name_qt;
extra_material_level3_shape_08_stl_rotation = qt_extra_material_level3_shape_08_stl_rotation_qt;
extra_material_level3_shape_08_stl_translate = qt_extra_material_level3_shape_08_stl_translate_qt;

//SHAPE 09 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_09_model = qt_extra_material_level3_shape_09_model_qt;
extra_material_level3_shape_09_cube_centered = qt_extra_material_level3_shape_09_cube_centered_qt;
extra_material_level3_shape_09_cube_dimensions = qt_extra_material_level3_shape_09_cube_dimensions_qt;
extra_material_level3_shape_09_cube_rotation = qt_extra_material_level3_shape_09_cube_rotation_qt;
extra_material_level3_shape_09_cube_translate = qt_extra_material_level3_shape_09_cube_translate_qt;

extra_material_level3_shape_09_cylinder_centered = qt_extra_material_level3_shape_09_cylinder_centered_qt;
extra_material_level3_shape_09_cylinder_diameter = qt_extra_material_level3_shape_09_cylinder_diameter_qt;
extra_material_level3_shape_09_cylinder_height = qt_extra_material_level3_shape_09_cylinder_height_qt;
extra_material_level3_shape_09_cylinder_number_of_faces = qt_extra_material_level3_shape_09_cylinder_number_of_faces_qt;
extra_material_level3_shape_09_cylinder_rotation = qt_extra_material_level3_shape_09_cylinder_rotation_qt;
extra_material_level3_shape_09_cylinder_translate = qt_extra_material_level3_shape_09_cylinder_translate_qt;

extra_material_level3_shape_09_sphere_diameter = qt_extra_material_level3_shape_09_sphere_diameter_qt;
extra_material_level3_shape_09_sphere_number_of_faces = qt_extra_material_level3_shape_09_sphere_number_of_faces_qt;
extra_material_level3_shape_09_sphere_translate = qt_extra_material_level3_shape_09_sphere_translate_qt;

extra_material_level3_shape_09_stl_name = qt_extra_material_level3_shape_09_stl_name_qt;
extra_material_level3_shape_09_stl_rotation = qt_extra_material_level3_shape_09_stl_rotation_qt;
extra_material_level3_shape_09_stl_translate = qt_extra_material_level3_shape_09_stl_translate_qt;


//SHAPE 10 ADDITION MATERIAL (Level 3)
extra_material_level3_shape_10_model = qt_extra_material_level3_shape_10_model_qt;
extra_material_level3_shape_10_cube_centered = qt_extra_material_level3_shape_10_cube_centered_qt;
extra_material_level3_shape_10_cube_dimensions = qt_extra_material_level3_shape_10_cube_dimensions_qt;
extra_material_level3_shape_10_cube_rotation = qt_extra_material_level3_shape_10_cube_rotation_qt;
extra_material_level3_shape_10_cube_translate = qt_extra_material_level3_shape_10_cube_translate_qt;

extra_material_level3_shape_10_cylinder_centered = qt_extra_material_level3_shape_10_cylinder_centered_qt;
extra_material_level3_shape_10_cylinder_diameter = qt_extra_material_level3_shape_10_cylinder_diameter_qt;
extra_material_level3_shape_10_cylinder_height = qt_extra_material_level3_shape_10_cylinder_height_qt;
extra_material_level3_shape_10_cylinder_number_of_faces = qt_extra_material_level3_shape_10_cylinder_number_of_faces_qt;
extra_material_level3_shape_10_cylinder_rotation = qt_extra_material_level3_shape_10_cylinder_rotation_qt;
extra_material_level3_shape_10_cylinder_translate = qt_extra_material_level3_shape_10_cylinder_translate_qt;

extra_material_level3_shape_10_sphere_diameter = qt_extra_material_level3_shape_10_sphere_diameter_qt;
extra_material_level3_shape_10_sphere_number_of_faces = qt_extra_material_level3_shape_10_sphere_number_of_faces_qt;
extra_material_level3_shape_10_sphere_translate = qt_extra_material_level3_shape_10_sphere_translate_qt;

extra_material_level3_shape_10_stl_name = qt_extra_material_level3_shape_10_stl_name_qt;
extra_material_level3_shape_10_stl_rotation = qt_extra_material_level3_shape_10_stl_rotation_qt;
extra_material_level3_shape_10_stl_translate = qt_extra_material_level3_shape_10_stl_translate_qt;


//SONIC INSERT DATA
regular_sonic_insert_offset_x =                   qt_regular_sonic_insert_offset_x_qt;
regular_sonic_insert_offset_z =                   qt_regular_sonic_insert_offset_z_qt;
regular_sonic_insert_stl =                        qt_regular_sonic_insert_stl_qt;

dimple_sonic_insert_offset_x =                    qt_dimple_sonic_insert_offset_x_qt;
dimple_sonic_insert_offset_z =                    qt_dimple_sonic_insert_offset_z_qt;
dimple_sonic_insert_probe_width =                 qt_dimple_sonic_insert_probe_width_qt;
dimple_sonic_insert_stl =                         qt_dimple_sonic_insert_stl_qt;


//VARIABLES Level 4 TO APPLY TO EVERYTHING
//SHAPE 01 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_01_model = qt_extra_cut_level4_shape_01_model_qt;
extra_cut_level4_shape_01_cube_centered = qt_extra_cut_level4_shape_01_cube_centered_qt;
extra_cut_level4_shape_01_cube_dimensions = qt_extra_cut_level4_shape_01_cube_dimensions_qt;
extra_cut_level4_shape_01_cube_rotation = qt_extra_cut_level4_shape_01_cube_rotation_qt;
extra_cut_level4_shape_01_cube_translate = qt_extra_cut_level4_shape_01_cube_translate_qt;

extra_cut_level4_shape_01_cylinder_centered = qt_extra_cut_level4_shape_01_cylinder_centered_qt;
extra_cut_level4_shape_01_cylinder_diameter = qt_extra_cut_level4_shape_01_cylinder_diameter_qt;
extra_cut_level4_shape_01_cylinder_height = qt_extra_cut_level4_shape_01_cylinder_height_qt;
extra_cut_level4_shape_01_cylinder_number_of_faces = qt_extra_cut_level4_shape_01_cylinder_number_of_faces_qt;
extra_cut_level4_shape_01_cylinder_rotation = qt_extra_cut_level4_shape_01_cylinder_rotation_qt;
extra_cut_level4_shape_01_cylinder_translate = qt_extra_cut_level4_shape_01_cylinder_translate_qt;

extra_cut_level4_shape_01_sphere_diameter = qt_extra_cut_level4_shape_01_sphere_diameter_qt;
extra_cut_level4_shape_01_sphere_number_of_faces = qt_extra_cut_level4_shape_01_sphere_number_of_faces_qt;
extra_cut_level4_shape_01_sphere_translate = qt_extra_cut_level4_shape_01_sphere_translate_qt;

extra_cut_level4_shape_01_stl_name = qt_extra_cut_level4_shape_01_stl_name_qt;
extra_cut_level4_shape_01_stl_rotation = qt_extra_cut_level4_shape_01_stl_rotation_qt;
extra_cut_level4_shape_01_stl_translate = qt_extra_cut_level4_shape_01_stl_translate_qt;


//SHAPE 02 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_02_model = qt_extra_cut_level4_shape_02_model_qt;
extra_cut_level4_shape_02_cube_centered = qt_extra_cut_level4_shape_02_cube_centered_qt;
extra_cut_level4_shape_02_cube_dimensions = qt_extra_cut_level4_shape_02_cube_dimensions_qt;
extra_cut_level4_shape_02_cube_rotation = qt_extra_cut_level4_shape_02_cube_rotation_qt;
extra_cut_level4_shape_02_cube_translate = qt_extra_cut_level4_shape_02_cube_translate_qt;

extra_cut_level4_shape_02_cylinder_centered = qt_extra_cut_level4_shape_02_cylinder_centered_qt;
extra_cut_level4_shape_02_cylinder_diameter = qt_extra_cut_level4_shape_02_cylinder_diameter_qt;
extra_cut_level4_shape_02_cylinder_height = qt_extra_cut_level4_shape_02_cylinder_height_qt;
extra_cut_level4_shape_02_cylinder_number_of_faces = qt_extra_cut_level4_shape_02_cylinder_number_of_faces_qt;
extra_cut_level4_shape_02_cylinder_rotation = qt_extra_cut_level4_shape_02_cylinder_rotation_qt;
extra_cut_level4_shape_02_cylinder_translate = qt_extra_cut_level4_shape_02_cylinder_translate_qt;

extra_cut_level4_shape_02_sphere_diameter = qt_extra_cut_level4_shape_02_sphere_diameter_qt;
extra_cut_level4_shape_02_sphere_number_of_faces = qt_extra_cut_level4_shape_02_sphere_number_of_faces_qt;
extra_cut_level4_shape_02_sphere_translate = qt_extra_cut_level4_shape_02_sphere_translate_qt;

extra_cut_level4_shape_02_stl_name = qt_extra_cut_level4_shape_02_stl_name_qt;
extra_cut_level4_shape_02_stl_rotation = qt_extra_cut_level4_shape_02_stl_rotation_qt;
extra_cut_level4_shape_02_stl_translate = qt_extra_cut_level4_shape_02_stl_translate_qt;


//SHAPE 03 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_03_model = qt_extra_cut_level4_shape_03_model_qt;
extra_cut_level4_shape_03_cube_centered = qt_extra_cut_level4_shape_03_cube_centered_qt;
extra_cut_level4_shape_03_cube_dimensions = qt_extra_cut_level4_shape_03_cube_dimensions_qt;
extra_cut_level4_shape_03_cube_rotation = qt_extra_cut_level4_shape_03_cube_rotation_qt;
extra_cut_level4_shape_03_cube_translate = qt_extra_cut_level4_shape_03_cube_translate_qt;

extra_cut_level4_shape_03_cylinder_centered = qt_extra_cut_level4_shape_03_cylinder_centered_qt;
extra_cut_level4_shape_03_cylinder_diameter = qt_extra_cut_level4_shape_03_cylinder_diameter_qt;
extra_cut_level4_shape_03_cylinder_height = qt_extra_cut_level4_shape_03_cylinder_height_qt;
extra_cut_level4_shape_03_cylinder_number_of_faces = qt_extra_cut_level4_shape_03_cylinder_number_of_faces_qt;
extra_cut_level4_shape_03_cylinder_rotation = qt_extra_cut_level4_shape_03_cylinder_rotation_qt;
extra_cut_level4_shape_03_cylinder_translate = qt_extra_cut_level4_shape_03_cylinder_translate_qt;

extra_cut_level4_shape_03_sphere_diameter = qt_extra_cut_level4_shape_03_sphere_diameter_qt;
extra_cut_level4_shape_03_sphere_number_of_faces = qt_extra_cut_level4_shape_03_sphere_number_of_faces_qt;
extra_cut_level4_shape_03_sphere_translate = qt_extra_cut_level4_shape_03_sphere_translate_qt;

extra_cut_level4_shape_03_stl_name = qt_extra_cut_level4_shape_03_stl_name_qt;
extra_cut_level4_shape_03_stl_rotation = qt_extra_cut_level4_shape_03_stl_rotation_qt;
extra_cut_level4_shape_03_stl_translate = qt_extra_cut_level4_shape_03_stl_translate_qt;


//SHAPE 04 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_04_model = qt_extra_cut_level4_shape_04_model_qt;
extra_cut_level4_shape_04_cube_centered = qt_extra_cut_level4_shape_04_cube_centered_qt;
extra_cut_level4_shape_04_cube_dimensions = qt_extra_cut_level4_shape_04_cube_dimensions_qt;
extra_cut_level4_shape_04_cube_rotation = qt_extra_cut_level4_shape_04_cube_rotation_qt;
extra_cut_level4_shape_04_cube_translate = qt_extra_cut_level4_shape_04_cube_translate_qt;

extra_cut_level4_shape_04_cylinder_centered = qt_extra_cut_level4_shape_04_cylinder_centered_qt;
extra_cut_level4_shape_04_cylinder_diameter = qt_extra_cut_level4_shape_04_cylinder_diameter_qt;
extra_cut_level4_shape_04_cylinder_height = qt_extra_cut_level4_shape_04_cylinder_height_qt;
extra_cut_level4_shape_04_cylinder_number_of_faces = qt_extra_cut_level4_shape_04_cylinder_number_of_faces_qt;
extra_cut_level4_shape_04_cylinder_rotation = qt_extra_cut_level4_shape_04_cylinder_rotation_qt;
extra_cut_level4_shape_04_cylinder_translate = qt_extra_cut_level4_shape_04_cylinder_translate_qt;

extra_cut_level4_shape_04_sphere_diameter = qt_extra_cut_level4_shape_04_sphere_diameter_qt;
extra_cut_level4_shape_04_sphere_number_of_faces = qt_extra_cut_level4_shape_04_sphere_number_of_faces_qt;
extra_cut_level4_shape_04_sphere_translate = qt_extra_cut_level4_shape_04_sphere_translate_qt;

extra_cut_level4_shape_04_stl_name = qt_extra_cut_level4_shape_04_stl_name_qt;
extra_cut_level4_shape_04_stl_rotation = qt_extra_cut_level4_shape_04_stl_rotation_qt;
extra_cut_level4_shape_04_stl_translate = qt_extra_cut_level4_shape_04_stl_translate_qt;


//SHAPE 05 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_05_model = qt_extra_cut_level4_shape_05_model_qt;
extra_cut_level4_shape_05_cube_centered = qt_extra_cut_level4_shape_05_cube_centered_qt;
extra_cut_level4_shape_05_cube_dimensions = qt_extra_cut_level4_shape_05_cube_dimensions_qt;
extra_cut_level4_shape_05_cube_rotation = qt_extra_cut_level4_shape_05_cube_rotation_qt;
extra_cut_level4_shape_05_cube_translate = qt_extra_cut_level4_shape_05_cube_translate_qt;

extra_cut_level4_shape_05_cylinder_centered = qt_extra_cut_level4_shape_05_cylinder_centered_qt;
extra_cut_level4_shape_05_cylinder_diameter = qt_extra_cut_level4_shape_05_cylinder_diameter_qt;
extra_cut_level4_shape_05_cylinder_height = qt_extra_cut_level4_shape_05_cylinder_height_qt;
extra_cut_level4_shape_05_cylinder_number_of_faces = qt_extra_cut_level4_shape_05_cylinder_number_of_faces_qt;
extra_cut_level4_shape_05_cylinder_rotation = qt_extra_cut_level4_shape_05_cylinder_rotation_qt;
extra_cut_level4_shape_05_cylinder_translate = qt_extra_cut_level4_shape_05_cylinder_translate_qt;

extra_cut_level4_shape_05_sphere_diameter = qt_extra_cut_level4_shape_05_sphere_diameter_qt;
extra_cut_level4_shape_05_sphere_number_of_faces = qt_extra_cut_level4_shape_05_sphere_number_of_faces_qt;
extra_cut_level4_shape_05_sphere_translate = qt_extra_cut_level4_shape_05_sphere_translate_qt;

extra_cut_level4_shape_05_stl_name = qt_extra_cut_level4_shape_05_stl_name_qt;
extra_cut_level4_shape_05_stl_rotation = qt_extra_cut_level4_shape_05_stl_rotation_qt;
extra_cut_level4_shape_05_stl_translate = qt_extra_cut_level4_shape_05_stl_translate_qt;


//SHAPE 06 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_06_model = qt_extra_cut_level4_shape_06_model_qt;
extra_cut_level4_shape_06_cube_centered = qt_extra_cut_level4_shape_06_cube_centered_qt;
extra_cut_level4_shape_06_cube_dimensions = qt_extra_cut_level4_shape_06_cube_dimensions_qt;
extra_cut_level4_shape_06_cube_rotation = qt_extra_cut_level4_shape_06_cube_rotation_qt;
extra_cut_level4_shape_06_cube_translate = qt_extra_cut_level4_shape_06_cube_translate_qt;

extra_cut_level4_shape_06_cylinder_centered = qt_extra_cut_level4_shape_06_cylinder_centered_qt;
extra_cut_level4_shape_06_cylinder_diameter = qt_extra_cut_level4_shape_06_cylinder_diameter_qt;
extra_cut_level4_shape_06_cylinder_height = qt_extra_cut_level4_shape_06_cylinder_height_qt;
extra_cut_level4_shape_06_cylinder_number_of_faces = qt_extra_cut_level4_shape_06_cylinder_number_of_faces_qt;
extra_cut_level4_shape_06_cylinder_rotation = qt_extra_cut_level4_shape_06_cylinder_rotation_qt;
extra_cut_level4_shape_06_cylinder_translate = qt_extra_cut_level4_shape_06_cylinder_translate_qt;

extra_cut_level4_shape_06_sphere_diameter = qt_extra_cut_level4_shape_06_sphere_diameter_qt;
extra_cut_level4_shape_06_sphere_number_of_faces = qt_extra_cut_level4_shape_06_sphere_number_of_faces_qt;
extra_cut_level4_shape_06_sphere_translate = qt_extra_cut_level4_shape_06_sphere_translate_qt;

extra_cut_level4_shape_06_stl_name = qt_extra_cut_level4_shape_06_stl_name_qt;
extra_cut_level4_shape_06_stl_rotation = qt_extra_cut_level4_shape_06_stl_rotation_qt;
extra_cut_level4_shape_06_stl_translate = qt_extra_cut_level4_shape_06_stl_translate_qt;


//SHAPE 07 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_07_model = qt_extra_cut_level4_shape_07_model_qt;
extra_cut_level4_shape_07_cube_centered = qt_extra_cut_level4_shape_07_cube_centered_qt;
extra_cut_level4_shape_07_cube_dimensions = qt_extra_cut_level4_shape_07_cube_dimensions_qt;
extra_cut_level4_shape_07_cube_rotation = qt_extra_cut_level4_shape_07_cube_rotation_qt;
extra_cut_level4_shape_07_cube_translate = qt_extra_cut_level4_shape_07_cube_translate_qt;

extra_cut_level4_shape_07_cylinder_centered = qt_extra_cut_level4_shape_07_cylinder_centered_qt;
extra_cut_level4_shape_07_cylinder_diameter = qt_extra_cut_level4_shape_07_cylinder_diameter_qt;
extra_cut_level4_shape_07_cylinder_height = qt_extra_cut_level4_shape_07_cylinder_height_qt;
extra_cut_level4_shape_07_cylinder_number_of_faces = qt_extra_cut_level4_shape_07_cylinder_number_of_faces_qt;
extra_cut_level4_shape_07_cylinder_rotation = qt_extra_cut_level4_shape_07_cylinder_rotation_qt;
extra_cut_level4_shape_07_cylinder_translate = qt_extra_cut_level4_shape_07_cylinder_translate_qt;

extra_cut_level4_shape_07_sphere_diameter = qt_extra_cut_level4_shape_07_sphere_diameter_qt;
extra_cut_level4_shape_07_sphere_number_of_faces = qt_extra_cut_level4_shape_07_sphere_number_of_faces_qt;
extra_cut_level4_shape_07_sphere_translate = qt_extra_cut_level4_shape_07_sphere_translate_qt;

extra_cut_level4_shape_07_stl_name = qt_extra_cut_level4_shape_07_stl_name_qt;
extra_cut_level4_shape_07_stl_rotation = qt_extra_cut_level4_shape_07_stl_rotation_qt;
extra_cut_level4_shape_07_stl_translate = qt_extra_cut_level4_shape_07_stl_translate_qt;


//SHAPE 08 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_08_model = qt_extra_cut_level4_shape_08_model_qt;
extra_cut_level4_shape_08_cube_centered = qt_extra_cut_level4_shape_08_cube_centered_qt;
extra_cut_level4_shape_08_cube_dimensions = qt_extra_cut_level4_shape_08_cube_dimensions_qt;
extra_cut_level4_shape_08_cube_rotation = qt_extra_cut_level4_shape_08_cube_rotation_qt;
extra_cut_level4_shape_08_cube_translate = qt_extra_cut_level4_shape_08_cube_translate_qt;

extra_cut_level4_shape_08_cylinder_centered = qt_extra_cut_level4_shape_08_cylinder_centered_qt;
extra_cut_level4_shape_08_cylinder_diameter = qt_extra_cut_level4_shape_08_cylinder_diameter_qt;
extra_cut_level4_shape_08_cylinder_height = qt_extra_cut_level4_shape_08_cylinder_height_qt;
extra_cut_level4_shape_08_cylinder_number_of_faces = qt_extra_cut_level4_shape_08_cylinder_number_of_faces_qt;
extra_cut_level4_shape_08_cylinder_rotation = qt_extra_cut_level4_shape_08_cylinder_rotation_qt;
extra_cut_level4_shape_08_cylinder_translate = qt_extra_cut_level4_shape_08_cylinder_translate_qt;

extra_cut_level4_shape_08_sphere_diameter = qt_extra_cut_level4_shape_08_sphere_diameter_qt;
extra_cut_level4_shape_08_sphere_number_of_faces = qt_extra_cut_level4_shape_08_sphere_number_of_faces_qt;
extra_cut_level4_shape_08_sphere_translate = qt_extra_cut_level4_shape_08_sphere_translate_qt;

extra_cut_level4_shape_08_stl_name = qt_extra_cut_level4_shape_08_stl_name_qt;
extra_cut_level4_shape_08_stl_rotation = qt_extra_cut_level4_shape_08_stl_rotation_qt;
extra_cut_level4_shape_08_stl_translate = qt_extra_cut_level4_shape_08_stl_translate_qt;

//SHAPE 09 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_09_model = qt_extra_cut_level4_shape_09_model_qt;
extra_cut_level4_shape_09_cube_centered = qt_extra_cut_level4_shape_09_cube_centered_qt;
extra_cut_level4_shape_09_cube_dimensions = qt_extra_cut_level4_shape_09_cube_dimensions_qt;
extra_cut_level4_shape_09_cube_rotation = qt_extra_cut_level4_shape_09_cube_rotation_qt;
extra_cut_level4_shape_09_cube_translate = qt_extra_cut_level4_shape_09_cube_translate_qt;

extra_cut_level4_shape_09_cylinder_centered = qt_extra_cut_level4_shape_09_cylinder_centered_qt;
extra_cut_level4_shape_09_cylinder_diameter = qt_extra_cut_level4_shape_09_cylinder_diameter_qt;
extra_cut_level4_shape_09_cylinder_height = qt_extra_cut_level4_shape_09_cylinder_height_qt;
extra_cut_level4_shape_09_cylinder_number_of_faces = qt_extra_cut_level4_shape_09_cylinder_number_of_faces_qt;
extra_cut_level4_shape_09_cylinder_rotation = qt_extra_cut_level4_shape_09_cylinder_rotation_qt;
extra_cut_level4_shape_09_cylinder_translate = qt_extra_cut_level4_shape_09_cylinder_translate_qt;

extra_cut_level4_shape_09_sphere_diameter = qt_extra_cut_level4_shape_09_sphere_diameter_qt;
extra_cut_level4_shape_09_sphere_number_of_faces = qt_extra_cut_level4_shape_09_sphere_number_of_faces_qt;
extra_cut_level4_shape_09_sphere_translate = qt_extra_cut_level4_shape_09_sphere_translate_qt;

extra_cut_level4_shape_09_stl_name = qt_extra_cut_level4_shape_09_stl_name_qt;
extra_cut_level4_shape_09_stl_rotation = qt_extra_cut_level4_shape_09_stl_rotation_qt;
extra_cut_level4_shape_09_stl_translate = qt_extra_cut_level4_shape_09_stl_translate_qt;


//SHAPE 10 EXTRA CUTS Level 4 TO APPLY TO EVERYTHING
extra_cut_level4_shape_10_model = qt_extra_cut_level4_shape_10_model_qt;
extra_cut_level4_shape_10_cube_centered = qt_extra_cut_level4_shape_10_cube_centered_qt;
extra_cut_level4_shape_10_cube_dimensions = qt_extra_cut_level4_shape_10_cube_dimensions_qt;
extra_cut_level4_shape_10_cube_rotation = qt_extra_cut_level4_shape_10_cube_rotation_qt;
extra_cut_level4_shape_10_cube_translate = qt_extra_cut_level4_shape_10_cube_translate_qt;

extra_cut_level4_shape_10_cylinder_centered = qt_extra_cut_level4_shape_10_cylinder_centered_qt;
extra_cut_level4_shape_10_cylinder_diameter = qt_extra_cut_level4_shape_10_cylinder_diameter_qt;
extra_cut_level4_shape_10_cylinder_height = qt_extra_cut_level4_shape_10_cylinder_height_qt;
extra_cut_level4_shape_10_cylinder_number_of_faces = qt_extra_cut_level4_shape_10_cylinder_number_of_faces_qt;
extra_cut_level4_shape_10_cylinder_rotation = qt_extra_cut_level4_shape_10_cylinder_rotation_qt;
extra_cut_level4_shape_10_cylinder_translate = qt_extra_cut_level4_shape_10_cylinder_translate_qt;

extra_cut_level4_shape_10_sphere_diameter = qt_extra_cut_level4_shape_10_sphere_diameter_qt;
extra_cut_level4_shape_10_sphere_number_of_faces = qt_extra_cut_level4_shape_10_sphere_number_of_faces_qt;
extra_cut_level4_shape_10_sphere_translate = qt_extra_cut_level4_shape_10_sphere_translate_qt;

extra_cut_level4_shape_10_stl_name = qt_extra_cut_level4_shape_10_stl_name_qt;
extra_cut_level4_shape_10_stl_rotation = qt_extra_cut_level4_shape_10_stl_rotation_qt;
extra_cut_level4_shape_10_stl_translate = qt_extra_cut_level4_shape_10_stl_translate_qt;

// END OF ALL VARIABLES




///////////////////
//MODULES

//MODULES LEVEL 1 BLANK GENERATION AND EXTRA MATERIAL
//MODULES OF BLANKS GENERATION
module regular(regular_length=regular_length,
               regular_height=regular_height,
               regular_thickness=regular_thickness,
               regular_dxf_name=regular_dxf_name,
               regular_stl_name=regular_stl_name)
{
    color ("red")
    {
        if (regular_dxf_name=="0")
        {
            resize([regular_thickness,regular_length+epsilon,regular_height])   import(regular_stl_name);
        }//END OF IF

        //if (regular_stl_name=="0")
        else
        {
            difference()
            {
            translate ([0,regular_length,0])
            rotate([90,0,0])
            translate([regular_thickness/2,0,0])
                resize([regular_thickness,regular_height,regular_length+epsilon])
            rotate([0,0,90])
            linear_extrude(height = regular_length+epsilon, center = 1, convexity = 10)
                import (file = regular_dxf_name);

            if(regular_auto_tip=="YES")
                {
                    translate([-regular_thickness,regular_length+3,0])
                    rotate([45,0,0])
                    cube([regular_thickness*2,10,20]);

                    translate([-regular_thickness,regular_length-2,0])
                    rotate([-45,0,0])
                    cube([regular_thickness*2,10,20]);
                }
            }



        }//END OF ELSE
    }// END OF COLOR

}
//END OF MODULE REGULAR LEVEL 1

module dimple(dimple_length=dimple_length,
                    dimple_width=dimple_width,
                    dimple_thickness=dimple_thickness,
                    dimple_dxf_name=dimple_dxf_name,
                    dimple_stl_name=dimple_stl_name)
{
    color ("red")
    {
        if (dimple_dxf_name=="0")
        {
            resize([dimple_width,dimple_length+epsilon,dimple_thickness])   import(dimple_stl_name);
        }//END OF IF

        else
        {
            translate ([0,dimple_length,0])
            rotate([90,0,0])
            resize([dimple_width,dimple_thickness,dimple_length+epsilon])
            linear_extrude(height = dimple_length+epsilon, center = 1, convexity = 10)
            import (file = dimple_dxf_name);
        }//END OF ELSE
    }//END OF COLOR
}
//END OF MODULE DIMPLE LASER LEVEL 1





module round_pump(round_pump_length=round_pump_length,
                  round_pump_diameter=round_pump_diameter,
                  round_pump_tip_hole_diameter=round_pump_tip_hole_diameter,
                  round_pump_tip_hole_depth=round_pump_tip_hole_depth,
                  round_pump_outward_tensioner_length=round_pump_outward_tensioner_length,
                  round_pump_outward_tensioner_height=round_pump_outward_tensioner_height,
                  round_pump_outward_tensioner_thickness=round_pump_outward_tensioner_thickness,
                  round_pump_inward_tensioner_length=round_pump_inward_tensioner_length,
                  round_pump_inward_tensioner_height=round_pump_inward_tensioner_height,
                  round_pump_inward_tensioner_thickness=round_pump_inward_tensioner_thickness)
{
    difference()
    {

        //BODY + RAISED WINGS
        color ("red")
        {
            union ()
            {
                //BODY
                translate ([0,(round_pump_length)/2,0])
                rotate ([90,0,0])
                cylinder(h = round_pump_length, d=round_pump_diameter, center = true);



                //OUTWARD TENSIONER
                translate ([-round_pump_outward_tensioner_thickness/2,0,0])
                cube ([round_pump_outward_tensioner_thickness, round_pump_outward_tensioner_length, round_pump_outward_tensioner_height-round_pump_diameter/2]) ;


            } //END OF UNION
        } //END OF COLOR RED

        //TIP HOLE
        color ("blue")
        {
            translate ([0,round_pump_tip_hole_depth/2-epsilon,0])
            rotate ([90,0,0])
            cylinder (h = round_pump_tip_hole_depth+epsilon, d=round_pump_tip_hole_diameter, center = true);
        }
    }//END OF DIFFERENCE


    //INWARD TENSIONER
    translate ([-round_pump_inward_tensioner_thickness/2,0,round_pump_tip_hole_diameter/2-round_pump_inward_tensioner_height])
                cube ([round_pump_inward_tensioner_thickness,
                       round_pump_inward_tensioner_length,
                       round_pump_inward_tensioner_height+(round_pump_diameter-round_pump_tip_hole_diameter)/4]) ;


}
//END OF MODULE ROUND PUMP BLANK LEVEL 1


//BEGINNING OF SEVERAL MODULES FOR LEVER SIMPLE
module lever_simple_blade_support(lever_simple_body_diameter=lever_simple_body_diameter,
                                  lever_simple_blade_length=lever_simple_blade_length)
{
    translate ([0,-epsilon,0])
    rotate ([-90,0,0])
    cylinder(h = lever_simple_blade_length+2*epsilon, d=lever_simple_body_diameter);
}
//END OF MODULE LEVER SIMPLE BLANK BLADE SUPPORT LEVEL 1

module lever_simple_tip(lever_simple_body_diameter=lever_simple_body_diameter,
                        lever_simple_blade_length=lever_simple_blade_length,
                        lever_simple_tip_length=lever_simple_tip_length)
{
    difference ()
    {
        //tip
        color ("red")
        {
            translate ([0,lever_simple_blade_length+(lever_simple_tip_length/2),0])
            rotate ([90,0,0])
            cylinder(h = lever_simple_tip_length, d=lever_simple_body_diameter, center = true);
        }

        // rounded part at the tip
        color ("blue")
        {
            translate([0,lever_simple_blade_length+lever_simple_tip_length-0.5,0])
            rotate([-90,0,0])
            difference ()
            {
                cylinder(h = 5, d=10, center = true);
                cylinder(h = 6, d1 = 9, d2 = 0.01, center = true);
            }
        }
    }
}
//END OF MODULE TIP LEVER SIMPLE LEVEL 1

module lever_simple_body(lever_simple_body_length=lever_simple_body_length,
                        lever_simple_body_diameter=lever_simple_body_diameter)
{
    color ("green")
    {
        translate ([0,0,0])
        rotate ([90,0,0])
        cylinder(h = lever_simple_body_length, d=lever_simple_body_diameter);
    }
}
//END OF MODULE LEVER SIMPLE BODY LEVEL 1



module lever_simple_blade(lever_simple_body_diameter=lever_simple_body_diameter,
                          lever_simple_blade_length=lever_simple_blade_length,
                          lever_simple_blade_height=lever_simple_blade_height,//from the back
                          lever_simple_blade_thickness=lever_simple_blade_thickness)
{
    color ("blue")
    {
        translate ([-lever_simple_blade_thickness/2,0,0])
        cube([lever_simple_blade_thickness,lever_simple_blade_length,lever_simple_blade_height-lever_simple_body_diameter/2]) ;
    }
}
// END OF MODULE LEVER SIMPLE BLANK LEVEL 1



module lever_simple(lever_simple_body_length=lever_simple_body_length,
                    lever_simple_body_diameter=lever_simple_body_diameter,
                    lever_simple_blade_length=lever_simple_blade_length,
                    lever_simple_blade_height=lever_simple_blade_height, //from the middle
                    lever_simple_blade_thickness=lever_simple_blade_thickness,
                    lever_simple_tip_length=lever_simple_tip_length,
                    lever_simple_tip_hole_diameter=lever_simple_tip_hole_diameter,
                    lever_simple_tip_hole_depth=lever_simple_tip_hole_depth)
{
    difference()
    {
        union()
        {
            lever_simple_blade_support(lever_simple_body_diameter=qt_lever_simple_body_diameter_qt,
                                       lever_simple_blade_length=qt_lever_simple_blade_length_qt);

            lever_simple_tip(lever_simple_body_diameter=qt_lever_simple_body_diameter_qt,
                             lever_simple_blade_length=qt_lever_simple_blade_length_qt,
                             lever_simple_tip_length=qt_lever_simple_tip_length_qt);

            lever_simple_body(lever_simple_body_length=qt_lever_simple_body_length_qt,
                              lever_simple_body_diameter=qt_lever_simple_body_diameter_qt);

            lever_simple_blade(lever_simple_body_diameter=qt_lever_simple_body_diameter_qt,
                               lever_simple_blade_length=qt_lever_simple_blade_length_qt,
                               lever_simple_blade_height=qt_lever_simple_blade_height_qt,
                               lever_simple_blade_thickness=qt_lever_simple_blade_thickness_qt);
        }//END OF UNION

        translate([0,lever_simple_blade_length+lever_simple_tip_length+epsilon,0])
        rotate([90,0,0])
        cylinder(d=lever_simple_tip_hole_diameter, h=lever_simple_tip_hole_depth+epsilon);

    }//END OF DIFFERENCE

}
//END OF MODULE LEVER SIMPLE COMPLETE BLANK LEVEL 1


//BEGINNING OF SEVERAL MODULES FOR LEVER DOUBLE LEVEL 1
module lever_double_blade_support(lever_double_body_diameter=lever_double_body_diameter,
                                  lever_double_blade_length=lever_double_blade_length)
{
    translate ([0,-epsilon,0])
    rotate ([-90,0,0])
    cylinder(h = lever_double_blade_length+2*epsilon, d=lever_double_body_diameter);
}
//END OF MODULE LEVER DOUBLE BLANK LEVEL 1

module lever_double_tip(lever_double_body_diameter=lever_double_body_diameter,
                        lever_double_blade_length=lever_double_blade_length,
                        lever_double_tip_length=lever_double_tip_length)
{
    difference ()
    {
        //tip
        color ("red")
        {
            translate ([0,lever_double_blade_length+(lever_double_tip_length/2),0])
            rotate ([90,0,0])
            cylinder(h = lever_double_tip_length, d=lever_double_body_diameter, center = true);
        }

        // rounded part at the tip
        color ("blue")
        {
            translate([0,lever_double_blade_length+lever_double_tip_length-0.5,0])
            rotate([-90,0,0])
            difference ()
            {
                cylinder(h = 5, d=10, center = true);
                cylinder(h = 6, d1 = 9, d2 = 0.01, center = true);
            }
        }
    }
}
//END OF MODULE LEVER DOUBLE BLANK TIP LEVEL 1

module lever_double_body(lever_double_body_length=lever_double_body_length,
                        lever_double_body_diameter=lever_double_body_diameter)
{
    color ("green")
    {
        translate ([0,0,0])
        rotate ([90,0,0])
        cylinder(h = lever_double_body_length, d=lever_double_body_diameter);
    }
}
//END OF MODULE DOUBLE BODY LEVEL 1

module lever_double_blade(lever_double_body_diameter=lever_double_body_diameter,
                          lever_double_blade_length=lever_double_blade_length,
                          lever_double_blade_height=lever_double_blade_height,//from the middle
                                                  lever_double_blade_offset=lever_double_blade_offset,
                          lever_double_blade_thickness=lever_double_blade_thickness)
{
    color ("blue")
    {
                //TOP BLADE
        translate ([-lever_double_blade_thickness/2+lever_double_blade_offset,0,0])
        cube([lever_double_blade_thickness,lever_double_blade_length,lever_double_blade_height]) ;

                //BOTTOM BLADE
                mirror([0,0,1])
        translate ([-lever_double_blade_thickness/2-lever_double_blade_offset,0,0])
        cube([lever_double_blade_thickness,lever_double_blade_length,lever_double_blade_height]) ;
    }
}
//END OF MODULE LEVER DOUBLE BLADES LEVEL 1



module lever_double(lever_double_body_length=lever_double_body_length,
                    lever_double_body_diameter=lever_double_body_diameter,
                    lever_double_blade_length=lever_double_blade_length,
                    lever_double_blade_height=lever_double_blade_height, //from the middle
                    lever_double_blade_offset=lever_double_blade_offset,
                    lever_double_blade_thickness=lever_double_blade_thickness,
                    lever_double_tip_length=lever_double_tip_length,
                    lever_double_tip_hole_diameter=lever_double_tip_hole_diameter,
                    lever_double_tip_hole_depth=lever_double_tip_hole_depth)
{
    difference()
    {
        union()
        {
            lever_double_blade_support(lever_double_body_diameter=qt_lever_double_body_diameter_qt,
                                       lever_double_blade_length=qt_lever_double_blade_length_qt);

            lever_double_tip(lever_double_body_diameter=qt_lever_double_body_diameter_qt,
                             lever_double_blade_length=qt_lever_double_blade_length_qt,
                             lever_double_tip_length=qt_lever_double_tip_length_qt);

            lever_double_body(lever_double_body_length=qt_lever_double_body_length_qt,
                              lever_double_body_diameter=qt_lever_double_body_diameter_qt);

            lever_double_blade(lever_double_body_diameter=qt_lever_double_body_diameter_qt,
                               lever_double_blade_length=qt_lever_double_blade_length_qt,
                               lever_double_blade_height=qt_lever_double_blade_height_qt,
                               lever_double_blade_thickness=qt_lever_double_blade_thickness_qt);
        }//END OF UNION

        translate([0,lever_double_blade_length+lever_double_tip_length+epsilon,0])
        rotate([90,0,0])
        cylinder(d=lever_double_tip_hole_diameter, h=lever_double_tip_hole_depth+epsilon);

    }//END OF DIFFERENCE

}
//END OF MODULE LEVER DOUBLE COMPLETE BLANK LEVEL 1


module abloy_classic(   abloy_classic_length =    abloy_classic_length,
                        abloy_classic_height =    abloy_classic_height,
                        abloy_classic_thickness = abloy_classic_thickness,
                        abloy_classic_dxf_name =  abloy_classic_dxf_name,
                        abloy_classic_stl_name =  abloy_classic_stl_name)
{


    color ("red")
    {
        if (abloy_classic_dxf_name=="0")
        {
            resize([abloy_classic_thickness,abloy_classic_length+1,abloy_classic_height])
            import(abloy_classic_stl_name);
        }//END OF IF


        else
        {
            translate ([0,-epsilon,0])
            resize([abloy_classic_thickness,abloy_classic_length+epsilon,abloy_classic_height])
            rotate([-90,0,0])
            linear_extrude(height = abloy_classic_length+epsilon, center = 1, convexity = 10)
            import (file = abloy_classic_dxf_name);
        }//END OF ELSE
    }// END OF COLOR

}
//END OF MODULE ABLOY CLASSIC BLANK LEVEL 1


module abloy_disklock(abloy_disklock_length=abloy_disklock_length)
{
    difference()
    {
        color ("red")
        {
            translate ([0,abloy_disklock_length,0])
            translate ([-3.5/2,0,-6/2])
            rotate([90,0,0])
            linear_extrude(height = abloy_disklock_length+epsilon, center = 1, convexity = 10)
            import (file = "disklockpro.dxf");
        }

        //HOLES
        translate ([-0.4,abloy_disklock_length-22.5,1])
        rotate ([0,-90,0])
        cylinder(h = 2, d1 = 1, d2 = 4, center = false, $fn=100);

        translate ([0.4,abloy_disklock_length-22.5,-1])
        rotate ([0,90,0])
        cylinder(h = 2, d1 = 1, d2 = 4, center = false, $fn=100);

        //TIP BEVEL
        translate ([0,abloy_disklock_length,0])
        rotate ([-90,0,0])
        difference ()
        {
            cylinder(h = 5, d=10, center = true);
            cylinder(h = 10, d1 = 9.5, d2 = 1, center = true, $fn=100);
        }
    }
}
//END OF MODULE ABLOY DISKLOCK BLANK LEVEL 1


module abloy_protec(abloy_protec_length=abloy_protec_length)
{
    difference()
    {
        color ("red")
        {
            translate ([0,abloy_protec_length,0])
            rotate([90,0,0])
            linear_extrude(height = abloy_protec_length+epsilon, center = 1, convexity = 10)
            import (file = "protec.dxf");
        }

        //HOLES
        translate ([1.7- (2.9/2),abloy_protec_length-21,0.7])
        rotate ([0,-90,0])
        cylinder(h = 2, d1 = 1, d2 = 3, center = false, $fn=100);

        translate ([0-(1.7- (2.9/2)),abloy_protec_length-21,-0.7])
        rotate ([0,90,0])
        cylinder(h = 2, d1 = 1, d2 = 3, center = false, $fn=100);

    }
}
//END OF MODULE ABLOY PROTEC BLANK LEVEL 1

module abus_plus(abus_plus_length=abus_plus_length)
{
    difference()
    {
        color ("red")
        {
            translate ([0,abus_plus_length,0])
            translate ([-1.45,0,-6.7/2])
            rotate([90,0,0])
            linear_extrude(height = abus_plus_length+epsilon, center = 1, convexity = 10)
            import (file = "abusplus.dxf");
        }


        translate ([0,abus_plus_length,0])
        rotate ([-90,0,0])
        difference ()
        {
            cylinder(h = 5, d=10, center = true);
            cylinder(h = 10, d1 = 9, d2 = 1, center = true, $fn=100);
        }
    }
}//END OF MODULE ABUS PLUS BLANK LEVEL 1


module abus_x_plus(abus_x_plus_length=abus_x_plus_length)
{
    difference()
    {
        color ("red")
        {
            translate ([0,abus_x_plus_length,0])
            translate ([-1.45,0,-6.7/2])
            rotate([90,0,0])
            linear_extrude(height = abus_x_plus_length+epsilon, center = 1, convexity = 10)
            import (file = "abusxplus.dxf");
        }


        translate ([0,abus_x_plus_length,0])
        rotate ([-90,0,0])
        difference ()
        {
            cylinder(h = 5, d=10, center = true);
            cylinder(h = 10, d1 = 9, d2 = 1, center = true, $fn=100);
        }
    }
}//END OF MODULE ABUS PLUS BLANK LEVEL 1


module universal_disk()
{
color ("red") {
translate ([0,universal_disk_blank_length,0])
rotate([0,90,0])
translate ([-universal_disk_key_height/2,0,-universal_disk_key_width/2])
rotate([90,0,0])
    //resize([universal_disk_key_height,universal_disk_key_width,0])
    //cube([5,5,5]);
linear_extrude(height = universal_disk_blank_length+epsilon, center = 1, convexity = 10) import (file = universal_disk_dxf_name);
    }
}//END OF MODULE UNIVERSAL DISK TUMBLER KEY BLANK LEVEL 1



module fichet_787()
{
    difference()
    {
        //SOLID BLANK
        color ("red")
        {
            translate ([fichet_787_thickness/2,0,0])
            rotate ([0,0,90])
            linear_extrude(height = fichet_787_height, center = 1, convexity = 10)
            import (file = "787Svierge.dxf");
        }

        //REMOVED MATERIAL
        color ("blue")
        {
            translate ([fichet_787_profile_depth,fichet_787_dist_from_tip,fichet_787_dist_cut_3])
            rotate ([0,0,-fichet_787_profile_angle])
            cube ([10,20,fichet_787_profile_thickness], center=true) ;

            translate ([fichet_787_profile_depth,fichet_787_dist_from_tip,fichet_787_dist_cut_7])
            rotate ([0,0,-fichet_787_profile_angle])
            cube ([10,20,fichet_787_profile_thickness], center=true) ;

            translate ([-fichet_787_profile_depth,fichet_787_dist_from_tip,fichet_787_dist_cut_4])
            rotate ([0,0,fichet_787_profile_angle])
            cube ([10,20,fichet_787_profile_thickness], center=true) ;

            translate ([-fichet_787_profile_depth,fichet_787_dist_from_tip,fichet_787_dist_cut_8])
            rotate ([0,0,fichet_787_profile_angle])
            cube ([10,20,fichet_787_profile_thickness], center=true) ;

            //tip bevel
            translate ([0,4.9,fichet_787_height/2])
            scale([0.2,1,1])
            rotate ([90,0,0])
            difference ()
            {
                cylinder(h = 10, d=100, center = true);
                cylinder(h = 10.2, d1 = 90, d2 = 0.1, center = true, $fn=100);
            }

            //top bevel
            translate ([0,0,fichet_787_height+0.5])
            rotate ([0,20,0])
            cube ([10,40,1], center=true) ;
        }
    }//END OF DIFFERENCE
}
//END OF MODULE FICHET 787 BLANK LEVEL 1



module expert_stl(  expert_stl_name =           qt_expert_stl_name_qt,
                    expert_stl_set_dimensions = qt_expert_stl_set_dimensions_qt,
                    expert_stl_dx =             qt_expert_stl_dx_qt,
                    expert_stl_dy =             qt_expert_stl_dy_qt,
                    expert_stl_dz =             qt_expert_stl_dz_qt,
                    expert_stl_rx =             qt_expert_stl_rx_qt,
                    expert_stl_ry =             qt_expert_stl_ry_qt,
                    expert_stl_rz =             qt_expert_stl_rz_qt,
                    expert_stl_tx =             qt_expert_stl_tx_qt,
                    expert_stl_ty =             qt_expert_stl_ty_qt,
                    expert_stl_tz =             qt_expert_stl_tz_qt)
{
    if (expert_stl_set_dimensions=="NO")
    {
        import(expert_stl_name);
    }

    if (expert_stl_set_dimensions=="YES")
    {
        translate([expert_stl_tx, expert_stl_ty, expert_stl_tz])
        rotate([expert_stl_rx, expert_stl_ry, expert_stl_rz])
        resize([expert_stl_dx, expert_stl_dy, expert_stl_dz])
        import(expert_stl_name);
    }
}
//END OF MODULE EXPERT STL BLANK LEVEL 1





//END OF ALL BLANKS

//BLANK GENERATION BASED ON MODULES AND VARIABLES
module generate_blank(type_of_key=type_of_key)
{
if (type_of_key == "regular")
    regular(
        regular_length,
        regular_height,
        regular_thickness,
        regular_dxf_name,
        regular_stl_name);

if (type_of_key == "dimple")
    dimple(
        dimple_length,
        dimple_width,
        dimple_thickness,
        dimple_dxf_name,
        dimple_stl_name);



if (type_of_key == "round_pump")
    round_pump(
        round_pump_length,
        round_pump_diameter,
        round_pump_tip_hole_diameter,
        round_pump_tip_hole_depth,
        round_pump_outward_tensioner_length,
        round_pump_outward_tensioner_height,
        round_pump_outward_tensioner_thickness,
        round_pump_inward_tensioner_length,
        round_pump_inward_tensioner_height,
        round_pump_inward_tensioner_thickness);


if (type_of_key == "round_stl")
    round_stl(
        round_stl_name,
        round_stl_tx,
        round_stl_ty,
        round_stl_tz,
        round_stl_rx,
        round_stl_ry,
        round_stl_rz);

if (type_of_key == "lever_simple")
    lever_simple(
         lever_simple_body_length,
         lever_simple_body_diameter,
         lever_simple_blade_length,
         lever_simple_blade_height, //from the middle
         lever_simple_blade_thickness,
         lever_simple_tip_length,
         lever_simple_tip_hole_diameter,
         lever_simple_tip_hole_depth);


if (type_of_key == "lever_double")
    lever_double(
         lever_double_body_length,
         lever_double_body_diameter,
         lever_double_blade_length,
         lever_double_blade_height, //from the middle
         lever_double_blade_offset,
         lever_double_blade_thickness,
         lever_double_tip_length,
         lever_double_tip_hole_diameter,
         lever_double_tip_hole_depth);

if (type_of_key == "abloy_classic")
    abloy_classic(      abloy_classic_length,
                        abloy_classic_height,
                        abloy_classic_thickness,
                        abloy_classic_dxf_name,
                        abloy_classic_stl_name);

if (type_of_key == "abloy_disklock")
    abloy_disklock(abloy_disklock_length);

if (type_of_key == "abloy_protec")
    abloy_protec(abloy_protec_length);

if (type_of_key == "abus_plus")
    abus_plus(abus_plus_length);

if (type_of_key == "abus_x_plus")
    abus_plus(abus_plus_length);

if (type_of_key == "universal_disk")
    universal_disk(abus_plus_length);


if (type_of_key == "fichet_787")
    fichet_787();

if (type_of_key == "expert_stl")
    expert_stl( expert_stl_name,
                expert_stl_set_dimensions,
                expert_stl_dx,
                expert_stl_dy,
                expert_stl_dz,
                expert_stl_rx,
                expert_stl_ry,
                expert_stl_rz,
                expert_stl_tx,
                expert_stl_ty,
                expert_stl_tz);
}
//END OF MODULE GENERATING THE CHOSEN BLANK

//Additions of Level 1
//BEGINNING OF MODULES FOR ADDING THE 10 SHAPES of Level 1
module extra_material_level1_shape_01()
{

    if (extra_material_level1_shape_01_model=="CUBE")
    {
        if(extra_material_level1_shape_01_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_01_cube_translate)
            rotate(extra_material_level1_shape_01_cube_rotation)
            cube(extra_material_level1_shape_01_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_01_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_01_cube_translate)
            rotate(extra_material_level1_shape_01_cube_rotation)
            cube(extra_material_level1_shape_01_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_01_model=="CYLINDER")
    {
        if(extra_material_level1_shape_01_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_01_cylinder_translate)
            rotate(extra_material_level1_shape_01_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_01_cylinder_diameter, h=extra_material_level1_shape_01_cylinder_height, $fn=extra_material_level1_shape_01_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_01_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_01_cylinder_translate)
            rotate(extra_material_level1_shape_01_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_01_cylinder_diameter, h=extra_material_level1_shape_01_cylinder_height, $fn=extra_material_level1_shape_01_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_01_model=="SPHERE")
    {
        translate(extra_material_level1_shape_01_sphere_translate)
        sphere(d=extra_material_level1_shape_01_sphere_diameter, $fn=extra_material_level1_shape_01_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_01_model=="STL")
    {
        translate(extra_material_level1_shape_01_stl_translate)
        rotate(extra_material_level1_shape_01_stl_rotation)
        import(extra_material_level1_shape_01_stl_name);
    }

}
//END OF MODULE SHAPE 01 of Level 1

module extra_material_level1_shape_02()
{

    if (extra_material_level1_shape_02_model=="CUBE")
    {
        if(extra_material_level1_shape_02_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_02_cube_translate)
            rotate(extra_material_level1_shape_02_cube_rotation)
            cube(extra_material_level1_shape_02_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_02_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_02_cube_translate)
            rotate(extra_material_level1_shape_02_cube_rotation)
            cube(extra_material_level1_shape_02_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_02_model=="CYLINDER")
    {
        if(extra_material_level1_shape_02_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_02_cylinder_translate)
            rotate(extra_material_level1_shape_02_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_02_cylinder_diameter, h=extra_material_level1_shape_02_cylinder_height, $fn=extra_material_level1_shape_02_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_02_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_02_cylinder_translate)
            rotate(extra_material_level1_shape_02_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_02_cylinder_diameter, h=extra_material_level1_shape_02_cylinder_height, $fn=extra_material_level1_shape_02_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_02_model=="SPHERE")
    {
        translate(extra_material_level1_shape_02_sphere_translate)
        sphere(d=extra_material_level1_shape_02_sphere_diameter, $fn=extra_material_level1_shape_02_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_02_model=="STL")
    {
        translate(extra_material_level1_shape_02_stl_translate)
        rotate(extra_material_level1_shape_02_stl_rotation)
        import(extra_material_level1_shape_02_stl_name);
    }

}
//END OF MODULE SHAPE 02 of Level 1

module extra_material_level1_shape_03()
{

    if (extra_material_level1_shape_03_model=="CUBE")
    {
        if(extra_material_level1_shape_03_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_03_cube_translate)
            rotate(extra_material_level1_shape_03_cube_rotation)
            cube(extra_material_level1_shape_03_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_03_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_03_cube_translate)
            rotate(extra_material_level1_shape_03_cube_rotation)
            cube(extra_material_level1_shape_03_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_03_model=="CYLINDER")
    {
        if(extra_material_level1_shape_03_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_03_cylinder_translate)
            rotate(extra_material_level1_shape_03_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_03_cylinder_diameter, h=extra_material_level1_shape_03_cylinder_height, $fn=extra_material_level1_shape_03_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_03_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_03_cylinder_translate)
            rotate(extra_material_level1_shape_03_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_03_cylinder_diameter, h=extra_material_level1_shape_03_cylinder_height, $fn=extra_material_level1_shape_03_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_03_model=="SPHERE")
    {
        translate(extra_material_level1_shape_03_sphere_translate)
        sphere(d=extra_material_level1_shape_03_sphere_diameter, $fn=extra_material_level1_shape_03_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_03_model=="STL")
    {
        translate(extra_material_level1_shape_03_stl_translate)
        rotate(extra_material_level1_shape_03_stl_rotation)
        import(extra_material_level1_shape_03_stl_name);
    }

}
//END OF MODULE SHAPE 03 of Level 1


module extra_material_level1_shape_04()
{

    if (extra_material_level1_shape_04_model=="CUBE")
    {
        if(extra_material_level1_shape_04_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_04_cube_translate)
            rotate(extra_material_level1_shape_04_cube_rotation)
            cube(extra_material_level1_shape_04_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_04_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_04_cube_translate)
            rotate(extra_material_level1_shape_04_cube_rotation)
            cube(extra_material_level1_shape_04_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_04_model=="CYLINDER")
    {
        if(extra_material_level1_shape_04_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_04_cylinder_translate)
            rotate(extra_material_level1_shape_04_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_04_cylinder_diameter, h=extra_material_level1_shape_04_cylinder_height, $fn=extra_material_level1_shape_04_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_04_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_04_cylinder_translate)
            rotate(extra_material_level1_shape_04_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_04_cylinder_diameter, h=extra_material_level1_shape_04_cylinder_height, $fn=extra_material_level1_shape_04_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_04_model=="SPHERE")
    {
        translate(extra_material_level1_shape_04_sphere_translate)
        sphere(d=extra_material_level1_shape_04_sphere_diameter, $fn=extra_material_level1_shape_04_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_04_model=="STL")
    {
        translate(extra_material_level1_shape_04_stl_translate)
        rotate(extra_material_level1_shape_04_stl_rotation)
        import(extra_material_level1_shape_04_stl_name);
    }

}
//END OF MODULE SHAPE 04 of Level 1


module extra_material_level1_shape_05()
{

    if (extra_material_level1_shape_05_model=="CUBE")
    {
        if(extra_material_level1_shape_05_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_05_cube_translate)
            rotate(extra_material_level1_shape_05_cube_rotation)
            cube(extra_material_level1_shape_05_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_05_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_05_cube_translate)
            rotate(extra_material_level1_shape_05_cube_rotation)
            cube(extra_material_level1_shape_05_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_05_model=="CYLINDER")
    {
        if(extra_material_level1_shape_05_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_05_cylinder_translate)
            rotate(extra_material_level1_shape_05_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_05_cylinder_diameter, h=extra_material_level1_shape_05_cylinder_height, $fn=extra_material_level1_shape_05_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_05_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_05_cylinder_translate)
            rotate(extra_material_level1_shape_05_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_05_cylinder_diameter, h=extra_material_level1_shape_05_cylinder_height, $fn=extra_material_level1_shape_05_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_05_model=="SPHERE")
    {
        translate(extra_material_level1_shape_05_sphere_translate)
        sphere(d=extra_material_level1_shape_05_sphere_diameter, $fn=extra_material_level1_shape_05_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_05_model=="STL")
    {
        translate(extra_material_level1_shape_05_stl_translate)
        rotate(extra_material_level1_shape_05_stl_rotation)
        import(extra_material_level1_shape_05_stl_name);
    }

}
//END OF MODULE SHAPE 05 of Level 1


module extra_material_level1_shape_06()
{

    if (extra_material_level1_shape_06_model=="CUBE")
    {
        if(extra_material_level1_shape_06_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_06_cube_translate)
            rotate(extra_material_level1_shape_06_cube_rotation)
            cube(extra_material_level1_shape_06_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_06_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_06_cube_translate)
            rotate(extra_material_level1_shape_06_cube_rotation)
            cube(extra_material_level1_shape_06_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_06_model=="CYLINDER")
    {
        if(extra_material_level1_shape_06_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_06_cylinder_translate)
            rotate(extra_material_level1_shape_06_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_06_cylinder_diameter, h=extra_material_level1_shape_06_cylinder_height, $fn=extra_material_level1_shape_06_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_06_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_06_cylinder_translate)
            rotate(extra_material_level1_shape_06_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_06_cylinder_diameter, h=extra_material_level1_shape_06_cylinder_height, $fn=extra_material_level1_shape_06_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_06_model=="SPHERE")
    {
        translate(extra_material_level1_shape_06_sphere_translate)
        sphere(d=extra_material_level1_shape_06_sphere_diameter, $fn=extra_material_level1_shape_06_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_06_model=="STL")
    {
        translate(extra_material_level1_shape_06_stl_translate)
        rotate(extra_material_level1_shape_06_stl_rotation)
        import(extra_material_level1_shape_06_stl_name);
    }

}
//END OF MODULE SHAPE 06 of Level 1


module extra_material_level1_shape_07()
{

    if (extra_material_level1_shape_07_model=="CUBE")
    {
        if(extra_material_level1_shape_07_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_07_cube_translate)
            rotate(extra_material_level1_shape_07_cube_rotation)
            cube(extra_material_level1_shape_07_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_07_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_07_cube_translate)
            rotate(extra_material_level1_shape_07_cube_rotation)
            cube(extra_material_level1_shape_07_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_07_model=="CYLINDER")
    {
        if(extra_material_level1_shape_07_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_07_cylinder_translate)
            rotate(extra_material_level1_shape_07_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_07_cylinder_diameter, h=extra_material_level1_shape_07_cylinder_height, $fn=extra_material_level1_shape_07_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_07_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_07_cylinder_translate)
            rotate(extra_material_level1_shape_07_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_07_cylinder_diameter, h=extra_material_level1_shape_07_cylinder_height, $fn=extra_material_level1_shape_07_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_07_model=="SPHERE")
    {
        translate(extra_material_level1_shape_07_sphere_translate)
        sphere(d=extra_material_level1_shape_07_sphere_diameter, $fn=extra_material_level1_shape_07_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_07_model=="STL")
    {
        translate(extra_material_level1_shape_07_stl_translate)
        rotate(extra_material_level1_shape_07_stl_rotation)
        import(extra_material_level1_shape_07_stl_name);
    }

}
//END OF MODULE SHAPE 07 of Level 1


module extra_material_level1_shape_08()
{

    if (extra_material_level1_shape_08_model=="CUBE")
    {
        if(extra_material_level1_shape_08_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_08_cube_translate)
            rotate(extra_material_level1_shape_08_cube_rotation)
            cube(extra_material_level1_shape_08_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_08_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_08_cube_translate)
            rotate(extra_material_level1_shape_08_cube_rotation)
            cube(extra_material_level1_shape_08_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_08_model=="CYLINDER")
    {
        if(extra_material_level1_shape_08_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_08_cylinder_translate)
            rotate(extra_material_level1_shape_08_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_08_cylinder_diameter, h=extra_material_level1_shape_08_cylinder_height, $fn=extra_material_level1_shape_08_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_08_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_08_cylinder_translate)
            rotate(extra_material_level1_shape_08_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_08_cylinder_diameter, h=extra_material_level1_shape_08_cylinder_height, $fn=extra_material_level1_shape_08_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_08_model=="SPHERE")
    {
        translate(extra_material_level1_shape_08_sphere_translate)
        sphere(d=extra_material_level1_shape_08_sphere_diameter, $fn=extra_material_level1_shape_08_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_08_model=="STL")
    {
        translate(extra_material_level1_shape_08_stl_translate)
        rotate(extra_material_level1_shape_08_stl_rotation)
        import(extra_material_level1_shape_08_stl_name);
    }

}
//END OF MODULE SHAPE 08 of Level 1


module extra_material_level1_shape_09()
{

    if (extra_material_level1_shape_09_model=="CUBE")
    {
        if(extra_material_level1_shape_09_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_09_cube_translate)
            rotate(extra_material_level1_shape_09_cube_rotation)
            cube(extra_material_level1_shape_09_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_09_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_09_cube_translate)
            rotate(extra_material_level1_shape_09_cube_rotation)
            cube(extra_material_level1_shape_09_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_09_model=="CYLINDER")
    {
        if(extra_material_level1_shape_09_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_09_cylinder_translate)
            rotate(extra_material_level1_shape_09_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_09_cylinder_diameter, h=extra_material_level1_shape_09_cylinder_height, $fn=extra_material_level1_shape_09_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_09_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_09_cylinder_translate)
            rotate(extra_material_level1_shape_09_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_09_cylinder_diameter, h=extra_material_level1_shape_09_cylinder_height, $fn=extra_material_level1_shape_09_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_09_model=="SPHERE")
    {
        translate(extra_material_level1_shape_09_sphere_translate)
        sphere(d=extra_material_level1_shape_09_sphere_diameter, $fn=extra_material_level1_shape_09_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_09_model=="STL")
    {
        translate(extra_material_level1_shape_09_stl_translate)
        rotate(extra_material_level1_shape_09_stl_rotation)
        import(extra_material_level1_shape_09_stl_name);
    }

}
//END OF MODULE SHAPE 09 of Level 1


module extra_material_level1_shape_10()
{

    if (extra_material_level1_shape_10_model=="CUBE")
    {
        if(extra_material_level1_shape_10_cube_centered=="YES")
        {
            translate(extra_material_level1_shape_10_cube_translate)
            rotate(extra_material_level1_shape_10_cube_rotation)
            cube(extra_material_level1_shape_10_cube_dimensions, center=true);
        }

        if(extra_material_level1_shape_10_cube_centered=="NO")
        {
            translate(extra_material_level1_shape_10_cube_translate)
            rotate(extra_material_level1_shape_10_cube_rotation)
            cube(extra_material_level1_shape_10_cube_dimensions, center=false);
        }


    }

    if (extra_material_level1_shape_10_model=="CYLINDER")
    {
        if(extra_material_level1_shape_10_cylinder_centered=="YES")
        {
            translate(extra_material_level1_shape_10_cylinder_translate)
            rotate(extra_material_level1_shape_10_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_10_cylinder_diameter, h=extra_material_level1_shape_10_cylinder_height, $fn=extra_material_level1_shape_10_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level1_shape_10_cylinder_centered=="NO")
        {
            translate(extra_material_level1_shape_10_cylinder_translate)
            rotate(extra_material_level1_shape_10_cylinder_rotation)
            cylinder(d=extra_material_level1_shape_10_cylinder_diameter, h=extra_material_level1_shape_10_cylinder_height, $fn=extra_material_level1_shape_10_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level1_shape_10_model=="SPHERE")
    {
        translate(extra_material_level1_shape_10_sphere_translate)
        sphere(d=extra_material_level1_shape_10_sphere_diameter, $fn=extra_material_level1_shape_10_sphere_number_of_faces);
    }

    if (extra_material_level1_shape_10_model=="STL")
    {
        translate(extra_material_level1_shape_10_stl_translate)
        rotate(extra_material_level1_shape_10_stl_rotation)
        import(extra_material_level1_shape_10_stl_name);
    }

}
//END OF MODULE ADDING SHAPE 10 of Level 1

module extra_material_level1_use()
{

        if(extra_material_level1_shape01_use == "YES")   extra_material_level1_shape_01();
        if(extra_material_level1_shape02_use == "YES")   extra_material_level1_shape_02();
        if(extra_material_level1_shape03_use == "YES")   extra_material_level1_shape_03();
        if(extra_material_level1_shape04_use == "YES")   extra_material_level1_shape_04();
        if(extra_material_level1_shape05_use == "YES")   extra_material_level1_shape_05();
        if(extra_material_level1_shape06_use == "YES")   extra_material_level1_shape_06();
        if(extra_material_level1_shape07_use == "YES")   extra_material_level1_shape_07();
        if(extra_material_level1_shape08_use == "YES")   extra_material_level1_shape_08();
        if(extra_material_level1_shape09_use == "YES")   extra_material_level1_shape_09();
        if(extra_material_level1_shape10_use == "YES")   extra_material_level1_shape_10();



}
//END OF MODULE ADDING CHOSEN SHAPES of Level 1


//MODULES OF CUTTING LEVEL 2 (Actual key cutting and moving element cuttings or profile cuttings for example)
//KEY CUTTINGS LEVEL 2

module prism_cut(
    prism_root_x,
    prism_root_y,
    prism_angle_x,
    prism_angle_y,
    prism_height)
{
    prism_top_x = prism_height*tan(prism_angle_x/2);
    prism_top_y = prism_height*tan(prism_angle_y/2);

    PrismPoints =
    [
      [  -prism_root_x/2,  -prism_root_y/2,  0 ],  //0
      [ prism_root_x/2,  -prism_root_y/2,  0 ],    //1
      [ prism_root_x/2,  prism_root_y/2,  0 ],     //2
      [ -prism_root_x/2,  prism_root_y/2,  0 ],    //3

      [  -prism_root_x/2-prism_top_x,  -prism_root_y/2-prism_top_y,  prism_height ],//4
      [ prism_root_x/2+prism_top_x,  -prism_root_y/2-prism_top_y,  prism_height ],  //5
      [ prism_root_x/2+prism_top_x,  prism_root_y/2+prism_top_y,  prism_height ],   //6
      [  -prism_root_x/2-prism_top_x,  prism_root_y/2+prism_top_y,  prism_height ]  //7
    ];

    PrismFaces =
    [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]   // left
    ];

    polyhedron( PrismPoints, PrismFaces );

}//END OF PRISM CUT
//


module cone_cut(
    cone_height,
    cone_bottom_diameter,
    cone_top_diameter,
    cone_number_of_faces)
{
    $fn=cone_number_of_faces;
    cylinder(h=cone_height, d1=cone_bottom_diameter, d2=cone_top_diameter,center=false);
}// END OF CONICAL CUT


module laser_cut(
    laser_mill_height,
    laser_mill_diameter,
    laser_mill_number_of_faces,
    laser_mill_center)
{
    $fn=laser_mill_number_of_faces;
    if (laser_mill_center=="NO")
    {
        translate([0,0,laser_mill_diameter/2])
        rotate([0,90,0])
        cylinder(h=laser_mill_height, d=laser_mill_diameter,center=false);
    }

    if (laser_mill_center=="YES")
    {

        rotate([0,90,0])
        cylinder(h=laser_mill_height, d=laser_mill_diameter,center=false);
    }

}// END OF LASER CUT
//

module cut(
    cut_to_use, //can be prism_cut, cone_cut, laser_cut, stl_mill

    prism_root_x,
    prism_root_y,
    prism_angle_x,
    prism_angle_y,
    prism_height,

    cone_height,
    cone_bottom_diameter,
    cone_angle,
    cone_number_of_faces,

    laser_mill_height,
    laser_mill_diameter,
    laser_mill_number_of_faces)
{

    cone_top_diameter = cone_height*tan(cone_angle/2)*2+cone_bottom_diameter;

    if (cut_to_use == "prism_cut")
    {

        prism_cut(
            prism_root_x =      prism_root_x,
            prism_root_y =      prism_root_y,
            prism_angle_x =     prism_angle_x,
            prism_angle_y =     prism_angle_y,
            prism_height =      prism_height);
    }

    if (cut_to_use == "cone_cut")
    {
        cone_cut(
            cone_height=cone_height,
            cone_bottom_diameter=cone_bottom_diameter,
            cone_top_diameter=cone_top_diameter,
            cone_number_of_faces=cone_number_of_faces);
    }

    if (cut_to_use == "laser_cut")
    {
        laser_cut(
            laser_mill_height,
            laser_mill_diameter,
            laser_mill_number_of_faces,
            laser_mill_center);
    }

    if (cut_to_use == "stl_mill")
    {
        import(stl_mill_name);
    }



}// END OF MODULE cut() choosing and applying the chosen cut


module regular_row1_cut(
    regular_row1_cut_to_use=regular_row1_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    regular_row1_prism_root_x=regular_row1_prism_root_x,
    regular_row1_prism_root_y=regular_row1_prism_root_y,
    regular_row1_prism_angle_x=regular_row1_prism_angle_x,
    regular_row1_prism_angle_y=regular_row1_prism_angle_y,
    regular_row1_prism_height=regular_row1_prism_height,

    regular_row1_cone_height=regular_row1_cone_height,
    regular_row1_cone_bottom_diameter=regular_row1_cone_bottom_diameter,
    regular_row1_cone_angle=regular_row1_cone_angle,
    regular_row1_cone_number_of_faces=regular_row1_cone_number_of_faces,

    regular_row1_laser_mill_height=regular_row1_laser_mill_height,
    regular_row1_laser_mill_diameter=regular_row1_laser_mill_diameter,
    regular_row1_laser_mill_number_of_faces=regular_row1_laser_mill_number_of_faces,
    regular_row1_laser_mill_center=regular_row1_laser_mill_center,

    regular_row1_stl_mill_name=regular_row1_stl_mill_name)
{
    cut(cut_to_use = regular_row1_cut_to_use,

    prism_root_x = regular_row1_prism_root_x,
    prism_root_y = regular_row1_prism_root_y,
    prism_angle_x = regular_row1_prism_angle_x,
    prism_angle_y = regular_row1_prism_angle_y,
    prism_height = regular_row1_prism_height,

    cone_height=regular_row1_cone_height,
    cone_bottom_diameter=regular_row1_cone_bottom_diameter,
    cone_angle=regular_row1_cone_angle,
    cone_number_of_faces=regular_row1_cone_number_of_faces,

    laser_mill_height=regular_row1_laser_mill_height,
    laser_mill_diameter=regular_row1_laser_mill_diameter,
    laser_mill_number_of_faces=regular_row1_laser_mill_number_of_faces,
    laser_mill_center=regular_row1_laser_mill_center,

    stl_mill_name=regular_row1_stl_mill_name);



}
//

module regular_row2_cut(
    regular_row2_cut_to_use=regular_row2_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    regular_row2_prism_root_x=regular_row2_prism_root_x,
    regular_row2_prism_root_y=regular_row2_prism_root_y,
    regular_row2_prism_angle_x=regular_row2_prism_angle_x,
    regular_row2_prism_angle_y=regular_row2_prism_angle_y,
    regular_row2_prism_height=regular_row2_prism_height,

    regular_row2_cone_height=regular_row2_cone_height,
    regular_row2_cone_bottom_diameter=regular_row2_cone_bottom_diameter,
    regular_row2_cone_angle=regular_row2_cone_angle,
    regular_row2_cone_number_of_faces=regular_row2_cone_number_of_faces,

    regular_row2_laser_mill_height=regular_row2_laser_mill_height,
    regular_row2_laser_mill_diameter=regular_row2_laser_mill_diameter,
    regular_row2_laser_mill_number_of_faces=regular_row2_laser_mill_number_of_faces,
    regular_row2_laser_mill_center=regular_row2_laser_mill_center,

    regular_row2_stl_mill_name=regular_row2_stl_mill_name)
{
    cut(cut_to_use = regular_row2_cut_to_use,

    prism_root_x = regular_row2_prism_root_x,
    prism_root_y = regular_row2_prism_root_y,
    prism_angle_x = regular_row2_prism_angle_x,
    prism_angle_y = regular_row2_prism_angle_y,
    prism_height = regular_row2_prism_height,

    cone_height=regular_row2_cone_height,
    cone_bottom_diameter=regular_row2_cone_bottom_diameter,
    cone_angle=regular_row2_cone_angle,
    cone_number_of_faces=regular_row2_cone_number_of_faces,

    laser_mill_height=regular_row2_laser_mill_height,
    laser_mill_diameter=regular_row2_laser_mill_diameter,
    laser_mill_number_of_faces=regular_row2_laser_mill_number_of_faces,
    laser_mill_center=regular_row2_laser_mill_center,

    stl_mill_name=regular_row2_stl_mill_name);



}
//


module regular_row3_cut(
    regular_row3_cut_to_use=regular_row3_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    regular_row3_prism_root_x=regular_row3_prism_root_x,
    regular_row3_prism_root_y=regular_row3_prism_root_y,
    regular_row3_prism_angle_x=regular_row3_prism_angle_x,
    regular_row3_prism_angle_y=regular_row3_prism_angle_y,
    regular_row3_prism_height=regular_row3_prism_height,

    regular_row3_cone_height=regular_row3_cone_height,
    regular_row3_cone_bottom_diameter=regular_row3_cone_bottom_diameter,
    regular_row3_cone_angle=regular_row3_cone_angle,
    regular_row3_cone_number_of_faces=regular_row3_cone_number_of_faces,

    regular_row3_laser_mill_height=regular_row3_laser_mill_height,
    regular_row3_laser_mill_diameter=regular_row3_laser_mill_diameter,
    regular_row3_laser_mill_number_of_faces=regular_row3_laser_mill_number_of_faces,
    regular_row3_laser_mill_center=regular_row3_laser_mill_center,

    regular_row3_stl_mill_name=regular_row3_stl_mill_name)
{
    cut(cut_to_use = regular_row3_cut_to_use,

    prism_root_x = regular_row3_prism_root_x,
    prism_root_y = regular_row3_prism_root_y,
    prism_angle_x = regular_row3_prism_angle_x,
    prism_angle_y = regular_row3_prism_angle_y,
    prism_height = regular_row3_prism_height,

    cone_height=regular_row3_cone_height,
    cone_bottom_diameter=regular_row3_cone_bottom_diameter,
    cone_angle=regular_row3_cone_angle,
    cone_number_of_faces=regular_row3_cone_number_of_faces,

    laser_mill_height=regular_row3_laser_mill_height,
    laser_mill_diameter=regular_row3_laser_mill_diameter,
    laser_mill_number_of_faces=regular_row3_laser_mill_number_of_faces,
    laser_mill_center=regular_row3_laser_mill_center,

    stl_mill_name=regular_row3_stl_mill_name);



}
//


module regular_row4_cut(
    regular_row4_cut_to_use=regular_row4_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    regular_row4_prism_root_x=regular_row4_prism_root_x,
    regular_row4_prism_root_y=regular_row4_prism_root_y,
    regular_row4_prism_angle_x=regular_row4_prism_angle_x,
    regular_row4_prism_angle_y=regular_row4_prism_angle_y,
    regular_row4_prism_height=regular_row4_prism_height,

    regular_row4_cone_height=regular_row4_cone_height,
    regular_row4_cone_bottom_diameter=regular_row4_cone_bottom_diameter,
    regular_row4_cone_angle=regular_row4_cone_angle,
    regular_row4_cone_number_of_faces=regular_row4_cone_number_of_faces,

    regular_row4_laser_mill_height=regular_row4_laser_mill_height,
    regular_row4_laser_mill_diameter=regular_row4_laser_mill_diameter,
    regular_row4_laser_mill_number_of_faces=regular_row4_laser_mill_number_of_faces,
    regular_row4_laser_mill_center=regular_row4_laser_mill_center,

    regular_row4_stl_mill_name=regular_row4_stl_mill_name)
{
    cut(cut_to_use = regular_row4_cut_to_use,

    prism_root_x = regular_row4_prism_root_x,
    prism_root_y = regular_row4_prism_root_y,
    prism_angle_x = regular_row4_prism_angle_x,
    prism_angle_y = regular_row4_prism_angle_y,
    prism_height = regular_row4_prism_height,

    cone_height=regular_row4_cone_height,
    cone_bottom_diameter=regular_row4_cone_bottom_diameter,
    cone_angle=regular_row4_cone_angle,
    cone_number_of_faces=regular_row4_cone_number_of_faces,

    laser_mill_height=regular_row4_laser_mill_height,
    laser_mill_diameter=regular_row4_laser_mill_diameter,
    laser_mill_number_of_faces=regular_row4_laser_mill_number_of_faces,
    laser_mill_center=regular_row4_laser_mill_center,

    stl_mill_name=regular_row4_stl_mill_name);



}
//


module regular_row5_cut(
    regular_row5_cut_to_use=regular_row5_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    regular_row5_prism_root_x=regular_row5_prism_root_x,
    regular_row5_prism_root_y=regular_row5_prism_root_y,
    regular_row5_prism_angle_x=regular_row5_prism_angle_x,
    regular_row5_prism_angle_y=regular_row5_prism_angle_y,
    regular_row5_prism_height=regular_row5_prism_height,

    regular_row5_cone_height=regular_row5_cone_height,
    regular_row5_cone_bottom_diameter=regular_row5_cone_bottom_diameter,
    regular_row5_cone_angle=regular_row5_cone_angle,
    regular_row5_cone_number_of_faces=regular_row5_cone_number_of_faces,

    regular_row5_laser_mill_height=regular_row5_laser_mill_height,
    regular_row5_laser_mill_diameter=regular_row5_laser_mill_diameter,
    regular_row5_laser_mill_number_of_faces=regular_row5_laser_mill_number_of_faces,
    regular_row5_laser_mill_center=regular_row5_laser_mill_center,

    regular_row5_stl_mill_name=regular_row5_stl_mill_name)
{
    cut(cut_to_use = regular_row5_cut_to_use,

    prism_root_x = regular_row5_prism_root_x,
    prism_root_y = regular_row5_prism_root_y,
    prism_angle_x = regular_row5_prism_angle_x,
    prism_angle_y = regular_row5_prism_angle_y,
    prism_height = regular_row5_prism_height,

    cone_height=regular_row5_cone_height,
    cone_bottom_diameter=regular_row5_cone_bottom_diameter,
    cone_angle=regular_row5_cone_angle,
    cone_number_of_faces=regular_row5_cone_number_of_faces,

    laser_mill_height=regular_row5_laser_mill_height,
    laser_mill_diameter=regular_row5_laser_mill_diameter,
    laser_mill_number_of_faces=regular_row5_laser_mill_number_of_faces,
    laser_mill_center=regular_row5_laser_mill_center,

    stl_mill_name=regular_row5_stl_mill_name);



}
//


module regular_row6_cut(
    regular_row6_cut_to_use=regular_row6_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    regular_row6_prism_root_x=regular_row6_prism_root_x,
    regular_row6_prism_root_y=regular_row6_prism_root_y,
    regular_row6_prism_angle_x=regular_row6_prism_angle_x,
    regular_row6_prism_angle_y=regular_row6_prism_angle_y,
    regular_row6_prism_height=regular_row6_prism_height,

    regular_row6_cone_height=regular_row6_cone_height,
    regular_row6_cone_bottom_diameter=regular_row6_cone_bottom_diameter,
    regular_row6_cone_angle=regular_row6_cone_angle,
    regular_row6_cone_number_of_faces=regular_row6_cone_number_of_faces,

    regular_row6_laser_mill_height=regular_row6_laser_mill_height,
    regular_row6_laser_mill_diameter=regular_row6_laser_mill_diameter,
    regular_row6_laser_mill_number_of_faces=regular_row6_laser_mill_number_of_faces,
    regular_row6_laser_mill_center=regular_row6_laser_mill_center,

    regular_row6_stl_mill_name=regular_row6_stl_mill_name)
{
    cut(cut_to_use = regular_row6_cut_to_use,

    prism_root_x = regular_row6_prism_root_x,
    prism_root_y = regular_row6_prism_root_y,
    prism_angle_x = regular_row6_prism_angle_x,
    prism_angle_y = regular_row6_prism_angle_y,
    prism_height = regular_row6_prism_height,

    cone_height=regular_row6_cone_height,
    cone_bottom_diameter=regular_row6_cone_bottom_diameter,
    cone_angle=regular_row6_cone_angle,
    cone_number_of_faces=regular_row6_cone_number_of_faces,

    laser_mill_height=regular_row6_laser_mill_height,
    laser_mill_diameter=regular_row6_laser_mill_diameter,
    laser_mill_number_of_faces=regular_row6_laser_mill_number_of_faces,
    laser_mill_center=regular_row6_laser_mill_center,

    stl_mill_name=regular_row6_stl_mill_name);



}
//


module regular_sonic_cut(
    regular_sonic_cut_to_use=regular_sonic_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    regular_sonic_prism_root_x=regular_sonic_prism_root_x,
    regular_sonic_prism_root_y=regular_sonic_prism_root_y,
    regular_sonic_prism_angle_x=regular_sonic_prism_angle_x,
    regular_sonic_prism_angle_y=regular_sonic_prism_angle_y,
    regular_sonic_prism_height=regular_sonic_prism_height,

    regular_sonic_cone_height=regular_sonic_cone_height,
    regular_sonic_cone_bottom_diameter=regular_sonic_cone_bottom_diameter,
    regular_sonic_cone_angle=regular_sonic_cone_angle,
    regular_sonic_cone_number_of_faces=regular_sonic_cone_number_of_faces,

    regular_sonic_laser_mill_height=regular_sonic_laser_mill_height,
    regular_sonic_laser_mill_diameter=regular_sonic_laser_mill_diameter,
    regular_sonic_laser_mill_number_of_faces=regular_sonic_laser_mill_number_of_faces,
    regular_sonic_laser_mill_center=regular_sonic_laser_mill_center,

    regular_sonic_stl_mill_name=regular_sonic_stl_mill_name)
{
    cut(cut_to_use = regular_sonic_cut_to_use,

    prism_root_x = regular_sonic_prism_root_x,
    prism_root_y = regular_sonic_prism_root_y,
    prism_angle_x = regular_sonic_prism_angle_x,
    prism_angle_y = regular_sonic_prism_angle_y,
    prism_height = regular_sonic_prism_height,

    cone_height=regular_sonic_cone_height,
    cone_bottom_diameter=regular_sonic_cone_bottom_diameter,
    cone_angle=regular_sonic_cone_angle,
    cone_number_of_faces=regular_sonic_cone_number_of_faces,

    laser_mill_height=regular_sonic_laser_mill_height,
    laser_mill_diameter=regular_sonic_laser_mill_diameter,
    laser_mill_number_of_faces=regular_sonic_laser_mill_number_of_faces,
    laser_mill_center=regular_sonic_laser_mill_center,

    stl_mill_name=regular_sonic_stl_mill_name);



}
//

module regular_row1_complete(
    regular_row1_number_of_pins = regular_row1_number_of_pins,
    regular_row1_offset_on_x = regular_row1_offset_on_x,
    regular_row1_offset_on_z = regular_row1_offset_on_z,
    regular_row1_angle_on_y = regular_row1_angle_on_y,
    regular_row1_mirror = regular_row1_mirror,
    regular_row1_linked = regular_row1_linked,
    regular_row1_link_root_addition = regular_row1_link_root_addition,
    regular_row1_shoulder_distance = regular_row1_shoulder_distance,
    regular_row1_interpin_space = regular_row1_interpin_space)
{
    mirror(regular_row1_mirror)
    translate([0,0,regular_row1_offset_on_z])
    translate([regular_row1_offset_on_x,0,0])
    rotate([0,regular_row1_angle_on_y,0])
    {

        if (regular_row1_linked == "NO"||regular_row1_cut_to_use=="prism_cut"||regular_row1_cut_to_use=="cone_cut"||regular_row1_cut_to_use=="stl_mill")
        {
            translate([0,regular_row1_cut01_distance,regular_row1_cut01_depth])rotate([0,0,regular_row1_cut01_angle])regular_row1_cut();
            translate([0,regular_row1_cut02_distance,regular_row1_cut02_depth])rotate([0,0,regular_row1_cut02_angle])regular_row1_cut();
            translate([0,regular_row1_cut03_distance,regular_row1_cut03_depth])rotate([0,0,regular_row1_cut03_angle])regular_row1_cut();
            translate([0,regular_row1_cut04_distance,regular_row1_cut04_depth])rotate([0,0,regular_row1_cut04_angle])regular_row1_cut();
            translate([0,regular_row1_cut05_distance,regular_row1_cut05_depth])rotate([0,0,regular_row1_cut05_angle])regular_row1_cut();
            translate([0,regular_row1_cut06_distance,regular_row1_cut06_depth])rotate([0,0,regular_row1_cut06_angle])regular_row1_cut();
            translate([0,regular_row1_cut07_distance,regular_row1_cut07_depth])rotate([0,0,regular_row1_cut07_angle])regular_row1_cut();
            translate([0,regular_row1_cut08_distance,regular_row1_cut08_depth])rotate([0,0,regular_row1_cut08_angle])regular_row1_cut();
            translate([0,regular_row1_cut09_distance,regular_row1_cut09_depth])rotate([0,0,regular_row1_cut09_angle])regular_row1_cut();
            translate([0,regular_row1_cut10_distance,regular_row1_cut10_depth])rotate([0,0,regular_row1_cut10_angle])regular_row1_cut();
            translate([0,regular_row1_cut11_distance,regular_row1_cut11_depth])rotate([0,0,regular_row1_cut11_angle])regular_row1_cut();
            translate([0,regular_row1_cut12_distance,regular_row1_cut12_depth])rotate([0,0,regular_row1_cut12_angle])regular_row1_cut();
            translate([0,regular_row1_cut13_distance,regular_row1_cut13_depth])rotate([0,0,regular_row1_cut13_angle])regular_row1_cut();
            translate([0,regular_row1_cut14_distance,regular_row1_cut14_depth])rotate([0,0,regular_row1_cut14_angle])regular_row1_cut();
            translate([0,regular_row1_cut15_distance,regular_row1_cut15_depth])rotate([0,0,regular_row1_cut15_angle])regular_row1_cut();
            translate([0,regular_row1_cut16_distance,regular_row1_cut16_depth])rotate([0,0,regular_row1_cut16_angle])regular_row1_cut();
            translate([0,regular_row1_cut17_distance,regular_row1_cut17_depth])rotate([0,0,regular_row1_cut17_angle])regular_row1_cut();
            translate([0,regular_row1_cut18_distance,regular_row1_cut18_depth])rotate([0,0,regular_row1_cut18_angle])regular_row1_cut();
            translate([0,regular_row1_cut19_distance,regular_row1_cut19_depth])rotate([0,0,regular_row1_cut19_angle])regular_row1_cut();
            translate([0,regular_row1_cut20_distance,regular_row1_cut20_depth])rotate([0,0,regular_row1_cut20_angle])regular_row1_cut();
            translate([0,regular_row1_cut21_distance,regular_row1_cut21_depth])rotate([0,0,regular_row1_cut21_angle])regular_row1_cut();
            translate([0,regular_row1_cut22_distance,regular_row1_cut22_depth])rotate([0,0,regular_row1_cut22_angle])regular_row1_cut();

        }//END OF IF ROW1 LINKED "NO"

        if (regular_row1_linked == "YES"&&regular_row1_cut_to_use=="laser_cut")
        {
        if (regular_row1_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut01_distance,regular_row1_cut01_depth])rotate([0,0,regular_row1_cut01_angle])regular_row1_cut();

                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut01_distance,regular_row1_cut01_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut01_distance,regular_row1_cut01_depth])rotate([0,0,regular_row1_cut01_angle])regular_row1_cut();

                //CUT 02
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut02_distance,regular_row1_cut02_depth])rotate([0,0,regular_row1_cut02_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut02_distance,regular_row1_cut02_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut02_distance,regular_row1_cut02_depth])rotate([0,0,regular_row1_cut02_angle])regular_row1_cut();

                //CUT 03
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut03_distance,regular_row1_cut03_depth])rotate([0,0,regular_row1_cut03_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut03_distance,regular_row1_cut03_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut03_distance,regular_row1_cut03_depth])rotate([0,0,regular_row1_cut03_angle])regular_row1_cut();

                //CUT 04
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut04_distance,regular_row1_cut04_depth])rotate([0,0,regular_row1_cut04_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut04_distance,regular_row1_cut04_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut04_distance,regular_row1_cut04_depth])rotate([0,0,regular_row1_cut04_angle])regular_row1_cut();

                //CUT 05
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut05_distance,regular_row1_cut05_depth])rotate([0,0,regular_row1_cut05_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut05_distance,regular_row1_cut05_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut05_distance,regular_row1_cut05_depth])rotate([0,0,regular_row1_cut05_angle])regular_row1_cut();

                //CUT 06
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut06_distance,regular_row1_cut06_depth])rotate([0,0,regular_row1_cut06_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut06_distance,regular_row1_cut06_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut06_distance,regular_row1_cut06_depth])rotate([0,0,regular_row1_cut06_angle])regular_row1_cut();

                //CUT 07
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut07_distance,regular_row1_cut07_depth])rotate([0,0,regular_row1_cut07_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut07_distance,regular_row1_cut07_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut07_distance,regular_row1_cut07_depth])rotate([0,0,regular_row1_cut07_angle])regular_row1_cut();

                //CUT 08
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut08_distance,regular_row1_cut08_depth])rotate([0,0,regular_row1_cut08_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut08_distance,regular_row1_cut08_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut08_distance,regular_row1_cut08_depth])rotate([0,0,regular_row1_cut08_angle])regular_row1_cut();

                //CUT 09
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut09_distance,regular_row1_cut09_depth])rotate([0,0,regular_row1_cut09_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut09_distance,regular_row1_cut09_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut09_distance,regular_row1_cut09_depth])rotate([0,0,regular_row1_cut09_angle])regular_row1_cut();

                //CUT 10
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut10_distance,regular_row1_cut10_depth])rotate([0,0,regular_row1_cut10_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut10_distance,regular_row1_cut10_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut10_distance,regular_row1_cut10_depth])rotate([0,0,regular_row1_cut10_angle])regular_row1_cut();

                //CUT 11
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut11_distance,regular_row1_cut11_depth])rotate([0,0,regular_row1_cut11_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut11_distance,regular_row1_cut11_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut11_distance,regular_row1_cut11_depth])rotate([0,0,regular_row1_cut11_angle])regular_row1_cut();

                //CUT 12
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut12_distance,regular_row1_cut12_depth])rotate([0,0,regular_row1_cut12_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut12_distance,regular_row1_cut12_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut12_distance,regular_row1_cut12_depth])rotate([0,0,regular_row1_cut12_angle])regular_row1_cut();

                //CUT 13
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut13_distance,regular_row1_cut13_depth])rotate([0,0,regular_row1_cut13_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut13_distance,regular_row1_cut13_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut13_distance,regular_row1_cut13_depth])rotate([0,0,regular_row1_cut13_angle])regular_row1_cut();

                //CUT 14
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut14_distance,regular_row1_cut14_depth])rotate([0,0,regular_row1_cut14_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut14_distance,regular_row1_cut14_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut14_distance,regular_row1_cut14_depth])rotate([0,0,regular_row1_cut14_angle])regular_row1_cut();

                //CUT 15
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut15_distance,regular_row1_cut15_depth])rotate([0,0,regular_row1_cut15_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut15_distance,regular_row1_cut15_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut15_distance,regular_row1_cut15_depth])rotate([0,0,regular_row1_cut15_angle])regular_row1_cut();

                //CUT 16
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut16_distance,regular_row1_cut16_depth])rotate([0,0,regular_row1_cut16_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut16_distance,regular_row1_cut16_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut16_distance,regular_row1_cut16_depth])rotate([0,0,regular_row1_cut16_angle])regular_row1_cut();

                //CUT 17
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut17_distance,regular_row1_cut17_depth])rotate([0,0,regular_row1_cut17_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut17_distance,regular_row1_cut17_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut17_distance,regular_row1_cut17_depth])rotate([0,0,regular_row1_cut17_angle])regular_row1_cut();

                //CUT 18
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut18_distance,regular_row1_cut18_depth])rotate([0,0,regular_row1_cut18_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut18_distance,regular_row1_cut18_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut18_distance,regular_row1_cut18_depth])rotate([0,0,regular_row1_cut18_angle])regular_row1_cut();

                //CUT 19
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut19_distance,regular_row1_cut19_depth])rotate([0,0,regular_row1_cut19_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut19_distance,regular_row1_cut19_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut19_distance,regular_row1_cut19_depth])rotate([0,0,regular_row1_cut19_angle])regular_row1_cut();

                //CUT 20
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut20_distance,regular_row1_cut20_depth])rotate([0,0,regular_row1_cut20_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut20_distance,regular_row1_cut20_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut20_distance,regular_row1_cut20_depth])rotate([0,0,regular_row1_cut20_angle])regular_row1_cut();

                //CUT 21
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut21_distance,regular_row1_cut21_depth])rotate([0,0,regular_row1_cut21_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut21_distance,regular_row1_cut21_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut21_distance,regular_row1_cut21_depth])rotate([0,0,regular_row1_cut21_angle])regular_row1_cut();

                //CUT 22
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut22_distance,regular_row1_cut22_depth])rotate([0,0,regular_row1_cut22_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut22_distance,regular_row1_cut22_depth])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut22_distance,regular_row1_cut22_depth])rotate([0,0,regular_row1_cut22_angle])regular_row1_cut();
        }

        if (regular_row1_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut01_distance,regular_row1_cut01_depth])rotate([0,0,regular_row1_cut01_angle])regular_row1_cut();

                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut01_distance,regular_row1_cut01_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut01_distance,regular_row1_cut01_depth])rotate([0,0,regular_row1_cut01_angle])regular_row1_cut();

                //CUT 02
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut02_distance,regular_row1_cut02_depth])rotate([0,0,regular_row1_cut02_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut02_distance,regular_row1_cut02_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut02_distance,regular_row1_cut02_depth])rotate([0,0,regular_row1_cut02_angle])regular_row1_cut();

                //CUT 03
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut03_distance,regular_row1_cut03_depth])rotate([0,0,regular_row1_cut03_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut03_distance,regular_row1_cut03_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut03_distance,regular_row1_cut03_depth])rotate([0,0,regular_row1_cut03_angle])regular_row1_cut();

                //CUT 04
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut04_distance,regular_row1_cut04_depth])rotate([0,0,regular_row1_cut04_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut04_distance,regular_row1_cut04_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut04_distance,regular_row1_cut04_depth])rotate([0,0,regular_row1_cut04_angle])regular_row1_cut();

                //CUT 05
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut05_distance,regular_row1_cut05_depth])rotate([0,0,regular_row1_cut05_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut05_distance,regular_row1_cut05_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut05_distance,regular_row1_cut05_depth])rotate([0,0,regular_row1_cut05_angle])regular_row1_cut();

                //CUT 06
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut06_distance,regular_row1_cut06_depth])rotate([0,0,regular_row1_cut06_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut06_distance,regular_row1_cut06_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut06_distance,regular_row1_cut06_depth])rotate([0,0,regular_row1_cut06_angle])regular_row1_cut();

                //CUT 07
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut07_distance,regular_row1_cut07_depth])rotate([0,0,regular_row1_cut07_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut07_distance,regular_row1_cut07_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut07_distance,regular_row1_cut07_depth])rotate([0,0,regular_row1_cut07_angle])regular_row1_cut();

                //CUT 08
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut08_distance,regular_row1_cut08_depth])rotate([0,0,regular_row1_cut08_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut08_distance,regular_row1_cut08_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut08_distance,regular_row1_cut08_depth])rotate([0,0,regular_row1_cut08_angle])regular_row1_cut();

                //CUT 09
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut09_distance,regular_row1_cut09_depth])rotate([0,0,regular_row1_cut09_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut09_distance,regular_row1_cut09_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut09_distance,regular_row1_cut09_depth])rotate([0,0,regular_row1_cut09_angle])regular_row1_cut();

                //CUT 10
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut10_distance,regular_row1_cut10_depth])rotate([0,0,regular_row1_cut10_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut10_distance,regular_row1_cut10_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut10_distance,regular_row1_cut10_depth])rotate([0,0,regular_row1_cut10_angle])regular_row1_cut();

                //CUT 11
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut11_distance,regular_row1_cut11_depth])rotate([0,0,regular_row1_cut11_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut11_distance,regular_row1_cut11_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut11_distance,regular_row1_cut11_depth])rotate([0,0,regular_row1_cut11_angle])regular_row1_cut();

                //CUT 12
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut12_distance,regular_row1_cut12_depth])rotate([0,0,regular_row1_cut12_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut12_distance,regular_row1_cut12_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut12_distance,regular_row1_cut12_depth])rotate([0,0,regular_row1_cut12_angle])regular_row1_cut();

                //CUT 13
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut13_distance,regular_row1_cut13_depth])rotate([0,0,regular_row1_cut13_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut13_distance,regular_row1_cut13_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut13_distance,regular_row1_cut13_depth])rotate([0,0,regular_row1_cut13_angle])regular_row1_cut();

                //CUT 14
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut14_distance,regular_row1_cut14_depth])rotate([0,0,regular_row1_cut14_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut14_distance,regular_row1_cut14_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut14_distance,regular_row1_cut14_depth])rotate([0,0,regular_row1_cut14_angle])regular_row1_cut();

                //CUT 15
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut15_distance,regular_row1_cut15_depth])rotate([0,0,regular_row1_cut15_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut15_distance,regular_row1_cut15_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut15_distance,regular_row1_cut15_depth])rotate([0,0,regular_row1_cut15_angle])regular_row1_cut();

                //CUT 16
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut16_distance,regular_row1_cut16_depth])rotate([0,0,regular_row1_cut16_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut16_distance,regular_row1_cut16_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut16_distance,regular_row1_cut16_depth])rotate([0,0,regular_row1_cut16_angle])regular_row1_cut();

                //CUT 17
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut17_distance,regular_row1_cut17_depth])rotate([0,0,regular_row1_cut17_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut17_distance,regular_row1_cut17_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut17_distance,regular_row1_cut17_depth])rotate([0,0,regular_row1_cut17_angle])regular_row1_cut();

                //CUT 18
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut18_distance,regular_row1_cut18_depth])rotate([0,0,regular_row1_cut18_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut18_distance,regular_row1_cut18_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut18_distance,regular_row1_cut18_depth])rotate([0,0,regular_row1_cut18_angle])regular_row1_cut();

                //CUT 19
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut19_distance,regular_row1_cut19_depth])rotate([0,0,regular_row1_cut19_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut19_distance,regular_row1_cut19_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut19_distance,regular_row1_cut19_depth])rotate([0,0,regular_row1_cut19_angle])regular_row1_cut();

                //CUT 20
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut20_distance,regular_row1_cut20_depth])rotate([0,0,regular_row1_cut20_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut20_distance,regular_row1_cut20_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut20_distance,regular_row1_cut20_depth])rotate([0,0,regular_row1_cut20_angle])regular_row1_cut();

                //CUT 21
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut21_distance,regular_row1_cut21_depth])rotate([0,0,regular_row1_cut21_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut21_distance,regular_row1_cut21_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut21_distance,regular_row1_cut21_depth])rotate([0,0,regular_row1_cut21_angle])regular_row1_cut();

                //CUT 22
                translate([0,-regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut22_distance,regular_row1_cut22_depth])rotate([0,0,regular_row1_cut22_angle])regular_row1_cut();
                }
                translate([0,-regular_row1_link_root_addition/2+regular_row1_cut22_distance,regular_row1_cut22_depth-regular_row1_laser_mill_diameter/2])
                cube([qt_regular_row1_laser_mill_height_qt,regular_row1_link_root_addition,regular_row1_laser_mill_diameter]);

                translate([0,regular_row1_link_root_addition/2,0])
                translate([0,regular_row1_cut22_distance,regular_row1_cut22_depth])rotate([0,0,regular_row1_cut22_angle])regular_row1_cut();
        }

}//END OF IF ROW1 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF ROW1






}// END OF MODULE row1_complete
//

module regular_row2_complete(
    regular_row2_number_of_pins = regular_row2_number_of_pins,
    regular_row2_offset_on_x = regular_row2_offset_on_x,
    regular_row2_offset_on_z = regular_row2_offset_on_z,
    regular_row2_angle_on_y = regular_row2_angle_on_y,
    regular_row2_mirror = regular_row2_mirror,
    regular_row2_linked = regular_row2_linked,
    regular_row2_link_root_addition = regular_row2_link_root_addition,
    regular_row2_shoulder_distance = regular_row2_shoulder_distance,
    regular_row2_interpin_space = regular_row2_interpin_space)
{
    mirror(regular_row2_mirror)
    translate([0,0,regular_row2_offset_on_z])
    translate([regular_row2_offset_on_x,0,0])
    rotate([0,regular_row2_angle_on_y,0])
    {

        if (regular_row2_linked == "NO"||regular_row2_cut_to_use=="prism_cut"||regular_row2_cut_to_use=="cone_cut"||regular_row2_cut_to_use=="stl_mill")
        {
            translate([0,regular_row2_cut01_distance,regular_row2_cut01_depth])rotate([0,0,regular_row2_cut01_angle])regular_row2_cut();
            translate([0,regular_row2_cut02_distance,regular_row2_cut02_depth])rotate([0,0,regular_row2_cut02_angle])regular_row2_cut();
            translate([0,regular_row2_cut03_distance,regular_row2_cut03_depth])rotate([0,0,regular_row2_cut03_angle])regular_row2_cut();
            translate([0,regular_row2_cut04_distance,regular_row2_cut04_depth])rotate([0,0,regular_row2_cut04_angle])regular_row2_cut();
            translate([0,regular_row2_cut05_distance,regular_row2_cut05_depth])rotate([0,0,regular_row2_cut05_angle])regular_row2_cut();
            translate([0,regular_row2_cut06_distance,regular_row2_cut06_depth])rotate([0,0,regular_row2_cut06_angle])regular_row2_cut();
            translate([0,regular_row2_cut07_distance,regular_row2_cut07_depth])rotate([0,0,regular_row2_cut07_angle])regular_row2_cut();
            translate([0,regular_row2_cut08_distance,regular_row2_cut08_depth])rotate([0,0,regular_row2_cut08_angle])regular_row2_cut();
            translate([0,regular_row2_cut09_distance,regular_row2_cut09_depth])rotate([0,0,regular_row2_cut09_angle])regular_row2_cut();
            translate([0,regular_row2_cut10_distance,regular_row2_cut10_depth])rotate([0,0,regular_row2_cut10_angle])regular_row2_cut();
            translate([0,regular_row2_cut11_distance,regular_row2_cut11_depth])rotate([0,0,regular_row2_cut11_angle])regular_row2_cut();
            translate([0,regular_row2_cut12_distance,regular_row2_cut12_depth])rotate([0,0,regular_row2_cut12_angle])regular_row2_cut();
            translate([0,regular_row2_cut13_distance,regular_row2_cut13_depth])rotate([0,0,regular_row2_cut13_angle])regular_row2_cut();
            translate([0,regular_row2_cut14_distance,regular_row2_cut14_depth])rotate([0,0,regular_row2_cut14_angle])regular_row2_cut();
            translate([0,regular_row2_cut15_distance,regular_row2_cut15_depth])rotate([0,0,regular_row2_cut15_angle])regular_row2_cut();
            translate([0,regular_row2_cut16_distance,regular_row2_cut16_depth])rotate([0,0,regular_row2_cut16_angle])regular_row2_cut();
            translate([0,regular_row2_cut17_distance,regular_row2_cut17_depth])rotate([0,0,regular_row2_cut17_angle])regular_row2_cut();
            translate([0,regular_row2_cut18_distance,regular_row2_cut18_depth])rotate([0,0,regular_row2_cut18_angle])regular_row2_cut();
            translate([0,regular_row2_cut19_distance,regular_row2_cut19_depth])rotate([0,0,regular_row2_cut19_angle])regular_row2_cut();
            translate([0,regular_row2_cut20_distance,regular_row2_cut20_depth])rotate([0,0,regular_row2_cut20_angle])regular_row2_cut();
            translate([0,regular_row2_cut21_distance,regular_row2_cut21_depth])rotate([0,0,regular_row2_cut21_angle])regular_row2_cut();
            translate([0,regular_row2_cut22_distance,regular_row2_cut22_depth])rotate([0,0,regular_row2_cut22_angle])regular_row2_cut();

        }//END OF IF row2 LINKED "NO"

        if (regular_row2_linked == "YES"&&regular_row2_cut_to_use=="laser_cut")
        {
        if (regular_row2_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut01_distance,regular_row2_cut01_depth])rotate([0,0,regular_row2_cut01_angle])regular_row2_cut();

                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut01_distance,regular_row2_cut01_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut01_distance,regular_row2_cut01_depth])rotate([0,0,regular_row2_cut01_angle])regular_row2_cut();

                //CUT 02
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut02_distance,regular_row2_cut02_depth])rotate([0,0,regular_row2_cut02_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut02_distance,regular_row2_cut02_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut02_distance,regular_row2_cut02_depth])rotate([0,0,regular_row2_cut02_angle])regular_row2_cut();

                //CUT 03
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut03_distance,regular_row2_cut03_depth])rotate([0,0,regular_row2_cut03_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut03_distance,regular_row2_cut03_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut03_distance,regular_row2_cut03_depth])rotate([0,0,regular_row2_cut03_angle])regular_row2_cut();

                //CUT 04
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut04_distance,regular_row2_cut04_depth])rotate([0,0,regular_row2_cut04_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut04_distance,regular_row2_cut04_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut04_distance,regular_row2_cut04_depth])rotate([0,0,regular_row2_cut04_angle])regular_row2_cut();

                //CUT 05
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut05_distance,regular_row2_cut05_depth])rotate([0,0,regular_row2_cut05_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut05_distance,regular_row2_cut05_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut05_distance,regular_row2_cut05_depth])rotate([0,0,regular_row2_cut05_angle])regular_row2_cut();

                //CUT 06
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut06_distance,regular_row2_cut06_depth])rotate([0,0,regular_row2_cut06_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut06_distance,regular_row2_cut06_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut06_distance,regular_row2_cut06_depth])rotate([0,0,regular_row2_cut06_angle])regular_row2_cut();

                //CUT 07
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut07_distance,regular_row2_cut07_depth])rotate([0,0,regular_row2_cut07_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut07_distance,regular_row2_cut07_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut07_distance,regular_row2_cut07_depth])rotate([0,0,regular_row2_cut07_angle])regular_row2_cut();

                //CUT 08
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut08_distance,regular_row2_cut08_depth])rotate([0,0,regular_row2_cut08_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut08_distance,regular_row2_cut08_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut08_distance,regular_row2_cut08_depth])rotate([0,0,regular_row2_cut08_angle])regular_row2_cut();

                //CUT 09
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut09_distance,regular_row2_cut09_depth])rotate([0,0,regular_row2_cut09_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut09_distance,regular_row2_cut09_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut09_distance,regular_row2_cut09_depth])rotate([0,0,regular_row2_cut09_angle])regular_row2_cut();

                //CUT 10
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut10_distance,regular_row2_cut10_depth])rotate([0,0,regular_row2_cut10_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut10_distance,regular_row2_cut10_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut10_distance,regular_row2_cut10_depth])rotate([0,0,regular_row2_cut10_angle])regular_row2_cut();

                //CUT 11
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut11_distance,regular_row2_cut11_depth])rotate([0,0,regular_row2_cut11_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut11_distance,regular_row2_cut11_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut11_distance,regular_row2_cut11_depth])rotate([0,0,regular_row2_cut11_angle])regular_row2_cut();

                //CUT 12
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut12_distance,regular_row2_cut12_depth])rotate([0,0,regular_row2_cut12_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut12_distance,regular_row2_cut12_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut12_distance,regular_row2_cut12_depth])rotate([0,0,regular_row2_cut12_angle])regular_row2_cut();

                //CUT 13
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut13_distance,regular_row2_cut13_depth])rotate([0,0,regular_row2_cut13_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut13_distance,regular_row2_cut13_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut13_distance,regular_row2_cut13_depth])rotate([0,0,regular_row2_cut13_angle])regular_row2_cut();

                //CUT 14
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut14_distance,regular_row2_cut14_depth])rotate([0,0,regular_row2_cut14_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut14_distance,regular_row2_cut14_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut14_distance,regular_row2_cut14_depth])rotate([0,0,regular_row2_cut14_angle])regular_row2_cut();

                //CUT 15
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut15_distance,regular_row2_cut15_depth])rotate([0,0,regular_row2_cut15_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut15_distance,regular_row2_cut15_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut15_distance,regular_row2_cut15_depth])rotate([0,0,regular_row2_cut15_angle])regular_row2_cut();

                //CUT 16
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut16_distance,regular_row2_cut16_depth])rotate([0,0,regular_row2_cut16_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut16_distance,regular_row2_cut16_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut16_distance,regular_row2_cut16_depth])rotate([0,0,regular_row2_cut16_angle])regular_row2_cut();

                //CUT 17
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut17_distance,regular_row2_cut17_depth])rotate([0,0,regular_row2_cut17_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut17_distance,regular_row2_cut17_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut17_distance,regular_row2_cut17_depth])rotate([0,0,regular_row2_cut17_angle])regular_row2_cut();

                //CUT 18
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut18_distance,regular_row2_cut18_depth])rotate([0,0,regular_row2_cut18_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut18_distance,regular_row2_cut18_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut18_distance,regular_row2_cut18_depth])rotate([0,0,regular_row2_cut18_angle])regular_row2_cut();

                //CUT 19
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut19_distance,regular_row2_cut19_depth])rotate([0,0,regular_row2_cut19_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut19_distance,regular_row2_cut19_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut19_distance,regular_row2_cut19_depth])rotate([0,0,regular_row2_cut19_angle])regular_row2_cut();

                //CUT 20
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut20_distance,regular_row2_cut20_depth])rotate([0,0,regular_row2_cut20_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut20_distance,regular_row2_cut20_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut20_distance,regular_row2_cut20_depth])rotate([0,0,regular_row2_cut20_angle])regular_row2_cut();

                //CUT 21
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut21_distance,regular_row2_cut21_depth])rotate([0,0,regular_row2_cut21_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut21_distance,regular_row2_cut21_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut21_distance,regular_row2_cut21_depth])rotate([0,0,regular_row2_cut21_angle])regular_row2_cut();

                //CUT 22
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut22_distance,regular_row2_cut22_depth])rotate([0,0,regular_row2_cut22_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut22_distance,regular_row2_cut22_depth])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut22_distance,regular_row2_cut22_depth])rotate([0,0,regular_row2_cut22_angle])regular_row2_cut();
        }

        if (regular_row2_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut01_distance,regular_row2_cut01_depth])rotate([0,0,regular_row2_cut01_angle])regular_row2_cut();

                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut01_distance,regular_row2_cut01_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut01_distance,regular_row2_cut01_depth])rotate([0,0,regular_row2_cut01_angle])regular_row2_cut();

                //CUT 02
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut02_distance,regular_row2_cut02_depth])rotate([0,0,regular_row2_cut02_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut02_distance,regular_row2_cut02_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut02_distance,regular_row2_cut02_depth])rotate([0,0,regular_row2_cut02_angle])regular_row2_cut();

                //CUT 03
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut03_distance,regular_row2_cut03_depth])rotate([0,0,regular_row2_cut03_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut03_distance,regular_row2_cut03_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut03_distance,regular_row2_cut03_depth])rotate([0,0,regular_row2_cut03_angle])regular_row2_cut();

                //CUT 04
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut04_distance,regular_row2_cut04_depth])rotate([0,0,regular_row2_cut04_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut04_distance,regular_row2_cut04_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut04_distance,regular_row2_cut04_depth])rotate([0,0,regular_row2_cut04_angle])regular_row2_cut();

                //CUT 05
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut05_distance,regular_row2_cut05_depth])rotate([0,0,regular_row2_cut05_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut05_distance,regular_row2_cut05_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut05_distance,regular_row2_cut05_depth])rotate([0,0,regular_row2_cut05_angle])regular_row2_cut();

                //CUT 06
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut06_distance,regular_row2_cut06_depth])rotate([0,0,regular_row2_cut06_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut06_distance,regular_row2_cut06_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut06_distance,regular_row2_cut06_depth])rotate([0,0,regular_row2_cut06_angle])regular_row2_cut();

                //CUT 07
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut07_distance,regular_row2_cut07_depth])rotate([0,0,regular_row2_cut07_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut07_distance,regular_row2_cut07_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut07_distance,regular_row2_cut07_depth])rotate([0,0,regular_row2_cut07_angle])regular_row2_cut();

                //CUT 08
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut08_distance,regular_row2_cut08_depth])rotate([0,0,regular_row2_cut08_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut08_distance,regular_row2_cut08_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut08_distance,regular_row2_cut08_depth])rotate([0,0,regular_row2_cut08_angle])regular_row2_cut();

                //CUT 09
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut09_distance,regular_row2_cut09_depth])rotate([0,0,regular_row2_cut09_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut09_distance,regular_row2_cut09_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut09_distance,regular_row2_cut09_depth])rotate([0,0,regular_row2_cut09_angle])regular_row2_cut();

                //CUT 10
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut10_distance,regular_row2_cut10_depth])rotate([0,0,regular_row2_cut10_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut10_distance,regular_row2_cut10_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut10_distance,regular_row2_cut10_depth])rotate([0,0,regular_row2_cut10_angle])regular_row2_cut();

                //CUT 11
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut11_distance,regular_row2_cut11_depth])rotate([0,0,regular_row2_cut11_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut11_distance,regular_row2_cut11_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut11_distance,regular_row2_cut11_depth])rotate([0,0,regular_row2_cut11_angle])regular_row2_cut();

                //CUT 12
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut12_distance,regular_row2_cut12_depth])rotate([0,0,regular_row2_cut12_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut12_distance,regular_row2_cut12_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut12_distance,regular_row2_cut12_depth])rotate([0,0,regular_row2_cut12_angle])regular_row2_cut();

                //CUT 13
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut13_distance,regular_row2_cut13_depth])rotate([0,0,regular_row2_cut13_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut13_distance,regular_row2_cut13_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut13_distance,regular_row2_cut13_depth])rotate([0,0,regular_row2_cut13_angle])regular_row2_cut();

                //CUT 14
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut14_distance,regular_row2_cut14_depth])rotate([0,0,regular_row2_cut14_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut14_distance,regular_row2_cut14_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut14_distance,regular_row2_cut14_depth])rotate([0,0,regular_row2_cut14_angle])regular_row2_cut();

                //CUT 15
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut15_distance,regular_row2_cut15_depth])rotate([0,0,regular_row2_cut15_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut15_distance,regular_row2_cut15_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut15_distance,regular_row2_cut15_depth])rotate([0,0,regular_row2_cut15_angle])regular_row2_cut();

                //CUT 16
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut16_distance,regular_row2_cut16_depth])rotate([0,0,regular_row2_cut16_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut16_distance,regular_row2_cut16_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut16_distance,regular_row2_cut16_depth])rotate([0,0,regular_row2_cut16_angle])regular_row2_cut();

                //CUT 17
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut17_distance,regular_row2_cut17_depth])rotate([0,0,regular_row2_cut17_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut17_distance,regular_row2_cut17_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut17_distance,regular_row2_cut17_depth])rotate([0,0,regular_row2_cut17_angle])regular_row2_cut();

                //CUT 18
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut18_distance,regular_row2_cut18_depth])rotate([0,0,regular_row2_cut18_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut18_distance,regular_row2_cut18_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut18_distance,regular_row2_cut18_depth])rotate([0,0,regular_row2_cut18_angle])regular_row2_cut();

                //CUT 19
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut19_distance,regular_row2_cut19_depth])rotate([0,0,regular_row2_cut19_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut19_distance,regular_row2_cut19_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut19_distance,regular_row2_cut19_depth])rotate([0,0,regular_row2_cut19_angle])regular_row2_cut();

                //CUT 20
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut20_distance,regular_row2_cut20_depth])rotate([0,0,regular_row2_cut20_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut20_distance,regular_row2_cut20_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut20_distance,regular_row2_cut20_depth])rotate([0,0,regular_row2_cut20_angle])regular_row2_cut();

                //CUT 21
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut21_distance,regular_row2_cut21_depth])rotate([0,0,regular_row2_cut21_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut21_distance,regular_row2_cut21_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut21_distance,regular_row2_cut21_depth])rotate([0,0,regular_row2_cut21_angle])regular_row2_cut();

                //CUT 22
                translate([0,-regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut22_distance,regular_row2_cut22_depth])rotate([0,0,regular_row2_cut22_angle])regular_row2_cut();
                }
                translate([0,-regular_row2_link_root_addition/2+regular_row2_cut22_distance,regular_row2_cut22_depth-regular_row2_laser_mill_diameter/2])
                cube([qt_regular_row2_laser_mill_height_qt,regular_row2_link_root_addition,regular_row2_laser_mill_diameter]);

                translate([0,regular_row2_link_root_addition/2,0])
                translate([0,regular_row2_cut22_distance,regular_row2_cut22_depth])rotate([0,0,regular_row2_cut22_angle])regular_row2_cut();
        }

}//END OF IF row2 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row2






}// END OF MODULE row2_complete
//

module regular_row3_complete(
    regular_row3_number_of_pins = regular_row3_number_of_pins,
    regular_row3_offset_on_x = regular_row3_offset_on_x,
    regular_row3_offset_on_z = regular_row3_offset_on_z,
    regular_row3_angle_on_y = regular_row3_angle_on_y,
    regular_row3_mirror = regular_row3_mirror,
    regular_row3_linked = regular_row3_linked,
    regular_row3_link_root_addition = regular_row3_link_root_addition,
    regular_row3_shoulder_distance = regular_row3_shoulder_distance,
    regular_row3_interpin_space = regular_row3_interpin_space)
{
    mirror(regular_row3_mirror)
    translate([0,0,regular_row3_offset_on_z])
    translate([regular_row3_offset_on_x,0,0])
    rotate([0,regular_row3_angle_on_y,0])
    {

        if (regular_row3_linked == "NO"||regular_row3_cut_to_use=="prism_cut"||regular_row3_cut_to_use=="cone_cut"||regular_row3_cut_to_use=="stl_mill")
        {
            translate([0,regular_row3_cut01_distance,regular_row3_cut01_depth])rotate([0,0,regular_row3_cut01_angle])regular_row3_cut();
            translate([0,regular_row3_cut02_distance,regular_row3_cut02_depth])rotate([0,0,regular_row3_cut02_angle])regular_row3_cut();
            translate([0,regular_row3_cut03_distance,regular_row3_cut03_depth])rotate([0,0,regular_row3_cut03_angle])regular_row3_cut();
            translate([0,regular_row3_cut04_distance,regular_row3_cut04_depth])rotate([0,0,regular_row3_cut04_angle])regular_row3_cut();
            translate([0,regular_row3_cut05_distance,regular_row3_cut05_depth])rotate([0,0,regular_row3_cut05_angle])regular_row3_cut();
            translate([0,regular_row3_cut06_distance,regular_row3_cut06_depth])rotate([0,0,regular_row3_cut06_angle])regular_row3_cut();
            translate([0,regular_row3_cut07_distance,regular_row3_cut07_depth])rotate([0,0,regular_row3_cut07_angle])regular_row3_cut();
            translate([0,regular_row3_cut08_distance,regular_row3_cut08_depth])rotate([0,0,regular_row3_cut08_angle])regular_row3_cut();
            translate([0,regular_row3_cut09_distance,regular_row3_cut09_depth])rotate([0,0,regular_row3_cut09_angle])regular_row3_cut();
            translate([0,regular_row3_cut10_distance,regular_row3_cut10_depth])rotate([0,0,regular_row3_cut10_angle])regular_row3_cut();
            translate([0,regular_row3_cut11_distance,regular_row3_cut11_depth])rotate([0,0,regular_row3_cut11_angle])regular_row3_cut();
            translate([0,regular_row3_cut12_distance,regular_row3_cut12_depth])rotate([0,0,regular_row3_cut12_angle])regular_row3_cut();
            translate([0,regular_row3_cut13_distance,regular_row3_cut13_depth])rotate([0,0,regular_row3_cut13_angle])regular_row3_cut();
            translate([0,regular_row3_cut14_distance,regular_row3_cut14_depth])rotate([0,0,regular_row3_cut14_angle])regular_row3_cut();
            translate([0,regular_row3_cut15_distance,regular_row3_cut15_depth])rotate([0,0,regular_row3_cut15_angle])regular_row3_cut();
            translate([0,regular_row3_cut16_distance,regular_row3_cut16_depth])rotate([0,0,regular_row3_cut16_angle])regular_row3_cut();
            translate([0,regular_row3_cut17_distance,regular_row3_cut17_depth])rotate([0,0,regular_row3_cut17_angle])regular_row3_cut();
            translate([0,regular_row3_cut18_distance,regular_row3_cut18_depth])rotate([0,0,regular_row3_cut18_angle])regular_row3_cut();
            translate([0,regular_row3_cut19_distance,regular_row3_cut19_depth])rotate([0,0,regular_row3_cut19_angle])regular_row3_cut();
            translate([0,regular_row3_cut20_distance,regular_row3_cut20_depth])rotate([0,0,regular_row3_cut20_angle])regular_row3_cut();
            translate([0,regular_row3_cut21_distance,regular_row3_cut21_depth])rotate([0,0,regular_row3_cut21_angle])regular_row3_cut();
            translate([0,regular_row3_cut22_distance,regular_row3_cut22_depth])rotate([0,0,regular_row3_cut22_angle])regular_row3_cut();

        }//END OF IF row3 LINKED "NO"

        if (regular_row3_linked == "YES"&&regular_row3_cut_to_use=="laser_cut")
        {
        if (regular_row3_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut01_distance,regular_row3_cut01_depth])rotate([0,0,regular_row3_cut01_angle])regular_row3_cut();

                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut01_distance,regular_row3_cut01_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut01_distance,regular_row3_cut01_depth])rotate([0,0,regular_row3_cut01_angle])regular_row3_cut();

                //CUT 02
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut02_distance,regular_row3_cut02_depth])rotate([0,0,regular_row3_cut02_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut02_distance,regular_row3_cut02_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut02_distance,regular_row3_cut02_depth])rotate([0,0,regular_row3_cut02_angle])regular_row3_cut();

                //CUT 03
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut03_distance,regular_row3_cut03_depth])rotate([0,0,regular_row3_cut03_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut03_distance,regular_row3_cut03_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut03_distance,regular_row3_cut03_depth])rotate([0,0,regular_row3_cut03_angle])regular_row3_cut();

                //CUT 04
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut04_distance,regular_row3_cut04_depth])rotate([0,0,regular_row3_cut04_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut04_distance,regular_row3_cut04_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut04_distance,regular_row3_cut04_depth])rotate([0,0,regular_row3_cut04_angle])regular_row3_cut();

                //CUT 05
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut05_distance,regular_row3_cut05_depth])rotate([0,0,regular_row3_cut05_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut05_distance,regular_row3_cut05_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut05_distance,regular_row3_cut05_depth])rotate([0,0,regular_row3_cut05_angle])regular_row3_cut();

                //CUT 06
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut06_distance,regular_row3_cut06_depth])rotate([0,0,regular_row3_cut06_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut06_distance,regular_row3_cut06_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut06_distance,regular_row3_cut06_depth])rotate([0,0,regular_row3_cut06_angle])regular_row3_cut();

                //CUT 07
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut07_distance,regular_row3_cut07_depth])rotate([0,0,regular_row3_cut07_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut07_distance,regular_row3_cut07_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut07_distance,regular_row3_cut07_depth])rotate([0,0,regular_row3_cut07_angle])regular_row3_cut();

                //CUT 08
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut08_distance,regular_row3_cut08_depth])rotate([0,0,regular_row3_cut08_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut08_distance,regular_row3_cut08_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut08_distance,regular_row3_cut08_depth])rotate([0,0,regular_row3_cut08_angle])regular_row3_cut();

                //CUT 09
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut09_distance,regular_row3_cut09_depth])rotate([0,0,regular_row3_cut09_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut09_distance,regular_row3_cut09_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut09_distance,regular_row3_cut09_depth])rotate([0,0,regular_row3_cut09_angle])regular_row3_cut();

                //CUT 10
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut10_distance,regular_row3_cut10_depth])rotate([0,0,regular_row3_cut10_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut10_distance,regular_row3_cut10_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut10_distance,regular_row3_cut10_depth])rotate([0,0,regular_row3_cut10_angle])regular_row3_cut();

                //CUT 11
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut11_distance,regular_row3_cut11_depth])rotate([0,0,regular_row3_cut11_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut11_distance,regular_row3_cut11_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut11_distance,regular_row3_cut11_depth])rotate([0,0,regular_row3_cut11_angle])regular_row3_cut();

                //CUT 12
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut12_distance,regular_row3_cut12_depth])rotate([0,0,regular_row3_cut12_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut12_distance,regular_row3_cut12_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut12_distance,regular_row3_cut12_depth])rotate([0,0,regular_row3_cut12_angle])regular_row3_cut();

                //CUT 13
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut13_distance,regular_row3_cut13_depth])rotate([0,0,regular_row3_cut13_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut13_distance,regular_row3_cut13_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut13_distance,regular_row3_cut13_depth])rotate([0,0,regular_row3_cut13_angle])regular_row3_cut();

                //CUT 14
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut14_distance,regular_row3_cut14_depth])rotate([0,0,regular_row3_cut14_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut14_distance,regular_row3_cut14_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut14_distance,regular_row3_cut14_depth])rotate([0,0,regular_row3_cut14_angle])regular_row3_cut();

                //CUT 15
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut15_distance,regular_row3_cut15_depth])rotate([0,0,regular_row3_cut15_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut15_distance,regular_row3_cut15_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut15_distance,regular_row3_cut15_depth])rotate([0,0,regular_row3_cut15_angle])regular_row3_cut();

                //CUT 16
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut16_distance,regular_row3_cut16_depth])rotate([0,0,regular_row3_cut16_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut16_distance,regular_row3_cut16_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut16_distance,regular_row3_cut16_depth])rotate([0,0,regular_row3_cut16_angle])regular_row3_cut();

                //CUT 17
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut17_distance,regular_row3_cut17_depth])rotate([0,0,regular_row3_cut17_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut17_distance,regular_row3_cut17_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut17_distance,regular_row3_cut17_depth])rotate([0,0,regular_row3_cut17_angle])regular_row3_cut();

                //CUT 18
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut18_distance,regular_row3_cut18_depth])rotate([0,0,regular_row3_cut18_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut18_distance,regular_row3_cut18_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut18_distance,regular_row3_cut18_depth])rotate([0,0,regular_row3_cut18_angle])regular_row3_cut();

                //CUT 19
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut19_distance,regular_row3_cut19_depth])rotate([0,0,regular_row3_cut19_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut19_distance,regular_row3_cut19_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut19_distance,regular_row3_cut19_depth])rotate([0,0,regular_row3_cut19_angle])regular_row3_cut();

                //CUT 20
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut20_distance,regular_row3_cut20_depth])rotate([0,0,regular_row3_cut20_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut20_distance,regular_row3_cut20_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut20_distance,regular_row3_cut20_depth])rotate([0,0,regular_row3_cut20_angle])regular_row3_cut();

                //CUT 21
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut21_distance,regular_row3_cut21_depth])rotate([0,0,regular_row3_cut21_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut21_distance,regular_row3_cut21_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut21_distance,regular_row3_cut21_depth])rotate([0,0,regular_row3_cut21_angle])regular_row3_cut();

                //CUT 22
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut22_distance,regular_row3_cut22_depth])rotate([0,0,regular_row3_cut22_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut22_distance,regular_row3_cut22_depth])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut22_distance,regular_row3_cut22_depth])rotate([0,0,regular_row3_cut22_angle])regular_row3_cut();
        }

        if (regular_row3_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut01_distance,regular_row3_cut01_depth])rotate([0,0,regular_row3_cut01_angle])regular_row3_cut();

                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut01_distance,regular_row3_cut01_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut01_distance,regular_row3_cut01_depth])rotate([0,0,regular_row3_cut01_angle])regular_row3_cut();

                //CUT 02
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut02_distance,regular_row3_cut02_depth])rotate([0,0,regular_row3_cut02_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut02_distance,regular_row3_cut02_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut02_distance,regular_row3_cut02_depth])rotate([0,0,regular_row3_cut02_angle])regular_row3_cut();

                //CUT 03
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut03_distance,regular_row3_cut03_depth])rotate([0,0,regular_row3_cut03_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut03_distance,regular_row3_cut03_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut03_distance,regular_row3_cut03_depth])rotate([0,0,regular_row3_cut03_angle])regular_row3_cut();

                //CUT 04
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut04_distance,regular_row3_cut04_depth])rotate([0,0,regular_row3_cut04_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut04_distance,regular_row3_cut04_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut04_distance,regular_row3_cut04_depth])rotate([0,0,regular_row3_cut04_angle])regular_row3_cut();

                //CUT 05
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut05_distance,regular_row3_cut05_depth])rotate([0,0,regular_row3_cut05_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut05_distance,regular_row3_cut05_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut05_distance,regular_row3_cut05_depth])rotate([0,0,regular_row3_cut05_angle])regular_row3_cut();

                //CUT 06
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut06_distance,regular_row3_cut06_depth])rotate([0,0,regular_row3_cut06_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut06_distance,regular_row3_cut06_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut06_distance,regular_row3_cut06_depth])rotate([0,0,regular_row3_cut06_angle])regular_row3_cut();

                //CUT 07
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut07_distance,regular_row3_cut07_depth])rotate([0,0,regular_row3_cut07_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut07_distance,regular_row3_cut07_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut07_distance,regular_row3_cut07_depth])rotate([0,0,regular_row3_cut07_angle])regular_row3_cut();

                //CUT 08
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut08_distance,regular_row3_cut08_depth])rotate([0,0,regular_row3_cut08_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut08_distance,regular_row3_cut08_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut08_distance,regular_row3_cut08_depth])rotate([0,0,regular_row3_cut08_angle])regular_row3_cut();

                //CUT 09
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut09_distance,regular_row3_cut09_depth])rotate([0,0,regular_row3_cut09_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut09_distance,regular_row3_cut09_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut09_distance,regular_row3_cut09_depth])rotate([0,0,regular_row3_cut09_angle])regular_row3_cut();

                //CUT 10
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut10_distance,regular_row3_cut10_depth])rotate([0,0,regular_row3_cut10_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut10_distance,regular_row3_cut10_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut10_distance,regular_row3_cut10_depth])rotate([0,0,regular_row3_cut10_angle])regular_row3_cut();

                //CUT 11
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut11_distance,regular_row3_cut11_depth])rotate([0,0,regular_row3_cut11_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut11_distance,regular_row3_cut11_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut11_distance,regular_row3_cut11_depth])rotate([0,0,regular_row3_cut11_angle])regular_row3_cut();

                //CUT 12
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut12_distance,regular_row3_cut12_depth])rotate([0,0,regular_row3_cut12_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut12_distance,regular_row3_cut12_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut12_distance,regular_row3_cut12_depth])rotate([0,0,regular_row3_cut12_angle])regular_row3_cut();

                //CUT 13
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut13_distance,regular_row3_cut13_depth])rotate([0,0,regular_row3_cut13_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut13_distance,regular_row3_cut13_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut13_distance,regular_row3_cut13_depth])rotate([0,0,regular_row3_cut13_angle])regular_row3_cut();

                //CUT 14
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut14_distance,regular_row3_cut14_depth])rotate([0,0,regular_row3_cut14_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut14_distance,regular_row3_cut14_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut14_distance,regular_row3_cut14_depth])rotate([0,0,regular_row3_cut14_angle])regular_row3_cut();

                //CUT 15
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut15_distance,regular_row3_cut15_depth])rotate([0,0,regular_row3_cut15_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut15_distance,regular_row3_cut15_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut15_distance,regular_row3_cut15_depth])rotate([0,0,regular_row3_cut15_angle])regular_row3_cut();

                //CUT 16
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut16_distance,regular_row3_cut16_depth])rotate([0,0,regular_row3_cut16_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut16_distance,regular_row3_cut16_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut16_distance,regular_row3_cut16_depth])rotate([0,0,regular_row3_cut16_angle])regular_row3_cut();

                //CUT 17
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut17_distance,regular_row3_cut17_depth])rotate([0,0,regular_row3_cut17_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut17_distance,regular_row3_cut17_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut17_distance,regular_row3_cut17_depth])rotate([0,0,regular_row3_cut17_angle])regular_row3_cut();

                //CUT 18
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut18_distance,regular_row3_cut18_depth])rotate([0,0,regular_row3_cut18_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut18_distance,regular_row3_cut18_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut18_distance,regular_row3_cut18_depth])rotate([0,0,regular_row3_cut18_angle])regular_row3_cut();

                //CUT 19
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut19_distance,regular_row3_cut19_depth])rotate([0,0,regular_row3_cut19_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut19_distance,regular_row3_cut19_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut19_distance,regular_row3_cut19_depth])rotate([0,0,regular_row3_cut19_angle])regular_row3_cut();

                //CUT 20
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut20_distance,regular_row3_cut20_depth])rotate([0,0,regular_row3_cut20_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut20_distance,regular_row3_cut20_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut20_distance,regular_row3_cut20_depth])rotate([0,0,regular_row3_cut20_angle])regular_row3_cut();

                //CUT 21
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut21_distance,regular_row3_cut21_depth])rotate([0,0,regular_row3_cut21_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut21_distance,regular_row3_cut21_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut21_distance,regular_row3_cut21_depth])rotate([0,0,regular_row3_cut21_angle])regular_row3_cut();

                //CUT 22
                translate([0,-regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut22_distance,regular_row3_cut22_depth])rotate([0,0,regular_row3_cut22_angle])regular_row3_cut();
                }
                translate([0,-regular_row3_link_root_addition/2+regular_row3_cut22_distance,regular_row3_cut22_depth-regular_row3_laser_mill_diameter/2])
                cube([qt_regular_row3_laser_mill_height_qt,regular_row3_link_root_addition,regular_row3_laser_mill_diameter]);

                translate([0,regular_row3_link_root_addition/2,0])
                translate([0,regular_row3_cut22_distance,regular_row3_cut22_depth])rotate([0,0,regular_row3_cut22_angle])regular_row3_cut();
        }

}//END OF IF row3 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row3






}// END OF MODULE row3_complete


//

module regular_row4_complete(
    regular_row4_number_of_pins = regular_row4_number_of_pins,
    regular_row4_offset_on_x = regular_row4_offset_on_x,
    regular_row4_offset_on_z = regular_row4_offset_on_z,
    regular_row4_angle_on_y = regular_row4_angle_on_y,
    regular_row4_mirror = regular_row4_mirror,
    regular_row4_linked = regular_row4_linked,
    regular_row4_link_root_addition = regular_row4_link_root_addition,
    regular_row4_shoulder_distance = regular_row4_shoulder_distance,
    regular_row4_interpin_space = regular_row4_interpin_space)
{
    mirror(regular_row4_mirror)
    translate([0,0,regular_row4_offset_on_z])
    translate([regular_row4_offset_on_x,0,0])
    rotate([0,regular_row4_angle_on_y,0])
    {

        if (regular_row4_linked == "NO"||regular_row4_cut_to_use=="prism_cut"||regular_row4_cut_to_use=="cone_cut"||regular_row4_cut_to_use=="stl_mill")
        {
            translate([0,regular_row4_cut01_distance,regular_row4_cut01_depth])rotate([0,0,regular_row4_cut01_angle])regular_row4_cut();
            translate([0,regular_row4_cut02_distance,regular_row4_cut02_depth])rotate([0,0,regular_row4_cut02_angle])regular_row4_cut();
            translate([0,regular_row4_cut03_distance,regular_row4_cut03_depth])rotate([0,0,regular_row4_cut03_angle])regular_row4_cut();
            translate([0,regular_row4_cut04_distance,regular_row4_cut04_depth])rotate([0,0,regular_row4_cut04_angle])regular_row4_cut();
            translate([0,regular_row4_cut05_distance,regular_row4_cut05_depth])rotate([0,0,regular_row4_cut05_angle])regular_row4_cut();
            translate([0,regular_row4_cut06_distance,regular_row4_cut06_depth])rotate([0,0,regular_row4_cut06_angle])regular_row4_cut();
            translate([0,regular_row4_cut07_distance,regular_row4_cut07_depth])rotate([0,0,regular_row4_cut07_angle])regular_row4_cut();
            translate([0,regular_row4_cut08_distance,regular_row4_cut08_depth])rotate([0,0,regular_row4_cut08_angle])regular_row4_cut();
            translate([0,regular_row4_cut09_distance,regular_row4_cut09_depth])rotate([0,0,regular_row4_cut09_angle])regular_row4_cut();
            translate([0,regular_row4_cut10_distance,regular_row4_cut10_depth])rotate([0,0,regular_row4_cut10_angle])regular_row4_cut();
            translate([0,regular_row4_cut11_distance,regular_row4_cut11_depth])rotate([0,0,regular_row4_cut11_angle])regular_row4_cut();
            translate([0,regular_row4_cut12_distance,regular_row4_cut12_depth])rotate([0,0,regular_row4_cut12_angle])regular_row4_cut();
            translate([0,regular_row4_cut13_distance,regular_row4_cut13_depth])rotate([0,0,regular_row4_cut13_angle])regular_row4_cut();
            translate([0,regular_row4_cut14_distance,regular_row4_cut14_depth])rotate([0,0,regular_row4_cut14_angle])regular_row4_cut();
            translate([0,regular_row4_cut15_distance,regular_row4_cut15_depth])rotate([0,0,regular_row4_cut15_angle])regular_row4_cut();
            translate([0,regular_row4_cut16_distance,regular_row4_cut16_depth])rotate([0,0,regular_row4_cut16_angle])regular_row4_cut();
            translate([0,regular_row4_cut17_distance,regular_row4_cut17_depth])rotate([0,0,regular_row4_cut17_angle])regular_row4_cut();
            translate([0,regular_row4_cut18_distance,regular_row4_cut18_depth])rotate([0,0,regular_row4_cut18_angle])regular_row4_cut();
            translate([0,regular_row4_cut19_distance,regular_row4_cut19_depth])rotate([0,0,regular_row4_cut19_angle])regular_row4_cut();
            translate([0,regular_row4_cut20_distance,regular_row4_cut20_depth])rotate([0,0,regular_row4_cut20_angle])regular_row4_cut();
            translate([0,regular_row4_cut21_distance,regular_row4_cut21_depth])rotate([0,0,regular_row4_cut21_angle])regular_row4_cut();
            translate([0,regular_row4_cut22_distance,regular_row4_cut22_depth])rotate([0,0,regular_row4_cut22_angle])regular_row4_cut();

        }//END OF IF row4 LINKED "NO"

        if (regular_row4_linked == "YES"&&regular_row1_cut_to_use=="laser_cut")
        {
        if (regular_row4_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut01_distance,regular_row4_cut01_depth])rotate([0,0,regular_row4_cut01_angle])regular_row4_cut();

                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut01_distance,regular_row4_cut01_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut01_distance,regular_row4_cut01_depth])rotate([0,0,regular_row4_cut01_angle])regular_row4_cut();

                //CUT 02
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut02_distance,regular_row4_cut02_depth])rotate([0,0,regular_row4_cut02_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut02_distance,regular_row4_cut02_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut02_distance,regular_row4_cut02_depth])rotate([0,0,regular_row4_cut02_angle])regular_row4_cut();

                //CUT 03
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut03_distance,regular_row4_cut03_depth])rotate([0,0,regular_row4_cut03_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut03_distance,regular_row4_cut03_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut03_distance,regular_row4_cut03_depth])rotate([0,0,regular_row4_cut03_angle])regular_row4_cut();

                //CUT 04
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut04_distance,regular_row4_cut04_depth])rotate([0,0,regular_row4_cut04_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut04_distance,regular_row4_cut04_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut04_distance,regular_row4_cut04_depth])rotate([0,0,regular_row4_cut04_angle])regular_row4_cut();

                //CUT 05
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut05_distance,regular_row4_cut05_depth])rotate([0,0,regular_row4_cut05_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut05_distance,regular_row4_cut05_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut05_distance,regular_row4_cut05_depth])rotate([0,0,regular_row4_cut05_angle])regular_row4_cut();

                //CUT 06
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut06_distance,regular_row4_cut06_depth])rotate([0,0,regular_row4_cut06_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut06_distance,regular_row4_cut06_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut06_distance,regular_row4_cut06_depth])rotate([0,0,regular_row4_cut06_angle])regular_row4_cut();

                //CUT 07
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut07_distance,regular_row4_cut07_depth])rotate([0,0,regular_row4_cut07_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut07_distance,regular_row4_cut07_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut07_distance,regular_row4_cut07_depth])rotate([0,0,regular_row4_cut07_angle])regular_row4_cut();

                //CUT 08
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut08_distance,regular_row4_cut08_depth])rotate([0,0,regular_row4_cut08_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut08_distance,regular_row4_cut08_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut08_distance,regular_row4_cut08_depth])rotate([0,0,regular_row4_cut08_angle])regular_row4_cut();

                //CUT 09
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut09_distance,regular_row4_cut09_depth])rotate([0,0,regular_row4_cut09_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut09_distance,regular_row4_cut09_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut09_distance,regular_row4_cut09_depth])rotate([0,0,regular_row4_cut09_angle])regular_row4_cut();

                //CUT 10
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut10_distance,regular_row4_cut10_depth])rotate([0,0,regular_row4_cut10_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut10_distance,regular_row4_cut10_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut10_distance,regular_row4_cut10_depth])rotate([0,0,regular_row4_cut10_angle])regular_row4_cut();

                //CUT 11
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut11_distance,regular_row4_cut11_depth])rotate([0,0,regular_row4_cut11_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut11_distance,regular_row4_cut11_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut11_distance,regular_row4_cut11_depth])rotate([0,0,regular_row4_cut11_angle])regular_row4_cut();

                //CUT 12
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut12_distance,regular_row4_cut12_depth])rotate([0,0,regular_row4_cut12_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut12_distance,regular_row4_cut12_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut12_distance,regular_row4_cut12_depth])rotate([0,0,regular_row4_cut12_angle])regular_row4_cut();

                //CUT 13
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut13_distance,regular_row4_cut13_depth])rotate([0,0,regular_row4_cut13_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut13_distance,regular_row4_cut13_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut13_distance,regular_row4_cut13_depth])rotate([0,0,regular_row4_cut13_angle])regular_row4_cut();

                //CUT 14
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut14_distance,regular_row4_cut14_depth])rotate([0,0,regular_row4_cut14_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut14_distance,regular_row4_cut14_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut14_distance,regular_row4_cut14_depth])rotate([0,0,regular_row4_cut14_angle])regular_row4_cut();

                //CUT 15
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut15_distance,regular_row4_cut15_depth])rotate([0,0,regular_row4_cut15_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut15_distance,regular_row4_cut15_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut15_distance,regular_row4_cut15_depth])rotate([0,0,regular_row4_cut15_angle])regular_row4_cut();

                //CUT 16
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut16_distance,regular_row4_cut16_depth])rotate([0,0,regular_row4_cut16_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut16_distance,regular_row4_cut16_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut16_distance,regular_row4_cut16_depth])rotate([0,0,regular_row4_cut16_angle])regular_row4_cut();

                //CUT 17
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut17_distance,regular_row4_cut17_depth])rotate([0,0,regular_row4_cut17_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut17_distance,regular_row4_cut17_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut17_distance,regular_row4_cut17_depth])rotate([0,0,regular_row4_cut17_angle])regular_row4_cut();

                //CUT 18
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut18_distance,regular_row4_cut18_depth])rotate([0,0,regular_row4_cut18_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut18_distance,regular_row4_cut18_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut18_distance,regular_row4_cut18_depth])rotate([0,0,regular_row4_cut18_angle])regular_row4_cut();

                //CUT 19
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut19_distance,regular_row4_cut19_depth])rotate([0,0,regular_row4_cut19_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut19_distance,regular_row4_cut19_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut19_distance,regular_row4_cut19_depth])rotate([0,0,regular_row4_cut19_angle])regular_row4_cut();

                //CUT 20
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut20_distance,regular_row4_cut20_depth])rotate([0,0,regular_row4_cut20_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut20_distance,regular_row4_cut20_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut20_distance,regular_row4_cut20_depth])rotate([0,0,regular_row4_cut20_angle])regular_row4_cut();

                //CUT 21
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut21_distance,regular_row4_cut21_depth])rotate([0,0,regular_row4_cut21_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut21_distance,regular_row4_cut21_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut21_distance,regular_row4_cut21_depth])rotate([0,0,regular_row4_cut21_angle])regular_row4_cut();

                //CUT 22
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut22_distance,regular_row4_cut22_depth])rotate([0,0,regular_row4_cut22_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut22_distance,regular_row4_cut22_depth])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut22_distance,regular_row4_cut22_depth])rotate([0,0,regular_row4_cut22_angle])regular_row4_cut();
        }

        if (regular_row4_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut01_distance,regular_row4_cut01_depth])rotate([0,0,regular_row4_cut01_angle])regular_row4_cut();

                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut01_distance,regular_row4_cut01_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut01_distance,regular_row4_cut01_depth])rotate([0,0,regular_row4_cut01_angle])regular_row4_cut();

                //CUT 02
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut02_distance,regular_row4_cut02_depth])rotate([0,0,regular_row4_cut02_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut02_distance,regular_row4_cut02_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut02_distance,regular_row4_cut02_depth])rotate([0,0,regular_row4_cut02_angle])regular_row4_cut();

                //CUT 03
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut03_distance,regular_row4_cut03_depth])rotate([0,0,regular_row4_cut03_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut03_distance,regular_row4_cut03_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut03_distance,regular_row4_cut03_depth])rotate([0,0,regular_row4_cut03_angle])regular_row4_cut();

                //CUT 04
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut04_distance,regular_row4_cut04_depth])rotate([0,0,regular_row4_cut04_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut04_distance,regular_row4_cut04_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut04_distance,regular_row4_cut04_depth])rotate([0,0,regular_row4_cut04_angle])regular_row4_cut();

                //CUT 05
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut05_distance,regular_row4_cut05_depth])rotate([0,0,regular_row4_cut05_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut05_distance,regular_row4_cut05_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut05_distance,regular_row4_cut05_depth])rotate([0,0,regular_row4_cut05_angle])regular_row4_cut();

                //CUT 06
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut06_distance,regular_row4_cut06_depth])rotate([0,0,regular_row4_cut06_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut06_distance,regular_row4_cut06_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut06_distance,regular_row4_cut06_depth])rotate([0,0,regular_row4_cut06_angle])regular_row4_cut();

                //CUT 07
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut07_distance,regular_row4_cut07_depth])rotate([0,0,regular_row4_cut07_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut07_distance,regular_row4_cut07_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut07_distance,regular_row4_cut07_depth])rotate([0,0,regular_row4_cut07_angle])regular_row4_cut();

                //CUT 08
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut08_distance,regular_row4_cut08_depth])rotate([0,0,regular_row4_cut08_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut08_distance,regular_row4_cut08_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut08_distance,regular_row4_cut08_depth])rotate([0,0,regular_row4_cut08_angle])regular_row4_cut();

                //CUT 09
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut09_distance,regular_row4_cut09_depth])rotate([0,0,regular_row4_cut09_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut09_distance,regular_row4_cut09_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut09_distance,regular_row4_cut09_depth])rotate([0,0,regular_row4_cut09_angle])regular_row4_cut();

                //CUT 10
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut10_distance,regular_row4_cut10_depth])rotate([0,0,regular_row4_cut10_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut10_distance,regular_row4_cut10_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut10_distance,regular_row4_cut10_depth])rotate([0,0,regular_row4_cut10_angle])regular_row4_cut();

                //CUT 11
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut11_distance,regular_row4_cut11_depth])rotate([0,0,regular_row4_cut11_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut11_distance,regular_row4_cut11_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut11_distance,regular_row4_cut11_depth])rotate([0,0,regular_row4_cut11_angle])regular_row4_cut();

                //CUT 12
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut12_distance,regular_row4_cut12_depth])rotate([0,0,regular_row4_cut12_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut12_distance,regular_row4_cut12_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut12_distance,regular_row4_cut12_depth])rotate([0,0,regular_row4_cut12_angle])regular_row4_cut();

                //CUT 13
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut13_distance,regular_row4_cut13_depth])rotate([0,0,regular_row4_cut13_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut13_distance,regular_row4_cut13_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut13_distance,regular_row4_cut13_depth])rotate([0,0,regular_row4_cut13_angle])regular_row4_cut();

                //CUT 14
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut14_distance,regular_row4_cut14_depth])rotate([0,0,regular_row4_cut14_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut14_distance,regular_row4_cut14_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut14_distance,regular_row4_cut14_depth])rotate([0,0,regular_row4_cut14_angle])regular_row4_cut();

                //CUT 15
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut15_distance,regular_row4_cut15_depth])rotate([0,0,regular_row4_cut15_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut15_distance,regular_row4_cut15_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut15_distance,regular_row4_cut15_depth])rotate([0,0,regular_row4_cut15_angle])regular_row4_cut();

                //CUT 16
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut16_distance,regular_row4_cut16_depth])rotate([0,0,regular_row4_cut16_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut16_distance,regular_row4_cut16_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut16_distance,regular_row4_cut16_depth])rotate([0,0,regular_row4_cut16_angle])regular_row4_cut();

                //CUT 17
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut17_distance,regular_row4_cut17_depth])rotate([0,0,regular_row4_cut17_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut17_distance,regular_row4_cut17_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut17_distance,regular_row4_cut17_depth])rotate([0,0,regular_row4_cut17_angle])regular_row4_cut();

                //CUT 18
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut18_distance,regular_row4_cut18_depth])rotate([0,0,regular_row4_cut18_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut18_distance,regular_row4_cut18_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut18_distance,regular_row4_cut18_depth])rotate([0,0,regular_row4_cut18_angle])regular_row4_cut();

                //CUT 19
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut19_distance,regular_row4_cut19_depth])rotate([0,0,regular_row4_cut19_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut19_distance,regular_row4_cut19_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut19_distance,regular_row4_cut19_depth])rotate([0,0,regular_row4_cut19_angle])regular_row4_cut();

                //CUT 20
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut20_distance,regular_row4_cut20_depth])rotate([0,0,regular_row4_cut20_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut20_distance,regular_row4_cut20_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut20_distance,regular_row4_cut20_depth])rotate([0,0,regular_row4_cut20_angle])regular_row4_cut();

                //CUT 21
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut21_distance,regular_row4_cut21_depth])rotate([0,0,regular_row4_cut21_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut21_distance,regular_row4_cut21_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut21_distance,regular_row4_cut21_depth])rotate([0,0,regular_row4_cut21_angle])regular_row4_cut();

                //CUT 22
                translate([0,-regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut22_distance,regular_row4_cut22_depth])rotate([0,0,regular_row4_cut22_angle])regular_row4_cut();
                }
                translate([0,-regular_row4_link_root_addition/2+regular_row4_cut22_distance,regular_row4_cut22_depth-regular_row4_laser_mill_diameter/2])
                cube([qt_regular_row4_laser_mill_height_qt,regular_row4_link_root_addition,regular_row4_laser_mill_diameter]);

                translate([0,regular_row4_link_root_addition/2,0])
                translate([0,regular_row4_cut22_distance,regular_row4_cut22_depth])rotate([0,0,regular_row4_cut22_angle])regular_row4_cut();
        }

}//END OF IF row4 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row4






}// END OF MODULE row4_complete
//


module regular_row5_complete(
    regular_row5_number_of_pins = regular_row5_number_of_pins,
    regular_row5_offset_on_x = regular_row5_offset_on_x,
    regular_row5_offset_on_z = regular_row5_offset_on_z,
    regular_row5_angle_on_y = regular_row5_angle_on_y,
    regular_row5_mirror = regular_row5_mirror,
    regular_row5_linked = regular_row5_linked,
    regular_row5_link_root_addition = regular_row5_link_root_addition,
    regular_row5_shoulder_distance = regular_row5_shoulder_distance,
    regular_row5_interpin_space = regular_row5_interpin_space)
{
    mirror(regular_row5_mirror)
    translate([0,0,regular_row5_offset_on_z])
    translate([regular_row5_offset_on_x,0,0])
    rotate([0,regular_row5_angle_on_y,0])
    {

        if (regular_row5_linked == "NO"||regular_row5_cut_to_use=="prism_cut"||regular_row5_cut_to_use=="cone_cut"||regular_row5_cut_to_use=="stl_mill")
        {
            translate([0,regular_row5_cut01_distance,regular_row5_cut01_depth])rotate([0,0,regular_row5_cut01_angle])regular_row5_cut();
            translate([0,regular_row5_cut02_distance,regular_row5_cut02_depth])rotate([0,0,regular_row5_cut02_angle])regular_row5_cut();
            translate([0,regular_row5_cut03_distance,regular_row5_cut03_depth])rotate([0,0,regular_row5_cut03_angle])regular_row5_cut();
            translate([0,regular_row5_cut04_distance,regular_row5_cut04_depth])rotate([0,0,regular_row5_cut04_angle])regular_row5_cut();
            translate([0,regular_row5_cut05_distance,regular_row5_cut05_depth])rotate([0,0,regular_row5_cut05_angle])regular_row5_cut();
            translate([0,regular_row5_cut06_distance,regular_row5_cut06_depth])rotate([0,0,regular_row5_cut06_angle])regular_row5_cut();
            translate([0,regular_row5_cut07_distance,regular_row5_cut07_depth])rotate([0,0,regular_row5_cut07_angle])regular_row5_cut();
            translate([0,regular_row5_cut08_distance,regular_row5_cut08_depth])rotate([0,0,regular_row5_cut08_angle])regular_row5_cut();
            translate([0,regular_row5_cut09_distance,regular_row5_cut09_depth])rotate([0,0,regular_row5_cut09_angle])regular_row5_cut();
            translate([0,regular_row5_cut10_distance,regular_row5_cut10_depth])rotate([0,0,regular_row5_cut10_angle])regular_row5_cut();
            translate([0,regular_row5_cut11_distance,regular_row5_cut11_depth])rotate([0,0,regular_row5_cut11_angle])regular_row5_cut();
            translate([0,regular_row5_cut12_distance,regular_row5_cut12_depth])rotate([0,0,regular_row5_cut12_angle])regular_row5_cut();
            translate([0,regular_row5_cut13_distance,regular_row5_cut13_depth])rotate([0,0,regular_row5_cut13_angle])regular_row5_cut();
            translate([0,regular_row5_cut14_distance,regular_row5_cut14_depth])rotate([0,0,regular_row5_cut14_angle])regular_row5_cut();
            translate([0,regular_row5_cut15_distance,regular_row5_cut15_depth])rotate([0,0,regular_row5_cut15_angle])regular_row5_cut();
            translate([0,regular_row5_cut16_distance,regular_row5_cut16_depth])rotate([0,0,regular_row5_cut16_angle])regular_row5_cut();
            translate([0,regular_row5_cut17_distance,regular_row5_cut17_depth])rotate([0,0,regular_row5_cut17_angle])regular_row5_cut();
            translate([0,regular_row5_cut18_distance,regular_row5_cut18_depth])rotate([0,0,regular_row5_cut18_angle])regular_row5_cut();
            translate([0,regular_row5_cut19_distance,regular_row5_cut19_depth])rotate([0,0,regular_row5_cut19_angle])regular_row5_cut();
            translate([0,regular_row5_cut20_distance,regular_row5_cut20_depth])rotate([0,0,regular_row5_cut20_angle])regular_row5_cut();
            translate([0,regular_row5_cut21_distance,regular_row5_cut21_depth])rotate([0,0,regular_row5_cut21_angle])regular_row5_cut();
            translate([0,regular_row5_cut22_distance,regular_row5_cut22_depth])rotate([0,0,regular_row5_cut22_angle])regular_row5_cut();

        }//END OF IF row5 LINKED "NO"

        if (regular_row5_linked == "YES"&&regular_row5_cut_to_use=="laser_cut")
        {
        if (regular_row5_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut01_distance,regular_row5_cut01_depth])rotate([0,0,regular_row5_cut01_angle])regular_row5_cut();

                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut01_distance,regular_row5_cut01_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut01_distance,regular_row5_cut01_depth])rotate([0,0,regular_row5_cut01_angle])regular_row5_cut();

                //CUT 02
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut02_distance,regular_row5_cut02_depth])rotate([0,0,regular_row5_cut02_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut02_distance,regular_row5_cut02_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut02_distance,regular_row5_cut02_depth])rotate([0,0,regular_row5_cut02_angle])regular_row5_cut();

                //CUT 03
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut03_distance,regular_row5_cut03_depth])rotate([0,0,regular_row5_cut03_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut03_distance,regular_row5_cut03_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut03_distance,regular_row5_cut03_depth])rotate([0,0,regular_row5_cut03_angle])regular_row5_cut();

                //CUT 04
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut04_distance,regular_row5_cut04_depth])rotate([0,0,regular_row5_cut04_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut04_distance,regular_row5_cut04_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut04_distance,regular_row5_cut04_depth])rotate([0,0,regular_row5_cut04_angle])regular_row5_cut();

                //CUT 05
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut05_distance,regular_row5_cut05_depth])rotate([0,0,regular_row5_cut05_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut05_distance,regular_row5_cut05_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut05_distance,regular_row5_cut05_depth])rotate([0,0,regular_row5_cut05_angle])regular_row5_cut();

                //CUT 06
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut06_distance,regular_row5_cut06_depth])rotate([0,0,regular_row5_cut06_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut06_distance,regular_row5_cut06_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut06_distance,regular_row5_cut06_depth])rotate([0,0,regular_row5_cut06_angle])regular_row5_cut();

                //CUT 07
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut07_distance,regular_row5_cut07_depth])rotate([0,0,regular_row5_cut07_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut07_distance,regular_row5_cut07_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut07_distance,regular_row5_cut07_depth])rotate([0,0,regular_row5_cut07_angle])regular_row5_cut();

                //CUT 08
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut08_distance,regular_row5_cut08_depth])rotate([0,0,regular_row5_cut08_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut08_distance,regular_row5_cut08_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut08_distance,regular_row5_cut08_depth])rotate([0,0,regular_row5_cut08_angle])regular_row5_cut();

                //CUT 09
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut09_distance,regular_row5_cut09_depth])rotate([0,0,regular_row5_cut09_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut09_distance,regular_row5_cut09_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut09_distance,regular_row5_cut09_depth])rotate([0,0,regular_row5_cut09_angle])regular_row5_cut();

                //CUT 10
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut10_distance,regular_row5_cut10_depth])rotate([0,0,regular_row5_cut10_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut10_distance,regular_row5_cut10_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut10_distance,regular_row5_cut10_depth])rotate([0,0,regular_row5_cut10_angle])regular_row5_cut();

                //CUT 11
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut11_distance,regular_row5_cut11_depth])rotate([0,0,regular_row5_cut11_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut11_distance,regular_row5_cut11_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut11_distance,regular_row5_cut11_depth])rotate([0,0,regular_row5_cut11_angle])regular_row5_cut();

                //CUT 12
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut12_distance,regular_row5_cut12_depth])rotate([0,0,regular_row5_cut12_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut12_distance,regular_row5_cut12_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut12_distance,regular_row5_cut12_depth])rotate([0,0,regular_row5_cut12_angle])regular_row5_cut();

                //CUT 13
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut13_distance,regular_row5_cut13_depth])rotate([0,0,regular_row5_cut13_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut13_distance,regular_row5_cut13_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut13_distance,regular_row5_cut13_depth])rotate([0,0,regular_row5_cut13_angle])regular_row5_cut();

                //CUT 14
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut14_distance,regular_row5_cut14_depth])rotate([0,0,regular_row5_cut14_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut14_distance,regular_row5_cut14_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut14_distance,regular_row5_cut14_depth])rotate([0,0,regular_row5_cut14_angle])regular_row5_cut();

                //CUT 15
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut15_distance,regular_row5_cut15_depth])rotate([0,0,regular_row5_cut15_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut15_distance,regular_row5_cut15_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut15_distance,regular_row5_cut15_depth])rotate([0,0,regular_row5_cut15_angle])regular_row5_cut();

                //CUT 16
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut16_distance,regular_row5_cut16_depth])rotate([0,0,regular_row5_cut16_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut16_distance,regular_row5_cut16_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut16_distance,regular_row5_cut16_depth])rotate([0,0,regular_row5_cut16_angle])regular_row5_cut();

                //CUT 17
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut17_distance,regular_row5_cut17_depth])rotate([0,0,regular_row5_cut17_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut17_distance,regular_row5_cut17_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut17_distance,regular_row5_cut17_depth])rotate([0,0,regular_row5_cut17_angle])regular_row5_cut();

                //CUT 18
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut18_distance,regular_row5_cut18_depth])rotate([0,0,regular_row5_cut18_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut18_distance,regular_row5_cut18_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut18_distance,regular_row5_cut18_depth])rotate([0,0,regular_row5_cut18_angle])regular_row5_cut();

                //CUT 19
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut19_distance,regular_row5_cut19_depth])rotate([0,0,regular_row5_cut19_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut19_distance,regular_row5_cut19_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut19_distance,regular_row5_cut19_depth])rotate([0,0,regular_row5_cut19_angle])regular_row5_cut();

                //CUT 20
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut20_distance,regular_row5_cut20_depth])rotate([0,0,regular_row5_cut20_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut20_distance,regular_row5_cut20_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut20_distance,regular_row5_cut20_depth])rotate([0,0,regular_row5_cut20_angle])regular_row5_cut();

                //CUT 21
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut21_distance,regular_row5_cut21_depth])rotate([0,0,regular_row5_cut21_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut21_distance,regular_row5_cut21_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut21_distance,regular_row5_cut21_depth])rotate([0,0,regular_row5_cut21_angle])regular_row5_cut();

                //CUT 22
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut22_distance,regular_row5_cut22_depth])rotate([0,0,regular_row5_cut22_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut22_distance,regular_row5_cut22_depth])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut22_distance,regular_row5_cut22_depth])rotate([0,0,regular_row5_cut22_angle])regular_row5_cut();
        }

        if (regular_row5_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut01_distance,regular_row5_cut01_depth])rotate([0,0,regular_row5_cut01_angle])regular_row5_cut();

                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut01_distance,regular_row5_cut01_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut01_distance,regular_row5_cut01_depth])rotate([0,0,regular_row5_cut01_angle])regular_row5_cut();

                //CUT 02
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut02_distance,regular_row5_cut02_depth])rotate([0,0,regular_row5_cut02_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut02_distance,regular_row5_cut02_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut02_distance,regular_row5_cut02_depth])rotate([0,0,regular_row5_cut02_angle])regular_row5_cut();

                //CUT 03
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut03_distance,regular_row5_cut03_depth])rotate([0,0,regular_row5_cut03_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut03_distance,regular_row5_cut03_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut03_distance,regular_row5_cut03_depth])rotate([0,0,regular_row5_cut03_angle])regular_row5_cut();

                //CUT 04
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut04_distance,regular_row5_cut04_depth])rotate([0,0,regular_row5_cut04_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut04_distance,regular_row5_cut04_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut04_distance,regular_row5_cut04_depth])rotate([0,0,regular_row5_cut04_angle])regular_row5_cut();

                //CUT 05
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut05_distance,regular_row5_cut05_depth])rotate([0,0,regular_row5_cut05_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut05_distance,regular_row5_cut05_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut05_distance,regular_row5_cut05_depth])rotate([0,0,regular_row5_cut05_angle])regular_row5_cut();

                //CUT 06
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut06_distance,regular_row5_cut06_depth])rotate([0,0,regular_row5_cut06_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut06_distance,regular_row5_cut06_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut06_distance,regular_row5_cut06_depth])rotate([0,0,regular_row5_cut06_angle])regular_row5_cut();

                //CUT 07
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut07_distance,regular_row5_cut07_depth])rotate([0,0,regular_row5_cut07_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut07_distance,regular_row5_cut07_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut07_distance,regular_row5_cut07_depth])rotate([0,0,regular_row5_cut07_angle])regular_row5_cut();

                //CUT 08
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut08_distance,regular_row5_cut08_depth])rotate([0,0,regular_row5_cut08_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut08_distance,regular_row5_cut08_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut08_distance,regular_row5_cut08_depth])rotate([0,0,regular_row5_cut08_angle])regular_row5_cut();

                //CUT 09
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut09_distance,regular_row5_cut09_depth])rotate([0,0,regular_row5_cut09_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut09_distance,regular_row5_cut09_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut09_distance,regular_row5_cut09_depth])rotate([0,0,regular_row5_cut09_angle])regular_row5_cut();

                //CUT 10
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut10_distance,regular_row5_cut10_depth])rotate([0,0,regular_row5_cut10_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut10_distance,regular_row5_cut10_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut10_distance,regular_row5_cut10_depth])rotate([0,0,regular_row5_cut10_angle])regular_row5_cut();

                //CUT 11
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut11_distance,regular_row5_cut11_depth])rotate([0,0,regular_row5_cut11_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut11_distance,regular_row5_cut11_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut11_distance,regular_row5_cut11_depth])rotate([0,0,regular_row5_cut11_angle])regular_row5_cut();

                //CUT 12
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut12_distance,regular_row5_cut12_depth])rotate([0,0,regular_row5_cut12_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut12_distance,regular_row5_cut12_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut12_distance,regular_row5_cut12_depth])rotate([0,0,regular_row5_cut12_angle])regular_row5_cut();

                //CUT 13
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut13_distance,regular_row5_cut13_depth])rotate([0,0,regular_row5_cut13_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut13_distance,regular_row5_cut13_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut13_distance,regular_row5_cut13_depth])rotate([0,0,regular_row5_cut13_angle])regular_row5_cut();

                //CUT 14
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut14_distance,regular_row5_cut14_depth])rotate([0,0,regular_row5_cut14_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut14_distance,regular_row5_cut14_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut14_distance,regular_row5_cut14_depth])rotate([0,0,regular_row5_cut14_angle])regular_row5_cut();

                //CUT 15
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut15_distance,regular_row5_cut15_depth])rotate([0,0,regular_row5_cut15_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut15_distance,regular_row5_cut15_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut15_distance,regular_row5_cut15_depth])rotate([0,0,regular_row5_cut15_angle])regular_row5_cut();

                //CUT 16
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut16_distance,regular_row5_cut16_depth])rotate([0,0,regular_row5_cut16_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut16_distance,regular_row5_cut16_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut16_distance,regular_row5_cut16_depth])rotate([0,0,regular_row5_cut16_angle])regular_row5_cut();

                //CUT 17
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut17_distance,regular_row5_cut17_depth])rotate([0,0,regular_row5_cut17_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut17_distance,regular_row5_cut17_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut17_distance,regular_row5_cut17_depth])rotate([0,0,regular_row5_cut17_angle])regular_row5_cut();

                //CUT 18
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut18_distance,regular_row5_cut18_depth])rotate([0,0,regular_row5_cut18_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut18_distance,regular_row5_cut18_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut18_distance,regular_row5_cut18_depth])rotate([0,0,regular_row5_cut18_angle])regular_row5_cut();

                //CUT 19
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut19_distance,regular_row5_cut19_depth])rotate([0,0,regular_row5_cut19_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut19_distance,regular_row5_cut19_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut19_distance,regular_row5_cut19_depth])rotate([0,0,regular_row5_cut19_angle])regular_row5_cut();

                //CUT 20
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut20_distance,regular_row5_cut20_depth])rotate([0,0,regular_row5_cut20_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut20_distance,regular_row5_cut20_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut20_distance,regular_row5_cut20_depth])rotate([0,0,regular_row5_cut20_angle])regular_row5_cut();

                //CUT 21
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut21_distance,regular_row5_cut21_depth])rotate([0,0,regular_row5_cut21_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut21_distance,regular_row5_cut21_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut21_distance,regular_row5_cut21_depth])rotate([0,0,regular_row5_cut21_angle])regular_row5_cut();

                //CUT 22
                translate([0,-regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut22_distance,regular_row5_cut22_depth])rotate([0,0,regular_row5_cut22_angle])regular_row5_cut();
                }
                translate([0,-regular_row5_link_root_addition/2+regular_row5_cut22_distance,regular_row5_cut22_depth-regular_row5_laser_mill_diameter/2])
                cube([qt_regular_row5_laser_mill_height_qt,regular_row5_link_root_addition,regular_row5_laser_mill_diameter]);

                translate([0,regular_row5_link_root_addition/2,0])
                translate([0,regular_row5_cut22_distance,regular_row5_cut22_depth])rotate([0,0,regular_row5_cut22_angle])regular_row5_cut();
        }

}//END OF IF row5 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row5






}// END OF MODULE row5_complete
//

module regular_row6_complete(
    regular_row6_number_of_pins = regular_row6_number_of_pins,
    regular_row6_offset_on_x = regular_row6_offset_on_x,
    regular_row6_offset_on_z = regular_row6_offset_on_z,
    regular_row6_angle_on_y = regular_row6_angle_on_y,
    regular_row6_mirror = regular_row6_mirror,
    regular_row6_linked = regular_row6_linked,
    regular_row6_link_root_addition = regular_row6_link_root_addition,
    regular_row6_shoulder_distance = regular_row6_shoulder_distance,
    regular_row6_interpin_space = regular_row6_interpin_space)
{
    mirror(regular_row6_mirror)
    translate([0,0,regular_row6_offset_on_z])
    translate([regular_row6_offset_on_x,0,0])
    rotate([0,regular_row6_angle_on_y,0])
    {

        if (regular_row6_linked == "NO"||regular_row6_cut_to_use=="prism_cut"||regular_row6_cut_to_use=="cone_cut"||regular_row6_cut_to_use=="stl_mill")
        {
            translate([0,regular_row6_cut01_distance,regular_row6_cut01_depth])rotate([0,0,regular_row6_cut01_angle])regular_row6_cut();
            translate([0,regular_row6_cut02_distance,regular_row6_cut02_depth])rotate([0,0,regular_row6_cut02_angle])regular_row6_cut();
            translate([0,regular_row6_cut03_distance,regular_row6_cut03_depth])rotate([0,0,regular_row6_cut03_angle])regular_row6_cut();
            translate([0,regular_row6_cut04_distance,regular_row6_cut04_depth])rotate([0,0,regular_row6_cut04_angle])regular_row6_cut();
            translate([0,regular_row6_cut05_distance,regular_row6_cut05_depth])rotate([0,0,regular_row6_cut05_angle])regular_row6_cut();
            translate([0,regular_row6_cut06_distance,regular_row6_cut06_depth])rotate([0,0,regular_row6_cut06_angle])regular_row6_cut();
            translate([0,regular_row6_cut07_distance,regular_row6_cut07_depth])rotate([0,0,regular_row6_cut07_angle])regular_row6_cut();
            translate([0,regular_row6_cut08_distance,regular_row6_cut08_depth])rotate([0,0,regular_row6_cut08_angle])regular_row6_cut();
            translate([0,regular_row6_cut09_distance,regular_row6_cut09_depth])rotate([0,0,regular_row6_cut09_angle])regular_row6_cut();
            translate([0,regular_row6_cut10_distance,regular_row6_cut10_depth])rotate([0,0,regular_row6_cut10_angle])regular_row6_cut();
            translate([0,regular_row6_cut11_distance,regular_row6_cut11_depth])rotate([0,0,regular_row6_cut11_angle])regular_row6_cut();
            translate([0,regular_row6_cut12_distance,regular_row6_cut12_depth])rotate([0,0,regular_row6_cut12_angle])regular_row6_cut();
            translate([0,regular_row6_cut13_distance,regular_row6_cut13_depth])rotate([0,0,regular_row6_cut13_angle])regular_row6_cut();
            translate([0,regular_row6_cut14_distance,regular_row6_cut14_depth])rotate([0,0,regular_row6_cut14_angle])regular_row6_cut();
            translate([0,regular_row6_cut15_distance,regular_row6_cut15_depth])rotate([0,0,regular_row6_cut15_angle])regular_row6_cut();
            translate([0,regular_row6_cut16_distance,regular_row6_cut16_depth])rotate([0,0,regular_row6_cut16_angle])regular_row6_cut();
            translate([0,regular_row6_cut17_distance,regular_row6_cut17_depth])rotate([0,0,regular_row6_cut17_angle])regular_row6_cut();
            translate([0,regular_row6_cut18_distance,regular_row6_cut18_depth])rotate([0,0,regular_row6_cut18_angle])regular_row6_cut();
            translate([0,regular_row6_cut19_distance,regular_row6_cut19_depth])rotate([0,0,regular_row6_cut19_angle])regular_row6_cut();
            translate([0,regular_row6_cut20_distance,regular_row6_cut20_depth])rotate([0,0,regular_row6_cut20_angle])regular_row6_cut();
            translate([0,regular_row6_cut21_distance,regular_row6_cut21_depth])rotate([0,0,regular_row6_cut21_angle])regular_row6_cut();
            translate([0,regular_row6_cut22_distance,regular_row6_cut22_depth])rotate([0,0,regular_row6_cut22_angle])regular_row6_cut();

        }//END OF IF row6 LINKED "NO"

        if (regular_row6_linked == "YES"&&regular_row6_cut_to_use=="laser_cut")
        {
        if (regular_row6_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut01_distance,regular_row6_cut01_depth])rotate([0,0,regular_row6_cut01_angle])regular_row6_cut();

                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut01_distance,regular_row6_cut01_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut01_distance,regular_row6_cut01_depth])rotate([0,0,regular_row6_cut01_angle])regular_row6_cut();

                //CUT 02
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut02_distance,regular_row6_cut02_depth])rotate([0,0,regular_row6_cut02_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut02_distance,regular_row6_cut02_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut02_distance,regular_row6_cut02_depth])rotate([0,0,regular_row6_cut02_angle])regular_row6_cut();

                //CUT 03
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut03_distance,regular_row6_cut03_depth])rotate([0,0,regular_row6_cut03_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut03_distance,regular_row6_cut03_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut03_distance,regular_row6_cut03_depth])rotate([0,0,regular_row6_cut03_angle])regular_row6_cut();

                //CUT 04
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut04_distance,regular_row6_cut04_depth])rotate([0,0,regular_row6_cut04_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut04_distance,regular_row6_cut04_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut04_distance,regular_row6_cut04_depth])rotate([0,0,regular_row6_cut04_angle])regular_row6_cut();

                //CUT 05
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut05_distance,regular_row6_cut05_depth])rotate([0,0,regular_row6_cut05_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut05_distance,regular_row6_cut05_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut05_distance,regular_row6_cut05_depth])rotate([0,0,regular_row6_cut05_angle])regular_row6_cut();

                //CUT 06
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut06_distance,regular_row6_cut06_depth])rotate([0,0,regular_row6_cut06_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut06_distance,regular_row6_cut06_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut06_distance,regular_row6_cut06_depth])rotate([0,0,regular_row6_cut06_angle])regular_row6_cut();

                //CUT 07
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut07_distance,regular_row6_cut07_depth])rotate([0,0,regular_row6_cut07_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut07_distance,regular_row6_cut07_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut07_distance,regular_row6_cut07_depth])rotate([0,0,regular_row6_cut07_angle])regular_row6_cut();

                //CUT 08
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut08_distance,regular_row6_cut08_depth])rotate([0,0,regular_row6_cut08_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut08_distance,regular_row6_cut08_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut08_distance,regular_row6_cut08_depth])rotate([0,0,regular_row6_cut08_angle])regular_row6_cut();

                //CUT 09
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut09_distance,regular_row6_cut09_depth])rotate([0,0,regular_row6_cut09_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut09_distance,regular_row6_cut09_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut09_distance,regular_row6_cut09_depth])rotate([0,0,regular_row6_cut09_angle])regular_row6_cut();

                //CUT 10
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut10_distance,regular_row6_cut10_depth])rotate([0,0,regular_row6_cut10_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut10_distance,regular_row6_cut10_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut10_distance,regular_row6_cut10_depth])rotate([0,0,regular_row6_cut10_angle])regular_row6_cut();

                //CUT 11
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut11_distance,regular_row6_cut11_depth])rotate([0,0,regular_row6_cut11_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut11_distance,regular_row6_cut11_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut11_distance,regular_row6_cut11_depth])rotate([0,0,regular_row6_cut11_angle])regular_row6_cut();

                //CUT 12
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut12_distance,regular_row6_cut12_depth])rotate([0,0,regular_row6_cut12_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut12_distance,regular_row6_cut12_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut12_distance,regular_row6_cut12_depth])rotate([0,0,regular_row6_cut12_angle])regular_row6_cut();

                //CUT 13
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut13_distance,regular_row6_cut13_depth])rotate([0,0,regular_row6_cut13_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut13_distance,regular_row6_cut13_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut13_distance,regular_row6_cut13_depth])rotate([0,0,regular_row6_cut13_angle])regular_row6_cut();

                //CUT 14
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut14_distance,regular_row6_cut14_depth])rotate([0,0,regular_row6_cut14_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut14_distance,regular_row6_cut14_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut14_distance,regular_row6_cut14_depth])rotate([0,0,regular_row6_cut14_angle])regular_row6_cut();

                //CUT 15
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut15_distance,regular_row6_cut15_depth])rotate([0,0,regular_row6_cut15_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut15_distance,regular_row6_cut15_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut15_distance,regular_row6_cut15_depth])rotate([0,0,regular_row6_cut15_angle])regular_row6_cut();

                //CUT 16
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut16_distance,regular_row6_cut16_depth])rotate([0,0,regular_row6_cut16_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut16_distance,regular_row6_cut16_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut16_distance,regular_row6_cut16_depth])rotate([0,0,regular_row6_cut16_angle])regular_row6_cut();

                //CUT 17
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut17_distance,regular_row6_cut17_depth])rotate([0,0,regular_row6_cut17_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut17_distance,regular_row6_cut17_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut17_distance,regular_row6_cut17_depth])rotate([0,0,regular_row6_cut17_angle])regular_row6_cut();

                //CUT 18
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut18_distance,regular_row6_cut18_depth])rotate([0,0,regular_row6_cut18_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut18_distance,regular_row6_cut18_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut18_distance,regular_row6_cut18_depth])rotate([0,0,regular_row6_cut18_angle])regular_row6_cut();

                //CUT 19
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut19_distance,regular_row6_cut19_depth])rotate([0,0,regular_row6_cut19_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut19_distance,regular_row6_cut19_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut19_distance,regular_row6_cut19_depth])rotate([0,0,regular_row6_cut19_angle])regular_row6_cut();

                //CUT 20
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut20_distance,regular_row6_cut20_depth])rotate([0,0,regular_row6_cut20_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut20_distance,regular_row6_cut20_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut20_distance,regular_row6_cut20_depth])rotate([0,0,regular_row6_cut20_angle])regular_row6_cut();

                //CUT 21
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut21_distance,regular_row6_cut21_depth])rotate([0,0,regular_row6_cut21_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut21_distance,regular_row6_cut21_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut21_distance,regular_row6_cut21_depth])rotate([0,0,regular_row6_cut21_angle])regular_row6_cut();

                //CUT 22
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut22_distance,regular_row6_cut22_depth])rotate([0,0,regular_row6_cut22_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut22_distance,regular_row6_cut22_depth])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut22_distance,regular_row6_cut22_depth])rotate([0,0,regular_row6_cut22_angle])regular_row6_cut();
        }

        if (regular_row6_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut01_distance,regular_row6_cut01_depth])rotate([0,0,regular_row6_cut01_angle])regular_row6_cut();

                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut01_distance,regular_row6_cut01_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut01_distance,regular_row6_cut01_depth])rotate([0,0,regular_row6_cut01_angle])regular_row6_cut();

                //CUT 02
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut02_distance,regular_row6_cut02_depth])rotate([0,0,regular_row6_cut02_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut02_distance,regular_row6_cut02_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut02_distance,regular_row6_cut02_depth])rotate([0,0,regular_row6_cut02_angle])regular_row6_cut();

                //CUT 03
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut03_distance,regular_row6_cut03_depth])rotate([0,0,regular_row6_cut03_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut03_distance,regular_row6_cut03_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut03_distance,regular_row6_cut03_depth])rotate([0,0,regular_row6_cut03_angle])regular_row6_cut();

                //CUT 04
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut04_distance,regular_row6_cut04_depth])rotate([0,0,regular_row6_cut04_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut04_distance,regular_row6_cut04_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut04_distance,regular_row6_cut04_depth])rotate([0,0,regular_row6_cut04_angle])regular_row6_cut();

                //CUT 05
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut05_distance,regular_row6_cut05_depth])rotate([0,0,regular_row6_cut05_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut05_distance,regular_row6_cut05_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut05_distance,regular_row6_cut05_depth])rotate([0,0,regular_row6_cut05_angle])regular_row6_cut();

                //CUT 06
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut06_distance,regular_row6_cut06_depth])rotate([0,0,regular_row6_cut06_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut06_distance,regular_row6_cut06_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut06_distance,regular_row6_cut06_depth])rotate([0,0,regular_row6_cut06_angle])regular_row6_cut();

                //CUT 07
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut07_distance,regular_row6_cut07_depth])rotate([0,0,regular_row6_cut07_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut07_distance,regular_row6_cut07_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut07_distance,regular_row6_cut07_depth])rotate([0,0,regular_row6_cut07_angle])regular_row6_cut();

                //CUT 08
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut08_distance,regular_row6_cut08_depth])rotate([0,0,regular_row6_cut08_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut08_distance,regular_row6_cut08_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut08_distance,regular_row6_cut08_depth])rotate([0,0,regular_row6_cut08_angle])regular_row6_cut();

                //CUT 09
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut09_distance,regular_row6_cut09_depth])rotate([0,0,regular_row6_cut09_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut09_distance,regular_row6_cut09_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut09_distance,regular_row6_cut09_depth])rotate([0,0,regular_row6_cut09_angle])regular_row6_cut();

                //CUT 10
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut10_distance,regular_row6_cut10_depth])rotate([0,0,regular_row6_cut10_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut10_distance,regular_row6_cut10_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut10_distance,regular_row6_cut10_depth])rotate([0,0,regular_row6_cut10_angle])regular_row6_cut();

                //CUT 11
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut11_distance,regular_row6_cut11_depth])rotate([0,0,regular_row6_cut11_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut11_distance,regular_row6_cut11_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut11_distance,regular_row6_cut11_depth])rotate([0,0,regular_row6_cut11_angle])regular_row6_cut();

                //CUT 12
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut12_distance,regular_row6_cut12_depth])rotate([0,0,regular_row6_cut12_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut12_distance,regular_row6_cut12_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut12_distance,regular_row6_cut12_depth])rotate([0,0,regular_row6_cut12_angle])regular_row6_cut();

                //CUT 13
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut13_distance,regular_row6_cut13_depth])rotate([0,0,regular_row6_cut13_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut13_distance,regular_row6_cut13_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut13_distance,regular_row6_cut13_depth])rotate([0,0,regular_row6_cut13_angle])regular_row6_cut();

                //CUT 14
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut14_distance,regular_row6_cut14_depth])rotate([0,0,regular_row6_cut14_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut14_distance,regular_row6_cut14_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut14_distance,regular_row6_cut14_depth])rotate([0,0,regular_row6_cut14_angle])regular_row6_cut();

                //CUT 15
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut15_distance,regular_row6_cut15_depth])rotate([0,0,regular_row6_cut15_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut15_distance,regular_row6_cut15_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut15_distance,regular_row6_cut15_depth])rotate([0,0,regular_row6_cut15_angle])regular_row6_cut();

                //CUT 16
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut16_distance,regular_row6_cut16_depth])rotate([0,0,regular_row6_cut16_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut16_distance,regular_row6_cut16_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut16_distance,regular_row6_cut16_depth])rotate([0,0,regular_row6_cut16_angle])regular_row6_cut();

                //CUT 17
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut17_distance,regular_row6_cut17_depth])rotate([0,0,regular_row6_cut17_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut17_distance,regular_row6_cut17_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut17_distance,regular_row6_cut17_depth])rotate([0,0,regular_row6_cut17_angle])regular_row6_cut();

                //CUT 18
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut18_distance,regular_row6_cut18_depth])rotate([0,0,regular_row6_cut18_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut18_distance,regular_row6_cut18_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut18_distance,regular_row6_cut18_depth])rotate([0,0,regular_row6_cut18_angle])regular_row6_cut();

                //CUT 19
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut19_distance,regular_row6_cut19_depth])rotate([0,0,regular_row6_cut19_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut19_distance,regular_row6_cut19_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut19_distance,regular_row6_cut19_depth])rotate([0,0,regular_row6_cut19_angle])regular_row6_cut();

                //CUT 20
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut20_distance,regular_row6_cut20_depth])rotate([0,0,regular_row6_cut20_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut20_distance,regular_row6_cut20_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut20_distance,regular_row6_cut20_depth])rotate([0,0,regular_row6_cut20_angle])regular_row6_cut();

                //CUT 21
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut21_distance,regular_row6_cut21_depth])rotate([0,0,regular_row6_cut21_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut21_distance,regular_row6_cut21_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut21_distance,regular_row6_cut21_depth])rotate([0,0,regular_row6_cut21_angle])regular_row6_cut();

                //CUT 22
                translate([0,-regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut22_distance,regular_row6_cut22_depth])rotate([0,0,regular_row6_cut22_angle])regular_row6_cut();
                }
                translate([0,-regular_row6_link_root_addition/2+regular_row6_cut22_distance,regular_row6_cut22_depth-regular_row6_laser_mill_diameter/2])
                cube([qt_regular_row6_laser_mill_height_qt,regular_row6_link_root_addition,regular_row6_laser_mill_diameter]);

                translate([0,regular_row6_link_root_addition/2,0])
                translate([0,regular_row6_cut22_distance,regular_row6_cut22_depth])rotate([0,0,regular_row6_cut22_angle])regular_row6_cut();
        }

}//END OF IF row6 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row6



}// END OF MODULE row6_complete
//


module regular_sonic_complete(
    regular_sonic_number_of_pins = regular_sonic_number_of_pins,
    regular_sonic_offset_on_x = regular_sonic_offset_on_x,
    regular_sonic_offset_on_z = regular_sonic_offset_on_z,
    regular_sonic_angle_on_y = regular_sonic_angle_on_y,
    regular_sonic_mirror = regular_sonic_mirror,
    regular_sonic_linked = regular_sonic_linked,
    regular_sonic_link_root_addition = regular_sonic_link_root_addition,
    regular_sonic_shoulder_distance = regular_sonic_shoulder_distance,
    regular_sonic_interpin_space = regular_sonic_interpin_space)
{
    mirror(regular_sonic_mirror)
    translate([0,0,regular_sonic_offset_on_z])
    translate([regular_sonic_offset_on_x,0,0])
    rotate([0,regular_sonic_angle_on_y,0])
    {

        if (regular_sonic_linked == "NO"||regular_sonic_cut_to_use=="prism_cut"||regular_sonic_cut_to_use=="cone_cut"||regular_sonic_cut_to_use=="stl_mill")
        {
            translate([0,regular_sonic_cut01_distance,regular_sonic_cut01_depth])rotate([0,0,regular_sonic_cut01_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut02_distance,regular_sonic_cut02_depth])rotate([0,0,regular_sonic_cut02_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut03_distance,regular_sonic_cut03_depth])rotate([0,0,regular_sonic_cut03_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut04_distance,regular_sonic_cut04_depth])rotate([0,0,regular_sonic_cut04_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut05_distance,regular_sonic_cut05_depth])rotate([0,0,regular_sonic_cut05_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut06_distance,regular_sonic_cut06_depth])rotate([0,0,regular_sonic_cut06_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut07_distance,regular_sonic_cut07_depth])rotate([0,0,regular_sonic_cut07_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut08_distance,regular_sonic_cut08_depth])rotate([0,0,regular_sonic_cut08_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut09_distance,regular_sonic_cut09_depth])rotate([0,0,regular_sonic_cut09_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut10_distance,regular_sonic_cut10_depth])rotate([0,0,regular_sonic_cut10_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut11_distance,regular_sonic_cut11_depth])rotate([0,0,regular_sonic_cut11_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut12_distance,regular_sonic_cut12_depth])rotate([0,0,regular_sonic_cut12_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut13_distance,regular_sonic_cut13_depth])rotate([0,0,regular_sonic_cut13_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut14_distance,regular_sonic_cut14_depth])rotate([0,0,regular_sonic_cut14_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut15_distance,regular_sonic_cut15_depth])rotate([0,0,regular_sonic_cut15_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut16_distance,regular_sonic_cut16_depth])rotate([0,0,regular_sonic_cut16_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut17_distance,regular_sonic_cut17_depth])rotate([0,0,regular_sonic_cut17_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut18_distance,regular_sonic_cut18_depth])rotate([0,0,regular_sonic_cut18_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut19_distance,regular_sonic_cut19_depth])rotate([0,0,regular_sonic_cut19_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut20_distance,regular_sonic_cut20_depth])rotate([0,0,regular_sonic_cut20_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut21_distance,regular_sonic_cut21_depth])rotate([0,0,regular_sonic_cut21_angle])regular_sonic_cut();
            translate([0,regular_sonic_cut22_distance,regular_sonic_cut22_depth])rotate([0,0,regular_sonic_cut22_angle])regular_sonic_cut();

        }//END OF IF sonic LINKED "NO"

        if (regular_sonic_linked == "YES"&&regular_sonic_cut_to_use=="laser_cut")
        {
        if (regular_sonic_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut01_distance,regular_sonic_cut01_depth])rotate([0,0,regular_sonic_cut01_angle])regular_sonic_cut();

                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut01_distance,regular_sonic_cut01_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut01_distance,regular_sonic_cut01_depth])rotate([0,0,regular_sonic_cut01_angle])regular_sonic_cut();

                //CUT 02
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut02_distance,regular_sonic_cut02_depth])rotate([0,0,regular_sonic_cut02_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut02_distance,regular_sonic_cut02_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut02_distance,regular_sonic_cut02_depth])rotate([0,0,regular_sonic_cut02_angle])regular_sonic_cut();

                //CUT 03
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut03_distance,regular_sonic_cut03_depth])rotate([0,0,regular_sonic_cut03_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut03_distance,regular_sonic_cut03_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut03_distance,regular_sonic_cut03_depth])rotate([0,0,regular_sonic_cut03_angle])regular_sonic_cut();

                //CUT 04
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut04_distance,regular_sonic_cut04_depth])rotate([0,0,regular_sonic_cut04_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut04_distance,regular_sonic_cut04_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut04_distance,regular_sonic_cut04_depth])rotate([0,0,regular_sonic_cut04_angle])regular_sonic_cut();

                //CUT 05
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut05_distance,regular_sonic_cut05_depth])rotate([0,0,regular_sonic_cut05_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut05_distance,regular_sonic_cut05_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut05_distance,regular_sonic_cut05_depth])rotate([0,0,regular_sonic_cut05_angle])regular_sonic_cut();

                //CUT 06
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut06_distance,regular_sonic_cut06_depth])rotate([0,0,regular_sonic_cut06_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut06_distance,regular_sonic_cut06_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut06_distance,regular_sonic_cut06_depth])rotate([0,0,regular_sonic_cut06_angle])regular_sonic_cut();

                //CUT 07
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut07_distance,regular_sonic_cut07_depth])rotate([0,0,regular_sonic_cut07_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut07_distance,regular_sonic_cut07_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut07_distance,regular_sonic_cut07_depth])rotate([0,0,regular_sonic_cut07_angle])regular_sonic_cut();

                //CUT 08
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut08_distance,regular_sonic_cut08_depth])rotate([0,0,regular_sonic_cut08_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut08_distance,regular_sonic_cut08_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut08_distance,regular_sonic_cut08_depth])rotate([0,0,regular_sonic_cut08_angle])regular_sonic_cut();

                //CUT 09
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut09_distance,regular_sonic_cut09_depth])rotate([0,0,regular_sonic_cut09_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut09_distance,regular_sonic_cut09_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut09_distance,regular_sonic_cut09_depth])rotate([0,0,regular_sonic_cut09_angle])regular_sonic_cut();

                //CUT 10
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut10_distance,regular_sonic_cut10_depth])rotate([0,0,regular_sonic_cut10_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut10_distance,regular_sonic_cut10_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut10_distance,regular_sonic_cut10_depth])rotate([0,0,regular_sonic_cut10_angle])regular_sonic_cut();

                //CUT 11
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut11_distance,regular_sonic_cut11_depth])rotate([0,0,regular_sonic_cut11_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut11_distance,regular_sonic_cut11_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut11_distance,regular_sonic_cut11_depth])rotate([0,0,regular_sonic_cut11_angle])regular_sonic_cut();

                //CUT 12
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut12_distance,regular_sonic_cut12_depth])rotate([0,0,regular_sonic_cut12_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut12_distance,regular_sonic_cut12_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut12_distance,regular_sonic_cut12_depth])rotate([0,0,regular_sonic_cut12_angle])regular_sonic_cut();

                //CUT 13
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut13_distance,regular_sonic_cut13_depth])rotate([0,0,regular_sonic_cut13_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut13_distance,regular_sonic_cut13_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut13_distance,regular_sonic_cut13_depth])rotate([0,0,regular_sonic_cut13_angle])regular_sonic_cut();

                //CUT 14
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut14_distance,regular_sonic_cut14_depth])rotate([0,0,regular_sonic_cut14_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut14_distance,regular_sonic_cut14_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut14_distance,regular_sonic_cut14_depth])rotate([0,0,regular_sonic_cut14_angle])regular_sonic_cut();

                //CUT 15
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut15_distance,regular_sonic_cut15_depth])rotate([0,0,regular_sonic_cut15_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut15_distance,regular_sonic_cut15_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut15_distance,regular_sonic_cut15_depth])rotate([0,0,regular_sonic_cut15_angle])regular_sonic_cut();

                //CUT 16
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut16_distance,regular_sonic_cut16_depth])rotate([0,0,regular_sonic_cut16_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut16_distance,regular_sonic_cut16_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut16_distance,regular_sonic_cut16_depth])rotate([0,0,regular_sonic_cut16_angle])regular_sonic_cut();

                //CUT 17
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut17_distance,regular_sonic_cut17_depth])rotate([0,0,regular_sonic_cut17_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut17_distance,regular_sonic_cut17_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut17_distance,regular_sonic_cut17_depth])rotate([0,0,regular_sonic_cut17_angle])regular_sonic_cut();

                //CUT 18
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut18_distance,regular_sonic_cut18_depth])rotate([0,0,regular_sonic_cut18_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut18_distance,regular_sonic_cut18_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut18_distance,regular_sonic_cut18_depth])rotate([0,0,regular_sonic_cut18_angle])regular_sonic_cut();

                //CUT 19
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut19_distance,regular_sonic_cut19_depth])rotate([0,0,regular_sonic_cut19_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut19_distance,regular_sonic_cut19_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut19_distance,regular_sonic_cut19_depth])rotate([0,0,regular_sonic_cut19_angle])regular_sonic_cut();

                //CUT 20
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut20_distance,regular_sonic_cut20_depth])rotate([0,0,regular_sonic_cut20_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut20_distance,regular_sonic_cut20_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut20_distance,regular_sonic_cut20_depth])rotate([0,0,regular_sonic_cut20_angle])regular_sonic_cut();

                //CUT 21
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut21_distance,regular_sonic_cut21_depth])rotate([0,0,regular_sonic_cut21_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut21_distance,regular_sonic_cut21_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut21_distance,regular_sonic_cut21_depth])rotate([0,0,regular_sonic_cut21_angle])regular_sonic_cut();

                //CUT 22
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut22_distance,regular_sonic_cut22_depth])rotate([0,0,regular_sonic_cut22_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut22_distance,regular_sonic_cut22_depth])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut22_distance,regular_sonic_cut22_depth])rotate([0,0,regular_sonic_cut22_angle])regular_sonic_cut();
        }

        if (regular_sonic_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut01_distance,regular_sonic_cut01_depth])rotate([0,0,regular_sonic_cut01_angle])regular_sonic_cut();

                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut01_distance,regular_sonic_cut01_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut01_distance,regular_sonic_cut01_depth])rotate([0,0,regular_sonic_cut01_angle])regular_sonic_cut();

                //CUT 02
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut02_distance,regular_sonic_cut02_depth])rotate([0,0,regular_sonic_cut02_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut02_distance,regular_sonic_cut02_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut02_distance,regular_sonic_cut02_depth])rotate([0,0,regular_sonic_cut02_angle])regular_sonic_cut();

                //CUT 03
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut03_distance,regular_sonic_cut03_depth])rotate([0,0,regular_sonic_cut03_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut03_distance,regular_sonic_cut03_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut03_distance,regular_sonic_cut03_depth])rotate([0,0,regular_sonic_cut03_angle])regular_sonic_cut();

                //CUT 04
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut04_distance,regular_sonic_cut04_depth])rotate([0,0,regular_sonic_cut04_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut04_distance,regular_sonic_cut04_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut04_distance,regular_sonic_cut04_depth])rotate([0,0,regular_sonic_cut04_angle])regular_sonic_cut();

                //CUT 05
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut05_distance,regular_sonic_cut05_depth])rotate([0,0,regular_sonic_cut05_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut05_distance,regular_sonic_cut05_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut05_distance,regular_sonic_cut05_depth])rotate([0,0,regular_sonic_cut05_angle])regular_sonic_cut();

                //CUT 06
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut06_distance,regular_sonic_cut06_depth])rotate([0,0,regular_sonic_cut06_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut06_distance,regular_sonic_cut06_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut06_distance,regular_sonic_cut06_depth])rotate([0,0,regular_sonic_cut06_angle])regular_sonic_cut();

                //CUT 07
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut07_distance,regular_sonic_cut07_depth])rotate([0,0,regular_sonic_cut07_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut07_distance,regular_sonic_cut07_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut07_distance,regular_sonic_cut07_depth])rotate([0,0,regular_sonic_cut07_angle])regular_sonic_cut();

                //CUT 08
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut08_distance,regular_sonic_cut08_depth])rotate([0,0,regular_sonic_cut08_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut08_distance,regular_sonic_cut08_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut08_distance,regular_sonic_cut08_depth])rotate([0,0,regular_sonic_cut08_angle])regular_sonic_cut();

                //CUT 09
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut09_distance,regular_sonic_cut09_depth])rotate([0,0,regular_sonic_cut09_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut09_distance,regular_sonic_cut09_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut09_distance,regular_sonic_cut09_depth])rotate([0,0,regular_sonic_cut09_angle])regular_sonic_cut();

                //CUT 10
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut10_distance,regular_sonic_cut10_depth])rotate([0,0,regular_sonic_cut10_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut10_distance,regular_sonic_cut10_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut10_distance,regular_sonic_cut10_depth])rotate([0,0,regular_sonic_cut10_angle])regular_sonic_cut();

                //CUT 11
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut11_distance,regular_sonic_cut11_depth])rotate([0,0,regular_sonic_cut11_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut11_distance,regular_sonic_cut11_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut11_distance,regular_sonic_cut11_depth])rotate([0,0,regular_sonic_cut11_angle])regular_sonic_cut();

                //CUT 12
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut12_distance,regular_sonic_cut12_depth])rotate([0,0,regular_sonic_cut12_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut12_distance,regular_sonic_cut12_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut12_distance,regular_sonic_cut12_depth])rotate([0,0,regular_sonic_cut12_angle])regular_sonic_cut();

                //CUT 13
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut13_distance,regular_sonic_cut13_depth])rotate([0,0,regular_sonic_cut13_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut13_distance,regular_sonic_cut13_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut13_distance,regular_sonic_cut13_depth])rotate([0,0,regular_sonic_cut13_angle])regular_sonic_cut();

                //CUT 14
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut14_distance,regular_sonic_cut14_depth])rotate([0,0,regular_sonic_cut14_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut14_distance,regular_sonic_cut14_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut14_distance,regular_sonic_cut14_depth])rotate([0,0,regular_sonic_cut14_angle])regular_sonic_cut();

                //CUT 15
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut15_distance,regular_sonic_cut15_depth])rotate([0,0,regular_sonic_cut15_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut15_distance,regular_sonic_cut15_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut15_distance,regular_sonic_cut15_depth])rotate([0,0,regular_sonic_cut15_angle])regular_sonic_cut();

                //CUT 16
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut16_distance,regular_sonic_cut16_depth])rotate([0,0,regular_sonic_cut16_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut16_distance,regular_sonic_cut16_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut16_distance,regular_sonic_cut16_depth])rotate([0,0,regular_sonic_cut16_angle])regular_sonic_cut();

                //CUT 17
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut17_distance,regular_sonic_cut17_depth])rotate([0,0,regular_sonic_cut17_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut17_distance,regular_sonic_cut17_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut17_distance,regular_sonic_cut17_depth])rotate([0,0,regular_sonic_cut17_angle])regular_sonic_cut();

                //CUT 18
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut18_distance,regular_sonic_cut18_depth])rotate([0,0,regular_sonic_cut18_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut18_distance,regular_sonic_cut18_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut18_distance,regular_sonic_cut18_depth])rotate([0,0,regular_sonic_cut18_angle])regular_sonic_cut();

                //CUT 19
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut19_distance,regular_sonic_cut19_depth])rotate([0,0,regular_sonic_cut19_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut19_distance,regular_sonic_cut19_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut19_distance,regular_sonic_cut19_depth])rotate([0,0,regular_sonic_cut19_angle])regular_sonic_cut();

                //CUT 20
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut20_distance,regular_sonic_cut20_depth])rotate([0,0,regular_sonic_cut20_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut20_distance,regular_sonic_cut20_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut20_distance,regular_sonic_cut20_depth])rotate([0,0,regular_sonic_cut20_angle])regular_sonic_cut();

                //CUT 21
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut21_distance,regular_sonic_cut21_depth])rotate([0,0,regular_sonic_cut21_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut21_distance,regular_sonic_cut21_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut21_distance,regular_sonic_cut21_depth])rotate([0,0,regular_sonic_cut21_angle])regular_sonic_cut();

                //CUT 22
                translate([0,-regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut22_distance,regular_sonic_cut22_depth])rotate([0,0,regular_sonic_cut22_angle])regular_sonic_cut();
                }
                translate([0,-regular_sonic_link_root_addition/2+regular_sonic_cut22_distance,regular_sonic_cut22_depth-regular_sonic_laser_mill_diameter/2])
                cube([qt_regular_sonic_laser_mill_height_qt,regular_sonic_link_root_addition,regular_sonic_laser_mill_diameter]);

                translate([0,regular_sonic_link_root_addition/2,0])
                translate([0,regular_sonic_cut22_distance,regular_sonic_cut22_depth])rotate([0,0,regular_sonic_cut22_angle])regular_sonic_cut();
        }

}//END OF IF sonic LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF sonic


}// END OF MODULE sonic_complete

//REGULAR SONIC INSERT CUTTING LEVEL 2
module regular_sonic_insert_cut()
{
    translate([0,0,regular_sonic_insert_offset_z])
    translate([0,0,regular_height])
    cube([regular_thickness*2, regular_length*2, regular_height*2],center=true);

}
//END OF REGULAR SONIC PROBE CUT


//END OF REGULAR CUTTINGS



//BEGINNING OF DIMPLE CUTTINGS

module dimple_row1_cut(
    dimple_row1_cut_to_use=dimple_row1_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    dimple_row1_prism_root_x=dimple_row1_prism_root_x,
    dimple_row1_prism_root_y=dimple_row1_prism_root_y,
    dimple_row1_prism_angle_x=dimple_row1_prism_angle_x,
    dimple_row1_prism_angle_y=dimple_row1_prism_angle_y,
    dimple_row1_prism_height=dimple_row1_prism_height,

    dimple_row1_cone_height=dimple_row1_cone_height,
    dimple_row1_cone_bottom_diameter=dimple_row1_cone_bottom_diameter,
    dimple_row1_cone_angle=dimple_row1_cone_angle,
    dimple_row1_cone_number_of_faces=dimple_row1_cone_number_of_faces,

    dimple_row1_laser_mill_height=dimple_row1_laser_mill_height,
    dimple_row1_laser_mill_diameter=dimple_row1_laser_mill_diameter,
    dimple_row1_laser_mill_number_of_faces=dimple_row1_laser_mill_number_of_faces,
    dimple_row1_laser_mill_center=dimple_row1_laser_mill_center,

    dimple_row1_stl_mill_name=dimple_row1_stl_mill_name)
{
    cut(cut_to_use = dimple_row1_cut_to_use,

    prism_root_x = dimple_row1_prism_root_x,
    prism_root_y = dimple_row1_prism_root_y,
    prism_angle_x = dimple_row1_prism_angle_x,
    prism_angle_y = dimple_row1_prism_angle_y,
    prism_height = dimple_row1_prism_height,

    cone_height=dimple_row1_cone_height,
    cone_bottom_diameter=dimple_row1_cone_bottom_diameter,
    cone_angle=dimple_row1_cone_angle,
    cone_number_of_faces=dimple_row1_cone_number_of_faces,

    laser_mill_height=dimple_row1_laser_mill_height,
    laser_mill_diameter=dimple_row1_laser_mill_diameter,
    laser_mill_number_of_faces=dimple_row1_laser_mill_number_of_faces,
    laser_mill_center=dimple_row1_laser_mill_center,

    stl_mill_name=dimple_row1_stl_mill_name);



}
//

module dimple_row2_cut(
    dimple_row2_cut_to_use=dimple_row2_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    dimple_row2_prism_root_x=dimple_row2_prism_root_x,
    dimple_row2_prism_root_y=dimple_row2_prism_root_y,
    dimple_row2_prism_angle_x=dimple_row2_prism_angle_x,
    dimple_row2_prism_angle_y=dimple_row2_prism_angle_y,
    dimple_row2_prism_height=dimple_row2_prism_height,

    dimple_row2_cone_height=dimple_row2_cone_height,
    dimple_row2_cone_bottom_diameter=dimple_row2_cone_bottom_diameter,
    dimple_row2_cone_angle=dimple_row2_cone_angle,
    dimple_row2_cone_number_of_faces=dimple_row2_cone_number_of_faces,

    dimple_row2_laser_mill_height=dimple_row2_laser_mill_height,
    dimple_row2_laser_mill_diameter=dimple_row2_laser_mill_diameter,
    dimple_row2_laser_mill_number_of_faces=dimple_row2_laser_mill_number_of_faces,
    dimple_row2_laser_mill_center=dimple_row2_laser_mill_center,

    dimple_row2_stl_mill_name=dimple_row2_stl_mill_name)
{
    cut(cut_to_use = dimple_row2_cut_to_use,

    prism_root_x = dimple_row2_prism_root_x,
    prism_root_y = dimple_row2_prism_root_y,
    prism_angle_x = dimple_row2_prism_angle_x,
    prism_angle_y = dimple_row2_prism_angle_y,
    prism_height = dimple_row2_prism_height,

    cone_height=dimple_row2_cone_height,
    cone_bottom_diameter=dimple_row2_cone_bottom_diameter,
    cone_angle=dimple_row2_cone_angle,
    cone_number_of_faces=dimple_row2_cone_number_of_faces,

    laser_mill_height=dimple_row2_laser_mill_height,
    laser_mill_diameter=dimple_row2_laser_mill_diameter,
    laser_mill_number_of_faces=dimple_row2_laser_mill_number_of_faces,
    laser_mill_center=dimple_row2_laser_mill_center,

    stl_mill_name=dimple_row2_stl_mill_name);



}
//


module dimple_row3_cut(
    dimple_row3_cut_to_use=dimple_row3_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    dimple_row3_prism_root_x=dimple_row3_prism_root_x,
    dimple_row3_prism_root_y=dimple_row3_prism_root_y,
    dimple_row3_prism_angle_x=dimple_row3_prism_angle_x,
    dimple_row3_prism_angle_y=dimple_row3_prism_angle_y,
    dimple_row3_prism_height=dimple_row3_prism_height,

    dimple_row3_cone_height=dimple_row3_cone_height,
    dimple_row3_cone_bottom_diameter=dimple_row3_cone_bottom_diameter,
    dimple_row3_cone_angle=dimple_row3_cone_angle,
    dimple_row3_cone_number_of_faces=dimple_row3_cone_number_of_faces,

    dimple_row3_laser_mill_height=dimple_row3_laser_mill_height,
    dimple_row3_laser_mill_diameter=dimple_row3_laser_mill_diameter,
    dimple_row3_laser_mill_number_of_faces=dimple_row3_laser_mill_number_of_faces,
    dimple_row3_laser_mill_center=dimple_row3_laser_mill_center,

    dimple_row3_stl_mill_name=dimple_row3_stl_mill_name)
{
    cut(cut_to_use = dimple_row3_cut_to_use,

    prism_root_x = dimple_row3_prism_root_x,
    prism_root_y = dimple_row3_prism_root_y,
    prism_angle_x = dimple_row3_prism_angle_x,
    prism_angle_y = dimple_row3_prism_angle_y,
    prism_height = dimple_row3_prism_height,

    cone_height=dimple_row3_cone_height,
    cone_bottom_diameter=dimple_row3_cone_bottom_diameter,
    cone_angle=dimple_row3_cone_angle,
    cone_number_of_faces=dimple_row3_cone_number_of_faces,

    laser_mill_height=dimple_row3_laser_mill_height,
    laser_mill_diameter=dimple_row3_laser_mill_diameter,
    laser_mill_number_of_faces=dimple_row3_laser_mill_number_of_faces,
    laser_mill_center=dimple_row3_laser_mill_center,

    stl_mill_name=dimple_row3_stl_mill_name);



}
//


module dimple_row4_cut(
    dimple_row4_cut_to_use=dimple_row4_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    dimple_row4_prism_root_x=dimple_row4_prism_root_x,
    dimple_row4_prism_root_y=dimple_row4_prism_root_y,
    dimple_row4_prism_angle_x=dimple_row4_prism_angle_x,
    dimple_row4_prism_angle_y=dimple_row4_prism_angle_y,
    dimple_row4_prism_height=dimple_row4_prism_height,

    dimple_row4_cone_height=dimple_row4_cone_height,
    dimple_row4_cone_bottom_diameter=dimple_row4_cone_bottom_diameter,
    dimple_row4_cone_angle=dimple_row4_cone_angle,
    dimple_row4_cone_number_of_faces=dimple_row4_cone_number_of_faces,

    dimple_row4_laser_mill_height=dimple_row4_laser_mill_height,
    dimple_row4_laser_mill_diameter=dimple_row4_laser_mill_diameter,
    dimple_row4_laser_mill_number_of_faces=dimple_row4_laser_mill_number_of_faces,
    dimple_row4_laser_mill_center=dimple_row4_laser_mill_center,

    dimple_row4_stl_mill_name=dimple_row4_stl_mill_name)
{
    cut(cut_to_use = dimple_row4_cut_to_use,

    prism_root_x = dimple_row4_prism_root_x,
    prism_root_y = dimple_row4_prism_root_y,
    prism_angle_x = dimple_row4_prism_angle_x,
    prism_angle_y = dimple_row4_prism_angle_y,
    prism_height = dimple_row4_prism_height,

    cone_height=dimple_row4_cone_height,
    cone_bottom_diameter=dimple_row4_cone_bottom_diameter,
    cone_angle=dimple_row4_cone_angle,
    cone_number_of_faces=dimple_row4_cone_number_of_faces,

    laser_mill_height=dimple_row4_laser_mill_height,
    laser_mill_diameter=dimple_row4_laser_mill_diameter,
    laser_mill_number_of_faces=dimple_row4_laser_mill_number_of_faces,
    laser_mill_center=dimple_row4_laser_mill_center,

    stl_mill_name=dimple_row4_stl_mill_name);



}
//


module dimple_row5_cut(
    dimple_row5_cut_to_use=dimple_row5_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    dimple_row5_prism_root_x=dimple_row5_prism_root_x,
    dimple_row5_prism_root_y=dimple_row5_prism_root_y,
    dimple_row5_prism_angle_x=dimple_row5_prism_angle_x,
    dimple_row5_prism_angle_y=dimple_row5_prism_angle_y,
    dimple_row5_prism_height=dimple_row5_prism_height,

    dimple_row5_cone_height=dimple_row5_cone_height,
    dimple_row5_cone_bottom_diameter=dimple_row5_cone_bottom_diameter,
    dimple_row5_cone_angle=dimple_row5_cone_angle,
    dimple_row5_cone_number_of_faces=dimple_row5_cone_number_of_faces,

    dimple_row5_laser_mill_height=dimple_row5_laser_mill_height,
    dimple_row5_laser_mill_diameter=dimple_row5_laser_mill_diameter,
    dimple_row5_laser_mill_number_of_faces=dimple_row5_laser_mill_number_of_faces,
    dimple_row5_laser_mill_center=dimple_row5_laser_mill_center,

    dimple_row5_stl_mill_name=dimple_row5_stl_mill_name)
{
    cut(cut_to_use = dimple_row5_cut_to_use,

    prism_root_x = dimple_row5_prism_root_x,
    prism_root_y = dimple_row5_prism_root_y,
    prism_angle_x = dimple_row5_prism_angle_x,
    prism_angle_y = dimple_row5_prism_angle_y,
    prism_height = dimple_row5_prism_height,

    cone_height=dimple_row5_cone_height,
    cone_bottom_diameter=dimple_row5_cone_bottom_diameter,
    cone_angle=dimple_row5_cone_angle,
    cone_number_of_faces=dimple_row5_cone_number_of_faces,

    laser_mill_height=dimple_row5_laser_mill_height,
    laser_mill_diameter=dimple_row5_laser_mill_diameter,
    laser_mill_number_of_faces=dimple_row5_laser_mill_number_of_faces,
    laser_mill_center=dimple_row5_laser_mill_center,

    stl_mill_name=dimple_row5_stl_mill_name);



}
//


module dimple_row6_cut(
    dimple_row6_cut_to_use=dimple_row6_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    dimple_row6_prism_root_x=dimple_row6_prism_root_x,
    dimple_row6_prism_root_y=dimple_row6_prism_root_y,
    dimple_row6_prism_angle_x=dimple_row6_prism_angle_x,
    dimple_row6_prism_angle_y=dimple_row6_prism_angle_y,
    dimple_row6_prism_height=dimple_row6_prism_height,

    dimple_row6_cone_height=dimple_row6_cone_height,
    dimple_row6_cone_bottom_diameter=dimple_row6_cone_bottom_diameter,
    dimple_row6_cone_angle=dimple_row6_cone_angle,
    dimple_row6_cone_number_of_faces=dimple_row6_cone_number_of_faces,

    dimple_row6_laser_mill_height=dimple_row6_laser_mill_height,
    dimple_row6_laser_mill_diameter=dimple_row6_laser_mill_diameter,
    dimple_row6_laser_mill_number_of_faces=dimple_row6_laser_mill_number_of_faces,
    dimple_row6_laser_mill_center=dimple_row6_laser_mill_center,

    dimple_row6_stl_mill_name=dimple_row6_stl_mill_name)
{
    cut(cut_to_use = dimple_row6_cut_to_use,

    prism_root_x = dimple_row6_prism_root_x,
    prism_root_y = dimple_row6_prism_root_y,
    prism_angle_x = dimple_row6_prism_angle_x,
    prism_angle_y = dimple_row6_prism_angle_y,
    prism_height = dimple_row6_prism_height,

    cone_height=dimple_row6_cone_height,
    cone_bottom_diameter=dimple_row6_cone_bottom_diameter,
    cone_angle=dimple_row6_cone_angle,
    cone_number_of_faces=dimple_row6_cone_number_of_faces,

    laser_mill_height=dimple_row6_laser_mill_height,
    laser_mill_diameter=dimple_row6_laser_mill_diameter,
    laser_mill_number_of_faces=dimple_row6_laser_mill_number_of_faces,
    laser_mill_center=dimple_row6_laser_mill_center,

    stl_mill_name=dimple_row6_stl_mill_name);



}
//


module dimple_sonic_cut(
    dimple_sonic_cut_to_use=dimple_sonic_cut_to_use, //can be prism_cut, cone_cut, laser_cut

    dimple_sonic_prism_root_x=dimple_sonic_prism_root_x,
    dimple_sonic_prism_root_y=dimple_sonic_prism_root_y,
    dimple_sonic_prism_angle_x=dimple_sonic_prism_angle_x,
    dimple_sonic_prism_angle_y=dimple_sonic_prism_angle_y,
    dimple_sonic_prism_height=dimple_sonic_prism_height,

    dimple_sonic_cone_height=dimple_sonic_cone_height,
    dimple_sonic_cone_bottom_diameter=dimple_sonic_cone_bottom_diameter,
    dimple_sonic_cone_angle=dimple_sonic_cone_angle,
    dimple_sonic_cone_number_of_faces=dimple_sonic_cone_number_of_faces,

    dimple_sonic_laser_mill_height=dimple_sonic_laser_mill_height,
    dimple_sonic_laser_mill_diameter=dimple_sonic_laser_mill_diameter,
    dimple_sonic_laser_mill_number_of_faces=dimple_sonic_laser_mill_number_of_faces,
    dimple_sonic_laser_mill_center=dimple_sonic_laser_mill_center,

    dimple_sonic_stl_mill_name=dimple_sonic_stl_mill_name)
{
    cut(cut_to_use = dimple_sonic_cut_to_use,

    prism_root_x = dimple_sonic_prism_root_x,
    prism_root_y = dimple_sonic_prism_root_y,
    prism_angle_x = dimple_sonic_prism_angle_x,
    prism_angle_y = dimple_sonic_prism_angle_y,
    prism_height = dimple_sonic_prism_height,

    cone_height=dimple_sonic_cone_height,
    cone_bottom_diameter=dimple_sonic_cone_bottom_diameter,
    cone_angle=dimple_sonic_cone_angle,
    cone_number_of_faces=dimple_sonic_cone_number_of_faces,

    laser_mill_height=dimple_sonic_laser_mill_height,
    laser_mill_diameter=dimple_sonic_laser_mill_diameter,
    laser_mill_number_of_faces=dimple_sonic_laser_mill_number_of_faces,
    laser_mill_center=dimple_sonic_laser_mill_center,

    stl_mill_name=dimple_sonic_stl_mill_name);



}
//

module dimple_row1_complete(
    dimple_row1_number_of_pins = dimple_row1_number_of_pins,
    dimple_row1_offset_on_x = dimple_row1_offset_on_x,
    dimple_row1_offset_on_z = dimple_row1_offset_on_z,
    dimple_row1_angle_on_y = dimple_row1_angle_on_y,
    dimple_row1_mirror = dimple_row1_mirror,
    dimple_row1_linked = dimple_row1_linked,
    dimple_row1_link_root_addition = dimple_row1_link_root_addition,
    dimple_row1_shoulder_distance = dimple_row1_shoulder_distance,
    dimple_row1_interpin_space = dimple_row1_interpin_space)
{
    mirror(dimple_row1_mirror)
    translate([0,0,dimple_row1_offset_on_z])
    translate([dimple_row1_offset_on_x,0,0])
    rotate([0,dimple_row1_angle_on_y,0])
    {

        if (dimple_row1_linked == "NO"||dimple_row1_cut_to_use=="prism_cut"||dimple_row1_cut_to_use=="cone_cut"||dimple_row1_cut_to_use=="stl_mill")
        {
            translate([0,dimple_row1_cut01_distance,dimple_row1_cut01_depth])rotate([0,0,dimple_row1_cut01_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut02_distance,dimple_row1_cut02_depth])rotate([0,0,dimple_row1_cut02_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut03_distance,dimple_row1_cut03_depth])rotate([0,0,dimple_row1_cut03_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut04_distance,dimple_row1_cut04_depth])rotate([0,0,dimple_row1_cut04_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut05_distance,dimple_row1_cut05_depth])rotate([0,0,dimple_row1_cut05_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut06_distance,dimple_row1_cut06_depth])rotate([0,0,dimple_row1_cut06_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut07_distance,dimple_row1_cut07_depth])rotate([0,0,dimple_row1_cut07_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut08_distance,dimple_row1_cut08_depth])rotate([0,0,dimple_row1_cut08_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut09_distance,dimple_row1_cut09_depth])rotate([0,0,dimple_row1_cut09_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut10_distance,dimple_row1_cut10_depth])rotate([0,0,dimple_row1_cut10_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut11_distance,dimple_row1_cut11_depth])rotate([0,0,dimple_row1_cut11_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut12_distance,dimple_row1_cut12_depth])rotate([0,0,dimple_row1_cut12_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut13_distance,dimple_row1_cut13_depth])rotate([0,0,dimple_row1_cut13_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut14_distance,dimple_row1_cut14_depth])rotate([0,0,dimple_row1_cut14_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut15_distance,dimple_row1_cut15_depth])rotate([0,0,dimple_row1_cut15_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut16_distance,dimple_row1_cut16_depth])rotate([0,0,dimple_row1_cut16_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut17_distance,dimple_row1_cut17_depth])rotate([0,0,dimple_row1_cut17_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut18_distance,dimple_row1_cut18_depth])rotate([0,0,dimple_row1_cut18_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut19_distance,dimple_row1_cut19_depth])rotate([0,0,dimple_row1_cut19_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut20_distance,dimple_row1_cut20_depth])rotate([0,0,dimple_row1_cut20_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut21_distance,dimple_row1_cut21_depth])rotate([0,0,dimple_row1_cut21_angle])dimple_row1_cut();
            translate([0,dimple_row1_cut22_distance,dimple_row1_cut22_depth])rotate([0,0,dimple_row1_cut22_angle])dimple_row1_cut();

        }//END OF IF ROW1 LINKED "NO"

        if (dimple_row1_linked == "YES"&&dimple_row1_cut_to_use=="laser_cut")
        {
        if (dimple_row1_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut01_distance,dimple_row1_cut01_depth])rotate([0,0,dimple_row1_cut01_angle])dimple_row1_cut();

                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut01_distance,dimple_row1_cut01_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut01_distance,dimple_row1_cut01_depth])rotate([0,0,dimple_row1_cut01_angle])dimple_row1_cut();

                //CUT 02
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut02_distance,dimple_row1_cut02_depth])rotate([0,0,dimple_row1_cut02_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut02_distance,dimple_row1_cut02_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut02_distance,dimple_row1_cut02_depth])rotate([0,0,dimple_row1_cut02_angle])dimple_row1_cut();

                //CUT 03
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut03_distance,dimple_row1_cut03_depth])rotate([0,0,dimple_row1_cut03_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut03_distance,dimple_row1_cut03_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut03_distance,dimple_row1_cut03_depth])rotate([0,0,dimple_row1_cut03_angle])dimple_row1_cut();

                //CUT 04
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut04_distance,dimple_row1_cut04_depth])rotate([0,0,dimple_row1_cut04_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut04_distance,dimple_row1_cut04_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut04_distance,dimple_row1_cut04_depth])rotate([0,0,dimple_row1_cut04_angle])dimple_row1_cut();

                //CUT 05
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut05_distance,dimple_row1_cut05_depth])rotate([0,0,dimple_row1_cut05_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut05_distance,dimple_row1_cut05_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut05_distance,dimple_row1_cut05_depth])rotate([0,0,dimple_row1_cut05_angle])dimple_row1_cut();

                //CUT 06
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut06_distance,dimple_row1_cut06_depth])rotate([0,0,dimple_row1_cut06_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut06_distance,dimple_row1_cut06_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut06_distance,dimple_row1_cut06_depth])rotate([0,0,dimple_row1_cut06_angle])dimple_row1_cut();

                //CUT 07
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut07_distance,dimple_row1_cut07_depth])rotate([0,0,dimple_row1_cut07_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut07_distance,dimple_row1_cut07_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut07_distance,dimple_row1_cut07_depth])rotate([0,0,dimple_row1_cut07_angle])dimple_row1_cut();

                //CUT 08
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut08_distance,dimple_row1_cut08_depth])rotate([0,0,dimple_row1_cut08_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut08_distance,dimple_row1_cut08_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut08_distance,dimple_row1_cut08_depth])rotate([0,0,dimple_row1_cut08_angle])dimple_row1_cut();

                //CUT 09
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut09_distance,dimple_row1_cut09_depth])rotate([0,0,dimple_row1_cut09_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut09_distance,dimple_row1_cut09_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut09_distance,dimple_row1_cut09_depth])rotate([0,0,dimple_row1_cut09_angle])dimple_row1_cut();

                //CUT 10
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut10_distance,dimple_row1_cut10_depth])rotate([0,0,dimple_row1_cut10_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut10_distance,dimple_row1_cut10_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut10_distance,dimple_row1_cut10_depth])rotate([0,0,dimple_row1_cut10_angle])dimple_row1_cut();

                //CUT 11
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut11_distance,dimple_row1_cut11_depth])rotate([0,0,dimple_row1_cut11_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut11_distance,dimple_row1_cut11_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut11_distance,dimple_row1_cut11_depth])rotate([0,0,dimple_row1_cut11_angle])dimple_row1_cut();

                //CUT 12
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut12_distance,dimple_row1_cut12_depth])rotate([0,0,dimple_row1_cut12_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut12_distance,dimple_row1_cut12_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut12_distance,dimple_row1_cut12_depth])rotate([0,0,dimple_row1_cut12_angle])dimple_row1_cut();

                //CUT 13
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut13_distance,dimple_row1_cut13_depth])rotate([0,0,dimple_row1_cut13_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut13_distance,dimple_row1_cut13_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut13_distance,dimple_row1_cut13_depth])rotate([0,0,dimple_row1_cut13_angle])dimple_row1_cut();

                //CUT 14
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut14_distance,dimple_row1_cut14_depth])rotate([0,0,dimple_row1_cut14_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut14_distance,dimple_row1_cut14_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut14_distance,dimple_row1_cut14_depth])rotate([0,0,dimple_row1_cut14_angle])dimple_row1_cut();

                //CUT 15
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut15_distance,dimple_row1_cut15_depth])rotate([0,0,dimple_row1_cut15_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut15_distance,dimple_row1_cut15_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut15_distance,dimple_row1_cut15_depth])rotate([0,0,dimple_row1_cut15_angle])dimple_row1_cut();

                //CUT 16
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut16_distance,dimple_row1_cut16_depth])rotate([0,0,dimple_row1_cut16_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut16_distance,dimple_row1_cut16_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut16_distance,dimple_row1_cut16_depth])rotate([0,0,dimple_row1_cut16_angle])dimple_row1_cut();

                //CUT 17
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut17_distance,dimple_row1_cut17_depth])rotate([0,0,dimple_row1_cut17_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut17_distance,dimple_row1_cut17_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut17_distance,dimple_row1_cut17_depth])rotate([0,0,dimple_row1_cut17_angle])dimple_row1_cut();

                //CUT 18
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut18_distance,dimple_row1_cut18_depth])rotate([0,0,dimple_row1_cut18_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut18_distance,dimple_row1_cut18_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut18_distance,dimple_row1_cut18_depth])rotate([0,0,dimple_row1_cut18_angle])dimple_row1_cut();

                //CUT 19
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut19_distance,dimple_row1_cut19_depth])rotate([0,0,dimple_row1_cut19_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut19_distance,dimple_row1_cut19_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut19_distance,dimple_row1_cut19_depth])rotate([0,0,dimple_row1_cut19_angle])dimple_row1_cut();

                //CUT 20
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut20_distance,dimple_row1_cut20_depth])rotate([0,0,dimple_row1_cut20_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut20_distance,dimple_row1_cut20_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut20_distance,dimple_row1_cut20_depth])rotate([0,0,dimple_row1_cut20_angle])dimple_row1_cut();

                //CUT 21
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut21_distance,dimple_row1_cut21_depth])rotate([0,0,dimple_row1_cut21_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut21_distance,dimple_row1_cut21_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut21_distance,dimple_row1_cut21_depth])rotate([0,0,dimple_row1_cut21_angle])dimple_row1_cut();

                //CUT 22
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut22_distance,dimple_row1_cut22_depth])rotate([0,0,dimple_row1_cut22_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut22_distance,dimple_row1_cut22_depth])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut22_distance,dimple_row1_cut22_depth])rotate([0,0,dimple_row1_cut22_angle])dimple_row1_cut();
        }

        if (dimple_row1_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut01_distance,dimple_row1_cut01_depth])rotate([0,0,dimple_row1_cut01_angle])dimple_row1_cut();

                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut01_distance,dimple_row1_cut01_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut01_distance,dimple_row1_cut01_depth])rotate([0,0,dimple_row1_cut01_angle])dimple_row1_cut();

                //CUT 02
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut02_distance,dimple_row1_cut02_depth])rotate([0,0,dimple_row1_cut02_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut02_distance,dimple_row1_cut02_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut02_distance,dimple_row1_cut02_depth])rotate([0,0,dimple_row1_cut02_angle])dimple_row1_cut();

                //CUT 03
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut03_distance,dimple_row1_cut03_depth])rotate([0,0,dimple_row1_cut03_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut03_distance,dimple_row1_cut03_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut03_distance,dimple_row1_cut03_depth])rotate([0,0,dimple_row1_cut03_angle])dimple_row1_cut();

                //CUT 04
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut04_distance,dimple_row1_cut04_depth])rotate([0,0,dimple_row1_cut04_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut04_distance,dimple_row1_cut04_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut04_distance,dimple_row1_cut04_depth])rotate([0,0,dimple_row1_cut04_angle])dimple_row1_cut();

                //CUT 05
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut05_distance,dimple_row1_cut05_depth])rotate([0,0,dimple_row1_cut05_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut05_distance,dimple_row1_cut05_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut05_distance,dimple_row1_cut05_depth])rotate([0,0,dimple_row1_cut05_angle])dimple_row1_cut();

                //CUT 06
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut06_distance,dimple_row1_cut06_depth])rotate([0,0,dimple_row1_cut06_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut06_distance,dimple_row1_cut06_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut06_distance,dimple_row1_cut06_depth])rotate([0,0,dimple_row1_cut06_angle])dimple_row1_cut();

                //CUT 07
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut07_distance,dimple_row1_cut07_depth])rotate([0,0,dimple_row1_cut07_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut07_distance,dimple_row1_cut07_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut07_distance,dimple_row1_cut07_depth])rotate([0,0,dimple_row1_cut07_angle])dimple_row1_cut();

                //CUT 08
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut08_distance,dimple_row1_cut08_depth])rotate([0,0,dimple_row1_cut08_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut08_distance,dimple_row1_cut08_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut08_distance,dimple_row1_cut08_depth])rotate([0,0,dimple_row1_cut08_angle])dimple_row1_cut();

                //CUT 09
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut09_distance,dimple_row1_cut09_depth])rotate([0,0,dimple_row1_cut09_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut09_distance,dimple_row1_cut09_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut09_distance,dimple_row1_cut09_depth])rotate([0,0,dimple_row1_cut09_angle])dimple_row1_cut();

                //CUT 10
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut10_distance,dimple_row1_cut10_depth])rotate([0,0,dimple_row1_cut10_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut10_distance,dimple_row1_cut10_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut10_distance,dimple_row1_cut10_depth])rotate([0,0,dimple_row1_cut10_angle])dimple_row1_cut();

                //CUT 11
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut11_distance,dimple_row1_cut11_depth])rotate([0,0,dimple_row1_cut11_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut11_distance,dimple_row1_cut11_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut11_distance,dimple_row1_cut11_depth])rotate([0,0,dimple_row1_cut11_angle])dimple_row1_cut();

                //CUT 12
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut12_distance,dimple_row1_cut12_depth])rotate([0,0,dimple_row1_cut12_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut12_distance,dimple_row1_cut12_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut12_distance,dimple_row1_cut12_depth])rotate([0,0,dimple_row1_cut12_angle])dimple_row1_cut();

                //CUT 13
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut13_distance,dimple_row1_cut13_depth])rotate([0,0,dimple_row1_cut13_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut13_distance,dimple_row1_cut13_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut13_distance,dimple_row1_cut13_depth])rotate([0,0,dimple_row1_cut13_angle])dimple_row1_cut();

                //CUT 14
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut14_distance,dimple_row1_cut14_depth])rotate([0,0,dimple_row1_cut14_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut14_distance,dimple_row1_cut14_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut14_distance,dimple_row1_cut14_depth])rotate([0,0,dimple_row1_cut14_angle])dimple_row1_cut();

                //CUT 15
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut15_distance,dimple_row1_cut15_depth])rotate([0,0,dimple_row1_cut15_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut15_distance,dimple_row1_cut15_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut15_distance,dimple_row1_cut15_depth])rotate([0,0,dimple_row1_cut15_angle])dimple_row1_cut();

                //CUT 16
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut16_distance,dimple_row1_cut16_depth])rotate([0,0,dimple_row1_cut16_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut16_distance,dimple_row1_cut16_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut16_distance,dimple_row1_cut16_depth])rotate([0,0,dimple_row1_cut16_angle])dimple_row1_cut();

                //CUT 17
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut17_distance,dimple_row1_cut17_depth])rotate([0,0,dimple_row1_cut17_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut17_distance,dimple_row1_cut17_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut17_distance,dimple_row1_cut17_depth])rotate([0,0,dimple_row1_cut17_angle])dimple_row1_cut();

                //CUT 18
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut18_distance,dimple_row1_cut18_depth])rotate([0,0,dimple_row1_cut18_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut18_distance,dimple_row1_cut18_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut18_distance,dimple_row1_cut18_depth])rotate([0,0,dimple_row1_cut18_angle])dimple_row1_cut();

                //CUT 19
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut19_distance,dimple_row1_cut19_depth])rotate([0,0,dimple_row1_cut19_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut19_distance,dimple_row1_cut19_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut19_distance,dimple_row1_cut19_depth])rotate([0,0,dimple_row1_cut19_angle])dimple_row1_cut();

                //CUT 20
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut20_distance,dimple_row1_cut20_depth])rotate([0,0,dimple_row1_cut20_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut20_distance,dimple_row1_cut20_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut20_distance,dimple_row1_cut20_depth])rotate([0,0,dimple_row1_cut20_angle])dimple_row1_cut();

                //CUT 21
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut21_distance,dimple_row1_cut21_depth])rotate([0,0,dimple_row1_cut21_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut21_distance,dimple_row1_cut21_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut21_distance,dimple_row1_cut21_depth])rotate([0,0,dimple_row1_cut21_angle])dimple_row1_cut();

                //CUT 22
                translate([0,-dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut22_distance,dimple_row1_cut22_depth])rotate([0,0,dimple_row1_cut22_angle])dimple_row1_cut();
                }
                translate([0,-dimple_row1_link_root_addition/2+dimple_row1_cut22_distance,dimple_row1_cut22_depth-dimple_row1_laser_mill_diameter/2])
                cube([qt_dimple_row1_laser_mill_height_qt,dimple_row1_link_root_addition,dimple_row1_laser_mill_diameter]);

                translate([0,dimple_row1_link_root_addition/2,0])
                translate([0,dimple_row1_cut22_distance,dimple_row1_cut22_depth])rotate([0,0,dimple_row1_cut22_angle])dimple_row1_cut();
        }

}//END OF IF ROW1 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF ROW1






}// END OF MODULE row1_complete
//

module dimple_row2_complete(
    dimple_row2_number_of_pins = dimple_row2_number_of_pins,
    dimple_row2_offset_on_x = dimple_row2_offset_on_x,
    dimple_row2_offset_on_z = dimple_row2_offset_on_z,
    dimple_row2_angle_on_y = dimple_row2_angle_on_y,
    dimple_row2_mirror = dimple_row2_mirror,
    dimple_row2_linked = dimple_row2_linked,
    dimple_row2_link_root_addition = dimple_row2_link_root_addition,
    dimple_row2_shoulder_distance = dimple_row2_shoulder_distance,
    dimple_row2_interpin_space = dimple_row2_interpin_space)
{
    mirror(dimple_row2_mirror)
    translate([0,0,dimple_row2_offset_on_z])
    translate([dimple_row2_offset_on_x,0,0])
    rotate([0,dimple_row2_angle_on_y,0])
    {

        if (dimple_row2_linked == "NO"||dimple_row2_cut_to_use=="prism_cut"||dimple_row2_cut_to_use=="cone_cut"||dimple_row2_cut_to_use=="stl_mill")
        {
            translate([0,dimple_row2_cut01_distance,dimple_row2_cut01_depth])rotate([0,0,dimple_row2_cut01_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut02_distance,dimple_row2_cut02_depth])rotate([0,0,dimple_row2_cut02_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut03_distance,dimple_row2_cut03_depth])rotate([0,0,dimple_row2_cut03_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut04_distance,dimple_row2_cut04_depth])rotate([0,0,dimple_row2_cut04_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut05_distance,dimple_row2_cut05_depth])rotate([0,0,dimple_row2_cut05_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut06_distance,dimple_row2_cut06_depth])rotate([0,0,dimple_row2_cut06_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut07_distance,dimple_row2_cut07_depth])rotate([0,0,dimple_row2_cut07_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut08_distance,dimple_row2_cut08_depth])rotate([0,0,dimple_row2_cut08_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut09_distance,dimple_row2_cut09_depth])rotate([0,0,dimple_row2_cut09_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut10_distance,dimple_row2_cut10_depth])rotate([0,0,dimple_row2_cut10_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut11_distance,dimple_row2_cut11_depth])rotate([0,0,dimple_row2_cut11_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut12_distance,dimple_row2_cut12_depth])rotate([0,0,dimple_row2_cut12_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut13_distance,dimple_row2_cut13_depth])rotate([0,0,dimple_row2_cut13_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut14_distance,dimple_row2_cut14_depth])rotate([0,0,dimple_row2_cut14_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut15_distance,dimple_row2_cut15_depth])rotate([0,0,dimple_row2_cut15_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut16_distance,dimple_row2_cut16_depth])rotate([0,0,dimple_row2_cut16_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut17_distance,dimple_row2_cut17_depth])rotate([0,0,dimple_row2_cut17_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut18_distance,dimple_row2_cut18_depth])rotate([0,0,dimple_row2_cut18_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut19_distance,dimple_row2_cut19_depth])rotate([0,0,dimple_row2_cut19_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut20_distance,dimple_row2_cut20_depth])rotate([0,0,dimple_row2_cut20_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut21_distance,dimple_row2_cut21_depth])rotate([0,0,dimple_row2_cut21_angle])dimple_row2_cut();
            translate([0,dimple_row2_cut22_distance,dimple_row2_cut22_depth])rotate([0,0,dimple_row2_cut22_angle])dimple_row2_cut();

        }//END OF IF row2 LINKED "NO"

        if (dimple_row2_linked == "YES"&&dimple_row2_cut_to_use=="laser_cut")
        {
        if (dimple_row2_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut01_distance,dimple_row2_cut01_depth])rotate([0,0,dimple_row2_cut01_angle])dimple_row2_cut();

                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut01_distance,dimple_row2_cut01_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut01_distance,dimple_row2_cut01_depth])rotate([0,0,dimple_row2_cut01_angle])dimple_row2_cut();

                //CUT 02
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut02_distance,dimple_row2_cut02_depth])rotate([0,0,dimple_row2_cut02_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut02_distance,dimple_row2_cut02_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut02_distance,dimple_row2_cut02_depth])rotate([0,0,dimple_row2_cut02_angle])dimple_row2_cut();

                //CUT 03
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut03_distance,dimple_row2_cut03_depth])rotate([0,0,dimple_row2_cut03_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut03_distance,dimple_row2_cut03_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut03_distance,dimple_row2_cut03_depth])rotate([0,0,dimple_row2_cut03_angle])dimple_row2_cut();

                //CUT 04
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut04_distance,dimple_row2_cut04_depth])rotate([0,0,dimple_row2_cut04_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut04_distance,dimple_row2_cut04_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut04_distance,dimple_row2_cut04_depth])rotate([0,0,dimple_row2_cut04_angle])dimple_row2_cut();

                //CUT 05
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut05_distance,dimple_row2_cut05_depth])rotate([0,0,dimple_row2_cut05_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut05_distance,dimple_row2_cut05_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut05_distance,dimple_row2_cut05_depth])rotate([0,0,dimple_row2_cut05_angle])dimple_row2_cut();

                //CUT 06
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut06_distance,dimple_row2_cut06_depth])rotate([0,0,dimple_row2_cut06_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut06_distance,dimple_row2_cut06_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut06_distance,dimple_row2_cut06_depth])rotate([0,0,dimple_row2_cut06_angle])dimple_row2_cut();

                //CUT 07
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut07_distance,dimple_row2_cut07_depth])rotate([0,0,dimple_row2_cut07_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut07_distance,dimple_row2_cut07_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut07_distance,dimple_row2_cut07_depth])rotate([0,0,dimple_row2_cut07_angle])dimple_row2_cut();

                //CUT 08
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut08_distance,dimple_row2_cut08_depth])rotate([0,0,dimple_row2_cut08_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut08_distance,dimple_row2_cut08_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut08_distance,dimple_row2_cut08_depth])rotate([0,0,dimple_row2_cut08_angle])dimple_row2_cut();

                //CUT 09
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut09_distance,dimple_row2_cut09_depth])rotate([0,0,dimple_row2_cut09_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut09_distance,dimple_row2_cut09_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut09_distance,dimple_row2_cut09_depth])rotate([0,0,dimple_row2_cut09_angle])dimple_row2_cut();

                //CUT 10
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut10_distance,dimple_row2_cut10_depth])rotate([0,0,dimple_row2_cut10_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut10_distance,dimple_row2_cut10_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut10_distance,dimple_row2_cut10_depth])rotate([0,0,dimple_row2_cut10_angle])dimple_row2_cut();

                //CUT 11
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut11_distance,dimple_row2_cut11_depth])rotate([0,0,dimple_row2_cut11_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut11_distance,dimple_row2_cut11_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut11_distance,dimple_row2_cut11_depth])rotate([0,0,dimple_row2_cut11_angle])dimple_row2_cut();

                //CUT 12
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut12_distance,dimple_row2_cut12_depth])rotate([0,0,dimple_row2_cut12_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut12_distance,dimple_row2_cut12_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut12_distance,dimple_row2_cut12_depth])rotate([0,0,dimple_row2_cut12_angle])dimple_row2_cut();

                //CUT 13
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut13_distance,dimple_row2_cut13_depth])rotate([0,0,dimple_row2_cut13_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut13_distance,dimple_row2_cut13_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut13_distance,dimple_row2_cut13_depth])rotate([0,0,dimple_row2_cut13_angle])dimple_row2_cut();

                //CUT 14
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut14_distance,dimple_row2_cut14_depth])rotate([0,0,dimple_row2_cut14_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut14_distance,dimple_row2_cut14_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut14_distance,dimple_row2_cut14_depth])rotate([0,0,dimple_row2_cut14_angle])dimple_row2_cut();

                //CUT 15
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut15_distance,dimple_row2_cut15_depth])rotate([0,0,dimple_row2_cut15_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut15_distance,dimple_row2_cut15_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut15_distance,dimple_row2_cut15_depth])rotate([0,0,dimple_row2_cut15_angle])dimple_row2_cut();

                //CUT 16
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut16_distance,dimple_row2_cut16_depth])rotate([0,0,dimple_row2_cut16_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut16_distance,dimple_row2_cut16_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut16_distance,dimple_row2_cut16_depth])rotate([0,0,dimple_row2_cut16_angle])dimple_row2_cut();

                //CUT 17
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut17_distance,dimple_row2_cut17_depth])rotate([0,0,dimple_row2_cut17_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut17_distance,dimple_row2_cut17_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut17_distance,dimple_row2_cut17_depth])rotate([0,0,dimple_row2_cut17_angle])dimple_row2_cut();

                //CUT 18
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut18_distance,dimple_row2_cut18_depth])rotate([0,0,dimple_row2_cut18_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut18_distance,dimple_row2_cut18_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut18_distance,dimple_row2_cut18_depth])rotate([0,0,dimple_row2_cut18_angle])dimple_row2_cut();

                //CUT 19
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut19_distance,dimple_row2_cut19_depth])rotate([0,0,dimple_row2_cut19_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut19_distance,dimple_row2_cut19_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut19_distance,dimple_row2_cut19_depth])rotate([0,0,dimple_row2_cut19_angle])dimple_row2_cut();

                //CUT 20
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut20_distance,dimple_row2_cut20_depth])rotate([0,0,dimple_row2_cut20_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut20_distance,dimple_row2_cut20_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut20_distance,dimple_row2_cut20_depth])rotate([0,0,dimple_row2_cut20_angle])dimple_row2_cut();

                //CUT 21
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut21_distance,dimple_row2_cut21_depth])rotate([0,0,dimple_row2_cut21_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut21_distance,dimple_row2_cut21_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut21_distance,dimple_row2_cut21_depth])rotate([0,0,dimple_row2_cut21_angle])dimple_row2_cut();

                //CUT 22
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut22_distance,dimple_row2_cut22_depth])rotate([0,0,dimple_row2_cut22_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut22_distance,dimple_row2_cut22_depth])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut22_distance,dimple_row2_cut22_depth])rotate([0,0,dimple_row2_cut22_angle])dimple_row2_cut();
        }

        if (dimple_row2_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut01_distance,dimple_row2_cut01_depth])rotate([0,0,dimple_row2_cut01_angle])dimple_row2_cut();

                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut01_distance,dimple_row2_cut01_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut01_distance,dimple_row2_cut01_depth])rotate([0,0,dimple_row2_cut01_angle])dimple_row2_cut();

                //CUT 02
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut02_distance,dimple_row2_cut02_depth])rotate([0,0,dimple_row2_cut02_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut02_distance,dimple_row2_cut02_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut02_distance,dimple_row2_cut02_depth])rotate([0,0,dimple_row2_cut02_angle])dimple_row2_cut();

                //CUT 03
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut03_distance,dimple_row2_cut03_depth])rotate([0,0,dimple_row2_cut03_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut03_distance,dimple_row2_cut03_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut03_distance,dimple_row2_cut03_depth])rotate([0,0,dimple_row2_cut03_angle])dimple_row2_cut();

                //CUT 04
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut04_distance,dimple_row2_cut04_depth])rotate([0,0,dimple_row2_cut04_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut04_distance,dimple_row2_cut04_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut04_distance,dimple_row2_cut04_depth])rotate([0,0,dimple_row2_cut04_angle])dimple_row2_cut();

                //CUT 05
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut05_distance,dimple_row2_cut05_depth])rotate([0,0,dimple_row2_cut05_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut05_distance,dimple_row2_cut05_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut05_distance,dimple_row2_cut05_depth])rotate([0,0,dimple_row2_cut05_angle])dimple_row2_cut();

                //CUT 06
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut06_distance,dimple_row2_cut06_depth])rotate([0,0,dimple_row2_cut06_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut06_distance,dimple_row2_cut06_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut06_distance,dimple_row2_cut06_depth])rotate([0,0,dimple_row2_cut06_angle])dimple_row2_cut();

                //CUT 07
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut07_distance,dimple_row2_cut07_depth])rotate([0,0,dimple_row2_cut07_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut07_distance,dimple_row2_cut07_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut07_distance,dimple_row2_cut07_depth])rotate([0,0,dimple_row2_cut07_angle])dimple_row2_cut();

                //CUT 08
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut08_distance,dimple_row2_cut08_depth])rotate([0,0,dimple_row2_cut08_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut08_distance,dimple_row2_cut08_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut08_distance,dimple_row2_cut08_depth])rotate([0,0,dimple_row2_cut08_angle])dimple_row2_cut();

                //CUT 09
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut09_distance,dimple_row2_cut09_depth])rotate([0,0,dimple_row2_cut09_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut09_distance,dimple_row2_cut09_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut09_distance,dimple_row2_cut09_depth])rotate([0,0,dimple_row2_cut09_angle])dimple_row2_cut();

                //CUT 10
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut10_distance,dimple_row2_cut10_depth])rotate([0,0,dimple_row2_cut10_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut10_distance,dimple_row2_cut10_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut10_distance,dimple_row2_cut10_depth])rotate([0,0,dimple_row2_cut10_angle])dimple_row2_cut();

                //CUT 11
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut11_distance,dimple_row2_cut11_depth])rotate([0,0,dimple_row2_cut11_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut11_distance,dimple_row2_cut11_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut11_distance,dimple_row2_cut11_depth])rotate([0,0,dimple_row2_cut11_angle])dimple_row2_cut();

                //CUT 12
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut12_distance,dimple_row2_cut12_depth])rotate([0,0,dimple_row2_cut12_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut12_distance,dimple_row2_cut12_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut12_distance,dimple_row2_cut12_depth])rotate([0,0,dimple_row2_cut12_angle])dimple_row2_cut();

                //CUT 13
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut13_distance,dimple_row2_cut13_depth])rotate([0,0,dimple_row2_cut13_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut13_distance,dimple_row2_cut13_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut13_distance,dimple_row2_cut13_depth])rotate([0,0,dimple_row2_cut13_angle])dimple_row2_cut();

                //CUT 14
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut14_distance,dimple_row2_cut14_depth])rotate([0,0,dimple_row2_cut14_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut14_distance,dimple_row2_cut14_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut14_distance,dimple_row2_cut14_depth])rotate([0,0,dimple_row2_cut14_angle])dimple_row2_cut();

                //CUT 15
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut15_distance,dimple_row2_cut15_depth])rotate([0,0,dimple_row2_cut15_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut15_distance,dimple_row2_cut15_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut15_distance,dimple_row2_cut15_depth])rotate([0,0,dimple_row2_cut15_angle])dimple_row2_cut();

                //CUT 16
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut16_distance,dimple_row2_cut16_depth])rotate([0,0,dimple_row2_cut16_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut16_distance,dimple_row2_cut16_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut16_distance,dimple_row2_cut16_depth])rotate([0,0,dimple_row2_cut16_angle])dimple_row2_cut();

                //CUT 17
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut17_distance,dimple_row2_cut17_depth])rotate([0,0,dimple_row2_cut17_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut17_distance,dimple_row2_cut17_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut17_distance,dimple_row2_cut17_depth])rotate([0,0,dimple_row2_cut17_angle])dimple_row2_cut();

                //CUT 18
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut18_distance,dimple_row2_cut18_depth])rotate([0,0,dimple_row2_cut18_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut18_distance,dimple_row2_cut18_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut18_distance,dimple_row2_cut18_depth])rotate([0,0,dimple_row2_cut18_angle])dimple_row2_cut();

                //CUT 19
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut19_distance,dimple_row2_cut19_depth])rotate([0,0,dimple_row2_cut19_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut19_distance,dimple_row2_cut19_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut19_distance,dimple_row2_cut19_depth])rotate([0,0,dimple_row2_cut19_angle])dimple_row2_cut();

                //CUT 20
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut20_distance,dimple_row2_cut20_depth])rotate([0,0,dimple_row2_cut20_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut20_distance,dimple_row2_cut20_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut20_distance,dimple_row2_cut20_depth])rotate([0,0,dimple_row2_cut20_angle])dimple_row2_cut();

                //CUT 21
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut21_distance,dimple_row2_cut21_depth])rotate([0,0,dimple_row2_cut21_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut21_distance,dimple_row2_cut21_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut21_distance,dimple_row2_cut21_depth])rotate([0,0,dimple_row2_cut21_angle])dimple_row2_cut();

                //CUT 22
                translate([0,-dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut22_distance,dimple_row2_cut22_depth])rotate([0,0,dimple_row2_cut22_angle])dimple_row2_cut();
                }
                translate([0,-dimple_row2_link_root_addition/2+dimple_row2_cut22_distance,dimple_row2_cut22_depth-dimple_row2_laser_mill_diameter/2])
                cube([qt_dimple_row2_laser_mill_height_qt,dimple_row2_link_root_addition,dimple_row2_laser_mill_diameter]);

                translate([0,dimple_row2_link_root_addition/2,0])
                translate([0,dimple_row2_cut22_distance,dimple_row2_cut22_depth])rotate([0,0,dimple_row2_cut22_angle])dimple_row2_cut();
        }

}//END OF IF row2 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row2






}// END OF MODULE row2_complete
//

module dimple_row3_complete(
    dimple_row3_number_of_pins = dimple_row3_number_of_pins,
    dimple_row3_offset_on_x = dimple_row3_offset_on_x,
    dimple_row3_offset_on_z = dimple_row3_offset_on_z,
    dimple_row3_angle_on_y = dimple_row3_angle_on_y,
    dimple_row3_mirror = dimple_row3_mirror,
    dimple_row3_linked = dimple_row3_linked,
    dimple_row3_link_root_addition = dimple_row3_link_root_addition,
    dimple_row3_shoulder_distance = dimple_row3_shoulder_distance,
    dimple_row3_interpin_space = dimple_row3_interpin_space)
{
    mirror(dimple_row3_mirror)
    translate([0,0,dimple_row3_offset_on_z])
    translate([dimple_row3_offset_on_x,0,0])
    rotate([0,dimple_row3_angle_on_y,0])
    {

        if (dimple_row3_linked == "NO"||dimple_row3_cut_to_use=="prism_cut"||dimple_row3_cut_to_use=="cone_cut"||dimple_row3_cut_to_use=="stl_mill")
        {
            translate([0,dimple_row3_cut01_distance,dimple_row3_cut01_depth])rotate([0,0,dimple_row3_cut01_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut02_distance,dimple_row3_cut02_depth])rotate([0,0,dimple_row3_cut02_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut03_distance,dimple_row3_cut03_depth])rotate([0,0,dimple_row3_cut03_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut04_distance,dimple_row3_cut04_depth])rotate([0,0,dimple_row3_cut04_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut05_distance,dimple_row3_cut05_depth])rotate([0,0,dimple_row3_cut05_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut06_distance,dimple_row3_cut06_depth])rotate([0,0,dimple_row3_cut06_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut07_distance,dimple_row3_cut07_depth])rotate([0,0,dimple_row3_cut07_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut08_distance,dimple_row3_cut08_depth])rotate([0,0,dimple_row3_cut08_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut09_distance,dimple_row3_cut09_depth])rotate([0,0,dimple_row3_cut09_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut10_distance,dimple_row3_cut10_depth])rotate([0,0,dimple_row3_cut10_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut11_distance,dimple_row3_cut11_depth])rotate([0,0,dimple_row3_cut11_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut12_distance,dimple_row3_cut12_depth])rotate([0,0,dimple_row3_cut12_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut13_distance,dimple_row3_cut13_depth])rotate([0,0,dimple_row3_cut13_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut14_distance,dimple_row3_cut14_depth])rotate([0,0,dimple_row3_cut14_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut15_distance,dimple_row3_cut15_depth])rotate([0,0,dimple_row3_cut15_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut16_distance,dimple_row3_cut16_depth])rotate([0,0,dimple_row3_cut16_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut17_distance,dimple_row3_cut17_depth])rotate([0,0,dimple_row3_cut17_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut18_distance,dimple_row3_cut18_depth])rotate([0,0,dimple_row3_cut18_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut19_distance,dimple_row3_cut19_depth])rotate([0,0,dimple_row3_cut19_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut20_distance,dimple_row3_cut20_depth])rotate([0,0,dimple_row3_cut20_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut21_distance,dimple_row3_cut21_depth])rotate([0,0,dimple_row3_cut21_angle])dimple_row3_cut();
            translate([0,dimple_row3_cut22_distance,dimple_row3_cut22_depth])rotate([0,0,dimple_row3_cut22_angle])dimple_row3_cut();

        }//END OF IF row3 LINKED "NO"

        if (dimple_row3_linked == "YES"&&dimple_row3_cut_to_use=="laser_cut")
        {
        if (dimple_row3_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut01_distance,dimple_row3_cut01_depth])rotate([0,0,dimple_row3_cut01_angle])dimple_row3_cut();

                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut01_distance,dimple_row3_cut01_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut01_distance,dimple_row3_cut01_depth])rotate([0,0,dimple_row3_cut01_angle])dimple_row3_cut();

                //CUT 02
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut02_distance,dimple_row3_cut02_depth])rotate([0,0,dimple_row3_cut02_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut02_distance,dimple_row3_cut02_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut02_distance,dimple_row3_cut02_depth])rotate([0,0,dimple_row3_cut02_angle])dimple_row3_cut();

                //CUT 03
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut03_distance,dimple_row3_cut03_depth])rotate([0,0,dimple_row3_cut03_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut03_distance,dimple_row3_cut03_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut03_distance,dimple_row3_cut03_depth])rotate([0,0,dimple_row3_cut03_angle])dimple_row3_cut();

                //CUT 04
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut04_distance,dimple_row3_cut04_depth])rotate([0,0,dimple_row3_cut04_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut04_distance,dimple_row3_cut04_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut04_distance,dimple_row3_cut04_depth])rotate([0,0,dimple_row3_cut04_angle])dimple_row3_cut();

                //CUT 05
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut05_distance,dimple_row3_cut05_depth])rotate([0,0,dimple_row3_cut05_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut05_distance,dimple_row3_cut05_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut05_distance,dimple_row3_cut05_depth])rotate([0,0,dimple_row3_cut05_angle])dimple_row3_cut();

                //CUT 06
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut06_distance,dimple_row3_cut06_depth])rotate([0,0,dimple_row3_cut06_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut06_distance,dimple_row3_cut06_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut06_distance,dimple_row3_cut06_depth])rotate([0,0,dimple_row3_cut06_angle])dimple_row3_cut();

                //CUT 07
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut07_distance,dimple_row3_cut07_depth])rotate([0,0,dimple_row3_cut07_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut07_distance,dimple_row3_cut07_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut07_distance,dimple_row3_cut07_depth])rotate([0,0,dimple_row3_cut07_angle])dimple_row3_cut();

                //CUT 08
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut08_distance,dimple_row3_cut08_depth])rotate([0,0,dimple_row3_cut08_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut08_distance,dimple_row3_cut08_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut08_distance,dimple_row3_cut08_depth])rotate([0,0,dimple_row3_cut08_angle])dimple_row3_cut();

                //CUT 09
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut09_distance,dimple_row3_cut09_depth])rotate([0,0,dimple_row3_cut09_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut09_distance,dimple_row3_cut09_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut09_distance,dimple_row3_cut09_depth])rotate([0,0,dimple_row3_cut09_angle])dimple_row3_cut();

                //CUT 10
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut10_distance,dimple_row3_cut10_depth])rotate([0,0,dimple_row3_cut10_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut10_distance,dimple_row3_cut10_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut10_distance,dimple_row3_cut10_depth])rotate([0,0,dimple_row3_cut10_angle])dimple_row3_cut();

                //CUT 11
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut11_distance,dimple_row3_cut11_depth])rotate([0,0,dimple_row3_cut11_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut11_distance,dimple_row3_cut11_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut11_distance,dimple_row3_cut11_depth])rotate([0,0,dimple_row3_cut11_angle])dimple_row3_cut();

                //CUT 12
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut12_distance,dimple_row3_cut12_depth])rotate([0,0,dimple_row3_cut12_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut12_distance,dimple_row3_cut12_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut12_distance,dimple_row3_cut12_depth])rotate([0,0,dimple_row3_cut12_angle])dimple_row3_cut();

                //CUT 13
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut13_distance,dimple_row3_cut13_depth])rotate([0,0,dimple_row3_cut13_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut13_distance,dimple_row3_cut13_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut13_distance,dimple_row3_cut13_depth])rotate([0,0,dimple_row3_cut13_angle])dimple_row3_cut();

                //CUT 14
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut14_distance,dimple_row3_cut14_depth])rotate([0,0,dimple_row3_cut14_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut14_distance,dimple_row3_cut14_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut14_distance,dimple_row3_cut14_depth])rotate([0,0,dimple_row3_cut14_angle])dimple_row3_cut();

                //CUT 15
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut15_distance,dimple_row3_cut15_depth])rotate([0,0,dimple_row3_cut15_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut15_distance,dimple_row3_cut15_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut15_distance,dimple_row3_cut15_depth])rotate([0,0,dimple_row3_cut15_angle])dimple_row3_cut();

                //CUT 16
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut16_distance,dimple_row3_cut16_depth])rotate([0,0,dimple_row3_cut16_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut16_distance,dimple_row3_cut16_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut16_distance,dimple_row3_cut16_depth])rotate([0,0,dimple_row3_cut16_angle])dimple_row3_cut();

                //CUT 17
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut17_distance,dimple_row3_cut17_depth])rotate([0,0,dimple_row3_cut17_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut17_distance,dimple_row3_cut17_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut17_distance,dimple_row3_cut17_depth])rotate([0,0,dimple_row3_cut17_angle])dimple_row3_cut();

                //CUT 18
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut18_distance,dimple_row3_cut18_depth])rotate([0,0,dimple_row3_cut18_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut18_distance,dimple_row3_cut18_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut18_distance,dimple_row3_cut18_depth])rotate([0,0,dimple_row3_cut18_angle])dimple_row3_cut();

                //CUT 19
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut19_distance,dimple_row3_cut19_depth])rotate([0,0,dimple_row3_cut19_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut19_distance,dimple_row3_cut19_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut19_distance,dimple_row3_cut19_depth])rotate([0,0,dimple_row3_cut19_angle])dimple_row3_cut();

                //CUT 20
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut20_distance,dimple_row3_cut20_depth])rotate([0,0,dimple_row3_cut20_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut20_distance,dimple_row3_cut20_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut20_distance,dimple_row3_cut20_depth])rotate([0,0,dimple_row3_cut20_angle])dimple_row3_cut();

                //CUT 21
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut21_distance,dimple_row3_cut21_depth])rotate([0,0,dimple_row3_cut21_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut21_distance,dimple_row3_cut21_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut21_distance,dimple_row3_cut21_depth])rotate([0,0,dimple_row3_cut21_angle])dimple_row3_cut();

                //CUT 22
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut22_distance,dimple_row3_cut22_depth])rotate([0,0,dimple_row3_cut22_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut22_distance,dimple_row3_cut22_depth])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut22_distance,dimple_row3_cut22_depth])rotate([0,0,dimple_row3_cut22_angle])dimple_row3_cut();
        }

        if (dimple_row3_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut01_distance,dimple_row3_cut01_depth])rotate([0,0,dimple_row3_cut01_angle])dimple_row3_cut();

                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut01_distance,dimple_row3_cut01_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut01_distance,dimple_row3_cut01_depth])rotate([0,0,dimple_row3_cut01_angle])dimple_row3_cut();

                //CUT 02
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut02_distance,dimple_row3_cut02_depth])rotate([0,0,dimple_row3_cut02_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut02_distance,dimple_row3_cut02_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut02_distance,dimple_row3_cut02_depth])rotate([0,0,dimple_row3_cut02_angle])dimple_row3_cut();

                //CUT 03
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut03_distance,dimple_row3_cut03_depth])rotate([0,0,dimple_row3_cut03_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut03_distance,dimple_row3_cut03_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut03_distance,dimple_row3_cut03_depth])rotate([0,0,dimple_row3_cut03_angle])dimple_row3_cut();

                //CUT 04
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut04_distance,dimple_row3_cut04_depth])rotate([0,0,dimple_row3_cut04_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut04_distance,dimple_row3_cut04_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut04_distance,dimple_row3_cut04_depth])rotate([0,0,dimple_row3_cut04_angle])dimple_row3_cut();

                //CUT 05
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut05_distance,dimple_row3_cut05_depth])rotate([0,0,dimple_row3_cut05_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut05_distance,dimple_row3_cut05_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut05_distance,dimple_row3_cut05_depth])rotate([0,0,dimple_row3_cut05_angle])dimple_row3_cut();

                //CUT 06
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut06_distance,dimple_row3_cut06_depth])rotate([0,0,dimple_row3_cut06_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut06_distance,dimple_row3_cut06_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut06_distance,dimple_row3_cut06_depth])rotate([0,0,dimple_row3_cut06_angle])dimple_row3_cut();

                //CUT 07
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut07_distance,dimple_row3_cut07_depth])rotate([0,0,dimple_row3_cut07_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut07_distance,dimple_row3_cut07_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut07_distance,dimple_row3_cut07_depth])rotate([0,0,dimple_row3_cut07_angle])dimple_row3_cut();

                //CUT 08
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut08_distance,dimple_row3_cut08_depth])rotate([0,0,dimple_row3_cut08_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut08_distance,dimple_row3_cut08_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut08_distance,dimple_row3_cut08_depth])rotate([0,0,dimple_row3_cut08_angle])dimple_row3_cut();

                //CUT 09
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut09_distance,dimple_row3_cut09_depth])rotate([0,0,dimple_row3_cut09_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut09_distance,dimple_row3_cut09_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut09_distance,dimple_row3_cut09_depth])rotate([0,0,dimple_row3_cut09_angle])dimple_row3_cut();

                //CUT 10
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut10_distance,dimple_row3_cut10_depth])rotate([0,0,dimple_row3_cut10_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut10_distance,dimple_row3_cut10_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut10_distance,dimple_row3_cut10_depth])rotate([0,0,dimple_row3_cut10_angle])dimple_row3_cut();

                //CUT 11
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut11_distance,dimple_row3_cut11_depth])rotate([0,0,dimple_row3_cut11_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut11_distance,dimple_row3_cut11_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut11_distance,dimple_row3_cut11_depth])rotate([0,0,dimple_row3_cut11_angle])dimple_row3_cut();

                //CUT 12
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut12_distance,dimple_row3_cut12_depth])rotate([0,0,dimple_row3_cut12_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut12_distance,dimple_row3_cut12_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut12_distance,dimple_row3_cut12_depth])rotate([0,0,dimple_row3_cut12_angle])dimple_row3_cut();

                //CUT 13
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut13_distance,dimple_row3_cut13_depth])rotate([0,0,dimple_row3_cut13_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut13_distance,dimple_row3_cut13_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut13_distance,dimple_row3_cut13_depth])rotate([0,0,dimple_row3_cut13_angle])dimple_row3_cut();

                //CUT 14
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut14_distance,dimple_row3_cut14_depth])rotate([0,0,dimple_row3_cut14_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut14_distance,dimple_row3_cut14_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut14_distance,dimple_row3_cut14_depth])rotate([0,0,dimple_row3_cut14_angle])dimple_row3_cut();

                //CUT 15
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut15_distance,dimple_row3_cut15_depth])rotate([0,0,dimple_row3_cut15_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut15_distance,dimple_row3_cut15_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut15_distance,dimple_row3_cut15_depth])rotate([0,0,dimple_row3_cut15_angle])dimple_row3_cut();

                //CUT 16
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut16_distance,dimple_row3_cut16_depth])rotate([0,0,dimple_row3_cut16_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut16_distance,dimple_row3_cut16_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut16_distance,dimple_row3_cut16_depth])rotate([0,0,dimple_row3_cut16_angle])dimple_row3_cut();

                //CUT 17
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut17_distance,dimple_row3_cut17_depth])rotate([0,0,dimple_row3_cut17_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut17_distance,dimple_row3_cut17_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut17_distance,dimple_row3_cut17_depth])rotate([0,0,dimple_row3_cut17_angle])dimple_row3_cut();

                //CUT 18
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut18_distance,dimple_row3_cut18_depth])rotate([0,0,dimple_row3_cut18_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut18_distance,dimple_row3_cut18_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut18_distance,dimple_row3_cut18_depth])rotate([0,0,dimple_row3_cut18_angle])dimple_row3_cut();

                //CUT 19
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut19_distance,dimple_row3_cut19_depth])rotate([0,0,dimple_row3_cut19_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut19_distance,dimple_row3_cut19_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut19_distance,dimple_row3_cut19_depth])rotate([0,0,dimple_row3_cut19_angle])dimple_row3_cut();

                //CUT 20
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut20_distance,dimple_row3_cut20_depth])rotate([0,0,dimple_row3_cut20_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut20_distance,dimple_row3_cut20_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut20_distance,dimple_row3_cut20_depth])rotate([0,0,dimple_row3_cut20_angle])dimple_row3_cut();

                //CUT 21
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut21_distance,dimple_row3_cut21_depth])rotate([0,0,dimple_row3_cut21_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut21_distance,dimple_row3_cut21_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut21_distance,dimple_row3_cut21_depth])rotate([0,0,dimple_row3_cut21_angle])dimple_row3_cut();

                //CUT 22
                translate([0,-dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut22_distance,dimple_row3_cut22_depth])rotate([0,0,dimple_row3_cut22_angle])dimple_row3_cut();
                }
                translate([0,-dimple_row3_link_root_addition/2+dimple_row3_cut22_distance,dimple_row3_cut22_depth-dimple_row3_laser_mill_diameter/2])
                cube([qt_dimple_row3_laser_mill_height_qt,dimple_row3_link_root_addition,dimple_row3_laser_mill_diameter]);

                translate([0,dimple_row3_link_root_addition/2,0])
                translate([0,dimple_row3_cut22_distance,dimple_row3_cut22_depth])rotate([0,0,dimple_row3_cut22_angle])dimple_row3_cut();
        }

}//END OF IF row3 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row3






}// END OF MODULE row3_complete


//

module dimple_row4_complete(
    dimple_row4_number_of_pins = dimple_row4_number_of_pins,
    dimple_row4_offset_on_x = dimple_row4_offset_on_x,
    dimple_row4_offset_on_z = dimple_row4_offset_on_z,
    dimple_row4_angle_on_y = dimple_row4_angle_on_y,
    dimple_row4_mirror = dimple_row4_mirror,
    dimple_row4_linked = dimple_row4_linked,
    dimple_row4_link_root_addition = dimple_row4_link_root_addition,
    dimple_row4_shoulder_distance = dimple_row4_shoulder_distance,
    dimple_row4_interpin_space = dimple_row4_interpin_space)
{
    mirror(dimple_row4_mirror)
    translate([0,0,dimple_row4_offset_on_z])
    translate([dimple_row4_offset_on_x,0,0])
    rotate([0,dimple_row4_angle_on_y,0])
    {

        if (dimple_row4_linked == "NO"||dimple_row4_cut_to_use=="prism_cut"||dimple_row4_cut_to_use=="cone_cut"||dimple_row4_cut_to_use=="stl_mill")
        {
            translate([0,dimple_row4_cut01_distance,dimple_row4_cut01_depth])rotate([0,0,dimple_row4_cut01_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut02_distance,dimple_row4_cut02_depth])rotate([0,0,dimple_row4_cut02_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut03_distance,dimple_row4_cut03_depth])rotate([0,0,dimple_row4_cut03_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut04_distance,dimple_row4_cut04_depth])rotate([0,0,dimple_row4_cut04_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut05_distance,dimple_row4_cut05_depth])rotate([0,0,dimple_row4_cut05_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut06_distance,dimple_row4_cut06_depth])rotate([0,0,dimple_row4_cut06_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut07_distance,dimple_row4_cut07_depth])rotate([0,0,dimple_row4_cut07_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut08_distance,dimple_row4_cut08_depth])rotate([0,0,dimple_row4_cut08_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut09_distance,dimple_row4_cut09_depth])rotate([0,0,dimple_row4_cut09_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut10_distance,dimple_row4_cut10_depth])rotate([0,0,dimple_row4_cut10_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut11_distance,dimple_row4_cut11_depth])rotate([0,0,dimple_row4_cut11_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut12_distance,dimple_row4_cut12_depth])rotate([0,0,dimple_row4_cut12_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut13_distance,dimple_row4_cut13_depth])rotate([0,0,dimple_row4_cut13_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut14_distance,dimple_row4_cut14_depth])rotate([0,0,dimple_row4_cut14_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut15_distance,dimple_row4_cut15_depth])rotate([0,0,dimple_row4_cut15_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut16_distance,dimple_row4_cut16_depth])rotate([0,0,dimple_row4_cut16_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut17_distance,dimple_row4_cut17_depth])rotate([0,0,dimple_row4_cut17_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut18_distance,dimple_row4_cut18_depth])rotate([0,0,dimple_row4_cut18_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut19_distance,dimple_row4_cut19_depth])rotate([0,0,dimple_row4_cut19_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut20_distance,dimple_row4_cut20_depth])rotate([0,0,dimple_row4_cut20_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut21_distance,dimple_row4_cut21_depth])rotate([0,0,dimple_row4_cut21_angle])dimple_row4_cut();
            translate([0,dimple_row4_cut22_distance,dimple_row4_cut22_depth])rotate([0,0,dimple_row4_cut22_angle])dimple_row4_cut();

        }//END OF IF row4 LINKED "NO"

        if (dimple_row4_linked == "YES"&&dimple_row1_cut_to_use=="laser_cut")
        {
        if (dimple_row4_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut01_distance,dimple_row4_cut01_depth])rotate([0,0,dimple_row4_cut01_angle])dimple_row4_cut();

                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut01_distance,dimple_row4_cut01_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut01_distance,dimple_row4_cut01_depth])rotate([0,0,dimple_row4_cut01_angle])dimple_row4_cut();

                //CUT 02
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut02_distance,dimple_row4_cut02_depth])rotate([0,0,dimple_row4_cut02_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut02_distance,dimple_row4_cut02_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut02_distance,dimple_row4_cut02_depth])rotate([0,0,dimple_row4_cut02_angle])dimple_row4_cut();

                //CUT 03
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut03_distance,dimple_row4_cut03_depth])rotate([0,0,dimple_row4_cut03_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut03_distance,dimple_row4_cut03_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut03_distance,dimple_row4_cut03_depth])rotate([0,0,dimple_row4_cut03_angle])dimple_row4_cut();

                //CUT 04
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut04_distance,dimple_row4_cut04_depth])rotate([0,0,dimple_row4_cut04_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut04_distance,dimple_row4_cut04_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut04_distance,dimple_row4_cut04_depth])rotate([0,0,dimple_row4_cut04_angle])dimple_row4_cut();

                //CUT 05
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut05_distance,dimple_row4_cut05_depth])rotate([0,0,dimple_row4_cut05_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut05_distance,dimple_row4_cut05_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut05_distance,dimple_row4_cut05_depth])rotate([0,0,dimple_row4_cut05_angle])dimple_row4_cut();

                //CUT 06
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut06_distance,dimple_row4_cut06_depth])rotate([0,0,dimple_row4_cut06_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut06_distance,dimple_row4_cut06_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut06_distance,dimple_row4_cut06_depth])rotate([0,0,dimple_row4_cut06_angle])dimple_row4_cut();

                //CUT 07
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut07_distance,dimple_row4_cut07_depth])rotate([0,0,dimple_row4_cut07_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut07_distance,dimple_row4_cut07_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut07_distance,dimple_row4_cut07_depth])rotate([0,0,dimple_row4_cut07_angle])dimple_row4_cut();

                //CUT 08
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut08_distance,dimple_row4_cut08_depth])rotate([0,0,dimple_row4_cut08_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut08_distance,dimple_row4_cut08_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut08_distance,dimple_row4_cut08_depth])rotate([0,0,dimple_row4_cut08_angle])dimple_row4_cut();

                //CUT 09
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut09_distance,dimple_row4_cut09_depth])rotate([0,0,dimple_row4_cut09_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut09_distance,dimple_row4_cut09_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut09_distance,dimple_row4_cut09_depth])rotate([0,0,dimple_row4_cut09_angle])dimple_row4_cut();

                //CUT 10
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut10_distance,dimple_row4_cut10_depth])rotate([0,0,dimple_row4_cut10_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut10_distance,dimple_row4_cut10_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut10_distance,dimple_row4_cut10_depth])rotate([0,0,dimple_row4_cut10_angle])dimple_row4_cut();

                //CUT 11
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut11_distance,dimple_row4_cut11_depth])rotate([0,0,dimple_row4_cut11_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut11_distance,dimple_row4_cut11_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut11_distance,dimple_row4_cut11_depth])rotate([0,0,dimple_row4_cut11_angle])dimple_row4_cut();

                //CUT 12
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut12_distance,dimple_row4_cut12_depth])rotate([0,0,dimple_row4_cut12_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut12_distance,dimple_row4_cut12_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut12_distance,dimple_row4_cut12_depth])rotate([0,0,dimple_row4_cut12_angle])dimple_row4_cut();

                //CUT 13
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut13_distance,dimple_row4_cut13_depth])rotate([0,0,dimple_row4_cut13_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut13_distance,dimple_row4_cut13_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut13_distance,dimple_row4_cut13_depth])rotate([0,0,dimple_row4_cut13_angle])dimple_row4_cut();

                //CUT 14
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut14_distance,dimple_row4_cut14_depth])rotate([0,0,dimple_row4_cut14_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut14_distance,dimple_row4_cut14_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut14_distance,dimple_row4_cut14_depth])rotate([0,0,dimple_row4_cut14_angle])dimple_row4_cut();

                //CUT 15
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut15_distance,dimple_row4_cut15_depth])rotate([0,0,dimple_row4_cut15_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut15_distance,dimple_row4_cut15_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut15_distance,dimple_row4_cut15_depth])rotate([0,0,dimple_row4_cut15_angle])dimple_row4_cut();

                //CUT 16
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut16_distance,dimple_row4_cut16_depth])rotate([0,0,dimple_row4_cut16_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut16_distance,dimple_row4_cut16_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut16_distance,dimple_row4_cut16_depth])rotate([0,0,dimple_row4_cut16_angle])dimple_row4_cut();

                //CUT 17
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut17_distance,dimple_row4_cut17_depth])rotate([0,0,dimple_row4_cut17_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut17_distance,dimple_row4_cut17_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut17_distance,dimple_row4_cut17_depth])rotate([0,0,dimple_row4_cut17_angle])dimple_row4_cut();

                //CUT 18
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut18_distance,dimple_row4_cut18_depth])rotate([0,0,dimple_row4_cut18_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut18_distance,dimple_row4_cut18_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut18_distance,dimple_row4_cut18_depth])rotate([0,0,dimple_row4_cut18_angle])dimple_row4_cut();

                //CUT 19
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut19_distance,dimple_row4_cut19_depth])rotate([0,0,dimple_row4_cut19_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut19_distance,dimple_row4_cut19_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut19_distance,dimple_row4_cut19_depth])rotate([0,0,dimple_row4_cut19_angle])dimple_row4_cut();

                //CUT 20
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut20_distance,dimple_row4_cut20_depth])rotate([0,0,dimple_row4_cut20_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut20_distance,dimple_row4_cut20_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut20_distance,dimple_row4_cut20_depth])rotate([0,0,dimple_row4_cut20_angle])dimple_row4_cut();

                //CUT 21
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut21_distance,dimple_row4_cut21_depth])rotate([0,0,dimple_row4_cut21_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut21_distance,dimple_row4_cut21_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut21_distance,dimple_row4_cut21_depth])rotate([0,0,dimple_row4_cut21_angle])dimple_row4_cut();

                //CUT 22
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut22_distance,dimple_row4_cut22_depth])rotate([0,0,dimple_row4_cut22_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut22_distance,dimple_row4_cut22_depth])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut22_distance,dimple_row4_cut22_depth])rotate([0,0,dimple_row4_cut22_angle])dimple_row4_cut();
        }

        if (dimple_row4_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut01_distance,dimple_row4_cut01_depth])rotate([0,0,dimple_row4_cut01_angle])dimple_row4_cut();

                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut01_distance,dimple_row4_cut01_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut01_distance,dimple_row4_cut01_depth])rotate([0,0,dimple_row4_cut01_angle])dimple_row4_cut();

                //CUT 02
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut02_distance,dimple_row4_cut02_depth])rotate([0,0,dimple_row4_cut02_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut02_distance,dimple_row4_cut02_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut02_distance,dimple_row4_cut02_depth])rotate([0,0,dimple_row4_cut02_angle])dimple_row4_cut();

                //CUT 03
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut03_distance,dimple_row4_cut03_depth])rotate([0,0,dimple_row4_cut03_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut03_distance,dimple_row4_cut03_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut03_distance,dimple_row4_cut03_depth])rotate([0,0,dimple_row4_cut03_angle])dimple_row4_cut();

                //CUT 04
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut04_distance,dimple_row4_cut04_depth])rotate([0,0,dimple_row4_cut04_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut04_distance,dimple_row4_cut04_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut04_distance,dimple_row4_cut04_depth])rotate([0,0,dimple_row4_cut04_angle])dimple_row4_cut();

                //CUT 05
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut05_distance,dimple_row4_cut05_depth])rotate([0,0,dimple_row4_cut05_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut05_distance,dimple_row4_cut05_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut05_distance,dimple_row4_cut05_depth])rotate([0,0,dimple_row4_cut05_angle])dimple_row4_cut();

                //CUT 06
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut06_distance,dimple_row4_cut06_depth])rotate([0,0,dimple_row4_cut06_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut06_distance,dimple_row4_cut06_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut06_distance,dimple_row4_cut06_depth])rotate([0,0,dimple_row4_cut06_angle])dimple_row4_cut();

                //CUT 07
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut07_distance,dimple_row4_cut07_depth])rotate([0,0,dimple_row4_cut07_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut07_distance,dimple_row4_cut07_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut07_distance,dimple_row4_cut07_depth])rotate([0,0,dimple_row4_cut07_angle])dimple_row4_cut();

                //CUT 08
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut08_distance,dimple_row4_cut08_depth])rotate([0,0,dimple_row4_cut08_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut08_distance,dimple_row4_cut08_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut08_distance,dimple_row4_cut08_depth])rotate([0,0,dimple_row4_cut08_angle])dimple_row4_cut();

                //CUT 09
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut09_distance,dimple_row4_cut09_depth])rotate([0,0,dimple_row4_cut09_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut09_distance,dimple_row4_cut09_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut09_distance,dimple_row4_cut09_depth])rotate([0,0,dimple_row4_cut09_angle])dimple_row4_cut();

                //CUT 10
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut10_distance,dimple_row4_cut10_depth])rotate([0,0,dimple_row4_cut10_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut10_distance,dimple_row4_cut10_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut10_distance,dimple_row4_cut10_depth])rotate([0,0,dimple_row4_cut10_angle])dimple_row4_cut();

                //CUT 11
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut11_distance,dimple_row4_cut11_depth])rotate([0,0,dimple_row4_cut11_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut11_distance,dimple_row4_cut11_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut11_distance,dimple_row4_cut11_depth])rotate([0,0,dimple_row4_cut11_angle])dimple_row4_cut();

                //CUT 12
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut12_distance,dimple_row4_cut12_depth])rotate([0,0,dimple_row4_cut12_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut12_distance,dimple_row4_cut12_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut12_distance,dimple_row4_cut12_depth])rotate([0,0,dimple_row4_cut12_angle])dimple_row4_cut();

                //CUT 13
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut13_distance,dimple_row4_cut13_depth])rotate([0,0,dimple_row4_cut13_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut13_distance,dimple_row4_cut13_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut13_distance,dimple_row4_cut13_depth])rotate([0,0,dimple_row4_cut13_angle])dimple_row4_cut();

                //CUT 14
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut14_distance,dimple_row4_cut14_depth])rotate([0,0,dimple_row4_cut14_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut14_distance,dimple_row4_cut14_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut14_distance,dimple_row4_cut14_depth])rotate([0,0,dimple_row4_cut14_angle])dimple_row4_cut();

                //CUT 15
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut15_distance,dimple_row4_cut15_depth])rotate([0,0,dimple_row4_cut15_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut15_distance,dimple_row4_cut15_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut15_distance,dimple_row4_cut15_depth])rotate([0,0,dimple_row4_cut15_angle])dimple_row4_cut();

                //CUT 16
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut16_distance,dimple_row4_cut16_depth])rotate([0,0,dimple_row4_cut16_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut16_distance,dimple_row4_cut16_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut16_distance,dimple_row4_cut16_depth])rotate([0,0,dimple_row4_cut16_angle])dimple_row4_cut();

                //CUT 17
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut17_distance,dimple_row4_cut17_depth])rotate([0,0,dimple_row4_cut17_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut17_distance,dimple_row4_cut17_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut17_distance,dimple_row4_cut17_depth])rotate([0,0,dimple_row4_cut17_angle])dimple_row4_cut();

                //CUT 18
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut18_distance,dimple_row4_cut18_depth])rotate([0,0,dimple_row4_cut18_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut18_distance,dimple_row4_cut18_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut18_distance,dimple_row4_cut18_depth])rotate([0,0,dimple_row4_cut18_angle])dimple_row4_cut();

                //CUT 19
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut19_distance,dimple_row4_cut19_depth])rotate([0,0,dimple_row4_cut19_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut19_distance,dimple_row4_cut19_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut19_distance,dimple_row4_cut19_depth])rotate([0,0,dimple_row4_cut19_angle])dimple_row4_cut();

                //CUT 20
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut20_distance,dimple_row4_cut20_depth])rotate([0,0,dimple_row4_cut20_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut20_distance,dimple_row4_cut20_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut20_distance,dimple_row4_cut20_depth])rotate([0,0,dimple_row4_cut20_angle])dimple_row4_cut();

                //CUT 21
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut21_distance,dimple_row4_cut21_depth])rotate([0,0,dimple_row4_cut21_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut21_distance,dimple_row4_cut21_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut21_distance,dimple_row4_cut21_depth])rotate([0,0,dimple_row4_cut21_angle])dimple_row4_cut();

                //CUT 22
                translate([0,-dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut22_distance,dimple_row4_cut22_depth])rotate([0,0,dimple_row4_cut22_angle])dimple_row4_cut();
                }
                translate([0,-dimple_row4_link_root_addition/2+dimple_row4_cut22_distance,dimple_row4_cut22_depth-dimple_row4_laser_mill_diameter/2])
                cube([qt_dimple_row4_laser_mill_height_qt,dimple_row4_link_root_addition,dimple_row4_laser_mill_diameter]);

                translate([0,dimple_row4_link_root_addition/2,0])
                translate([0,dimple_row4_cut22_distance,dimple_row4_cut22_depth])rotate([0,0,dimple_row4_cut22_angle])dimple_row4_cut();
        }

}//END OF IF row4 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row4






}// END OF MODULE row4_complete
//


module dimple_row5_complete(
    dimple_row5_number_of_pins = dimple_row5_number_of_pins,
    dimple_row5_offset_on_x = dimple_row5_offset_on_x,
    dimple_row5_offset_on_z = dimple_row5_offset_on_z,
    dimple_row5_angle_on_y = dimple_row5_angle_on_y,
    dimple_row5_mirror = dimple_row5_mirror,
    dimple_row5_linked = dimple_row5_linked,
    dimple_row5_link_root_addition = dimple_row5_link_root_addition,
    dimple_row5_shoulder_distance = dimple_row5_shoulder_distance,
    dimple_row5_interpin_space = dimple_row5_interpin_space)
{
    mirror(dimple_row5_mirror)
    translate([0,0,dimple_row5_offset_on_z])
    translate([dimple_row5_offset_on_x,0,0])
    rotate([0,dimple_row5_angle_on_y,0])
    {

        if (dimple_row5_linked == "NO"||dimple_row5_cut_to_use=="prism_cut"||dimple_row5_cut_to_use=="cone_cut"||dimple_row5_cut_to_use=="stl_mill")
        {
            translate([0,dimple_row5_cut01_distance,dimple_row5_cut01_depth])rotate([0,0,dimple_row5_cut01_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut02_distance,dimple_row5_cut02_depth])rotate([0,0,dimple_row5_cut02_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut03_distance,dimple_row5_cut03_depth])rotate([0,0,dimple_row5_cut03_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut04_distance,dimple_row5_cut04_depth])rotate([0,0,dimple_row5_cut04_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut05_distance,dimple_row5_cut05_depth])rotate([0,0,dimple_row5_cut05_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut06_distance,dimple_row5_cut06_depth])rotate([0,0,dimple_row5_cut06_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut07_distance,dimple_row5_cut07_depth])rotate([0,0,dimple_row5_cut07_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut08_distance,dimple_row5_cut08_depth])rotate([0,0,dimple_row5_cut08_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut09_distance,dimple_row5_cut09_depth])rotate([0,0,dimple_row5_cut09_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut10_distance,dimple_row5_cut10_depth])rotate([0,0,dimple_row5_cut10_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut11_distance,dimple_row5_cut11_depth])rotate([0,0,dimple_row5_cut11_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut12_distance,dimple_row5_cut12_depth])rotate([0,0,dimple_row5_cut12_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut13_distance,dimple_row5_cut13_depth])rotate([0,0,dimple_row5_cut13_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut14_distance,dimple_row5_cut14_depth])rotate([0,0,dimple_row5_cut14_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut15_distance,dimple_row5_cut15_depth])rotate([0,0,dimple_row5_cut15_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut16_distance,dimple_row5_cut16_depth])rotate([0,0,dimple_row5_cut16_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut17_distance,dimple_row5_cut17_depth])rotate([0,0,dimple_row5_cut17_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut18_distance,dimple_row5_cut18_depth])rotate([0,0,dimple_row5_cut18_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut19_distance,dimple_row5_cut19_depth])rotate([0,0,dimple_row5_cut19_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut20_distance,dimple_row5_cut20_depth])rotate([0,0,dimple_row5_cut20_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut21_distance,dimple_row5_cut21_depth])rotate([0,0,dimple_row5_cut21_angle])dimple_row5_cut();
            translate([0,dimple_row5_cut22_distance,dimple_row5_cut22_depth])rotate([0,0,dimple_row5_cut22_angle])dimple_row5_cut();

        }//END OF IF row5 LINKED "NO"

        if (dimple_row5_linked == "YES"&&dimple_row5_cut_to_use=="laser_cut")
        {
        if (dimple_row5_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut01_distance,dimple_row5_cut01_depth])rotate([0,0,dimple_row5_cut01_angle])dimple_row5_cut();

                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut01_distance,dimple_row5_cut01_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut01_distance,dimple_row5_cut01_depth])rotate([0,0,dimple_row5_cut01_angle])dimple_row5_cut();

                //CUT 02
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut02_distance,dimple_row5_cut02_depth])rotate([0,0,dimple_row5_cut02_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut02_distance,dimple_row5_cut02_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut02_distance,dimple_row5_cut02_depth])rotate([0,0,dimple_row5_cut02_angle])dimple_row5_cut();

                //CUT 03
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut03_distance,dimple_row5_cut03_depth])rotate([0,0,dimple_row5_cut03_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut03_distance,dimple_row5_cut03_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut03_distance,dimple_row5_cut03_depth])rotate([0,0,dimple_row5_cut03_angle])dimple_row5_cut();

                //CUT 04
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut04_distance,dimple_row5_cut04_depth])rotate([0,0,dimple_row5_cut04_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut04_distance,dimple_row5_cut04_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut04_distance,dimple_row5_cut04_depth])rotate([0,0,dimple_row5_cut04_angle])dimple_row5_cut();

                //CUT 05
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut05_distance,dimple_row5_cut05_depth])rotate([0,0,dimple_row5_cut05_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut05_distance,dimple_row5_cut05_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut05_distance,dimple_row5_cut05_depth])rotate([0,0,dimple_row5_cut05_angle])dimple_row5_cut();

                //CUT 06
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut06_distance,dimple_row5_cut06_depth])rotate([0,0,dimple_row5_cut06_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut06_distance,dimple_row5_cut06_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut06_distance,dimple_row5_cut06_depth])rotate([0,0,dimple_row5_cut06_angle])dimple_row5_cut();

                //CUT 07
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut07_distance,dimple_row5_cut07_depth])rotate([0,0,dimple_row5_cut07_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut07_distance,dimple_row5_cut07_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut07_distance,dimple_row5_cut07_depth])rotate([0,0,dimple_row5_cut07_angle])dimple_row5_cut();

                //CUT 08
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut08_distance,dimple_row5_cut08_depth])rotate([0,0,dimple_row5_cut08_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut08_distance,dimple_row5_cut08_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut08_distance,dimple_row5_cut08_depth])rotate([0,0,dimple_row5_cut08_angle])dimple_row5_cut();

                //CUT 09
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut09_distance,dimple_row5_cut09_depth])rotate([0,0,dimple_row5_cut09_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut09_distance,dimple_row5_cut09_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut09_distance,dimple_row5_cut09_depth])rotate([0,0,dimple_row5_cut09_angle])dimple_row5_cut();

                //CUT 10
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut10_distance,dimple_row5_cut10_depth])rotate([0,0,dimple_row5_cut10_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut10_distance,dimple_row5_cut10_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut10_distance,dimple_row5_cut10_depth])rotate([0,0,dimple_row5_cut10_angle])dimple_row5_cut();

                //CUT 11
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut11_distance,dimple_row5_cut11_depth])rotate([0,0,dimple_row5_cut11_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut11_distance,dimple_row5_cut11_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut11_distance,dimple_row5_cut11_depth])rotate([0,0,dimple_row5_cut11_angle])dimple_row5_cut();

                //CUT 12
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut12_distance,dimple_row5_cut12_depth])rotate([0,0,dimple_row5_cut12_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut12_distance,dimple_row5_cut12_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut12_distance,dimple_row5_cut12_depth])rotate([0,0,dimple_row5_cut12_angle])dimple_row5_cut();

                //CUT 13
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut13_distance,dimple_row5_cut13_depth])rotate([0,0,dimple_row5_cut13_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut13_distance,dimple_row5_cut13_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut13_distance,dimple_row5_cut13_depth])rotate([0,0,dimple_row5_cut13_angle])dimple_row5_cut();

                //CUT 14
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut14_distance,dimple_row5_cut14_depth])rotate([0,0,dimple_row5_cut14_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut14_distance,dimple_row5_cut14_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut14_distance,dimple_row5_cut14_depth])rotate([0,0,dimple_row5_cut14_angle])dimple_row5_cut();

                //CUT 15
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut15_distance,dimple_row5_cut15_depth])rotate([0,0,dimple_row5_cut15_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut15_distance,dimple_row5_cut15_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut15_distance,dimple_row5_cut15_depth])rotate([0,0,dimple_row5_cut15_angle])dimple_row5_cut();

                //CUT 16
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut16_distance,dimple_row5_cut16_depth])rotate([0,0,dimple_row5_cut16_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut16_distance,dimple_row5_cut16_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut16_distance,dimple_row5_cut16_depth])rotate([0,0,dimple_row5_cut16_angle])dimple_row5_cut();

                //CUT 17
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut17_distance,dimple_row5_cut17_depth])rotate([0,0,dimple_row5_cut17_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut17_distance,dimple_row5_cut17_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut17_distance,dimple_row5_cut17_depth])rotate([0,0,dimple_row5_cut17_angle])dimple_row5_cut();

                //CUT 18
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut18_distance,dimple_row5_cut18_depth])rotate([0,0,dimple_row5_cut18_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut18_distance,dimple_row5_cut18_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut18_distance,dimple_row5_cut18_depth])rotate([0,0,dimple_row5_cut18_angle])dimple_row5_cut();

                //CUT 19
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut19_distance,dimple_row5_cut19_depth])rotate([0,0,dimple_row5_cut19_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut19_distance,dimple_row5_cut19_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut19_distance,dimple_row5_cut19_depth])rotate([0,0,dimple_row5_cut19_angle])dimple_row5_cut();

                //CUT 20
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut20_distance,dimple_row5_cut20_depth])rotate([0,0,dimple_row5_cut20_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut20_distance,dimple_row5_cut20_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut20_distance,dimple_row5_cut20_depth])rotate([0,0,dimple_row5_cut20_angle])dimple_row5_cut();

                //CUT 21
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut21_distance,dimple_row5_cut21_depth])rotate([0,0,dimple_row5_cut21_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut21_distance,dimple_row5_cut21_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut21_distance,dimple_row5_cut21_depth])rotate([0,0,dimple_row5_cut21_angle])dimple_row5_cut();

                //CUT 22
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut22_distance,dimple_row5_cut22_depth])rotate([0,0,dimple_row5_cut22_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut22_distance,dimple_row5_cut22_depth])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut22_distance,dimple_row5_cut22_depth])rotate([0,0,dimple_row5_cut22_angle])dimple_row5_cut();
        }

        if (dimple_row5_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut01_distance,dimple_row5_cut01_depth])rotate([0,0,dimple_row5_cut01_angle])dimple_row5_cut();

                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut01_distance,dimple_row5_cut01_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut01_distance,dimple_row5_cut01_depth])rotate([0,0,dimple_row5_cut01_angle])dimple_row5_cut();

                //CUT 02
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut02_distance,dimple_row5_cut02_depth])rotate([0,0,dimple_row5_cut02_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut02_distance,dimple_row5_cut02_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut02_distance,dimple_row5_cut02_depth])rotate([0,0,dimple_row5_cut02_angle])dimple_row5_cut();

                //CUT 03
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut03_distance,dimple_row5_cut03_depth])rotate([0,0,dimple_row5_cut03_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut03_distance,dimple_row5_cut03_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut03_distance,dimple_row5_cut03_depth])rotate([0,0,dimple_row5_cut03_angle])dimple_row5_cut();

                //CUT 04
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut04_distance,dimple_row5_cut04_depth])rotate([0,0,dimple_row5_cut04_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut04_distance,dimple_row5_cut04_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut04_distance,dimple_row5_cut04_depth])rotate([0,0,dimple_row5_cut04_angle])dimple_row5_cut();

                //CUT 05
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut05_distance,dimple_row5_cut05_depth])rotate([0,0,dimple_row5_cut05_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut05_distance,dimple_row5_cut05_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut05_distance,dimple_row5_cut05_depth])rotate([0,0,dimple_row5_cut05_angle])dimple_row5_cut();

                //CUT 06
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut06_distance,dimple_row5_cut06_depth])rotate([0,0,dimple_row5_cut06_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut06_distance,dimple_row5_cut06_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut06_distance,dimple_row5_cut06_depth])rotate([0,0,dimple_row5_cut06_angle])dimple_row5_cut();

                //CUT 07
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut07_distance,dimple_row5_cut07_depth])rotate([0,0,dimple_row5_cut07_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut07_distance,dimple_row5_cut07_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut07_distance,dimple_row5_cut07_depth])rotate([0,0,dimple_row5_cut07_angle])dimple_row5_cut();

                //CUT 08
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut08_distance,dimple_row5_cut08_depth])rotate([0,0,dimple_row5_cut08_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut08_distance,dimple_row5_cut08_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut08_distance,dimple_row5_cut08_depth])rotate([0,0,dimple_row5_cut08_angle])dimple_row5_cut();

                //CUT 09
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut09_distance,dimple_row5_cut09_depth])rotate([0,0,dimple_row5_cut09_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut09_distance,dimple_row5_cut09_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut09_distance,dimple_row5_cut09_depth])rotate([0,0,dimple_row5_cut09_angle])dimple_row5_cut();

                //CUT 10
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut10_distance,dimple_row5_cut10_depth])rotate([0,0,dimple_row5_cut10_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut10_distance,dimple_row5_cut10_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut10_distance,dimple_row5_cut10_depth])rotate([0,0,dimple_row5_cut10_angle])dimple_row5_cut();

                //CUT 11
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut11_distance,dimple_row5_cut11_depth])rotate([0,0,dimple_row5_cut11_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut11_distance,dimple_row5_cut11_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut11_distance,dimple_row5_cut11_depth])rotate([0,0,dimple_row5_cut11_angle])dimple_row5_cut();

                //CUT 12
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut12_distance,dimple_row5_cut12_depth])rotate([0,0,dimple_row5_cut12_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut12_distance,dimple_row5_cut12_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut12_distance,dimple_row5_cut12_depth])rotate([0,0,dimple_row5_cut12_angle])dimple_row5_cut();

                //CUT 13
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut13_distance,dimple_row5_cut13_depth])rotate([0,0,dimple_row5_cut13_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut13_distance,dimple_row5_cut13_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut13_distance,dimple_row5_cut13_depth])rotate([0,0,dimple_row5_cut13_angle])dimple_row5_cut();

                //CUT 14
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut14_distance,dimple_row5_cut14_depth])rotate([0,0,dimple_row5_cut14_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut14_distance,dimple_row5_cut14_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut14_distance,dimple_row5_cut14_depth])rotate([0,0,dimple_row5_cut14_angle])dimple_row5_cut();

                //CUT 15
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut15_distance,dimple_row5_cut15_depth])rotate([0,0,dimple_row5_cut15_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut15_distance,dimple_row5_cut15_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut15_distance,dimple_row5_cut15_depth])rotate([0,0,dimple_row5_cut15_angle])dimple_row5_cut();

                //CUT 16
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut16_distance,dimple_row5_cut16_depth])rotate([0,0,dimple_row5_cut16_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut16_distance,dimple_row5_cut16_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut16_distance,dimple_row5_cut16_depth])rotate([0,0,dimple_row5_cut16_angle])dimple_row5_cut();

                //CUT 17
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut17_distance,dimple_row5_cut17_depth])rotate([0,0,dimple_row5_cut17_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut17_distance,dimple_row5_cut17_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut17_distance,dimple_row5_cut17_depth])rotate([0,0,dimple_row5_cut17_angle])dimple_row5_cut();

                //CUT 18
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut18_distance,dimple_row5_cut18_depth])rotate([0,0,dimple_row5_cut18_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut18_distance,dimple_row5_cut18_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut18_distance,dimple_row5_cut18_depth])rotate([0,0,dimple_row5_cut18_angle])dimple_row5_cut();

                //CUT 19
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut19_distance,dimple_row5_cut19_depth])rotate([0,0,dimple_row5_cut19_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut19_distance,dimple_row5_cut19_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut19_distance,dimple_row5_cut19_depth])rotate([0,0,dimple_row5_cut19_angle])dimple_row5_cut();

                //CUT 20
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut20_distance,dimple_row5_cut20_depth])rotate([0,0,dimple_row5_cut20_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut20_distance,dimple_row5_cut20_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut20_distance,dimple_row5_cut20_depth])rotate([0,0,dimple_row5_cut20_angle])dimple_row5_cut();

                //CUT 21
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut21_distance,dimple_row5_cut21_depth])rotate([0,0,dimple_row5_cut21_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut21_distance,dimple_row5_cut21_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut21_distance,dimple_row5_cut21_depth])rotate([0,0,dimple_row5_cut21_angle])dimple_row5_cut();

                //CUT 22
                translate([0,-dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut22_distance,dimple_row5_cut22_depth])rotate([0,0,dimple_row5_cut22_angle])dimple_row5_cut();
                }
                translate([0,-dimple_row5_link_root_addition/2+dimple_row5_cut22_distance,dimple_row5_cut22_depth-dimple_row5_laser_mill_diameter/2])
                cube([qt_dimple_row5_laser_mill_height_qt,dimple_row5_link_root_addition,dimple_row5_laser_mill_diameter]);

                translate([0,dimple_row5_link_root_addition/2,0])
                translate([0,dimple_row5_cut22_distance,dimple_row5_cut22_depth])rotate([0,0,dimple_row5_cut22_angle])dimple_row5_cut();
        }

}//END OF IF row5 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row5






}// END OF MODULE row5_complete
//

module dimple_row6_complete(
    dimple_row6_number_of_pins = dimple_row6_number_of_pins,
    dimple_row6_offset_on_x = dimple_row6_offset_on_x,
    dimple_row6_offset_on_z = dimple_row6_offset_on_z,
    dimple_row6_angle_on_y = dimple_row6_angle_on_y,
    dimple_row6_mirror = dimple_row6_mirror,
    dimple_row6_linked = dimple_row6_linked,
    dimple_row6_link_root_addition = dimple_row6_link_root_addition,
    dimple_row6_shoulder_distance = dimple_row6_shoulder_distance,
    dimple_row6_interpin_space = dimple_row6_interpin_space)
{
    mirror(dimple_row6_mirror)
    translate([0,0,dimple_row6_offset_on_z])
    translate([dimple_row6_offset_on_x,0,0])
    rotate([0,dimple_row6_angle_on_y,0])
    {

        if (dimple_row6_linked == "NO"||dimple_row6_cut_to_use=="prism_cut"||dimple_row6_cut_to_use=="cone_cut"||dimple_row6_cut_to_use=="stl_mill")
        {
            translate([0,dimple_row6_cut01_distance,dimple_row6_cut01_depth])rotate([0,0,dimple_row6_cut01_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut02_distance,dimple_row6_cut02_depth])rotate([0,0,dimple_row6_cut02_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut03_distance,dimple_row6_cut03_depth])rotate([0,0,dimple_row6_cut03_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut04_distance,dimple_row6_cut04_depth])rotate([0,0,dimple_row6_cut04_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut05_distance,dimple_row6_cut05_depth])rotate([0,0,dimple_row6_cut05_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut06_distance,dimple_row6_cut06_depth])rotate([0,0,dimple_row6_cut06_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut07_distance,dimple_row6_cut07_depth])rotate([0,0,dimple_row6_cut07_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut08_distance,dimple_row6_cut08_depth])rotate([0,0,dimple_row6_cut08_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut09_distance,dimple_row6_cut09_depth])rotate([0,0,dimple_row6_cut09_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut10_distance,dimple_row6_cut10_depth])rotate([0,0,dimple_row6_cut10_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut11_distance,dimple_row6_cut11_depth])rotate([0,0,dimple_row6_cut11_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut12_distance,dimple_row6_cut12_depth])rotate([0,0,dimple_row6_cut12_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut13_distance,dimple_row6_cut13_depth])rotate([0,0,dimple_row6_cut13_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut14_distance,dimple_row6_cut14_depth])rotate([0,0,dimple_row6_cut14_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut15_distance,dimple_row6_cut15_depth])rotate([0,0,dimple_row6_cut15_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut16_distance,dimple_row6_cut16_depth])rotate([0,0,dimple_row6_cut16_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut17_distance,dimple_row6_cut17_depth])rotate([0,0,dimple_row6_cut17_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut18_distance,dimple_row6_cut18_depth])rotate([0,0,dimple_row6_cut18_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut19_distance,dimple_row6_cut19_depth])rotate([0,0,dimple_row6_cut19_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut20_distance,dimple_row6_cut20_depth])rotate([0,0,dimple_row6_cut20_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut21_distance,dimple_row6_cut21_depth])rotate([0,0,dimple_row6_cut21_angle])dimple_row6_cut();
            translate([0,dimple_row6_cut22_distance,dimple_row6_cut22_depth])rotate([0,0,dimple_row6_cut22_angle])dimple_row6_cut();

        }//END OF IF row6 LINKED "NO"

        if (dimple_row6_linked == "YES"&&dimple_row6_cut_to_use=="laser_cut")
        {
        if (dimple_row6_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut01_distance,dimple_row6_cut01_depth])rotate([0,0,dimple_row6_cut01_angle])dimple_row6_cut();

                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut01_distance,dimple_row6_cut01_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut01_distance,dimple_row6_cut01_depth])rotate([0,0,dimple_row6_cut01_angle])dimple_row6_cut();

                //CUT 02
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut02_distance,dimple_row6_cut02_depth])rotate([0,0,dimple_row6_cut02_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut02_distance,dimple_row6_cut02_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut02_distance,dimple_row6_cut02_depth])rotate([0,0,dimple_row6_cut02_angle])dimple_row6_cut();

                //CUT 03
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut03_distance,dimple_row6_cut03_depth])rotate([0,0,dimple_row6_cut03_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut03_distance,dimple_row6_cut03_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut03_distance,dimple_row6_cut03_depth])rotate([0,0,dimple_row6_cut03_angle])dimple_row6_cut();

                //CUT 04
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut04_distance,dimple_row6_cut04_depth])rotate([0,0,dimple_row6_cut04_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut04_distance,dimple_row6_cut04_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut04_distance,dimple_row6_cut04_depth])rotate([0,0,dimple_row6_cut04_angle])dimple_row6_cut();

                //CUT 05
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut05_distance,dimple_row6_cut05_depth])rotate([0,0,dimple_row6_cut05_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut05_distance,dimple_row6_cut05_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut05_distance,dimple_row6_cut05_depth])rotate([0,0,dimple_row6_cut05_angle])dimple_row6_cut();

                //CUT 06
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut06_distance,dimple_row6_cut06_depth])rotate([0,0,dimple_row6_cut06_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut06_distance,dimple_row6_cut06_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut06_distance,dimple_row6_cut06_depth])rotate([0,0,dimple_row6_cut06_angle])dimple_row6_cut();

                //CUT 07
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut07_distance,dimple_row6_cut07_depth])rotate([0,0,dimple_row6_cut07_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut07_distance,dimple_row6_cut07_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut07_distance,dimple_row6_cut07_depth])rotate([0,0,dimple_row6_cut07_angle])dimple_row6_cut();

                //CUT 08
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut08_distance,dimple_row6_cut08_depth])rotate([0,0,dimple_row6_cut08_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut08_distance,dimple_row6_cut08_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut08_distance,dimple_row6_cut08_depth])rotate([0,0,dimple_row6_cut08_angle])dimple_row6_cut();

                //CUT 09
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut09_distance,dimple_row6_cut09_depth])rotate([0,0,dimple_row6_cut09_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut09_distance,dimple_row6_cut09_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut09_distance,dimple_row6_cut09_depth])rotate([0,0,dimple_row6_cut09_angle])dimple_row6_cut();

                //CUT 10
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut10_distance,dimple_row6_cut10_depth])rotate([0,0,dimple_row6_cut10_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut10_distance,dimple_row6_cut10_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut10_distance,dimple_row6_cut10_depth])rotate([0,0,dimple_row6_cut10_angle])dimple_row6_cut();

                //CUT 11
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut11_distance,dimple_row6_cut11_depth])rotate([0,0,dimple_row6_cut11_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut11_distance,dimple_row6_cut11_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut11_distance,dimple_row6_cut11_depth])rotate([0,0,dimple_row6_cut11_angle])dimple_row6_cut();

                //CUT 12
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut12_distance,dimple_row6_cut12_depth])rotate([0,0,dimple_row6_cut12_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut12_distance,dimple_row6_cut12_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut12_distance,dimple_row6_cut12_depth])rotate([0,0,dimple_row6_cut12_angle])dimple_row6_cut();

                //CUT 13
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut13_distance,dimple_row6_cut13_depth])rotate([0,0,dimple_row6_cut13_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut13_distance,dimple_row6_cut13_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut13_distance,dimple_row6_cut13_depth])rotate([0,0,dimple_row6_cut13_angle])dimple_row6_cut();

                //CUT 14
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut14_distance,dimple_row6_cut14_depth])rotate([0,0,dimple_row6_cut14_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut14_distance,dimple_row6_cut14_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut14_distance,dimple_row6_cut14_depth])rotate([0,0,dimple_row6_cut14_angle])dimple_row6_cut();

                //CUT 15
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut15_distance,dimple_row6_cut15_depth])rotate([0,0,dimple_row6_cut15_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut15_distance,dimple_row6_cut15_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut15_distance,dimple_row6_cut15_depth])rotate([0,0,dimple_row6_cut15_angle])dimple_row6_cut();

                //CUT 16
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut16_distance,dimple_row6_cut16_depth])rotate([0,0,dimple_row6_cut16_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut16_distance,dimple_row6_cut16_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut16_distance,dimple_row6_cut16_depth])rotate([0,0,dimple_row6_cut16_angle])dimple_row6_cut();

                //CUT 17
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut17_distance,dimple_row6_cut17_depth])rotate([0,0,dimple_row6_cut17_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut17_distance,dimple_row6_cut17_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut17_distance,dimple_row6_cut17_depth])rotate([0,0,dimple_row6_cut17_angle])dimple_row6_cut();

                //CUT 18
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut18_distance,dimple_row6_cut18_depth])rotate([0,0,dimple_row6_cut18_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut18_distance,dimple_row6_cut18_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut18_distance,dimple_row6_cut18_depth])rotate([0,0,dimple_row6_cut18_angle])dimple_row6_cut();

                //CUT 19
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut19_distance,dimple_row6_cut19_depth])rotate([0,0,dimple_row6_cut19_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut19_distance,dimple_row6_cut19_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut19_distance,dimple_row6_cut19_depth])rotate([0,0,dimple_row6_cut19_angle])dimple_row6_cut();

                //CUT 20
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut20_distance,dimple_row6_cut20_depth])rotate([0,0,dimple_row6_cut20_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut20_distance,dimple_row6_cut20_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut20_distance,dimple_row6_cut20_depth])rotate([0,0,dimple_row6_cut20_angle])dimple_row6_cut();

                //CUT 21
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut21_distance,dimple_row6_cut21_depth])rotate([0,0,dimple_row6_cut21_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut21_distance,dimple_row6_cut21_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut21_distance,dimple_row6_cut21_depth])rotate([0,0,dimple_row6_cut21_angle])dimple_row6_cut();

                //CUT 22
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut22_distance,dimple_row6_cut22_depth])rotate([0,0,dimple_row6_cut22_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut22_distance,dimple_row6_cut22_depth])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut22_distance,dimple_row6_cut22_depth])rotate([0,0,dimple_row6_cut22_angle])dimple_row6_cut();
        }

        if (dimple_row6_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut01_distance,dimple_row6_cut01_depth])rotate([0,0,dimple_row6_cut01_angle])dimple_row6_cut();

                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut01_distance,dimple_row6_cut01_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut01_distance,dimple_row6_cut01_depth])rotate([0,0,dimple_row6_cut01_angle])dimple_row6_cut();

                //CUT 02
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut02_distance,dimple_row6_cut02_depth])rotate([0,0,dimple_row6_cut02_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut02_distance,dimple_row6_cut02_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut02_distance,dimple_row6_cut02_depth])rotate([0,0,dimple_row6_cut02_angle])dimple_row6_cut();

                //CUT 03
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut03_distance,dimple_row6_cut03_depth])rotate([0,0,dimple_row6_cut03_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut03_distance,dimple_row6_cut03_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut03_distance,dimple_row6_cut03_depth])rotate([0,0,dimple_row6_cut03_angle])dimple_row6_cut();

                //CUT 04
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut04_distance,dimple_row6_cut04_depth])rotate([0,0,dimple_row6_cut04_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut04_distance,dimple_row6_cut04_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut04_distance,dimple_row6_cut04_depth])rotate([0,0,dimple_row6_cut04_angle])dimple_row6_cut();

                //CUT 05
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut05_distance,dimple_row6_cut05_depth])rotate([0,0,dimple_row6_cut05_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut05_distance,dimple_row6_cut05_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut05_distance,dimple_row6_cut05_depth])rotate([0,0,dimple_row6_cut05_angle])dimple_row6_cut();

                //CUT 06
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut06_distance,dimple_row6_cut06_depth])rotate([0,0,dimple_row6_cut06_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut06_distance,dimple_row6_cut06_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut06_distance,dimple_row6_cut06_depth])rotate([0,0,dimple_row6_cut06_angle])dimple_row6_cut();

                //CUT 07
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut07_distance,dimple_row6_cut07_depth])rotate([0,0,dimple_row6_cut07_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut07_distance,dimple_row6_cut07_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut07_distance,dimple_row6_cut07_depth])rotate([0,0,dimple_row6_cut07_angle])dimple_row6_cut();

                //CUT 08
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut08_distance,dimple_row6_cut08_depth])rotate([0,0,dimple_row6_cut08_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut08_distance,dimple_row6_cut08_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut08_distance,dimple_row6_cut08_depth])rotate([0,0,dimple_row6_cut08_angle])dimple_row6_cut();

                //CUT 09
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut09_distance,dimple_row6_cut09_depth])rotate([0,0,dimple_row6_cut09_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut09_distance,dimple_row6_cut09_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut09_distance,dimple_row6_cut09_depth])rotate([0,0,dimple_row6_cut09_angle])dimple_row6_cut();

                //CUT 10
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut10_distance,dimple_row6_cut10_depth])rotate([0,0,dimple_row6_cut10_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut10_distance,dimple_row6_cut10_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut10_distance,dimple_row6_cut10_depth])rotate([0,0,dimple_row6_cut10_angle])dimple_row6_cut();

                //CUT 11
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut11_distance,dimple_row6_cut11_depth])rotate([0,0,dimple_row6_cut11_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut11_distance,dimple_row6_cut11_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut11_distance,dimple_row6_cut11_depth])rotate([0,0,dimple_row6_cut11_angle])dimple_row6_cut();

                //CUT 12
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut12_distance,dimple_row6_cut12_depth])rotate([0,0,dimple_row6_cut12_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut12_distance,dimple_row6_cut12_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut12_distance,dimple_row6_cut12_depth])rotate([0,0,dimple_row6_cut12_angle])dimple_row6_cut();

                //CUT 13
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut13_distance,dimple_row6_cut13_depth])rotate([0,0,dimple_row6_cut13_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut13_distance,dimple_row6_cut13_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut13_distance,dimple_row6_cut13_depth])rotate([0,0,dimple_row6_cut13_angle])dimple_row6_cut();

                //CUT 14
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut14_distance,dimple_row6_cut14_depth])rotate([0,0,dimple_row6_cut14_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut14_distance,dimple_row6_cut14_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut14_distance,dimple_row6_cut14_depth])rotate([0,0,dimple_row6_cut14_angle])dimple_row6_cut();

                //CUT 15
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut15_distance,dimple_row6_cut15_depth])rotate([0,0,dimple_row6_cut15_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut15_distance,dimple_row6_cut15_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut15_distance,dimple_row6_cut15_depth])rotate([0,0,dimple_row6_cut15_angle])dimple_row6_cut();

                //CUT 16
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut16_distance,dimple_row6_cut16_depth])rotate([0,0,dimple_row6_cut16_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut16_distance,dimple_row6_cut16_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut16_distance,dimple_row6_cut16_depth])rotate([0,0,dimple_row6_cut16_angle])dimple_row6_cut();

                //CUT 17
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut17_distance,dimple_row6_cut17_depth])rotate([0,0,dimple_row6_cut17_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut17_distance,dimple_row6_cut17_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut17_distance,dimple_row6_cut17_depth])rotate([0,0,dimple_row6_cut17_angle])dimple_row6_cut();

                //CUT 18
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut18_distance,dimple_row6_cut18_depth])rotate([0,0,dimple_row6_cut18_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut18_distance,dimple_row6_cut18_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut18_distance,dimple_row6_cut18_depth])rotate([0,0,dimple_row6_cut18_angle])dimple_row6_cut();

                //CUT 19
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut19_distance,dimple_row6_cut19_depth])rotate([0,0,dimple_row6_cut19_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut19_distance,dimple_row6_cut19_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut19_distance,dimple_row6_cut19_depth])rotate([0,0,dimple_row6_cut19_angle])dimple_row6_cut();

                //CUT 20
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut20_distance,dimple_row6_cut20_depth])rotate([0,0,dimple_row6_cut20_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut20_distance,dimple_row6_cut20_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut20_distance,dimple_row6_cut20_depth])rotate([0,0,dimple_row6_cut20_angle])dimple_row6_cut();

                //CUT 21
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut21_distance,dimple_row6_cut21_depth])rotate([0,0,dimple_row6_cut21_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut21_distance,dimple_row6_cut21_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut21_distance,dimple_row6_cut21_depth])rotate([0,0,dimple_row6_cut21_angle])dimple_row6_cut();

                //CUT 22
                translate([0,-dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut22_distance,dimple_row6_cut22_depth])rotate([0,0,dimple_row6_cut22_angle])dimple_row6_cut();
                }
                translate([0,-dimple_row6_link_root_addition/2+dimple_row6_cut22_distance,dimple_row6_cut22_depth-dimple_row6_laser_mill_diameter/2])
                cube([qt_dimple_row6_laser_mill_height_qt,dimple_row6_link_root_addition,dimple_row6_laser_mill_diameter]);

                translate([0,dimple_row6_link_root_addition/2,0])
                translate([0,dimple_row6_cut22_distance,dimple_row6_cut22_depth])rotate([0,0,dimple_row6_cut22_angle])dimple_row6_cut();
        }

}//END OF IF row6 LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF row6



}// END OF MODULE row6_complete
//


module dimple_sonic_complete(
    dimple_sonic_number_of_pins = dimple_sonic_number_of_pins,
    dimple_sonic_offset_on_x = dimple_sonic_offset_on_x,
    dimple_sonic_offset_on_z = dimple_sonic_offset_on_z,
    dimple_sonic_angle_on_y = dimple_sonic_angle_on_y,
    dimple_sonic_mirror = dimple_sonic_mirror,
    dimple_sonic_linked = dimple_sonic_linked,
    dimple_sonic_link_root_addition = dimple_sonic_link_root_addition,
    dimple_sonic_shoulder_distance = dimple_sonic_shoulder_distance,
    dimple_sonic_interpin_space = dimple_sonic_interpin_space)
{
    mirror(dimple_sonic_mirror)
    translate([0,0,dimple_sonic_offset_on_z])
    translate([dimple_sonic_offset_on_x,0,0])
    rotate([0,dimple_sonic_angle_on_y,0])
    {

        if (dimple_sonic_linked == "NO"||dimple_sonic_cut_to_use=="prism_cut"||dimple_sonic_cut_to_use=="cone_cut"||dimple_sonic_cut_to_use=="stl_mill")
        {
            translate([0,dimple_sonic_cut01_distance,dimple_sonic_cut01_depth])rotate([0,0,dimple_sonic_cut01_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut02_distance,dimple_sonic_cut02_depth])rotate([0,0,dimple_sonic_cut02_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut03_distance,dimple_sonic_cut03_depth])rotate([0,0,dimple_sonic_cut03_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut04_distance,dimple_sonic_cut04_depth])rotate([0,0,dimple_sonic_cut04_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut05_distance,dimple_sonic_cut05_depth])rotate([0,0,dimple_sonic_cut05_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut06_distance,dimple_sonic_cut06_depth])rotate([0,0,dimple_sonic_cut06_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut07_distance,dimple_sonic_cut07_depth])rotate([0,0,dimple_sonic_cut07_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut08_distance,dimple_sonic_cut08_depth])rotate([0,0,dimple_sonic_cut08_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut09_distance,dimple_sonic_cut09_depth])rotate([0,0,dimple_sonic_cut09_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut10_distance,dimple_sonic_cut10_depth])rotate([0,0,dimple_sonic_cut10_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut11_distance,dimple_sonic_cut11_depth])rotate([0,0,dimple_sonic_cut11_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut12_distance,dimple_sonic_cut12_depth])rotate([0,0,dimple_sonic_cut12_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut13_distance,dimple_sonic_cut13_depth])rotate([0,0,dimple_sonic_cut13_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut14_distance,dimple_sonic_cut14_depth])rotate([0,0,dimple_sonic_cut14_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut15_distance,dimple_sonic_cut15_depth])rotate([0,0,dimple_sonic_cut15_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut16_distance,dimple_sonic_cut16_depth])rotate([0,0,dimple_sonic_cut16_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut17_distance,dimple_sonic_cut17_depth])rotate([0,0,dimple_sonic_cut17_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut18_distance,dimple_sonic_cut18_depth])rotate([0,0,dimple_sonic_cut18_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut19_distance,dimple_sonic_cut19_depth])rotate([0,0,dimple_sonic_cut19_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut20_distance,dimple_sonic_cut20_depth])rotate([0,0,dimple_sonic_cut20_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut21_distance,dimple_sonic_cut21_depth])rotate([0,0,dimple_sonic_cut21_angle])dimple_sonic_cut();
            translate([0,dimple_sonic_cut22_distance,dimple_sonic_cut22_depth])rotate([0,0,dimple_sonic_cut22_angle])dimple_sonic_cut();

        }//END OF IF sonic LINKED "NO"

        if (dimple_sonic_linked == "YES"&&dimple_sonic_cut_to_use=="laser_cut")
        {
        if (dimple_sonic_laser_mill_center=="NO")
        {
                //CUT 01
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut01_distance,dimple_sonic_cut01_depth])rotate([0,0,dimple_sonic_cut01_angle])dimple_sonic_cut();

                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut01_distance,dimple_sonic_cut01_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut01_distance,dimple_sonic_cut01_depth])rotate([0,0,dimple_sonic_cut01_angle])dimple_sonic_cut();

                //CUT 02
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut02_distance,dimple_sonic_cut02_depth])rotate([0,0,dimple_sonic_cut02_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut02_distance,dimple_sonic_cut02_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut02_distance,dimple_sonic_cut02_depth])rotate([0,0,dimple_sonic_cut02_angle])dimple_sonic_cut();

                //CUT 03
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut03_distance,dimple_sonic_cut03_depth])rotate([0,0,dimple_sonic_cut03_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut03_distance,dimple_sonic_cut03_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut03_distance,dimple_sonic_cut03_depth])rotate([0,0,dimple_sonic_cut03_angle])dimple_sonic_cut();

                //CUT 04
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut04_distance,dimple_sonic_cut04_depth])rotate([0,0,dimple_sonic_cut04_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut04_distance,dimple_sonic_cut04_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut04_distance,dimple_sonic_cut04_depth])rotate([0,0,dimple_sonic_cut04_angle])dimple_sonic_cut();

                //CUT 05
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut05_distance,dimple_sonic_cut05_depth])rotate([0,0,dimple_sonic_cut05_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut05_distance,dimple_sonic_cut05_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut05_distance,dimple_sonic_cut05_depth])rotate([0,0,dimple_sonic_cut05_angle])dimple_sonic_cut();

                //CUT 06
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut06_distance,dimple_sonic_cut06_depth])rotate([0,0,dimple_sonic_cut06_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut06_distance,dimple_sonic_cut06_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut06_distance,dimple_sonic_cut06_depth])rotate([0,0,dimple_sonic_cut06_angle])dimple_sonic_cut();

                //CUT 07
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut07_distance,dimple_sonic_cut07_depth])rotate([0,0,dimple_sonic_cut07_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut07_distance,dimple_sonic_cut07_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut07_distance,dimple_sonic_cut07_depth])rotate([0,0,dimple_sonic_cut07_angle])dimple_sonic_cut();

                //CUT 08
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut08_distance,dimple_sonic_cut08_depth])rotate([0,0,dimple_sonic_cut08_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut08_distance,dimple_sonic_cut08_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut08_distance,dimple_sonic_cut08_depth])rotate([0,0,dimple_sonic_cut08_angle])dimple_sonic_cut();

                //CUT 09
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut09_distance,dimple_sonic_cut09_depth])rotate([0,0,dimple_sonic_cut09_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut09_distance,dimple_sonic_cut09_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut09_distance,dimple_sonic_cut09_depth])rotate([0,0,dimple_sonic_cut09_angle])dimple_sonic_cut();

                //CUT 10
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut10_distance,dimple_sonic_cut10_depth])rotate([0,0,dimple_sonic_cut10_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut10_distance,dimple_sonic_cut10_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut10_distance,dimple_sonic_cut10_depth])rotate([0,0,dimple_sonic_cut10_angle])dimple_sonic_cut();

                //CUT 11
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut11_distance,dimple_sonic_cut11_depth])rotate([0,0,dimple_sonic_cut11_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut11_distance,dimple_sonic_cut11_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut11_distance,dimple_sonic_cut11_depth])rotate([0,0,dimple_sonic_cut11_angle])dimple_sonic_cut();

                //CUT 12
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut12_distance,dimple_sonic_cut12_depth])rotate([0,0,dimple_sonic_cut12_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut12_distance,dimple_sonic_cut12_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut12_distance,dimple_sonic_cut12_depth])rotate([0,0,dimple_sonic_cut12_angle])dimple_sonic_cut();

                //CUT 13
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut13_distance,dimple_sonic_cut13_depth])rotate([0,0,dimple_sonic_cut13_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut13_distance,dimple_sonic_cut13_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut13_distance,dimple_sonic_cut13_depth])rotate([0,0,dimple_sonic_cut13_angle])dimple_sonic_cut();

                //CUT 14
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut14_distance,dimple_sonic_cut14_depth])rotate([0,0,dimple_sonic_cut14_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut14_distance,dimple_sonic_cut14_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut14_distance,dimple_sonic_cut14_depth])rotate([0,0,dimple_sonic_cut14_angle])dimple_sonic_cut();

                //CUT 15
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut15_distance,dimple_sonic_cut15_depth])rotate([0,0,dimple_sonic_cut15_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut15_distance,dimple_sonic_cut15_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut15_distance,dimple_sonic_cut15_depth])rotate([0,0,dimple_sonic_cut15_angle])dimple_sonic_cut();

                //CUT 16
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut16_distance,dimple_sonic_cut16_depth])rotate([0,0,dimple_sonic_cut16_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut16_distance,dimple_sonic_cut16_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut16_distance,dimple_sonic_cut16_depth])rotate([0,0,dimple_sonic_cut16_angle])dimple_sonic_cut();

                //CUT 17
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut17_distance,dimple_sonic_cut17_depth])rotate([0,0,dimple_sonic_cut17_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut17_distance,dimple_sonic_cut17_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut17_distance,dimple_sonic_cut17_depth])rotate([0,0,dimple_sonic_cut17_angle])dimple_sonic_cut();

                //CUT 18
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut18_distance,dimple_sonic_cut18_depth])rotate([0,0,dimple_sonic_cut18_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut18_distance,dimple_sonic_cut18_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut18_distance,dimple_sonic_cut18_depth])rotate([0,0,dimple_sonic_cut18_angle])dimple_sonic_cut();

                //CUT 19
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut19_distance,dimple_sonic_cut19_depth])rotate([0,0,dimple_sonic_cut19_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut19_distance,dimple_sonic_cut19_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut19_distance,dimple_sonic_cut19_depth])rotate([0,0,dimple_sonic_cut19_angle])dimple_sonic_cut();

                //CUT 20
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut20_distance,dimple_sonic_cut20_depth])rotate([0,0,dimple_sonic_cut20_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut20_distance,dimple_sonic_cut20_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut20_distance,dimple_sonic_cut20_depth])rotate([0,0,dimple_sonic_cut20_angle])dimple_sonic_cut();

                //CUT 21
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut21_distance,dimple_sonic_cut21_depth])rotate([0,0,dimple_sonic_cut21_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut21_distance,dimple_sonic_cut21_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut21_distance,dimple_sonic_cut21_depth])rotate([0,0,dimple_sonic_cut21_angle])dimple_sonic_cut();

                //CUT 22
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut22_distance,dimple_sonic_cut22_depth])rotate([0,0,dimple_sonic_cut22_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut22_distance,dimple_sonic_cut22_depth])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut22_distance,dimple_sonic_cut22_depth])rotate([0,0,dimple_sonic_cut22_angle])dimple_sonic_cut();
        }

        if (dimple_sonic_laser_mill_center=="YES")
        {
                //CUT 01
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut01_distance,dimple_sonic_cut01_depth])rotate([0,0,dimple_sonic_cut01_angle])dimple_sonic_cut();

                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut01_distance,dimple_sonic_cut01_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut01_distance,dimple_sonic_cut01_depth])rotate([0,0,dimple_sonic_cut01_angle])dimple_sonic_cut();

                //CUT 02
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut02_distance,dimple_sonic_cut02_depth])rotate([0,0,dimple_sonic_cut02_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut02_distance,dimple_sonic_cut02_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut02_distance,dimple_sonic_cut02_depth])rotate([0,0,dimple_sonic_cut02_angle])dimple_sonic_cut();

                //CUT 03
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut03_distance,dimple_sonic_cut03_depth])rotate([0,0,dimple_sonic_cut03_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut03_distance,dimple_sonic_cut03_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut03_distance,dimple_sonic_cut03_depth])rotate([0,0,dimple_sonic_cut03_angle])dimple_sonic_cut();

                //CUT 04
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut04_distance,dimple_sonic_cut04_depth])rotate([0,0,dimple_sonic_cut04_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut04_distance,dimple_sonic_cut04_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut04_distance,dimple_sonic_cut04_depth])rotate([0,0,dimple_sonic_cut04_angle])dimple_sonic_cut();

                //CUT 05
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut05_distance,dimple_sonic_cut05_depth])rotate([0,0,dimple_sonic_cut05_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut05_distance,dimple_sonic_cut05_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut05_distance,dimple_sonic_cut05_depth])rotate([0,0,dimple_sonic_cut05_angle])dimple_sonic_cut();

                //CUT 06
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut06_distance,dimple_sonic_cut06_depth])rotate([0,0,dimple_sonic_cut06_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut06_distance,dimple_sonic_cut06_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut06_distance,dimple_sonic_cut06_depth])rotate([0,0,dimple_sonic_cut06_angle])dimple_sonic_cut();

                //CUT 07
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut07_distance,dimple_sonic_cut07_depth])rotate([0,0,dimple_sonic_cut07_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut07_distance,dimple_sonic_cut07_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut07_distance,dimple_sonic_cut07_depth])rotate([0,0,dimple_sonic_cut07_angle])dimple_sonic_cut();

                //CUT 08
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut08_distance,dimple_sonic_cut08_depth])rotate([0,0,dimple_sonic_cut08_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut08_distance,dimple_sonic_cut08_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut08_distance,dimple_sonic_cut08_depth])rotate([0,0,dimple_sonic_cut08_angle])dimple_sonic_cut();

                //CUT 09
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut09_distance,dimple_sonic_cut09_depth])rotate([0,0,dimple_sonic_cut09_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut09_distance,dimple_sonic_cut09_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut09_distance,dimple_sonic_cut09_depth])rotate([0,0,dimple_sonic_cut09_angle])dimple_sonic_cut();

                //CUT 10
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut10_distance,dimple_sonic_cut10_depth])rotate([0,0,dimple_sonic_cut10_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut10_distance,dimple_sonic_cut10_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut10_distance,dimple_sonic_cut10_depth])rotate([0,0,dimple_sonic_cut10_angle])dimple_sonic_cut();

                //CUT 11
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut11_distance,dimple_sonic_cut11_depth])rotate([0,0,dimple_sonic_cut11_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut11_distance,dimple_sonic_cut11_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut11_distance,dimple_sonic_cut11_depth])rotate([0,0,dimple_sonic_cut11_angle])dimple_sonic_cut();

                //CUT 12
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut12_distance,dimple_sonic_cut12_depth])rotate([0,0,dimple_sonic_cut12_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut12_distance,dimple_sonic_cut12_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut12_distance,dimple_sonic_cut12_depth])rotate([0,0,dimple_sonic_cut12_angle])dimple_sonic_cut();

                //CUT 13
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut13_distance,dimple_sonic_cut13_depth])rotate([0,0,dimple_sonic_cut13_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut13_distance,dimple_sonic_cut13_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut13_distance,dimple_sonic_cut13_depth])rotate([0,0,dimple_sonic_cut13_angle])dimple_sonic_cut();

                //CUT 14
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut14_distance,dimple_sonic_cut14_depth])rotate([0,0,dimple_sonic_cut14_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut14_distance,dimple_sonic_cut14_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut14_distance,dimple_sonic_cut14_depth])rotate([0,0,dimple_sonic_cut14_angle])dimple_sonic_cut();

                //CUT 15
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut15_distance,dimple_sonic_cut15_depth])rotate([0,0,dimple_sonic_cut15_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut15_distance,dimple_sonic_cut15_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut15_distance,dimple_sonic_cut15_depth])rotate([0,0,dimple_sonic_cut15_angle])dimple_sonic_cut();

                //CUT 16
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut16_distance,dimple_sonic_cut16_depth])rotate([0,0,dimple_sonic_cut16_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut16_distance,dimple_sonic_cut16_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut16_distance,dimple_sonic_cut16_depth])rotate([0,0,dimple_sonic_cut16_angle])dimple_sonic_cut();

                //CUT 17
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut17_distance,dimple_sonic_cut17_depth])rotate([0,0,dimple_sonic_cut17_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut17_distance,dimple_sonic_cut17_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut17_distance,dimple_sonic_cut17_depth])rotate([0,0,dimple_sonic_cut17_angle])dimple_sonic_cut();

                //CUT 18
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut18_distance,dimple_sonic_cut18_depth])rotate([0,0,dimple_sonic_cut18_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut18_distance,dimple_sonic_cut18_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut18_distance,dimple_sonic_cut18_depth])rotate([0,0,dimple_sonic_cut18_angle])dimple_sonic_cut();

                //CUT 19
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut19_distance,dimple_sonic_cut19_depth])rotate([0,0,dimple_sonic_cut19_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut19_distance,dimple_sonic_cut19_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut19_distance,dimple_sonic_cut19_depth])rotate([0,0,dimple_sonic_cut19_angle])dimple_sonic_cut();

                //CUT 20
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut20_distance,dimple_sonic_cut20_depth])rotate([0,0,dimple_sonic_cut20_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut20_distance,dimple_sonic_cut20_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut20_distance,dimple_sonic_cut20_depth])rotate([0,0,dimple_sonic_cut20_angle])dimple_sonic_cut();

                //CUT 21
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut21_distance,dimple_sonic_cut21_depth])rotate([0,0,dimple_sonic_cut21_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut21_distance,dimple_sonic_cut21_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

        hull()
        {
                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut21_distance,dimple_sonic_cut21_depth])rotate([0,0,dimple_sonic_cut21_angle])dimple_sonic_cut();

                //CUT 22
                translate([0,-dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut22_distance,dimple_sonic_cut22_depth])rotate([0,0,dimple_sonic_cut22_angle])dimple_sonic_cut();
                }
                translate([0,-dimple_sonic_link_root_addition/2+dimple_sonic_cut22_distance,dimple_sonic_cut22_depth-dimple_sonic_laser_mill_diameter/2])
                cube([qt_dimple_sonic_laser_mill_height_qt,dimple_sonic_link_root_addition,dimple_sonic_laser_mill_diameter]);

                translate([0,dimple_sonic_link_root_addition/2,0])
                translate([0,dimple_sonic_cut22_distance,dimple_sonic_cut22_depth])rotate([0,0,dimple_sonic_cut22_angle])dimple_sonic_cut();
        }

}//END OF IF sonic LINKED "YES"

    }//END OF ROTATE Y, TRANSLATE X, MIRROR OF sonic

}// END OF MODULE sonic_complete

//DIMPLE SONIC INSERT CUTTING LEVEL 2
module dimple_sonic_insert_cut()
{
    translate([dimple_sonic_insert_offset_x,0,dimple_sonic_insert_offset_z])
    translate([0,0,dimple_thickness])
    cube([dimple_sonic_insert_probe_width, dimple_length*2+2*epsilon, dimple_thickness*2],center=true);

}
//END OF DIMPLE SONIC PROBE CUT
//
//END OF DIMPLE CUTTINGS


module round_pump_cut(  round_pump_number_of_pins = round_pump_number_of_pins,
                        round_pump_mill_diameter = round_pump_mill_diameter,
                        round_pump_mill_distance_frome_center = round_pump_mill_distance_frome_center)
{
    //CUT01
    rotate ([0,1-(360/round_pump_number_of_pins)*(1-1),0])
    translate([0,round_pump_cut01_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut01_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT02
    rotate ([0,1-(360/round_pump_number_of_pins)*(2-1),0])
    translate([0,round_pump_cut02_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut02_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT03
    rotate ([0,1-(360/round_pump_number_of_pins)*(3-1),0])
    translate([0,round_pump_cut03_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut03_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT04
    rotate ([0,1-(360/round_pump_number_of_pins)*(4-1),0])
    translate([0,round_pump_cut04_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut04_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT05
    rotate ([0,1-(360/round_pump_number_of_pins)*(5-1),0])
    translate([0,round_pump_cut05_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut05_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT06
    rotate ([0,1-(360/round_pump_number_of_pins)*(6-1),0])
    translate([0,round_pump_cut06_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut06_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT07
    rotate ([0,1-(360/round_pump_number_of_pins)*(7-1),0])
    translate([0,round_pump_cut07_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut07_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT08
    rotate ([0,1-(360/round_pump_number_of_pins)*(8-1),0])
    translate([0,round_pump_cut08_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut08_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT09
    rotate ([0,1-(360/round_pump_number_of_pins)*(9-1),0])
    translate([0,round_pump_cut09_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut09_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT10
    rotate ([0,1-(360/round_pump_number_of_pins)*(10-1),0])
    translate([0,round_pump_cut10_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut10_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT11
    rotate ([0,1-(360/round_pump_number_of_pins)*(11-1),0])
    translate([0,round_pump_cut11_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut11_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

    //CUT12
    rotate ([0,1-(360/round_pump_number_of_pins)*(12-1),0])
    translate([0,round_pump_cut12_depth_from_tip/2-epsilon,round_pump_mill_distance_frome_center+(round_pump_mill_diameter/2)])
    rotate ([90,0,0])
    cylinder(h = round_pump_cut12_depth_from_tip+epsilon, d=round_pump_mill_diameter, center = true);

}
//END OF MODULE PUMP CUT LEVEL 2

module lever_simple_cut_row1(   lever_simple_lock_row1_number_of_levers = 		lever_simple_lock_row1_number_of_levers,
                    lever_simple_lock_row1_blade_length = 			lever_simple_lock_row1_blade_length,
                    lever_simple_lock_row1_spaces = 				lever_simple_lock_row1_spaces,
                    lever_simple_lock_row1_thickness = 			lever_simple_lock_row1_thickness,
                    lever_simple_lock_row1_angle_on_y = 			lever_simple_lock_row1_angle_on_y)
{
    translate([0,0,-lever_simple_body_diameter/2])//Global translate on all cuts of lever simple to deal with the diameter of the body
    {
    translate([0,lever_simple_lock_row1_cut01_distance,lever_simple_lock_row1_cut01_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut01_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut02_distance,lever_simple_lock_row1_cut02_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut02_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut03_distance,lever_simple_lock_row1_cut03_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut03_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut04_distance,lever_simple_lock_row1_cut04_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut04_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut05_distance,lever_simple_lock_row1_cut05_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut05_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut06_distance,lever_simple_lock_row1_cut06_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut06_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut07_distance,lever_simple_lock_row1_cut07_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut07_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut08_distance,lever_simple_lock_row1_cut08_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut08_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut09_distance,lever_simple_lock_row1_cut09_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut09_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut10_distance,lever_simple_lock_row1_cut10_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut10_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut11_distance,lever_simple_lock_row1_cut11_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut11_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut12_distance,lever_simple_lock_row1_cut12_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut12_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut13_distance,lever_simple_lock_row1_cut13_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut13_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut14_distance,lever_simple_lock_row1_cut14_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut14_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut15_distance,lever_simple_lock_row1_cut15_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut15_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut16_distance,lever_simple_lock_row1_cut16_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut16_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut17_distance,lever_simple_lock_row1_cut17_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut17_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut18_distance,lever_simple_lock_row1_cut18_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut18_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut19_distance,lever_simple_lock_row1_cut19_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut19_thickness,lever_simple_cut_z], center=true);

    translate([0,lever_simple_lock_row1_cut20_distance,lever_simple_lock_row1_cut20_depth])
    rotate([0,lever_simple_lock_row1_angle_on_y,0])
    translate([0,0,lever_simple_cut_z/2])
    cube([lever_simple_cut_x,lever_simple_lock_row1_cut20_thickness,lever_simple_cut_z], center=true);
    }

}
//END OF MODULE LEVER SIMPLE CUT ROW 1 LEVEL 2


//LEVER DOUBLE
module lever_double_cut_row1(   lever_double_lock_row1_number_of_levers = 		lever_double_lock_row1_number_of_levers,
                    lever_double_lock_row1_blade_length = 			lever_double_lock_row1_blade_length,
                    lever_double_lock_row1_spaces = 				lever_double_lock_row1_spaces,
                    lever_double_lock_row1_thickness = 			lever_double_lock_row1_thickness,
                    lever_double_lock_row1_angle_on_y = 			lever_double_lock_row1_angle_on_y)
{

    translate([0,lever_double_lock_row1_cut01_distance,lever_double_lock_row1_cut01_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut01_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut02_distance,lever_double_lock_row1_cut02_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut02_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut03_distance,lever_double_lock_row1_cut03_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut03_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut04_distance,lever_double_lock_row1_cut04_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut04_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut05_distance,lever_double_lock_row1_cut05_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut05_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut06_distance,lever_double_lock_row1_cut06_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut06_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut07_distance,lever_double_lock_row1_cut07_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut07_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut08_distance,lever_double_lock_row1_cut08_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut08_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut09_distance,lever_double_lock_row1_cut09_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut09_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut10_distance,lever_double_lock_row1_cut10_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut10_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut11_distance,lever_double_lock_row1_cut11_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut11_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut12_distance,lever_double_lock_row1_cut12_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut12_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut13_distance,lever_double_lock_row1_cut13_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut13_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut14_distance,lever_double_lock_row1_cut14_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut14_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut15_distance,lever_double_lock_row1_cut15_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut15_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut16_distance,lever_double_lock_row1_cut16_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut16_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut17_distance,lever_double_lock_row1_cut17_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut17_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut18_distance,lever_double_lock_row1_cut18_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut18_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut19_distance,lever_double_lock_row1_cut19_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut19_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row1_cut20_distance,lever_double_lock_row1_cut20_depth])
    rotate([0,lever_double_lock_row1_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row1_cut20_thickness,lever_double_cut_z], center=true);


}
//END OF MODULE LEVER DOUBLE CUT ROW 1 LEVEL 2

module lever_double_cut_row2(   lever_double_lock_row2_number_of_levers = 		lever_double_lock_row2_number_of_levers,
                    lever_double_lock_row2_blade_length = 			lever_double_lock_row2_blade_length,
                    lever_double_lock_row2_spaces = 				lever_double_lock_row2_spaces,
                    lever_double_lock_row2_thickness = 			lever_double_lock_row2_thickness,
                    lever_double_lock_row2_angle_on_y = 			lever_double_lock_row2_angle_on_y)
{
    mirror([0,0,1])
    {
    translate([0,lever_double_lock_row2_cut01_distance,lever_double_lock_row2_cut01_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut01_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut02_distance,lever_double_lock_row2_cut02_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut02_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut03_distance,lever_double_lock_row2_cut03_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut03_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut04_distance,lever_double_lock_row2_cut04_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut04_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut05_distance,lever_double_lock_row2_cut05_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut05_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut06_distance,lever_double_lock_row2_cut06_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut06_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut07_distance,lever_double_lock_row2_cut07_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut07_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut08_distance,lever_double_lock_row2_cut08_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut08_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut09_distance,lever_double_lock_row2_cut09_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut09_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut10_distance,lever_double_lock_row2_cut10_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut10_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut11_distance,lever_double_lock_row2_cut11_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut11_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut12_distance,lever_double_lock_row2_cut12_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut12_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut13_distance,lever_double_lock_row2_cut13_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut13_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut14_distance,lever_double_lock_row2_cut14_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut14_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut15_distance,lever_double_lock_row2_cut15_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut15_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut16_distance,lever_double_lock_row2_cut16_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut16_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut17_distance,lever_double_lock_row2_cut17_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut17_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut18_distance,lever_double_lock_row2_cut18_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut18_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut19_distance,lever_double_lock_row2_cut19_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut19_thickness,lever_double_cut_z], center=true);

    translate([0,lever_double_lock_row2_cut20_distance,lever_double_lock_row2_cut20_depth])
    rotate([0,lever_double_lock_row2_angle_on_y,0])
    translate([0,0,lever_double_cut_z/2])
    cube([lever_double_cut_x,lever_double_lock_row2_cut20_thickness,lever_double_cut_z], center=true);
    }//END OF MIRROR

}
//END OF MODULE LEVER CUT ROW 2 LEVEL 2


//BEGINNING OF MODULES FOR ABLOY CLASSIC
module abloy_classic_mill(abloy_classic_cut_depth)
{
    translate ([0,0,0])
        rotate([0,90-abloy_classic_angle_step*abloy_classic_cut_depth,0])
    translate([-50/2,-abloy_classic_mill_thickness/2,0])
        cube([50,abloy_classic_mill_thickness,50], false);
}

module abloy_classic_cut_right(     abloy_classic_side_of_cutting = abloy_classic_side_of_cutting,
                                    abloy_classic_length = abloy_classic_length,
                                    abloy_classic_number_of_discs = abloy_classic_number_of_discs,
                                    abloy_classic_spaces = abloy_classic_spaces,
                                    abloy_classic_mill_thickness = abloy_classic_mill_thickness,
                                    abloy_classic_angle_step = abloy_classic_angle_step,
                                    abloy_classic_distance_from_tip = abloy_classic_distance_from_tip)
{

    color ("green")
    {
        //CUT01
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(01-1)),0])
        abloy_classic_mill(abloy_classic_cut01);

        //CUT02
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(02-1)),0])
        abloy_classic_mill(abloy_classic_cut02);

        //CUT03
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(03-1)),0])
        abloy_classic_mill(abloy_classic_cut03);

        //CUT04
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(04-1)),0])
        abloy_classic_mill(abloy_classic_cut04);

        //CUT05
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(05-1)),0])
        abloy_classic_mill(abloy_classic_cut05);

        //CUT06
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(06-1)),0])
        abloy_classic_mill(abloy_classic_cut06);

        //CUT07
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(07-1)),0])
        abloy_classic_mill(abloy_classic_cut07);

        //CUT08
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(08-1)),0])
        abloy_classic_mill(abloy_classic_cut08);

        //CUT09
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(09-1)),0])
        abloy_classic_mill(abloy_classic_cut09);

        //CUT10
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(10-1)),0])
        abloy_classic_mill(abloy_classic_cut10);

        //CUT11
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(11-1)),0])
        abloy_classic_mill(abloy_classic_cut11);

        //CUT12
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(12-1)),0])
        abloy_classic_mill(abloy_classic_cut12);

        //CUT13
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(13-1)),0])
        abloy_classic_mill(abloy_classic_cut13);

        //CUT14
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(14-1)),0])
        abloy_classic_mill(abloy_classic_cut14);

        //CUT15
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(15-1)),0])
        abloy_classic_mill(abloy_classic_cut15);

        //CUT16
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(16-1)),0])
        abloy_classic_mill(abloy_classic_cut16);

        //CUT17
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(17-1)),0])
        abloy_classic_mill(abloy_classic_cut17);

        //CUT18
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(18-1)),0])
        abloy_classic_mill(abloy_classic_cut18);

        //CUT19
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(19-1)),0])
        abloy_classic_mill(abloy_classic_cut19);

        //CUT20
        translate ([0,abloy_classic_length-abloy_classic_distance_from_tip-(abloy_classic_spaces*(20-1)),0])
        abloy_classic_mill(abloy_classic_cut20);

   }

}
//END OF MODULE ABLOY CLASSIC COMPLETE CUT RIGHT LEVEL 2

module abloy_classic_cut_left()
{
    mirror([0,0,1])
    abloy_classic_cut_right();
}
//END OF MODULE ABLOY CLASSIC COMPLETE CUT LEFT LEVEL 2

module abloy_classic_cut(abloy_classic_side_of_cutting=abloy_classic_side_of_cutting)
{
    if (abloy_classic_side_of_cutting=="RIGHT")
    {
        abloy_classic_cut_right();
    }


    if (abloy_classic_side_of_cutting=="LEFT")
    {
        abloy_classic_cut_left();
    }
}
//END OF MODULE ABLOY CLASSIC CUT COMPLETE LEVEL 2


//BEGINNING OF MODULES FOR ABLOY DISKLOCK PRO
module abloy_disklock_anglebase(degres)
{
        rotate([0,degres,0])
        translate ([-5,0,-2-(4.5/2)])
        cube([10,abloy_disklock_mill_thickness,2], false);

        rotate([0,180,0])
        rotate([0,degres,0])
        translate ([-5,0,-2-(4.5/2)])
        cube([10,abloy_disklock_mill_thickness,2], false);
}
module abloy_disklock_angle0() {}
module abloy_disklock_angle1() { abloy_disklock_anglebase(-15); abloy_disklock_anglebase(-30); abloy_disklock_anglebase(-45);}
module abloy_disklock_angle2() { abloy_disklock_anglebase(-30); abloy_disklock_anglebase(60); abloy_disklock_anglebase(-45);}
module abloy_disklock_angle3() { abloy_disklock_anglebase(-45); abloy_disklock_anglebase(45);}
module abloy_disklock_angle4() { abloy_disklock_anglebase(-60); abloy_disklock_anglebase(30); abloy_disklock_anglebase(45);}
module abloy_disklock_angle5() { abloy_disklock_anglebase(15); abloy_disklock_anglebase(30); abloy_disklock_anglebase(45);}
module abloy_disklock_angle6()
{
        rotate ([-90,0,0])
        difference()
        {
                cylinder (h=abloy_disklock_mill_thickness, d=10, $fn=100) ;
                translate ([0,0,-1])
                        cylinder (h=4, d=4.5, $fn=100) ;
        }
}



module abloy_disklock_mill(abloy_disklock_cut_depth)
{
    if (abloy_disklock_cut_depth==0)
        abloy_disklock_angle0();

    if (abloy_disklock_cut_depth==1)
        abloy_disklock_angle1();

    if (abloy_disklock_cut_depth==2)
        abloy_disklock_angle2();

    if (abloy_disklock_cut_depth==3)
        abloy_disklock_angle3();

    if (abloy_disklock_cut_depth==4)
        abloy_disklock_angle4();

    if (abloy_disklock_cut_depth==5)
        abloy_disklock_angle5();

    if (abloy_disklock_cut_depth==6)
        abloy_disklock_angle6();

}



module abloy_disklock_cut(  abloy_disklock_number_of_discs = abloy_disklock_number_of_discs,
                            abloy_disklock_spaces = abloy_disklock_spaces,
                            abloy_disklock_mill_thickness = abloy_disklock_mill_thickness,
                            abloy_disklock_distance_from_tip = abloy_disklock_distance_from_tip,
                            abloy_disklock_groove_at_the_tip = abloy_disklock_groove_at_the_tip)
{
    color ("green")
    {
        //CUT01
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(01-1)),0])
        abloy_disklock_mill(abloy_disklock_cut01);

        //CUT02
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(02-1)),0])
        abloy_disklock_mill(abloy_disklock_cut02);

        //CUT03
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(03-1)),0])
        abloy_disklock_mill(abloy_disklock_cut03);

        //CUT04
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(04-1)),0])
        abloy_disklock_mill(abloy_disklock_cut04);

        //CUT05
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(05-1)),0])
        abloy_disklock_mill(abloy_disklock_cut05);

        //CUT06
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(06-1)),0])
        abloy_disklock_mill(abloy_disklock_cut06);

        //CUT07
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(07-1)),0])
        abloy_disklock_mill(abloy_disklock_cut07);

        //CUT08
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(08-1)),0])
        abloy_disklock_mill(abloy_disklock_cut08);

        //CUT09
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(09-1)),0])
        abloy_disklock_mill(abloy_disklock_cut09);

        //CUT10
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(10-1)),0])
        abloy_disklock_mill(abloy_disklock_cut10);

        //CUT11
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(11-1)),0])
        abloy_disklock_mill(abloy_disklock_cut11);

        //CUT12
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(12-1)),0])
        abloy_disklock_mill(abloy_disklock_cut12);

        //CUT13
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(13-1)),0])
        abloy_disklock_mill(abloy_disklock_cut13);

        //CUT14
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(14-1)),0])
        abloy_disklock_mill(abloy_disklock_cut14);

        //CUT15
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(15-1)),0])
        abloy_disklock_mill(abloy_disklock_cut15);

        //CUT16
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(16-1)),0])
        abloy_disklock_mill(abloy_disklock_cut16);

        //CUT17
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(17-1)),0])
        abloy_disklock_mill(abloy_disklock_cut17);

        //CUT18
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(18-1)),0])
        abloy_disklock_mill(abloy_disklock_cut18);

        //CUT19
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(19-1)),0])
        abloy_disklock_mill(abloy_disklock_cut19);

        //CUT20
        translate ([0,abloy_disklock_length-abloy_disklock_distance_from_tip-(abloy_disklock_mill_thickness/2+abloy_disklock_spaces*(20-1)),0])
        abloy_disklock_mill(abloy_disklock_cut20);

        //GROOVES A THE TIP
        if (abloy_disklock_groove_at_the_tip=="YES")
        {
            //top tip groove
            translate ([0,abloy_disklock_length+1.4,6/2])
            rotate ([90,0,0])
            cylinder(h = 10, d=1.5, center = true, $fn=100);

            //bottom tip groove
            translate ([0,abloy_disklock_length+1.4,-6/2])
            rotate ([90,0,0])
            cylinder(h = 10, d=1.5, center = true, $fn=100);
        }//END OF IF abloy_disklock_groove_at_the_tip

    }
}
//END OF MODULE ABLOY DISKLOCK CUTTINGS LEVEL 2


//BEGINNING OF MODULES OF ABLOY PROTEC
module abloy_protec_anglebase(degres)
{

        rotate([0,degres,0])
        translate ([-5,0,-2-(4.3/2)])
        cube([10,abloy_protec_mill_thickness,2], false);

        rotate([0,180,0])
        rotate([0,degres,0])
        translate ([-5,0,-2-(4.3/2)])
        cube([10,abloy_protec_mill_thickness,2], false);
}
module abloy_protec_angle0() {}
module abloy_protec_angle1() { abloy_protec_anglebase(-50);}
module abloy_protec_angle2() { abloy_protec_anglebase(50);}
module abloy_protec_round345()
{
        rotate ([-90,0,0])
        difference()
        {
                cylinder (h=abloy_protec_mill_thickness, d=10, $fn=100) ;
                translate ([0,0,-1])
                        cylinder (h=4, d=5.5, $fn=100) ;
        }
}

module abloy_protec_angle3()
{
        abloy_protec_anglebase(-35);
        abloy_protec_round345();
}



module abloy_protec_angle4()
{
        abloy_protec_round345();
        abloy_protec_angle1();
        abloy_protec_angle2();
}

module abloy_protec_angle5()
{
        abloy_protec_anglebase(35);
        abloy_protec_round345();
}

module abloy_protec_angle6()
{
        rotate ([-90,0,0])
        difference()
        {
                cylinder (h=abloy_protec_mill_thickness, d=10, $fn=100) ;
                translate ([0,0,-1])
                        cylinder (h=4, d=4.3, $fn=100) ;
        }
}


module abloy_protec_mill(abloy_protec_cut_depth)
{
    translate ([0,-abloy_protec_mill_thickness/2,0])
    {
        if (abloy_protec_cut_depth==0)
            abloy_protec_angle0();

        if (abloy_protec_cut_depth==1)
            abloy_protec_angle1();

        if (abloy_protec_cut_depth==2)
            abloy_protec_angle2();

        if (abloy_protec_cut_depth==3)
            abloy_protec_angle3();

        if (abloy_protec_cut_depth==4)
            abloy_protec_angle4();

        if (abloy_protec_cut_depth==5)
            abloy_protec_angle5();

        if (abloy_protec_cut_depth==6)
            abloy_protec_angle6();
    }

}



module abloy_protec_cut(  abloy_protec_number_of_discs = abloy_protec_number_of_discs,
                            abloy_protec_spaces = abloy_protec_spaces,
                            abloy_protec_mill_thickness = abloy_protec_mill_thickness,
                            abloy_protec_distance_from_tip = abloy_protec_distance_from_tip,
                            abloy_protec_thinner_at_the_tip = abloy_protec_thinner_at_the_tip)
{
    color ("green")
    {
        //CUT01
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(01-1)),0])
        abloy_protec_mill(abloy_protec_cut01);

        //CUT02
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(02-1)),0])
        abloy_protec_mill(abloy_protec_cut02);

        //CUT03
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(03-1)),0])
        abloy_protec_mill(abloy_protec_cut03);

        //CUT04
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(04-1)),0])
        abloy_protec_mill(abloy_protec_cut04);

        //CUT05
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(05-1)),0])
        abloy_protec_mill(abloy_protec_cut05);

        //CUT06
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(06-1)),0])
        abloy_protec_mill(abloy_protec_cut06);

        //CUT07
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(07-1)),0])
        abloy_protec_mill(abloy_protec_cut07);

        //CUT08
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(08-1)),0])
        abloy_protec_mill(abloy_protec_cut08);

        //CUT09
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(09-1)),0])
        abloy_protec_mill(abloy_protec_cut09);

        //CUT10
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(10-1)),0])
        abloy_protec_mill(abloy_protec_cut10);

        //CUT11
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(11-1)),0])
        abloy_protec_mill(abloy_protec_cut11);

        //CUT12
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(12-1)),0])
        abloy_protec_mill(abloy_protec_cut12);

        //CUT13
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(13-1)),0])
        abloy_protec_mill(abloy_protec_cut13);

        //CUT14
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(14-1)),0])
        abloy_protec_mill(abloy_protec_cut14);

        //CUT15
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(15-1)),0])
        abloy_protec_mill(abloy_protec_cut15);

        //CUT16
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(16-1)),0])
        abloy_protec_mill(abloy_protec_cut16);

        //CUT17
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(17-1)),0])
        abloy_protec_mill(abloy_protec_cut17);

        //CUT18
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(18-1)),0])
        abloy_protec_mill(abloy_protec_cut18);

        //CUT19
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(19-1)),0])
        abloy_protec_mill(abloy_protec_cut19);

        //CUT20
        translate ([0,abloy_protec_length-abloy_protec_distance_from_tip-(abloy_protec_spaces*(20-1)),0])
        abloy_protec_mill(abloy_protec_cut20);



    }
    if (abloy_protec_thinner_at_the_tip=="YES")
        {
            //clean the ZERO cut at the end for profile discs
                        difference()
                        {
                                translate ([0,abloy_protec_length-(2.5/2)-0.1, 0])
                                cube ([10,2.9,10], center=true);

                                translate ([0,abloy_protec_length-(2.5/2), 0])
                                cube ([1.5,5,4], center=true);
                        }
        }//END OF IF abloy_protec_groove_at_the_tip
}
//END OF MODULE ABLOY PROTEC CUTTINGS LEVEL 2


//BEGINNING OF MODULES FOR ABUS PLUS


module abus_plus_anglebase(degres)
{

        rotate([0,degres,0])
        translate ([-5,0,-2-(2.91/2)])
        cube([10,abus_plus_mill_thickness,2], false);

        rotate([0,180,0])
        rotate([0,degres,0])
        translate ([-5,0,-2-(2.91/2)])
        cube([10,abus_plus_mill_thickness,2], false);
}
module abus_plus_angle6() { }
module abus_plus_angle5() { abus_plus_anglebase(72);}
module abus_plus_angle4() { abus_plus_anglebase(54);}

module abus_plus_angle3() {
abus_plus_anglebase(36);
abus_plus_anglebase(54);
}

module abus_plus_angle2() {
abus_plus_anglebase(18);
abus_plus_anglebase(36);
abus_plus_anglebase(54);
}

module abus_plus_angle1() {
abus_plus_anglebase(5);
abus_plus_anglebase(18);
abus_plus_anglebase(36);
abus_plus_anglebase(54);
}

module abus_plus_mill(abus_plus_cut_depth)
{
    translate ([0,-abus_plus_mill_thickness/2,0])
    {
        if (abus_plus_cut_depth==1)
            abus_plus_angle1();

        if (abus_plus_cut_depth==2)
            abus_plus_angle2();

        if (abus_plus_cut_depth==3)
            abus_plus_angle3();

        if (abus_plus_cut_depth==4)
            abus_plus_angle4();

        if (abus_plus_cut_depth==5)
            abus_plus_angle5();

        if (abus_plus_cut_depth==6)
            abus_plus_angle6();
    }

}



module abus_plus_cut(  abus_plus_number_of_discs = abus_plus_number_of_discs,
                            abus_plus_spaces = abus_plus_spaces,
                            abus_plus_mill_thickness = abus_plus_mill_thickness,
                            abus_plus_distance_from_tip = abus_plus_distance_from_tip)
{
    color ("green")
    {
        //CUT01
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(01-1)),0])
        abus_plus_mill(abus_plus_cut01);

        //CUT02
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(02-1)),0])
        abus_plus_mill(abus_plus_cut02);

        //CUT03
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(03-1)),0])
        abus_plus_mill(abus_plus_cut03);

        //CUT04
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(04-1)),0])
        abus_plus_mill(abus_plus_cut04);

        //CUT05
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(05-1)),0])
        abus_plus_mill(abus_plus_cut05);

        //CUT06
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(06-1)),0])
        abus_plus_mill(abus_plus_cut06);

        //CUT07
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(07-1)),0])
        abus_plus_mill(abus_plus_cut07);

        //CUT08
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(08-1)),0])
        abus_plus_mill(abus_plus_cut08);

        //CUT09
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(09-1)),0])
        abus_plus_mill(abus_plus_cut09);

        //CUT10
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(10-1)),0])
        abus_plus_mill(abus_plus_cut10);

        //CUT11
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(11-1)),0])
        abus_plus_mill(abus_plus_cut11);

        //CUT12
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(12-1)),0])
        abus_plus_mill(abus_plus_cut12);

        //CUT13
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(13-1)),0])
        abus_plus_mill(abus_plus_cut13);

        //CUT14
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(14-1)),0])
        abus_plus_mill(abus_plus_cut14);

        //CUT15
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(15-1)),0])
        abus_plus_mill(abus_plus_cut15);

        //CUT16
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(16-1)),0])
        abus_plus_mill(abus_plus_cut16);

        //CUT17
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(17-1)),0])
        abus_plus_mill(abus_plus_cut17);

        //CUT18
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(18-1)),0])
        abus_plus_mill(abus_plus_cut18);

        //CUT19
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(19-1)),0])
        abus_plus_mill(abus_plus_cut19);

        //CUT20
        translate ([0,abus_plus_length-abus_plus_distance_from_tip-(abus_plus_spaces*(20-1)),0])
        abus_plus_mill(abus_plus_cut20);



    }
}
//END OF MODULE ABUS PLUS CUTTINGS LEVEL 2

//BEGINNING OF MODULES FOR ABUS X PLUS


module abus_x_plus_anglebase(degres)
{

        rotate([0,degres,0])
        translate ([-5,0,-2-(2.91/2)])
        cube([10,abus_x_plus_mill_thickness,2], false);

        rotate([0,180,0])
        rotate([0,degres,0])
        translate ([-5,0,-2-(2.91/2)])
        cube([10,abus_x_plus_mill_thickness,2], false);
}
module abus_x_plus_angle6() { }
module abus_x_plus_angle5() { abus_x_plus_anglebase(72);}
module abus_x_plus_angle4() { abus_x_plus_anglebase(54);}

module abus_x_plus_angle3() {
abus_x_plus_anglebase(36);
abus_x_plus_anglebase(54);
}

module abus_x_plus_angle2() {
abus_x_plus_anglebase(18);
abus_x_plus_anglebase(36);
abus_x_plus_anglebase(54);
}

module abus_x_plus_angle1() {
abus_x_plus_anglebase(5);
abus_x_plus_anglebase(18);
abus_x_plus_anglebase(36);
abus_x_plus_anglebase(54);
}

module abus_x_plus_mill(abus_x_plus_cut_depth)
{
    translate ([0,-abus_x_plus_mill_thickness/2,0])
    {
        if (abus_x_plus_cut_depth==1)
            abus_x_plus_angle1();

        if (abus_x_plus_cut_depth==2)
            abus_x_plus_angle2();

        if (abus_x_plus_cut_depth==3)
            abus_x_plus_angle3();

        if (abus_x_plus_cut_depth==4)
            abus_x_plus_angle4();

        if (abus_x_plus_cut_depth==5)
            abus_x_plus_angle5();

        if (abus_x_plus_cut_depth==6)
            abus_x_plus_angle6();
    }

}



module abus_x_plus_cut(  abus_x_plus_number_of_discs = abus_x_plus_number_of_discs,
                            abus_x_plus_spaces = abus_x_plus_spaces,
                            abus_x_plus_mill_thickness = abus_x_plus_mill_thickness,
                            abus_x_plus_distance_from_tip = abus_x_plus_distance_from_tip)
{
    color ("green")
    {
        //CUT01
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(01-1)),0])
        abus_x_plus_mill(abus_x_plus_cut01);

        //CUT02
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(02-1)),0])
        abus_x_plus_mill(abus_x_plus_cut02);

        //CUT03
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(03-1)),0])
        abus_x_plus_mill(abus_x_plus_cut03);

        //CUT04
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(04-1)),0])
        abus_x_plus_mill(abus_x_plus_cut04);

        //CUT05
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(05-1)),0])
        abus_x_plus_mill(abus_x_plus_cut05);

        //CUT06
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(06-1)),0])
        abus_x_plus_mill(abus_x_plus_cut06);

        //CUT07
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(07-1)),0])
        abus_x_plus_mill(abus_x_plus_cut07);

        //CUT08
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(08-1)),0])
        abus_x_plus_mill(abus_x_plus_cut08);

        //CUT09
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(09-1)),0])
        abus_x_plus_mill(abus_x_plus_cut09);

        //CUT10
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(10-1)),0])
        abus_x_plus_mill(abus_x_plus_cut10);

        //CUT11
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(11-1)),0])
        abus_x_plus_mill(abus_x_plus_cut11);

        //CUT12
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(12-1)),0])
        abus_x_plus_mill(abus_x_plus_cut12);

        //CUT13
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(13-1)),0])
        abus_x_plus_mill(abus_x_plus_cut13);

        //CUT14
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(14-1)),0])
        abus_x_plus_mill(abus_x_plus_cut14);

        //CUT15
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(15-1)),0])
        abus_x_plus_mill(abus_x_plus_cut15);

        //CUT16
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(16-1)),0])
        abus_x_plus_mill(abus_x_plus_cut16);

        //CUT17
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(17-1)),0])
        abus_x_plus_mill(abus_x_plus_cut17);

        //CUT18
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(18-1)),0])
        abus_x_plus_mill(abus_x_plus_cut18);

        //CUT19
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(19-1)),0])
        abus_x_plus_mill(abus_x_plus_cut19);

        //CUT20
        translate ([0,abus_x_plus_length-abus_x_plus_distance_from_tip-(abus_x_plus_spaces*(20-1)),0])
        abus_x_plus_mill(abus_x_plus_cut20);



    }
}
//END OF MODULE ABUS X PLUS CUTTINGS LEVEL 2


//MODULES CUTTING UNIVERSAL DISK TUMBLER KEY
module universal_disk_cut(universal_disk_angle_cut, universal_disk_distance)
{
    translate([0,universal_disk_blank_length-universal_disk_distance,0])
rotate([0,-universal_disk_angle_cut*universal_disk_angle_step,0])
    translate([universal_disk_move_x,0,0])
    translate([10,0,0])
cube([20,universal_disk_mill_width,20],center=true);

}


module universal_disk_tip()
{
    translate ([0,universal_disk_blank_length,0])
rotate ([-90,0,0])
difference () {
cylinder(h = 5, d=universal_disk_key_height*1.3, center = true);
cylinder(h = 10, d1 = universal_disk_key_height*1.4, d2 = 1, center = true, $fn=100);
}
}
//NOT A MODULE :
universal_disk_dist_pin_1 = universal_disk_tip_thickness+universal_disk_mill_width/2 ;
universal_disk_dist_pin_2 = universal_disk_dist_pin_1 + universal_disk_dist_pin ;
universal_disk_dist_pin_3 = universal_disk_dist_pin_2 + universal_disk_dist_pin ;
universal_disk_dist_pin_4 = universal_disk_dist_pin_3 + universal_disk_dist_pin ;
universal_disk_dist_pin_5 = universal_disk_dist_pin_4 + universal_disk_dist_pin ;
universal_disk_dist_pin_6 = universal_disk_dist_pin_5 + universal_disk_dist_pin ;
universal_disk_dist_pin_7 = universal_disk_dist_pin_6 + universal_disk_dist_pin ;
universal_disk_dist_pin_8 = universal_disk_dist_pin_7 + universal_disk_dist_pin ;
universal_disk_dist_pin_9 = universal_disk_dist_pin_8 + universal_disk_dist_pin ;
universal_disk_dist_pin_10 = universal_disk_dist_pin_9 + universal_disk_dist_pin ;
universal_disk_dist_pin_11 = universal_disk_dist_pin_10 + universal_disk_dist_pin ;
universal_disk_dist_pin_12 = universal_disk_dist_pin_11 + universal_disk_dist_pin ;
universal_disk_dist_pin_13 = universal_disk_dist_pin_12 + universal_disk_dist_pin ;

module universal_disk_oneside_cuts()
{
universal_disk_cut(universal_disk_angle_01,universal_disk_dist_pin_1);
universal_disk_cut(universal_disk_angle_02,universal_disk_dist_pin_2);
universal_disk_cut(universal_disk_angle_03,universal_disk_dist_pin_3);
universal_disk_cut(universal_disk_angle_04,universal_disk_dist_pin_4);
universal_disk_cut(universal_disk_angle_05,universal_disk_dist_pin_5);
universal_disk_cut(universal_disk_angle_06,universal_disk_dist_pin_6);
universal_disk_cut(universal_disk_angle_07,universal_disk_dist_pin_7);
universal_disk_cut(universal_disk_angle_08,universal_disk_dist_pin_8);
universal_disk_cut(universal_disk_angle_09,universal_disk_dist_pin_9);
universal_disk_cut(universal_disk_angle_10,universal_disk_dist_pin_10);
universal_disk_cut(universal_disk_angle_11,universal_disk_dist_pin_11);
universal_disk_cut(universal_disk_angle_12,universal_disk_dist_pin_12);
universal_disk_cut(universal_disk_angle_13,universal_disk_dist_pin_13);
}

module universal_disk_all_cuts()
{
    universal_disk_oneside_cuts();

    if (universal_disk_reversible == "YES")
        rotate([0,180,0])
        universal_disk_oneside_cuts();

    if (universal_disk_auto_tip == "YES")
        universal_disk_tip();
}
//END OF MODULES FOR CUTTINGS UNIVERSAL DISK TUMBLER KEY LEVEL 2


//BEGINNING OF MODULES FOR FICHET 787

module fichet_787_right_cut(cut_depth) { //cut_depth from middle of blank to the root of the cut


        translate ([-(cut_depth+5),-10+fichet_787_dist_from_tip,0])
        cube([10,20,fichet_787_mill_thickness], center=true);


        translate ([-(cut_depth+5),0+fichet_787_dist_from_tip,0])
        cylinder(h = fichet_787_mill_thickness, d=10, $fn=100, center=true);
}

module fichet_787_left_cut(cut_depth) { //cut_depth from middle of blank to the root of the cut


        translate ([cut_depth+5,-10+fichet_787_dist_from_tip,0])
        cube([10,20,fichet_787_mill_thickness], center=true);


        translate ([cut_depth+5,0+fichet_787_dist_from_tip,0])
        cylinder(h = fichet_787_mill_thickness, d=10, $fn=100, center=true);
}

module fichet_787_cut_1 () { fichet_787_right_cut(fichet_787_cut01) ; }//in mm from the back of the key to the cut root
module fichet_787_cut_2 () {  fichet_787_left_cut(fichet_787_cut02) ; }//max is 2,5mm
module fichet_787_cut_3 () { fichet_787_right_cut(fichet_787_cut03) ; }
module fichet_787_cut_4 () {  fichet_787_left_cut(fichet_787_cut04) ; }
module fichet_787_cut_5 () { fichet_787_right_cut(fichet_787_cut05) ; }
module fichet_787_cut_6 () {  fichet_787_left_cut(fichet_787_cut06) ; }
module fichet_787_cut_7 () { fichet_787_right_cut(fichet_787_cut07) ; }
module fichet_787_cut_8 () {  fichet_787_left_cut(fichet_787_cut08) ; }
module fichet_787_cut_9 () { fichet_787_right_cut(fichet_787_cut09) ; }
module fichet_787_cut_10() {  fichet_787_left_cut(fichet_787_cut10) ; }

module fichet_787_cut()
{
    translate ([0,0,fichet_787_dist_cut_1])
    fichet_787_cut_1();

    translate ([0,0,fichet_787_dist_cut_2])
    fichet_787_cut_2();

    translate ([0,0,fichet_787_dist_cut_3])
    fichet_787_cut_3();

    translate ([0,0,fichet_787_dist_cut_4])
    fichet_787_cut_4();

    translate ([0,0,fichet_787_dist_cut_5])
    fichet_787_cut_5();

    translate ([0,0,fichet_787_dist_cut_6])
    fichet_787_cut_6();

    translate ([0,0,fichet_787_dist_cut_7])
    fichet_787_cut_7();

    translate ([0,0,fichet_787_dist_cut_8])
    fichet_787_cut_8();

    translate ([0,0,fichet_787_dist_cut_9])
    fichet_787_cut_9();

    translate ([0,0,fichet_787_dist_cut_10])
    fichet_787_cut_10();
}
//END OF MODULES FOR CUTTING FICHET 787 LEVEL 2




//BEGINNING OF MODULES FOR THE 10 SHAPES EXTRA CUTTING Level 2
module extra_cut_level2_shape_01()
{

    if (extra_cut_level2_shape_01_model=="CUBE")
    {
        if(extra_cut_level2_shape_01_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_01_cube_translate)
            rotate(extra_cut_level2_shape_01_cube_rotation)
            cube(extra_cut_level2_shape_01_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_01_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_01_cube_translate)
            rotate(extra_cut_level2_shape_01_cube_rotation)
            cube(extra_cut_level2_shape_01_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_01_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_01_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_01_cylinder_translate)
            rotate(extra_cut_level2_shape_01_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_01_cylinder_diameter, h=extra_cut_level2_shape_01_cylinder_height, $fn=extra_cut_level2_shape_01_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_01_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_01_cylinder_translate)
            rotate(extra_cut_level2_shape_01_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_01_cylinder_diameter, h=extra_cut_level2_shape_01_cylinder_height, $fn=extra_cut_level2_shape_01_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_01_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_01_sphere_translate)
        sphere(d=extra_cut_level2_shape_01_sphere_diameter, $fn=extra_cut_level2_shape_01_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_01_model=="STL")
    {
        translate(extra_cut_level2_shape_01_stl_translate)
        rotate(extra_cut_level2_shape_01_stl_rotation)
        import(extra_cut_level2_shape_01_stl_name);
    }

}
//END OF MODULE SHAPE 01 EXTRA CUTTING Level 2

module extra_cut_level2_shape_02()
{

    if (extra_cut_level2_shape_02_model=="CUBE")
    {
        if(extra_cut_level2_shape_02_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_02_cube_translate)
            rotate(extra_cut_level2_shape_02_cube_rotation)
            cube(extra_cut_level2_shape_02_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_02_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_02_cube_translate)
            rotate(extra_cut_level2_shape_02_cube_rotation)
            cube(extra_cut_level2_shape_02_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_02_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_02_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_02_cylinder_translate)
            rotate(extra_cut_level2_shape_02_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_02_cylinder_diameter, h=extra_cut_level2_shape_02_cylinder_height, $fn=extra_cut_level2_shape_02_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_02_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_02_cylinder_translate)
            rotate(extra_cut_level2_shape_02_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_02_cylinder_diameter, h=extra_cut_level2_shape_02_cylinder_height, $fn=extra_cut_level2_shape_02_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_02_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_02_sphere_translate)
        sphere(d=extra_cut_level2_shape_02_sphere_diameter, $fn=extra_cut_level2_shape_02_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_02_model=="STL")
    {
        translate(extra_cut_level2_shape_02_stl_translate)
        rotate(extra_cut_level2_shape_02_stl_rotation)
        import(extra_cut_level2_shape_02_stl_name);
    }

}
//END OF MODULE SHAPE 02 EXTRA CUTTING Level 2

module extra_cut_level2_shape_03()
{

    if (extra_cut_level2_shape_03_model=="CUBE")
    {
        if(extra_cut_level2_shape_03_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_03_cube_translate)
            rotate(extra_cut_level2_shape_03_cube_rotation)
            cube(extra_cut_level2_shape_03_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_03_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_03_cube_translate)
            rotate(extra_cut_level2_shape_03_cube_rotation)
            cube(extra_cut_level2_shape_03_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_03_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_03_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_03_cylinder_translate)
            rotate(extra_cut_level2_shape_03_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_03_cylinder_diameter, h=extra_cut_level2_shape_03_cylinder_height, $fn=extra_cut_level2_shape_03_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_03_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_03_cylinder_translate)
            rotate(extra_cut_level2_shape_03_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_03_cylinder_diameter, h=extra_cut_level2_shape_03_cylinder_height, $fn=extra_cut_level2_shape_03_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_03_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_03_sphere_translate)
        sphere(d=extra_cut_level2_shape_03_sphere_diameter, $fn=extra_cut_level2_shape_03_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_03_model=="STL")
    {
        translate(extra_cut_level2_shape_03_stl_translate)
        rotate(extra_cut_level2_shape_03_stl_rotation)
        import(extra_cut_level2_shape_03_stl_name);
    }

}
//END OF MODULE SHAPE 03 EXTRA CUTTING Level 2


module extra_cut_level2_shape_04()
{

    if (extra_cut_level2_shape_04_model=="CUBE")
    {
        if(extra_cut_level2_shape_04_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_04_cube_translate)
            rotate(extra_cut_level2_shape_04_cube_rotation)
            cube(extra_cut_level2_shape_04_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_04_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_04_cube_translate)
            rotate(extra_cut_level2_shape_04_cube_rotation)
            cube(extra_cut_level2_shape_04_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_04_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_04_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_04_cylinder_translate)
            rotate(extra_cut_level2_shape_04_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_04_cylinder_diameter, h=extra_cut_level2_shape_04_cylinder_height, $fn=extra_cut_level2_shape_04_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_04_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_04_cylinder_translate)
            rotate(extra_cut_level2_shape_04_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_04_cylinder_diameter, h=extra_cut_level2_shape_04_cylinder_height, $fn=extra_cut_level2_shape_04_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_04_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_04_sphere_translate)
        sphere(d=extra_cut_level2_shape_04_sphere_diameter, $fn=extra_cut_level2_shape_04_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_04_model=="STL")
    {
        translate(extra_cut_level2_shape_04_stl_translate)
        rotate(extra_cut_level2_shape_04_stl_rotation)
        import(extra_cut_level2_shape_04_stl_name);
    }

}
//END OF MODULE SHAPE 04 EXTRA CUTTING Level 2


module extra_cut_level2_shape_05()
{

    if (extra_cut_level2_shape_05_model=="CUBE")
    {
        if(extra_cut_level2_shape_05_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_05_cube_translate)
            rotate(extra_cut_level2_shape_05_cube_rotation)
            cube(extra_cut_level2_shape_05_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_05_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_05_cube_translate)
            rotate(extra_cut_level2_shape_05_cube_rotation)
            cube(extra_cut_level2_shape_05_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_05_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_05_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_05_cylinder_translate)
            rotate(extra_cut_level2_shape_05_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_05_cylinder_diameter, h=extra_cut_level2_shape_05_cylinder_height, $fn=extra_cut_level2_shape_05_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_05_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_05_cylinder_translate)
            rotate(extra_cut_level2_shape_05_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_05_cylinder_diameter, h=extra_cut_level2_shape_05_cylinder_height, $fn=extra_cut_level2_shape_05_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_05_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_05_sphere_translate)
        sphere(d=extra_cut_level2_shape_05_sphere_diameter, $fn=extra_cut_level2_shape_05_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_05_model=="STL")
    {
        translate(extra_cut_level2_shape_05_stl_translate)
        rotate(extra_cut_level2_shape_05_stl_rotation)
        import(extra_cut_level2_shape_05_stl_name);
    }

}
//END OF MODULE SHAPE 05 EXTRA CUTTING Level 2


module extra_cut_level2_shape_06()
{

    if (extra_cut_level2_shape_06_model=="CUBE")
    {
        if(extra_cut_level2_shape_06_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_06_cube_translate)
            rotate(extra_cut_level2_shape_06_cube_rotation)
            cube(extra_cut_level2_shape_06_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_06_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_06_cube_translate)
            rotate(extra_cut_level2_shape_06_cube_rotation)
            cube(extra_cut_level2_shape_06_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_06_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_06_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_06_cylinder_translate)
            rotate(extra_cut_level2_shape_06_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_06_cylinder_diameter, h=extra_cut_level2_shape_06_cylinder_height, $fn=extra_cut_level2_shape_06_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_06_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_06_cylinder_translate)
            rotate(extra_cut_level2_shape_06_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_06_cylinder_diameter, h=extra_cut_level2_shape_06_cylinder_height, $fn=extra_cut_level2_shape_06_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_06_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_06_sphere_translate)
        sphere(d=extra_cut_level2_shape_06_sphere_diameter, $fn=extra_cut_level2_shape_06_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_06_model=="STL")
    {
        translate(extra_cut_level2_shape_06_stl_translate)
        rotate(extra_cut_level2_shape_06_stl_rotation)
        import(extra_cut_level2_shape_06_stl_name);
    }

}
//END OF MODULE SHAPE 06 EXTRA CUTTING Level 2


module extra_cut_level2_shape_07()
{

    if (extra_cut_level2_shape_07_model=="CUBE")
    {
        if(extra_cut_level2_shape_07_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_07_cube_translate)
            rotate(extra_cut_level2_shape_07_cube_rotation)
            cube(extra_cut_level2_shape_07_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_07_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_07_cube_translate)
            rotate(extra_cut_level2_shape_07_cube_rotation)
            cube(extra_cut_level2_shape_07_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_07_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_07_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_07_cylinder_translate)
            rotate(extra_cut_level2_shape_07_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_07_cylinder_diameter, h=extra_cut_level2_shape_07_cylinder_height, $fn=extra_cut_level2_shape_07_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_07_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_07_cylinder_translate)
            rotate(extra_cut_level2_shape_07_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_07_cylinder_diameter, h=extra_cut_level2_shape_07_cylinder_height, $fn=extra_cut_level2_shape_07_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_07_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_07_sphere_translate)
        sphere(d=extra_cut_level2_shape_07_sphere_diameter, $fn=extra_cut_level2_shape_07_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_07_model=="STL")
    {
        translate(extra_cut_level2_shape_07_stl_translate)
        rotate(extra_cut_level2_shape_07_stl_rotation)
        import(extra_cut_level2_shape_07_stl_name);
    }

}
//END OF MODULE SHAPE 07 EXTRA CUTTING Level 2


module extra_cut_level2_shape_08()
{

    if (extra_cut_level2_shape_08_model=="CUBE")
    {
        if(extra_cut_level2_shape_08_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_08_cube_translate)
            rotate(extra_cut_level2_shape_08_cube_rotation)
            cube(extra_cut_level2_shape_08_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_08_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_08_cube_translate)
            rotate(extra_cut_level2_shape_08_cube_rotation)
            cube(extra_cut_level2_shape_08_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_08_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_08_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_08_cylinder_translate)
            rotate(extra_cut_level2_shape_08_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_08_cylinder_diameter, h=extra_cut_level2_shape_08_cylinder_height, $fn=extra_cut_level2_shape_08_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_08_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_08_cylinder_translate)
            rotate(extra_cut_level2_shape_08_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_08_cylinder_diameter, h=extra_cut_level2_shape_08_cylinder_height, $fn=extra_cut_level2_shape_08_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_08_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_08_sphere_translate)
        sphere(d=extra_cut_level2_shape_08_sphere_diameter, $fn=extra_cut_level2_shape_08_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_08_model=="STL")
    {
        translate(extra_cut_level2_shape_08_stl_translate)
        rotate(extra_cut_level2_shape_08_stl_rotation)
        import(extra_cut_level2_shape_08_stl_name);
    }

}
//END OF MODULE SHAPE 08 EXTRA CUTTING Level 2


module extra_cut_level2_shape_09()
{

    if (extra_cut_level2_shape_09_model=="CUBE")
    {
        if(extra_cut_level2_shape_09_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_09_cube_translate)
            rotate(extra_cut_level2_shape_09_cube_rotation)
            cube(extra_cut_level2_shape_09_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_09_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_09_cube_translate)
            rotate(extra_cut_level2_shape_09_cube_rotation)
            cube(extra_cut_level2_shape_09_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_09_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_09_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_09_cylinder_translate)
            rotate(extra_cut_level2_shape_09_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_09_cylinder_diameter, h=extra_cut_level2_shape_09_cylinder_height, $fn=extra_cut_level2_shape_09_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_09_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_09_cylinder_translate)
            rotate(extra_cut_level2_shape_09_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_09_cylinder_diameter, h=extra_cut_level2_shape_09_cylinder_height, $fn=extra_cut_level2_shape_09_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_09_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_09_sphere_translate)
        sphere(d=extra_cut_level2_shape_09_sphere_diameter, $fn=extra_cut_level2_shape_09_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_09_model=="STL")
    {
        translate(extra_cut_level2_shape_09_stl_translate)
        rotate(extra_cut_level2_shape_09_stl_rotation)
        import(extra_cut_level2_shape_09_stl_name);
    }

}
//END OF MODULE SHAPE 09 EXTRA CUTTING Level 2


module extra_cut_level2_shape_10()
{

    if (extra_cut_level2_shape_10_model=="CUBE")
    {
        if(extra_cut_level2_shape_10_cube_centered=="YES")
        {
            translate(extra_cut_level2_shape_10_cube_translate)
            rotate(extra_cut_level2_shape_10_cube_rotation)
            cube(extra_cut_level2_shape_10_cube_dimensions, center=true);
        }

        if(extra_cut_level2_shape_10_cube_centered=="NO")
        {
            translate(extra_cut_level2_shape_10_cube_translate)
            rotate(extra_cut_level2_shape_10_cube_rotation)
            cube(extra_cut_level2_shape_10_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level2_shape_10_model=="CYLINDER")
    {
        if(extra_cut_level2_shape_10_cylinder_centered=="YES")
        {
            translate(extra_cut_level2_shape_10_cylinder_translate)
            rotate(extra_cut_level2_shape_10_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_10_cylinder_diameter, h=extra_cut_level2_shape_10_cylinder_height, $fn=extra_cut_level2_shape_10_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level2_shape_10_cylinder_centered=="NO")
        {
            translate(extra_cut_level2_shape_10_cylinder_translate)
            rotate(extra_cut_level2_shape_10_cylinder_rotation)
            cylinder(d=extra_cut_level2_shape_10_cylinder_diameter, h=extra_cut_level2_shape_10_cylinder_height, $fn=extra_cut_level2_shape_10_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level2_shape_10_model=="SPHERE")
    {
        translate(extra_cut_level2_shape_10_sphere_translate)
        sphere(d=extra_cut_level2_shape_10_sphere_diameter, $fn=extra_cut_level2_shape_10_sphere_number_of_faces);
    }

    if (extra_cut_level2_shape_10_model=="STL")
    {
        translate(extra_cut_level2_shape_10_stl_translate)
        rotate(extra_cut_level2_shape_10_stl_rotation)
        import(extra_cut_level2_shape_10_stl_name);
    }

}
//END OF MODULE SHAPE 10 EXTRA CUTTING Level 2
//END OF EXTRA CUTTINGS OF LEVEL 2



module perform_chosen_cuts_level2() //LEVEL 2
{

    if(regular_row1_cut_use == "YES") regular_row1_complete();
    if(regular_row2_cut_use == "YES") regular_row2_complete();
    if(regular_row3_cut_use == "YES") regular_row3_complete();
    if(regular_row4_cut_use == "YES") regular_row4_complete();
    if(regular_row5_cut_use == "YES") regular_row5_complete();
    if(regular_row6_cut_use == "YES") regular_row6_complete();
    if(regular_sonic_cut_use == "YES") regular_sonic_complete();

    if(dimple_row1_cut_use == "YES") dimple_row1_complete();
    if(dimple_row2_cut_use == "YES") dimple_row2_complete();
    if(dimple_row3_cut_use == "YES") dimple_row3_complete();
    if(dimple_row4_cut_use == "YES") dimple_row4_complete();
    if(dimple_row5_cut_use == "YES") dimple_row5_complete();
    if(dimple_row6_cut_use == "YES") dimple_row6_complete();
    if(dimple_sonic_cut_use == "YES") dimple_sonic_complete();


    if(round_pump_cut_use == "YES")   round_pump_cut();

    if(lever_simple_lock_cut_use == "YES") lever_simple_cut_row1();

    if(lever_double_lock_cut_use == "YES")
    {
        if(lever_double_lock_row1_cut_use == "YES") lever_double_cut_row1();
        if(lever_double_lock_row2_cut_use == "YES") lever_double_cut_row2();

    }
    if(abloy_classic_cut_use == "YES")       abloy_classic_cut();
    if(abloy_disklock_cut_use == "YES")      abloy_disklock_cut();
    if(abloy_protec_cut_use == "YES")        abloy_protec_cut();
    if(abus_plus_cut == "YES")               abus_plus_cut();
    if(abus_x_plus_cut == "YES")             abus_x_plus_cut();
    if(universal_disk_use == "YES")          universal_disk_all_cuts();
    if(fichet_787_cut_use == "YES")          fichet_787_cut();


        if(extra_cut_level2_shape01_use == "YES")   extra_cut_level2_shape_01();
        if(extra_cut_level2_shape02_use == "YES")   extra_cut_level2_shape_02();
        if(extra_cut_level2_shape03_use == "YES")   extra_cut_level2_shape_03();
        if(extra_cut_level2_shape04_use == "YES")   extra_cut_level2_shape_04();
        if(extra_cut_level2_shape05_use == "YES")   extra_cut_level2_shape_05();
        if(extra_cut_level2_shape06_use == "YES")   extra_cut_level2_shape_06();
        if(extra_cut_level2_shape07_use == "YES")   extra_cut_level2_shape_07();
        if(extra_cut_level2_shape08_use == "YES")   extra_cut_level2_shape_08();
        if(extra_cut_level2_shape09_use == "YES")   extra_cut_level2_shape_09();
        if(extra_cut_level2_shape10_use == "YES")   extra_cut_level2_shape_10();

    if(regular_sonic_insert_use == "YES") regular_sonic_insert_cut();

    if(dimple_sonic_insert_use == "YES") dimple_sonic_insert_cut();
}
//END OF MODULE PERFORM CHOSEN CUTS OF LEVEL 2

// END OF ALL MODULES CUTTINGS LEVEL 2




//BEGINNING OF ADDITIONS OF LEVEL 3 (including key head and shoulder)
text_h = 3 ; //size
text_t = 2 ; //thickness


module automatic_key_head_and_shoulder()
{
    if (automatic_key_head_and_shoulder=="NO")
    {}

    if (automatic_key_head_and_shoulder=="YES")
    {
        if (type_of_key == "regular")
        {
            color ("blue")
            {
                //REGULAR SHOULDER
                translate ([0,-6/2,4.99])
                cube([regular_thickness+epsilon,6,10],center = true) ;


                //REGULAR KEY HEAD
                translate ([0,-13,4.99])
                cube([4,20,20],center = true) ;

                //TEXT ON REGULAR KEY HEAD
                translate([4/2-1,-20,9.5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }
        }


        if (type_of_key == "dimple")
        {

            color ("blue")
            {
                //DIMPLE SHOULDER
                translate ([dimple_width/2,-1.5,dimple_thickness/2])
                cube([11,3,dimple_thickness+0.05],center = true) ;

                //DIMPLE KEY HEAD
                translate ([dimple_width/2,-13,dimple_thickness/2])
                cube([20,20,dimple_thickness+1],center = true) ;

                //TEXT ON DIMPLE KEY HEAD
                translate([-0.5,-20,dimple_thickness-1])
                rotate([0,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }
        }




        if (type_of_key == "round_pump")
        {
            color ("blue")
            {
                translate ([0,round_pump_length+20/2-0.5,0])
                cube([4,20,20],center = true) ;

                //TEXT ON ROUND PUMP KEY HEAD
                translate([4/2-1,round_pump_length+2,5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }
        }


        if (type_of_key == "lever_simple")
        {
            color ("blue")
            {

                translate ([0,-9.5-lever_simple_body_length,0])
                cube([lever_simple_body_diameter,20,20],center = true) ;

                //TEXT ON LEVER LOCK SIMPLE KEY HEAD
                translate([lever_simple_body_diameter/2-1,-lever_simple_body_length-18,5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }
        }



        if (type_of_key == "lever_double")
        {
            color ("blue")
            {
                translate ([0,-9.5-lever_double_body_length,0])
                cube([lever_double_body_diameter,20,20],center = true) ;

               //TEXT ON LEVER LOCK DOUBLE KEY HEAD
                translate([lever_double_body_diameter/2-1,-lever_double_body_length-18,5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }
        }


        if (type_of_key == "abloy_classic")
        {
            color ("blue")
            {
                translate ([-qt_abloy_classic_thickness_qt-0.5,-20,-20/2])
                cube([qt_abloy_classic_thickness_qt+1,20,20],center = false) ;

                //TEXT ON ABLOY CLASSIC KEY HEAD
                translate([-text_t+0.5+1,-18,4.5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }



        }


        if (type_of_key == "abloy_disklock")
        {
            color ("blue")
            {
                translate ([0,-10,0])
                cube([4,20,20],center = true) ;


                //TEXT ON ABLOY DISKLOCK KEY HEAD
                translate([4/2-1,-18,4.5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }

        }


        if (type_of_key == "abloy_protec")
        {
            color ("blue")
            {
                translate ([0,-10,0])
                cube([4,20,20],center = true) ;


                //TEXT ON ABLOY DISKLOCK KEY HEAD
                translate([4/2-1,-18,4.5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }

        }

        if (type_of_key == "abus_plus")
        {
            color ("blue")
            {
                translate ([0,-10,0])
                cube([4,20,20],center = true) ;


                //TEXT ON ABUS PLUS KEY HEAD
                translate([4/2-1,-18,4.5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }

        }

        if (type_of_key == "abus_x_plus")
        {
            color ("blue")
            {
                translate ([0,-10,0])
                cube([4,20,20],center = true) ;


                //TEXT ON ABUS X PLUS KEY HEAD
                translate([4/2-1,-18,4.5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }

        }

        if (type_of_key == "universal_disk")
        {
            color ("blue")
            {
                translate ([-qt_universal_disk_key_width_qt/2-0.5,-20,-20/2])
                cube([qt_universal_disk_key_width_qt+1,20,20],center = false) ;

                //TEXT ON UNIVERSAL DISK KEY HEAD
                translate([qt_universal_disk_key_width_qt/2+0.5-text_t/2,-18,4.5])
                rotate([90,0,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }
            }



        }

        if (type_of_key == "fichet_787")
        {
            color ("blue")
            {
                //FICHET 787 SHOULDER
                translate ([0,26,fichet_787_height/2])
                rotate ([90,0,0])
                cylinder(h = 18, d=4, center = true, $fn=100);

                //FICHET 787 KEY HEAD
                translate ([0,44.5,7.5])
                cube([4.5,20,15],center = true) ;

                //TEXT ON FICHET 787 KEY HEAD
                translate([4.5/2+0.5-text_t/2,49,13])
                rotate([90,90,90])
                color("red"){
                        write(key_head_text_line1,h=text_h,t=text_t);
                    translate([0,-text_h-1,0])
                        write(key_head_text_line2,h=text_h,t=text_t);
                    translate([0,-2*(text_h+1),0])
                        write(key_head_text_line3,h=text_h,t=text_t);
                    translate([0,-3*(text_h+1),0])
                        write(key_head_text_line4,h=text_h,t=text_t);

                            }


            }

        }


    }
}
//END OF MODULE AUTOMATIC KEY HEAD


//MODULES SONIC INSERT KEY HEAD
module regular_sonic_key_head()
{
    translate([regular_sonic_insert_offset_x,0,regular_sonic_insert_offset_z])
    import(regular_sonic_insert_stl);
}

module dimple_sonic_key_head()
{
    if (regular_sonic_insert_stl == "") {}
        else
        {
    translate([dimple_sonic_insert_offset_x,0,dimple_sonic_insert_offset_z])
    import(dimple_sonic_insert_stl);
        }
}


module sonic_sonic_key_head()
{
    if (dimple_sonic_insert_stl == "") {}
        else
        {
    translate([dimple_sonic_insert_offset_x,0,dimple_sonic_insert_offset_z])
    import(dimple_sonic_insert_stl);
        }
}

//END MODULES SONIC INSERT KEY HEAD

//MODULES EXTRA MATERIAL LEVEL 3
//BEGINNING OF MODULES FOR THE 10 SHAPES EXTRA CUTTING Level 4
module extra_cut_level4_shape_01()
{

    if (extra_cut_level4_shape_01_model=="CUBE")
    {
        if(extra_cut_level4_shape_01_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_01_cube_translate)
            rotate(extra_cut_level4_shape_01_cube_rotation)
            cube(extra_cut_level4_shape_01_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_01_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_01_cube_translate)
            rotate(extra_cut_level4_shape_01_cube_rotation)
            cube(extra_cut_level4_shape_01_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_01_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_01_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_01_cylinder_translate)
            rotate(extra_cut_level4_shape_01_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_01_cylinder_diameter, h=extra_cut_level4_shape_01_cylinder_height, $fn=extra_cut_level4_shape_01_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_01_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_01_cylinder_translate)
            rotate(extra_cut_level4_shape_01_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_01_cylinder_diameter, h=extra_cut_level4_shape_01_cylinder_height, $fn=extra_cut_level4_shape_01_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_01_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_01_sphere_translate)
        sphere(d=extra_cut_level4_shape_01_sphere_diameter, $fn=extra_cut_level4_shape_01_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_01_model=="STL")
    {
        translate(extra_cut_level4_shape_01_stl_translate)
        rotate(extra_cut_level4_shape_01_stl_rotation)
        import(extra_cut_level4_shape_01_stl_name);
    }

}
//END OF MODULE SHAPE 01 EXTRA CUTTING Level 4

module extra_cut_level4_shape_02()
{

    if (extra_cut_level4_shape_02_model=="CUBE")
    {
        if(extra_cut_level4_shape_02_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_02_cube_translate)
            rotate(extra_cut_level4_shape_02_cube_rotation)
            cube(extra_cut_level4_shape_02_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_02_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_02_cube_translate)
            rotate(extra_cut_level4_shape_02_cube_rotation)
            cube(extra_cut_level4_shape_02_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_02_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_02_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_02_cylinder_translate)
            rotate(extra_cut_level4_shape_02_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_02_cylinder_diameter, h=extra_cut_level4_shape_02_cylinder_height, $fn=extra_cut_level4_shape_02_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_02_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_02_cylinder_translate)
            rotate(extra_cut_level4_shape_02_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_02_cylinder_diameter, h=extra_cut_level4_shape_02_cylinder_height, $fn=extra_cut_level4_shape_02_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_02_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_02_sphere_translate)
        sphere(d=extra_cut_level4_shape_02_sphere_diameter, $fn=extra_cut_level4_shape_02_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_02_model=="STL")
    {
        translate(extra_cut_level4_shape_02_stl_translate)
        rotate(extra_cut_level4_shape_02_stl_rotation)
        import(extra_cut_level4_shape_02_stl_name);
    }

}
//END OF MODULE SHAPE 02 EXTRA CUTTING Level 4

module extra_cut_level4_shape_03()
{

    if (extra_cut_level4_shape_03_model=="CUBE")
    {
        if(extra_cut_level4_shape_03_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_03_cube_translate)
            rotate(extra_cut_level4_shape_03_cube_rotation)
            cube(extra_cut_level4_shape_03_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_03_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_03_cube_translate)
            rotate(extra_cut_level4_shape_03_cube_rotation)
            cube(extra_cut_level4_shape_03_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_03_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_03_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_03_cylinder_translate)
            rotate(extra_cut_level4_shape_03_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_03_cylinder_diameter, h=extra_cut_level4_shape_03_cylinder_height, $fn=extra_cut_level4_shape_03_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_03_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_03_cylinder_translate)
            rotate(extra_cut_level4_shape_03_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_03_cylinder_diameter, h=extra_cut_level4_shape_03_cylinder_height, $fn=extra_cut_level4_shape_03_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_03_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_03_sphere_translate)
        sphere(d=extra_cut_level4_shape_03_sphere_diameter, $fn=extra_cut_level4_shape_03_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_03_model=="STL")
    {
        translate(extra_cut_level4_shape_03_stl_translate)
        rotate(extra_cut_level4_shape_03_stl_rotation)
        import(extra_cut_level4_shape_03_stl_name);
    }

}
//END OF MODULE SHAPE 03 EXTRA CUTTING Level 4


module extra_cut_level4_shape_04()
{

    if (extra_cut_level4_shape_04_model=="CUBE")
    {
        if(extra_cut_level4_shape_04_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_04_cube_translate)
            rotate(extra_cut_level4_shape_04_cube_rotation)
            cube(extra_cut_level4_shape_04_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_04_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_04_cube_translate)
            rotate(extra_cut_level4_shape_04_cube_rotation)
            cube(extra_cut_level4_shape_04_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_04_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_04_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_04_cylinder_translate)
            rotate(extra_cut_level4_shape_04_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_04_cylinder_diameter, h=extra_cut_level4_shape_04_cylinder_height, $fn=extra_cut_level4_shape_04_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_04_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_04_cylinder_translate)
            rotate(extra_cut_level4_shape_04_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_04_cylinder_diameter, h=extra_cut_level4_shape_04_cylinder_height, $fn=extra_cut_level4_shape_04_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_04_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_04_sphere_translate)
        sphere(d=extra_cut_level4_shape_04_sphere_diameter, $fn=extra_cut_level4_shape_04_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_04_model=="STL")
    {
        translate(extra_cut_level4_shape_04_stl_translate)
        rotate(extra_cut_level4_shape_04_stl_rotation)
        import(extra_cut_level4_shape_04_stl_name);
    }

}
//END OF MODULE SHAPE 04 EXTRA CUTTING Level 4


module extra_cut_level4_shape_05()
{

    if (extra_cut_level4_shape_05_model=="CUBE")
    {
        if(extra_cut_level4_shape_05_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_05_cube_translate)
            rotate(extra_cut_level4_shape_05_cube_rotation)
            cube(extra_cut_level4_shape_05_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_05_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_05_cube_translate)
            rotate(extra_cut_level4_shape_05_cube_rotation)
            cube(extra_cut_level4_shape_05_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_05_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_05_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_05_cylinder_translate)
            rotate(extra_cut_level4_shape_05_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_05_cylinder_diameter, h=extra_cut_level4_shape_05_cylinder_height, $fn=extra_cut_level4_shape_05_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_05_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_05_cylinder_translate)
            rotate(extra_cut_level4_shape_05_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_05_cylinder_diameter, h=extra_cut_level4_shape_05_cylinder_height, $fn=extra_cut_level4_shape_05_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_05_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_05_sphere_translate)
        sphere(d=extra_cut_level4_shape_05_sphere_diameter, $fn=extra_cut_level4_shape_05_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_05_model=="STL")
    {
        translate(extra_cut_level4_shape_05_stl_translate)
        rotate(extra_cut_level4_shape_05_stl_rotation)
        import(extra_cut_level4_shape_05_stl_name);
    }

}
//END OF MODULE SHAPE 05 EXTRA CUTTING Level 4


module extra_cut_level4_shape_06()
{

    if (extra_cut_level4_shape_06_model=="CUBE")
    {
        if(extra_cut_level4_shape_06_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_06_cube_translate)
            rotate(extra_cut_level4_shape_06_cube_rotation)
            cube(extra_cut_level4_shape_06_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_06_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_06_cube_translate)
            rotate(extra_cut_level4_shape_06_cube_rotation)
            cube(extra_cut_level4_shape_06_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_06_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_06_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_06_cylinder_translate)
            rotate(extra_cut_level4_shape_06_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_06_cylinder_diameter, h=extra_cut_level4_shape_06_cylinder_height, $fn=extra_cut_level4_shape_06_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_06_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_06_cylinder_translate)
            rotate(extra_cut_level4_shape_06_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_06_cylinder_diameter, h=extra_cut_level4_shape_06_cylinder_height, $fn=extra_cut_level4_shape_06_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_06_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_06_sphere_translate)
        sphere(d=extra_cut_level4_shape_06_sphere_diameter, $fn=extra_cut_level4_shape_06_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_06_model=="STL")
    {
        translate(extra_cut_level4_shape_06_stl_translate)
        rotate(extra_cut_level4_shape_06_stl_rotation)
        import(extra_cut_level4_shape_06_stl_name);
    }

}
//END OF MODULE SHAPE 06 EXTRA CUTTING Level 4


module extra_cut_level4_shape_07()
{

    if (extra_cut_level4_shape_07_model=="CUBE")
    {
        if(extra_cut_level4_shape_07_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_07_cube_translate)
            rotate(extra_cut_level4_shape_07_cube_rotation)
            cube(extra_cut_level4_shape_07_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_07_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_07_cube_translate)
            rotate(extra_cut_level4_shape_07_cube_rotation)
            cube(extra_cut_level4_shape_07_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_07_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_07_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_07_cylinder_translate)
            rotate(extra_cut_level4_shape_07_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_07_cylinder_diameter, h=extra_cut_level4_shape_07_cylinder_height, $fn=extra_cut_level4_shape_07_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_07_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_07_cylinder_translate)
            rotate(extra_cut_level4_shape_07_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_07_cylinder_diameter, h=extra_cut_level4_shape_07_cylinder_height, $fn=extra_cut_level4_shape_07_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_07_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_07_sphere_translate)
        sphere(d=extra_cut_level4_shape_07_sphere_diameter, $fn=extra_cut_level4_shape_07_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_07_model=="STL")
    {
        translate(extra_cut_level4_shape_07_stl_translate)
        rotate(extra_cut_level4_shape_07_stl_rotation)
        import(extra_cut_level4_shape_07_stl_name);
    }

}
//END OF MODULE SHAPE 07 EXTRA CUTTING Level 4


module extra_cut_level4_shape_08()
{

    if (extra_cut_level4_shape_08_model=="CUBE")
    {
        if(extra_cut_level4_shape_08_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_08_cube_translate)
            rotate(extra_cut_level4_shape_08_cube_rotation)
            cube(extra_cut_level4_shape_08_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_08_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_08_cube_translate)
            rotate(extra_cut_level4_shape_08_cube_rotation)
            cube(extra_cut_level4_shape_08_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_08_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_08_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_08_cylinder_translate)
            rotate(extra_cut_level4_shape_08_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_08_cylinder_diameter, h=extra_cut_level4_shape_08_cylinder_height, $fn=extra_cut_level4_shape_08_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_08_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_08_cylinder_translate)
            rotate(extra_cut_level4_shape_08_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_08_cylinder_diameter, h=extra_cut_level4_shape_08_cylinder_height, $fn=extra_cut_level4_shape_08_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_08_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_08_sphere_translate)
        sphere(d=extra_cut_level4_shape_08_sphere_diameter, $fn=extra_cut_level4_shape_08_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_08_model=="STL")
    {
        translate(extra_cut_level4_shape_08_stl_translate)
        rotate(extra_cut_level4_shape_08_stl_rotation)
        import(extra_cut_level4_shape_08_stl_name);
    }

}
//END OF MODULE SHAPE 08 EXTRA CUTTING Level 4


module extra_cut_level4_shape_09()
{

    if (extra_cut_level4_shape_09_model=="CUBE")
    {
        if(extra_cut_level4_shape_09_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_09_cube_translate)
            rotate(extra_cut_level4_shape_09_cube_rotation)
            cube(extra_cut_level4_shape_09_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_09_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_09_cube_translate)
            rotate(extra_cut_level4_shape_09_cube_rotation)
            cube(extra_cut_level4_shape_09_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_09_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_09_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_09_cylinder_translate)
            rotate(extra_cut_level4_shape_09_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_09_cylinder_diameter, h=extra_cut_level4_shape_09_cylinder_height, $fn=extra_cut_level4_shape_09_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_09_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_09_cylinder_translate)
            rotate(extra_cut_level4_shape_09_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_09_cylinder_diameter, h=extra_cut_level4_shape_09_cylinder_height, $fn=extra_cut_level4_shape_09_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_09_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_09_sphere_translate)
        sphere(d=extra_cut_level4_shape_09_sphere_diameter, $fn=extra_cut_level4_shape_09_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_09_model=="STL")
    {
        translate(extra_cut_level4_shape_09_stl_translate)
        rotate(extra_cut_level4_shape_09_stl_rotation)
        import(extra_cut_level4_shape_09_stl_name);
    }

}
//END OF MODULE SHAPE 09 EXTRA CUTTING Level 4


module extra_cut_level4_shape_10()
{

    if (extra_cut_level4_shape_10_model=="CUBE")
    {
        if(extra_cut_level4_shape_10_cube_centered=="YES")
        {
            translate(extra_cut_level4_shape_10_cube_translate)
            rotate(extra_cut_level4_shape_10_cube_rotation)
            cube(extra_cut_level4_shape_10_cube_dimensions, center=true);
        }

        if(extra_cut_level4_shape_10_cube_centered=="NO")
        {
            translate(extra_cut_level4_shape_10_cube_translate)
            rotate(extra_cut_level4_shape_10_cube_rotation)
            cube(extra_cut_level4_shape_10_cube_dimensions, center=false);
        }


    }

    if (extra_cut_level4_shape_10_model=="CYLINDER")
    {
        if(extra_cut_level4_shape_10_cylinder_centered=="YES")
        {
            translate(extra_cut_level4_shape_10_cylinder_translate)
            rotate(extra_cut_level4_shape_10_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_10_cylinder_diameter, h=extra_cut_level4_shape_10_cylinder_height, $fn=extra_cut_level4_shape_10_cylinder_number_of_faces, center=true);
        }

        if(extra_cut_level4_shape_10_cylinder_centered=="NO")
        {
            translate(extra_cut_level4_shape_10_cylinder_translate)
            rotate(extra_cut_level4_shape_10_cylinder_rotation)
            cylinder(d=extra_cut_level4_shape_10_cylinder_diameter, h=extra_cut_level4_shape_10_cylinder_height, $fn=extra_cut_level4_shape_10_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_cut_level4_shape_10_model=="SPHERE")
    {
        translate(extra_cut_level4_shape_10_sphere_translate)
        sphere(d=extra_cut_level4_shape_10_sphere_diameter, $fn=extra_cut_level4_shape_10_sphere_number_of_faces);
    }

    if (extra_cut_level4_shape_10_model=="STL")
    {
        translate(extra_cut_level4_shape_10_stl_translate)
        rotate(extra_cut_level4_shape_10_stl_rotation)
        import(extra_cut_level4_shape_10_stl_name);
    }

}
//END OF MODULE SHAPE 10 EXTRA CUTTING Level 4
//END OF EXTRA CUTTINGS OF Level 4
//BEGINNING OF MODULES FOR ADDING THE 10 SHAPES of Level 3
module extra_material_level3_shape_01()
{

    if (extra_material_level3_shape_01_model=="CUBE")
    {
        if(extra_material_level3_shape_01_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_01_cube_translate)
            rotate(extra_material_level3_shape_01_cube_rotation)
            cube(extra_material_level3_shape_01_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_01_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_01_cube_translate)
            rotate(extra_material_level3_shape_01_cube_rotation)
            cube(extra_material_level3_shape_01_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_01_model=="CYLINDER")
    {
        if(extra_material_level3_shape_01_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_01_cylinder_translate)
            rotate(extra_material_level3_shape_01_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_01_cylinder_diameter, h=extra_material_level3_shape_01_cylinder_height, $fn=extra_material_level3_shape_01_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_01_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_01_cylinder_translate)
            rotate(extra_material_level3_shape_01_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_01_cylinder_diameter, h=extra_material_level3_shape_01_cylinder_height, $fn=extra_material_level3_shape_01_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_01_model=="SPHERE")
    {
        translate(extra_material_level3_shape_01_sphere_translate)
        sphere(d=extra_material_level3_shape_01_sphere_diameter, $fn=extra_material_level3_shape_01_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_01_model=="STL")
    {
        translate(extra_material_level3_shape_01_stl_translate)
        rotate(extra_material_level3_shape_01_stl_rotation)
        import(extra_material_level3_shape_01_stl_name);
    }

}
//END OF MODULE SHAPE 01 of Level 3

module extra_material_level3_shape_02()
{

    if (extra_material_level3_shape_02_model=="CUBE")
    {
        if(extra_material_level3_shape_02_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_02_cube_translate)
            rotate(extra_material_level3_shape_02_cube_rotation)
            cube(extra_material_level3_shape_02_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_02_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_02_cube_translate)
            rotate(extra_material_level3_shape_02_cube_rotation)
            cube(extra_material_level3_shape_02_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_02_model=="CYLINDER")
    {
        if(extra_material_level3_shape_02_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_02_cylinder_translate)
            rotate(extra_material_level3_shape_02_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_02_cylinder_diameter, h=extra_material_level3_shape_02_cylinder_height, $fn=extra_material_level3_shape_02_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_02_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_02_cylinder_translate)
            rotate(extra_material_level3_shape_02_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_02_cylinder_diameter, h=extra_material_level3_shape_02_cylinder_height, $fn=extra_material_level3_shape_02_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_02_model=="SPHERE")
    {
        translate(extra_material_level3_shape_02_sphere_translate)
        sphere(d=extra_material_level3_shape_02_sphere_diameter, $fn=extra_material_level3_shape_02_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_02_model=="STL")
    {
        translate(extra_material_level3_shape_02_stl_translate)
        rotate(extra_material_level3_shape_02_stl_rotation)
        import(extra_material_level3_shape_02_stl_name);
    }

}
//END OF MODULE SHAPE 02 of Level 3

module extra_material_level3_shape_03()
{

    if (extra_material_level3_shape_03_model=="CUBE")
    {
        if(extra_material_level3_shape_03_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_03_cube_translate)
            rotate(extra_material_level3_shape_03_cube_rotation)
            cube(extra_material_level3_shape_03_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_03_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_03_cube_translate)
            rotate(extra_material_level3_shape_03_cube_rotation)
            cube(extra_material_level3_shape_03_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_03_model=="CYLINDER")
    {
        if(extra_material_level3_shape_03_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_03_cylinder_translate)
            rotate(extra_material_level3_shape_03_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_03_cylinder_diameter, h=extra_material_level3_shape_03_cylinder_height, $fn=extra_material_level3_shape_03_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_03_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_03_cylinder_translate)
            rotate(extra_material_level3_shape_03_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_03_cylinder_diameter, h=extra_material_level3_shape_03_cylinder_height, $fn=extra_material_level3_shape_03_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_03_model=="SPHERE")
    {
        translate(extra_material_level3_shape_03_sphere_translate)
        sphere(d=extra_material_level3_shape_03_sphere_diameter, $fn=extra_material_level3_shape_03_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_03_model=="STL")
    {
        translate(extra_material_level3_shape_03_stl_translate)
        rotate(extra_material_level3_shape_03_stl_rotation)
        import(extra_material_level3_shape_03_stl_name);
    }

}
//END OF MODULE SHAPE 03 of Level 3


module extra_material_level3_shape_04()
{

    if (extra_material_level3_shape_04_model=="CUBE")
    {
        if(extra_material_level3_shape_04_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_04_cube_translate)
            rotate(extra_material_level3_shape_04_cube_rotation)
            cube(extra_material_level3_shape_04_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_04_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_04_cube_translate)
            rotate(extra_material_level3_shape_04_cube_rotation)
            cube(extra_material_level3_shape_04_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_04_model=="CYLINDER")
    {
        if(extra_material_level3_shape_04_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_04_cylinder_translate)
            rotate(extra_material_level3_shape_04_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_04_cylinder_diameter, h=extra_material_level3_shape_04_cylinder_height, $fn=extra_material_level3_shape_04_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_04_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_04_cylinder_translate)
            rotate(extra_material_level3_shape_04_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_04_cylinder_diameter, h=extra_material_level3_shape_04_cylinder_height, $fn=extra_material_level3_shape_04_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_04_model=="SPHERE")
    {
        translate(extra_material_level3_shape_04_sphere_translate)
        sphere(d=extra_material_level3_shape_04_sphere_diameter, $fn=extra_material_level3_shape_04_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_04_model=="STL")
    {
        translate(extra_material_level3_shape_04_stl_translate)
        rotate(extra_material_level3_shape_04_stl_rotation)
        import(extra_material_level3_shape_04_stl_name);
    }

}
//END OF MODULE SHAPE 04 of Level 3


module extra_material_level3_shape_05()
{

    if (extra_material_level3_shape_05_model=="CUBE")
    {
        if(extra_material_level3_shape_05_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_05_cube_translate)
            rotate(extra_material_level3_shape_05_cube_rotation)
            cube(extra_material_level3_shape_05_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_05_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_05_cube_translate)
            rotate(extra_material_level3_shape_05_cube_rotation)
            cube(extra_material_level3_shape_05_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_05_model=="CYLINDER")
    {
        if(extra_material_level3_shape_05_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_05_cylinder_translate)
            rotate(extra_material_level3_shape_05_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_05_cylinder_diameter, h=extra_material_level3_shape_05_cylinder_height, $fn=extra_material_level3_shape_05_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_05_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_05_cylinder_translate)
            rotate(extra_material_level3_shape_05_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_05_cylinder_diameter, h=extra_material_level3_shape_05_cylinder_height, $fn=extra_material_level3_shape_05_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_05_model=="SPHERE")
    {
        translate(extra_material_level3_shape_05_sphere_translate)
        sphere(d=extra_material_level3_shape_05_sphere_diameter, $fn=extra_material_level3_shape_05_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_05_model=="STL")
    {
        translate(extra_material_level3_shape_05_stl_translate)
        rotate(extra_material_level3_shape_05_stl_rotation)
        import(extra_material_level3_shape_05_stl_name);
    }

}
//END OF MODULE SHAPE 05 of Level 3


module extra_material_level3_shape_06()
{

    if (extra_material_level3_shape_06_model=="CUBE")
    {
        if(extra_material_level3_shape_06_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_06_cube_translate)
            rotate(extra_material_level3_shape_06_cube_rotation)
            cube(extra_material_level3_shape_06_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_06_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_06_cube_translate)
            rotate(extra_material_level3_shape_06_cube_rotation)
            cube(extra_material_level3_shape_06_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_06_model=="CYLINDER")
    {
        if(extra_material_level3_shape_06_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_06_cylinder_translate)
            rotate(extra_material_level3_shape_06_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_06_cylinder_diameter, h=extra_material_level3_shape_06_cylinder_height, $fn=extra_material_level3_shape_06_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_06_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_06_cylinder_translate)
            rotate(extra_material_level3_shape_06_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_06_cylinder_diameter, h=extra_material_level3_shape_06_cylinder_height, $fn=extra_material_level3_shape_06_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_06_model=="SPHERE")
    {
        translate(extra_material_level3_shape_06_sphere_translate)
        sphere(d=extra_material_level3_shape_06_sphere_diameter, $fn=extra_material_level3_shape_06_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_06_model=="STL")
    {
        translate(extra_material_level3_shape_06_stl_translate)
        rotate(extra_material_level3_shape_06_stl_rotation)
        import(extra_material_level3_shape_06_stl_name);
    }

}
//END OF MODULE SHAPE 06 of Level 3


module extra_material_level3_shape_07()
{

    if (extra_material_level3_shape_07_model=="CUBE")
    {
        if(extra_material_level3_shape_07_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_07_cube_translate)
            rotate(extra_material_level3_shape_07_cube_rotation)
            cube(extra_material_level3_shape_07_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_07_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_07_cube_translate)
            rotate(extra_material_level3_shape_07_cube_rotation)
            cube(extra_material_level3_shape_07_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_07_model=="CYLINDER")
    {
        if(extra_material_level3_shape_07_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_07_cylinder_translate)
            rotate(extra_material_level3_shape_07_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_07_cylinder_diameter, h=extra_material_level3_shape_07_cylinder_height, $fn=extra_material_level3_shape_07_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_07_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_07_cylinder_translate)
            rotate(extra_material_level3_shape_07_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_07_cylinder_diameter, h=extra_material_level3_shape_07_cylinder_height, $fn=extra_material_level3_shape_07_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_07_model=="SPHERE")
    {
        translate(extra_material_level3_shape_07_sphere_translate)
        sphere(d=extra_material_level3_shape_07_sphere_diameter, $fn=extra_material_level3_shape_07_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_07_model=="STL")
    {
        translate(extra_material_level3_shape_07_stl_translate)
        rotate(extra_material_level3_shape_07_stl_rotation)
        import(extra_material_level3_shape_07_stl_name);
    }

}
//END OF MODULE SHAPE 07 of Level 3


module extra_material_level3_shape_08()
{

    if (extra_material_level3_shape_08_model=="CUBE")
    {
        if(extra_material_level3_shape_08_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_08_cube_translate)
            rotate(extra_material_level3_shape_08_cube_rotation)
            cube(extra_material_level3_shape_08_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_08_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_08_cube_translate)
            rotate(extra_material_level3_shape_08_cube_rotation)
            cube(extra_material_level3_shape_08_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_08_model=="CYLINDER")
    {
        if(extra_material_level3_shape_08_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_08_cylinder_translate)
            rotate(extra_material_level3_shape_08_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_08_cylinder_diameter, h=extra_material_level3_shape_08_cylinder_height, $fn=extra_material_level3_shape_08_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_08_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_08_cylinder_translate)
            rotate(extra_material_level3_shape_08_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_08_cylinder_diameter, h=extra_material_level3_shape_08_cylinder_height, $fn=extra_material_level3_shape_08_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_08_model=="SPHERE")
    {
        translate(extra_material_level3_shape_08_sphere_translate)
        sphere(d=extra_material_level3_shape_08_sphere_diameter, $fn=extra_material_level3_shape_08_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_08_model=="STL")
    {
        translate(extra_material_level3_shape_08_stl_translate)
        rotate(extra_material_level3_shape_08_stl_rotation)
        import(extra_material_level3_shape_08_stl_name);
    }

}
//END OF MODULE SHAPE 08 of Level 3


module extra_material_level3_shape_09()
{

    if (extra_material_level3_shape_09_model=="CUBE")
    {
        if(extra_material_level3_shape_09_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_09_cube_translate)
            rotate(extra_material_level3_shape_09_cube_rotation)
            cube(extra_material_level3_shape_09_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_09_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_09_cube_translate)
            rotate(extra_material_level3_shape_09_cube_rotation)
            cube(extra_material_level3_shape_09_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_09_model=="CYLINDER")
    {
        if(extra_material_level3_shape_09_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_09_cylinder_translate)
            rotate(extra_material_level3_shape_09_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_09_cylinder_diameter, h=extra_material_level3_shape_09_cylinder_height, $fn=extra_material_level3_shape_09_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_09_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_09_cylinder_translate)
            rotate(extra_material_level3_shape_09_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_09_cylinder_diameter, h=extra_material_level3_shape_09_cylinder_height, $fn=extra_material_level3_shape_09_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_09_model=="SPHERE")
    {
        translate(extra_material_level3_shape_09_sphere_translate)
        sphere(d=extra_material_level3_shape_09_sphere_diameter, $fn=extra_material_level3_shape_09_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_09_model=="STL")
    {
        translate(extra_material_level3_shape_09_stl_translate)
        rotate(extra_material_level3_shape_09_stl_rotation)
        import(extra_material_level3_shape_09_stl_name);
    }

}
//END OF MODULE SHAPE 09 of Level 3


module extra_material_level3_shape_10()
{

    if (extra_material_level3_shape_10_model=="CUBE")
    {
        if(extra_material_level3_shape_10_cube_centered=="YES")
        {
            translate(extra_material_level3_shape_10_cube_translate)
            rotate(extra_material_level3_shape_10_cube_rotation)
            cube(extra_material_level3_shape_10_cube_dimensions, center=true);
        }

        if(extra_material_level3_shape_10_cube_centered=="NO")
        {
            translate(extra_material_level3_shape_10_cube_translate)
            rotate(extra_material_level3_shape_10_cube_rotation)
            cube(extra_material_level3_shape_10_cube_dimensions, center=false);
        }


    }

    if (extra_material_level3_shape_10_model=="CYLINDER")
    {
        if(extra_material_level3_shape_10_cylinder_centered=="YES")
        {
            translate(extra_material_level3_shape_10_cylinder_translate)
            rotate(extra_material_level3_shape_10_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_10_cylinder_diameter, h=extra_material_level3_shape_10_cylinder_height, $fn=extra_material_level3_shape_10_cylinder_number_of_faces, center=true);
        }

        if(extra_material_level3_shape_10_cylinder_centered=="NO")
        {
            translate(extra_material_level3_shape_10_cylinder_translate)
            rotate(extra_material_level3_shape_10_cylinder_rotation)
            cylinder(d=extra_material_level3_shape_10_cylinder_diameter, h=extra_material_level3_shape_10_cylinder_height, $fn=extra_material_level3_shape_10_cylinder_number_of_faces, center=false);
        }
    }

    if (extra_material_level3_shape_10_model=="SPHERE")
    {
        translate(extra_material_level3_shape_10_sphere_translate)
        sphere(d=extra_material_level3_shape_10_sphere_diameter, $fn=extra_material_level3_shape_10_sphere_number_of_faces);
    }

    if (extra_material_level3_shape_10_model=="STL")
    {
        translate(extra_material_level3_shape_10_stl_translate)
        rotate(extra_material_level3_shape_10_stl_rotation)
        import(extra_material_level3_shape_10_stl_name);
    }

}
//END OF MODULE ADDING SHAPE 10 of Level 3

module extra_material_level3_use()
{
        if(extra_material_level3_shape01_use == "YES")   extra_material_level3_shape_01();
        if(extra_material_level3_shape02_use == "YES")   extra_material_level3_shape_02();
        if(extra_material_level3_shape03_use == "YES")   extra_material_level3_shape_03();
        if(extra_material_level3_shape04_use == "YES")   extra_material_level3_shape_04();
        if(extra_material_level3_shape05_use == "YES")   extra_material_level3_shape_05();
        if(extra_material_level3_shape06_use == "YES")   extra_material_level3_shape_06();
        if(extra_material_level3_shape07_use == "YES")   extra_material_level3_shape_07();
        if(extra_material_level3_shape08_use == "YES")   extra_material_level3_shape_08();
        if(extra_material_level3_shape09_use == "YES")   extra_material_level3_shape_09();
        if(extra_material_level3_shape10_use == "YES")   extra_material_level3_shape_10();

   if(regular_sonic_insert_use == "YES") regular_sonic_key_head();

   if(dimple_sonic_insert_use == "YES") dimple_sonic_key_head();


}
//END OF MODULE ADDING CHOSEN SHAPES of Level 3
//END OF ADDITIONS OF LEVEL 3
//END OF ALL MODULES LEVEL 3

//BEGINNING OF CUTTINGS OF LEVEL 4
module perform_chosen_cuts_level4() //LEVEL 2
{

        if(extra_cut_level4_shape01_use == "YES")   extra_cut_level4_shape_01();
        if(extra_cut_level4_shape02_use == "YES")   extra_cut_level4_shape_02();
        if(extra_cut_level4_shape03_use == "YES")   extra_cut_level4_shape_03();
        if(extra_cut_level4_shape04_use == "YES")   extra_cut_level4_shape_04();
        if(extra_cut_level4_shape05_use == "YES")   extra_cut_level4_shape_05();
        if(extra_cut_level4_shape06_use == "YES")   extra_cut_level4_shape_06();
        if(extra_cut_level4_shape07_use == "YES")   extra_cut_level4_shape_07();
        if(extra_cut_level4_shape08_use == "YES")   extra_cut_level4_shape_08();
        if(extra_cut_level4_shape09_use == "YES")   extra_cut_level4_shape_09();
        if(extra_cut_level4_shape10_use == "YES")   extra_cut_level4_shape_10();


}
//END OF MODULE PERFORM CHOSEN CUTS OF LEVEL 4
//END OF CUTTINGS OF LEVEL 4


//FINAL
difference() // MAIN DIFF LEVEL 4
{
    union() //LEVEL 1,2 AND 3
    {
        //BLANK CREATION + Additional material - cuts of level 2
        difference() //Level 2
        {
            union() //LEVEL 1
            {
                generate_blank(type_of_key); //LEVEL 1
                extra_material_level1_use(); //Level 1
            }

            perform_chosen_cuts_level2(); //LEVEL 2

            //reversible keys
            if(dimple_make_reversible == "YES")
            {
                translate([dimple_width,0,dimple_thickness])
                rotate([0,180,0])
                translate([0,0,0])
                perform_chosen_cuts_level2(); //LEVEL 2
            }
        }

            //Additions Level 3
            automatic_key_head_and_shoulder();
            extra_material_level3_use(); //Level 3
    }

    perform_chosen_cuts_level4();
}//END OF MAIN DIFF LEVEL 4

if(show_chosen_cuts_level2 == "YES")
{
    perform_chosen_cuts_level2();


    //reversible keys
    if(dimple_make_reversible == "YES")
    {
        translate([dimple_width,0,dimple_thickness])
        rotate([0,180,0])
        translate([0,0,0])
        perform_chosen_cuts_level2();
    }
}

if(show_chosen_cuts_level4 == "YES")
{
    perform_chosen_cuts_level4();

}

//////////////// PIN BOX


tolerance2 = qt_tolerance2_qt;
pin_box_number_of_pins = qt_pin_box_number_of_pins_qt ;
pin_box_number_of_wafers = qt_pin_box_number_of_wafers_qt ;
pin_box_hole_width = qt_pin_box_hole_width_qt ;
pin_box_pin_length = qt_pin_box_pin_length_qt ;
pin_box_wafer_length = qt_pin_box_wafer_length_qt ;
pin_box_driver_length = qt_pin_box_driver_length_qt ;
pin_box_spring_length = qt_pin_box_spring_length_qt ;
pin_box_groove_depth = qt_pin_box_groove_depth_qt ; //depth of holes, 3.5 is good
pin_box_final = qt_pin_box_final_qt;
pin_box_slider_final = qt_pin_box_slider_final_qt;



pin_box_bottom_thickness = 1 ;

pin_box_x_space = 1 ;
pin_box_y_space = 1 ;

pin_box_x_side_space = 2 ;
pin_box_y_side_space = pin_box_x_side_space + 1 ;
pin_box_y_side_space_bottom = pin_box_x_side_space ;

pin_box_x_start = pin_box_x_side_space +  pin_box_hole_width/2 ;

pin_box_move_for_numeros = 0 ;

pin_box_rayon = 5 ;
pin_box_diam = pin_box_rayon * 2 ;
pin_box_larg = pin_box_y_side_space + pin_box_pin_length + pin_box_number_of_wafers * (pin_box_y_space + pin_box_wafer_length) + pin_box_y_space + pin_box_driver_length + pin_box_y_space + pin_box_spring_length + pin_box_y_side_space_bottom + pin_box_move_for_numeros ;
pin_box_long = pin_box_x_side_space + pin_box_number_of_pins * pin_box_hole_width + (pin_box_number_of_pins-1) * pin_box_x_space + pin_box_x_side_space ;
pin_box_ep = pin_box_groove_depth + pin_box_bottom_thickness ;
pin_box_ep2 = pin_box_ep/2 ;



pin_box_y_pin = pin_box_larg - ( pin_box_y_side_space + pin_box_pin_length/2) ;
pin_box_y_wafer = pin_box_larg - (pin_box_y_side_space + pin_box_pin_length + pin_box_y_space + pin_box_wafer_length/2) ;
pin_box_y_driver = pin_box_larg - (pin_box_y_side_space + pin_box_pin_length + pin_box_number_of_wafers * (pin_box_y_space + pin_box_wafer_length) + pin_box_y_space + pin_box_driver_length/2);
pin_box_y_spring = pin_box_larg - (pin_box_y_side_space + pin_box_pin_length + pin_box_number_of_wafers * (pin_box_y_space + pin_box_wafer_length) + pin_box_y_space + pin_box_driver_length + pin_box_y_space + pin_box_spring_length/2);


pin_box_slide_x = 1 ;
pin_box_slide_angle = 30 ;
pin_box_diam_clic = 2 ;
pin_box_long_clic = 20 ;
pin_box_heigth_clic = -0.3 ;

module donothing()
{
}

module pin_box_hole(pin_box_hole_width, pin_box_hole_length, pin_box_hole_depth = pin_box_groove_depth)
{
color ("red")
{
translate([0,0,pin_box_bottom_thickness])
resize([pin_box_hole_width, pin_box_hole_length, pin_box_hole_depth+epsilon])
cylinder(d=pin_box_hole_width, h=pin_box_groove_depth+epsilon, center=false);
}
}

module pin_box_pin_hole()
{
translate([0,pin_box_y_pin,0])
pin_box_hole(pin_box_hole_width,pin_box_pin_length) ;
}

module pin_box_wafer_hole()
{
translate([0,pin_box_y_wafer,0])
for (i = [0 : pin_box_number_of_wafers-1])
{
translate([0,-i*(pin_box_wafer_length+pin_box_y_space),0])
pin_box_hole(pin_box_hole_width,pin_box_wafer_length) ;
}
}

module pin_box_driver_hole()
{
translate([0,pin_box_y_driver,0])
pin_box_hole(pin_box_hole_width,pin_box_driver_length) ;
}

module pin_box_spring_hole()
{
translate([0,pin_box_y_spring,0])
pin_box_hole(pin_box_hole_width,pin_box_spring_length) ;
}

module pin_box_big_spring_hole()
{
color ("blue")
{
translate([pin_box_long/2 - (pin_box_long-2*pin_box_x_side_space)/2,pin_box_y_spring - pin_box_spring_length/2,pin_box_bottom_thickness])
cube([pin_box_long-2*pin_box_x_side_space, pin_box_spring_length, pin_box_groove_depth+epsilon ]) ;
}
}


module pin_box_all_holes()
{
translate([pin_box_x_start,0,0])
for (i = [0 : pin_box_number_of_pins-1])
{
translate([i*(pin_box_hole_width+pin_box_x_space),0,0])
{
pin_box_pin_hole();
pin_box_wafer_hole();
pin_box_driver_hole();
pin_box_spring_hole();
}
}
}

module pin_box_all_holes_with_big_spring()
{
translate([pin_box_x_start,0,0])
for (i = [0 : pin_box_number_of_pins-1])
{
translate([i*(pin_box_hole_width+pin_box_x_space),0,0])
{
pin_box_pin_hole();

if (pin_box_number_of_wafers==0)
{
donothing();
}
else
{
pin_box_wafer_hole();
}


pin_box_driver_hole();

}
}
pin_box_big_spring_hole();
}

module pin_box_clic(a=pin_box_diam_clic, b=pin_box_long_clic)
{
translate([pin_box_long/2, pin_box_larg-pin_box_diam_clic*0.75, pin_box_ep + pin_box_heigth_clic])
rotate([0,90,0])
cylinder(d=a, h=b, center=true);
}


module pin_box_box2()
{
cube([pin_box_long,pin_box_larg,pin_box_ep]);

}





module pin_box_slide()
{
difference()
{
translate([-2*tolerance2,-epsilon,pin_box_ep-pin_box_slide_x * 2])
cube([pin_box_slide_x + 2*tolerance2, pin_box_larg + 2* epsilon, pin_box_slide_x * 2]);

translate([pin_box_slide_x, -2*epsilon, pin_box_ep-pin_box_slide_x * 2])
rotate([0,-pin_box_slide_angle, 0])
cube([pin_box_slide_x*2, pin_box_larg + 4* epsilon, pin_box_slide_x * 4]);
}
}

module pin_box_both_slide()
{
pin_box_slide();
translate([pin_box_long,0,0])
mirror([1,0,0])
pin_box_slide();
}

module pin_box_box_slide()
{
difference()
{
pin_box_box2();
pin_box_both_slide();
}
}


module pin_box_numeros()
{

color("red"){

    translate([3,pin_box_larg-10,pin_box_ep-1])
    {
translate ([0, 0, 0])
write("1",h=5.5,t=2);

translate ([pin_box_hole_width+1.5, 0, 0])
write("2",h=5.5,t=2);

translate ([(pin_box_hole_width+1.5)*2, 0, 0])
write("3",h=5.5,t=2);

translate ([(pin_box_hole_width+1.3)*3, 0, 0])
write("4",h=5.5,t=2);

translate ([(pin_box_hole_width+1.3)*4, 0, 0])
write("5",h=5.5,t=2);

translate ([(pin_box_hole_width+1.15)*5, 0, 0])
write("6",h=5.5,t=2);

translate ([(pin_box_hole_width+1.15)*6, 0, 0])
write("7",h=5.5,t=2);


    }
}
}

module pin_box_box_final()
{
pin_box_clic();
difference()
{
pin_box_box_slide();

//pin_box_numeros();
translate([0,-pin_box_move_for_numeros,0])
    {
//pin_box_all_holes();
pin_box_all_holes_with_big_spring();
    }
}
}

module pin_box_box_enlarge()
{
translate([pin_box_long/2,0,-pin_box_heigth_clic])
scale([1.1, 1,1])
translate([-pin_box_long/2,0,0])
pin_box_clic();

translate([pin_box_long/2,-tolerance2,0])
resize ([pin_box_long+2*tolerance2, pin_box_larg+2*tolerance2, pin_box_ep])
translate([-pin_box_long/2,0,0])
pin_box_box_slide();
}



module pin_box_slider_block()
{
translate([-pin_box_slide_x-tolerance2, -10, pin_box_ep-2*pin_box_slide_x])
cube([pin_box_long+2*tolerance2+2*pin_box_slide_x, pin_box_larg+10, pin_box_ep+2*pin_box_slide_x-(pin_box_ep-pin_box_slide_x)]);
}

module pin_box_slider_final()
{
translate([-pin_box_slide_x-10, pin_box_slide_x, pin_box_ep+pin_box_slide_x])
rotate([0,-180,0])
difference()
{
pin_box_slider_block();
pin_box_box_enlarge();

translate([0,-8-1, pin_box_ep-2*pin_box_slide_x-epsilon])
cube ([pin_box_long, 8, 2*pin_box_slide_x+epsilon]);
}
}

if (type_of_key == "pin_box")
{
    if (pin_box_final == "YES")
        pin_box_box_final();
    if (pin_box_slider_final == "YES")
        pin_box_slider_final();
}







