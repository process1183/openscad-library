/**
 * Cherry MX Mechanical Key Switch Mounting Plate
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

// https://cdn.sparkfun.com/datasheets/Components/Switches/MX%20Series.pdf
cherry_plate_dimensions = [24, 24, 1.5];

cherry_plate_switch_cutout = [14, 14, cherry_plate_dimensions.z];

cherry_plate_switch_cutout_position = [
    (cherry_plate_dimensions.x - cherry_plate_switch_cutout.x) / 2,
    (cherry_plate_dimensions.y - cherry_plate_switch_cutout.y) / 2,
    0
];

// Screw holes for #2-56 screws
cherry_plate_screw_hole_diameter = 2.5;

_cpshetc = (cherry_plate_screw_hole_diameter / 2) + 1;
cherry_plate_screw_locations = [
    [_cpshetc, _cpshetc, 0], // Bottom left
    [_cpshetc, cherry_plate_dimensions.y - _cpshetc, 0], // Top left
    [cherry_plate_dimensions.x - _cpshetc, cherry_plate_dimensions.y - _cpshetc, 0], // Top right
    [cherry_plate_dimensions.x - _cpshetc, _cpshetc, 0] // Bottom right
];



module CherryMXSwitchPlate() {
    difference() {
        cube(cherry_plate_dimensions);

        translate(cherry_plate_switch_cutout_position) {
            cube(cherry_plate_switch_cutout);
        }

        for(cpsh = cherry_plate_screw_locations) {
            translate(cpsh) {
                cylinder(d = cherry_plate_screw_hole_diameter, h = cherry_plate_dimensions.z, $fn = 60);
            }
        }
    }
}
