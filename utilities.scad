/**
 * OpenSCAD Library Utilities
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


/**
 * Convenience module for creating tubes.
 *
 * Args:
 *     height: Z height of the tube
 *     outer_diameter: Outer diameter of the tube
 *     inner_diameter: Inner diameter of the tube
 *     fn: Number of fragments to render the circles. (Passed to $fn)
 */
module tube(height, outer_diameter, inner_diameter, fn = 60) {
    difference() {
        cylinder(h = height, d = outer_diameter, $fn = fn);
        cylinder(h = height, d = inner_diameter, $fn = fn);
    }
}


/**
 * Create an oblique cone.
 * This pseudo oblique cone is created by using hull() around a very tiny
 * (1 micrometer height/radius) cylinder and sphere. The bottom cylinder's
 * diameter is `base_diameter`, and the top sphere has a radius of 1
 * micrometer and acts as the apex.
 *
 * Args:
 *     height: Z height of the cone. (Can be negative)
 *     base_diameter: Diameter of the base of the cone
 *     top_translate: X translation of the top of the cone
 *     fn: Number of fragments to render the circles. (Passed to $fn)
 */
module PseudoObliqueCone(height, base_diameter, top_translate, fn = 60) {
    cylinder_h = 0.001;

    hull() {
        th1 = height < 0 ? -cylinder_h : 0;
        translate([0, 0, th1]) {
            cylinder(h = cylinder_h, d = base_diameter, $fn = fn);
        }

        th2 = height > 0 ? height - cylinder_h : height;
        translate([top_translate, 0, th2]) {
            sphere(r = cylinder_h, $fn = fn);
        }
    }
}
