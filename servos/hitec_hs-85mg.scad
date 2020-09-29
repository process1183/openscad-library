/**
 * Hitec HS-85MG Micro Servo Dimensions
 * https://hitecrcd.com/products/servos/micro-and-mini-servos/analog-micro-and-mini-servos/hs-85mg/product
 * https://www.servocity.com/hs-85mg
 * https://github.com/process1183/openscad-library
 * Copyright (C) 2020  Josh Gadeken
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

hs85mg_main_body = [
    29.1,
    13,
    29.9
];

hs85mg_main_body_with_flanges = [
    40,
    hs85mg_main_body.y,
    hs85mg_main_body.z
];

// Bottom of servo to mounting flanges
hs85mg_flange_location_z = 18.5;

// Distance between wire and mounting flange
hs85mg_flange_wire_space = 13.5;

hs85mg_flange_dimensions = [
    (hs85mg_main_body_with_flanges.x - hs85mg_main_body.x) / 2,
    12,
    2
];

hs85mg_flange_screw_hole_diameter = 4.5;

hs85mg_flange_screw_hole_locations = [
    for(x = [2.2, 37.8]) [
        x,
        hs85mg_main_body.y / 2,
        hs85mg_flange_location_z
    ]
];

// Output shaft location does /not/ include mounting flanges
// Location is the center of the bottom of the output shaft
hs85mg_output_shaft_location = [
    6.55,
    hs85mg_main_body.y / 2,
    hs85mg_main_body.z
];

hs85mg_output_shaft_diameter = 0;
hs85mg_output_shaft_height = 3.7;

// Double Arm Horn (dah) dimensions
hs85mg_dah_length = 29;
hs85mg_dah_thickness = 1.6;
hs85mg_dah_center_width = 8;
hs85mg_dah_end_width = 4;
hs85mg_dah_screw_shroud_diameter = 7;
hs85mg_dah_screw_shroud_height = 0.8;

// Diameter for the six arm screw holes
hs85mg_dah_screw_hole_diameter = 1.15;

// Distance from center of horn to the three screw holes.
// Distances are the same for both sides of the arm.
hs85mg_dah_screw_hole_distances = [7.575, 10.075, 12.575];

// Distance from bottom of servo (Z = 0) to center of double arm horn
hs85mg_dah_installed_z_center = 34.2;
