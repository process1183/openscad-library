/**
 * Raspberry Pi Common Mechanical Parameters
 * https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical
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

/************************ RPi Common Dimensions *************************/

// Distance from the bottom, left, and top PCB edges to center of the 
// mounting screw holes
rpi_screw_hole_edge_distance = 3.5;

rpi_screw_hole_diameter = 2.75;

rpi_corner_radius = 3;

// 40 pin GPIO header
rpi_gpio_dimensions = [51, 5.1, 8.5];



/******************** RPi Model B Common Dimensions *********************/

// Dimensions of an unpopulated PCB
rpib_pcb_dimensions = [85, 56, 1.5];

// X and Y distance between mounting screw holes
rpib_screw_hole_spacing = [58, 49];

// Positions of the 4 mounting screw holes
rpib_screw_holes = [
    [ // Bottom left
        rpi_screw_hole_edge_distance,
        rpi_screw_hole_edge_distance
    ],
    [ // Top left
        rpi_screw_hole_edge_distance,
        rpi_screw_hole_edge_distance + rpib_screw_hole_spacing.y
    ],
    [ // Top right
        rpi_screw_hole_edge_distance + rpib_screw_hole_spacing.x,
        rpi_screw_hole_edge_distance + rpib_screw_hole_spacing.y,
    ],
    [ // Bottom right
        rpi_screw_hole_edge_distance + rpib_screw_hole_spacing.x,
        rpi_screw_hole_edge_distance
    ]
];

// Location of the bottom left corner of the GPIO header
rpib_gpio_position = [
    rpi_screw_hole_edge_distance + 29 - rpi_gpio_dimensions.x / 2,
    rpib_pcb_dimensions.y - rpi_screw_hole_edge_distance - rpi_gpio_dimensions.y / 2,
    rpib_pcb_dimensions.z
];

// Dimensions of the Micro SD card slot
rpib_usd_dimensions = [11.5, 12, 1.5];

// Dimensions of the USB ports
rpib_usb_dimensions = [17.25, 15, 16];

// Dimensions of the Ethernet port
rpib_ethernet_dimensions = [21.2, 16, 13.5];



module _Raspberry_Pi_B(components) {
    /**
     * Draw a 3D RPi B board with `components`.
     * This module is not meant to be used directly, but rather built upon by
     * modules for each board. E.g. Raspberry_Pi_4B()
     *
     * `components` is a vector of 3 element vectors. In each element, [0] is the 
     * component position, [1] is the component dimensions, and [2] is the color.
     */

    corners = [
        [rpi_corner_radius, rpi_corner_radius, 0], // Bottom left
        [rpi_corner_radius, rpib_pcb_dimensions.y - rpi_corner_radius, 0], // Top left
        [rpib_pcb_dimensions.x - rpi_corner_radius, rpib_pcb_dimensions.y - rpi_corner_radius, 0], // Top right
        [rpib_pcb_dimensions.x - rpi_corner_radius, rpi_corner_radius, 0], // Bottom right
    ];

    union() {
        difference() {
            color("Green") {
                hull() {
                    for(c = corners) {
                        translate(c) {
                            cylinder(r = rpi_corner_radius, h = rpib_pcb_dimensions.z, $fn = 60);
                        }
                    }
                }
            }

            translate([0, 0, -0.001]) {
                // Extend -Z and +Z a tiny bit past the PCB so the preview has clean-cut mounting screw holes
                for(s = rpib_screw_holes) {
                    translate(s) {
                        cylinder(d = rpi_screw_hole_diameter, h = rpib_pcb_dimensions.z + 0.002, $fn = 60);
                    }
                }
            }
        }

        for(c = components) {
            translate(c[0]) {
                color(c[2]) {
                    cube(size = c[1]);
                }
            }
        }
    }
}
