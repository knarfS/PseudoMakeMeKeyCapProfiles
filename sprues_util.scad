// config values for sprues
sprues_dia = 2;    // diameter of sprues (mm)
sprues_len = 3.5;    // length of sprues (mm)
sprues_cap_intrude = 0.1; // intrusion depth of sprues into the cap (mm)
sprues_y_offset = 0.55; // adjustment for y offset (mm)
connector_link_dia = 3; // diameter of linking cylinder  (mm)
cylinder_fn = 32; // resolution of cylinders

// Create a vertical sprues attached to the cap's outer wall.
module create_sprues(xpos, cap_bottom_length) {
    y = -cap_bottom_length / 2 + sprues_y_offset;
    z = -sprues_len + sprues_cap_intrude;
    translate([xpos, y, z])
        cylinder(h = sprues_len, d = sprues_dia, $fn = cylinder_fn);
}

// Create horizontal linking cylinder between the sprueses.
module create_connector_link(num_caps, cap_spacing, cap_bottom_length) {
    y = -cap_bottom_length / 2 + sprues_y_offset;
    x = -(sprues_dia / 2);
    z = -sprues_len + sprues_cap_intrude;
    connector_len = (num_caps - 1) * cap_spacing + sprues_dia;
    translate([x, y, z])
        rotate([0, 90, 0])
            cylinder(h = connector_len, d = connector_link_dia, $fn = cylinder_fn);
}