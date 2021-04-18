/**
 * Mechanical parameters for various nuts, bolts, etc
 * https://github.com/process1183/openscad-library
 * Copyright (C) 2021  Josh Gadeken
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
include <utilities.scad>;

// #2-56 threaded heat set insert tube
threaded_insert_256_id = 3; // Inner Diameter
threaded_insert_256_od = threaded_insert_256_id + 4; // Outer Diameter (Wall = 2mm)
threaded_insert_256_short_h = 3; // Short insert height
threaded_insert_256_long_h = 5; // Long insert height

// Unthreaded hole diameter for #2-56 screws
screw_256_hole_diameter = 2.45;

// Measurements for a #2-56 nut slot
nut_256_slot_diameter = 5.75;
nut_256_slot_height = 1.6;

// Unthreaded hole diameter for #4-40 screws
screw_440_hole_diameter = 3.2;

// Measurements for a #4-40 nut slot
nut_440_slot_diameter = 7.75;
nut_440_slot_height = 2.3;


module threaded_insert_256_short() {
    tube(threaded_insert_256_short_h, threaded_insert_256_od, threaded_insert_256_id);
}


module threaded_insert_256_long() {
    tube(threaded_insert_256_long_h, threaded_insert_256_od, threaded_insert_256_id);
}

