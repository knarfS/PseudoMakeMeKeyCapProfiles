use <MX_DES_Thumb.scad>
use <sprues_util.scad>

// Thumb keys
des_thumbs();

module des_thumbs() {
    key_ids = [19, 18, 18, 16, 13, 13, 16, 18, 18, 19];
    key_home_dots = [false, false, true, false, false, false, false, true, false, false];
    key_mirror = [1, 1, 1, 0, 1, 0, 1, 0, 0, 0];
    
    cap_spacing = BottomWidth(key_ids[0]) + 2.0;
    cap_bottom_length = BottomLength(key_ids[0]);
    
    for (i=[0:len(key_ids)-1]) {
        translate([i*cap_spacing, 0, 0])
            mirror([key_mirror[i], 0, 0])
                keycap(keyID = key_ids[i], cutLen = 0, visualizeDish = false,
                   rossSection = false, Dish = true, Stem = true,
                   crossSection = false, Legends = false,
                   homeDot = key_home_dots[i], Stab = 0);
    }

    // If only one cap, no connector parts are added
    if (len(key_ids) > 1) {
        for (i=[0:len(key_ids)-1]) {
            create_sprues(i*cap_spacing, cap_bottom_length);
        }
        
        create_connector_link(len(key_ids), cap_spacing, cap_bottom_length);
    }
}
