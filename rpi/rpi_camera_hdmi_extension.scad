/**
 * Petit Studio's Pi Camera HDMI Cable Extension
 * https://www.tindie.com/products/freto/pi-camera-hdmi-cable-extension
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

pchce_pcb_dimensions = [28.3, 25.9, 1.2];

pchce_hdmi_dimensions = [9.6, 15.1, 6.1];

pchce_hdmi_position = [
    pchce_pcb_dimensions.x - pchce_hdmi_dimensions.x - 0.7,
    (pchce_pcb_dimensions.y - pchce_hdmi_dimensions.y) / 2,
    pchce_pcb_dimensions.z
];

pchce_cam_connector_dimensions = [5.7, 20.9, 2.75];

pchce_cam_connector_position = [
    6.75,
    (pchce_pcb_dimensions.y - pchce_cam_connector_dimensions.y) / 2,
    pchce_pcb_dimensions.z
];

pchce_screw_hole_diameter = 2.2;

// Distance from the bottom, left, and top PCB edges to center of the
// mounting screw holes
pchce_screw_hole_edge_distance = 2.2;

// X and Y distance between the centers of the screw holes
pchce_screw_spacing = [12.5, 21];

pchce_screw_hole_positions = [
    [ // Bottom left
        pchce_screw_hole_edge_distance,
        pchce_screw_hole_edge_distance
    ],
    [ // Top left
        pchce_screw_hole_edge_distance,
        pchce_screw_hole_edge_distance + pchce_screw_spacing.y
    ],
    [ // Top right
        pchce_screw_hole_edge_distance + pchce_screw_spacing.x,
        pchce_screw_hole_edge_distance + pchce_screw_spacing.y
    ],
    [ // Bottom right
        pchce_screw_hole_edge_distance + pchce_screw_spacing.x,
        pchce_screw_hole_edge_distance
    ]
];


// Simple 3D model of the Pi Camera HDMI Cable Extension
module Pi_Cam_HDMI_Ext() {
    union() {
        difference() {
            color("Green") {
                cube(size = pchce_pcb_dimensions);
            }

            linear_extrude(height = pchce_pcb_dimensions.z) {
                for(s = pchce_screw_hole_positions) {
                    translate(s) {
                        circle(d = pchce_screw_hole_diameter, $fn = 60);
                    }
                }
            }
        }

        translate(pchce_hdmi_position) {
            color("Silver") {
                cube(size = pchce_hdmi_dimensions);
            }
        }

        translate(pchce_cam_connector_position) {
            color("Olive") {
                cube(size = pchce_cam_connector_dimensions);
            }
        }
    }
}
