use <MX_DES_Standard.scad>
use <sprues_util.scad>

// R4
//des_rX(keyID = 0, num_caps = 10);
// R3
//des_rX(keyID = 1, num_caps = 10);
// R2
//des_rX(keyID = 2, num_caps = 10);
// R3 homing keys
des_rX(keyID = 1, num_caps = 6, homeDot = true);

module des_rX(keyID, num_caps, homeDot = false) {
    cap_spacing = BottomWidth(keyID) + 2.0;
    cap_bottom_length = BottomLength(keyID);
    
    for (i=[0:num_caps-1]) {
        translate([i*cap_spacing, 0, 0])
            mirror([0,0,0])
                keycap(keyID = keyID, cutLen = 0, visualizeDish = false,
                   rossSection = false, Dish = true, Stem = true,
                   crossSection = false, Legends = false,
                   homeDot = homeDot, Stab = 0);
    }

    // If only one cap, no connector parts are added
    if (num_caps > 1) {
        for (i=[0:num_caps-1]) {
            create_sprues(i*cap_spacing, cap_bottom_length);
        }
        
        create_connector_link(num_caps, cap_spacing, cap_bottom_length);
    }
}
