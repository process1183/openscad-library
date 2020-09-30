/**
 * Raspberry Pi 4B Mechanical Parameters
 * https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/rpi_MECH_4b_4p0.pdf
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
include <rpi_common.scad>;


// Location of the bottom left corner of the Micro SD card slot
rpi4b_usd_position = [1.6, 22.15, -rpib_usd_dimensions.z];

// Dimensions of the display port
rpi4b_display_port_dimensions = [2.5, 22, 5.5];

// Location of the bottom left corner of the display port
rpi4b_display_port_position = [
    4 - rpi4b_display_port_dimensions.x / 2,
    rpi_screw_hole_edge_distance + 24.5 - rpi4b_display_port_dimensions.y / 2,
    rpib_pcb_dimensions.z
];

// Dimensions of the USB-C power port
rpi4b_pwr_dimensions = [9, 7.4, 3.2];

// Location of the bottom left corner of the USB-C port
rpi4b_pwr_position = [
    rpi_screw_hole_edge_distance + 7.7 - rpi4b_pwr_dimensions.x / 2,
    -1.25,
    rpib_pcb_dimensions.z
];

// Dimensions of the micro HDMI ports
// Includes the shrouds on each side of the port
rpi4b_uhdmi_dimensions = [7.1, 8.1, 3.5];

// Location of the bottom left corners of the micro HDMI ports
// Includes the shrouds on each side of the port
_4buhx1 = rpi4b_pwr_position.x + rpi4b_pwr_dimensions.x / 2 + 14.8;
_4buhx2 = _4buhx1 + 13.5;
rpi4b_uhdmi_positions = [
    for(x = [_4buhx1, _4buhx2]) [
        x - rpi4b_uhdmi_dimensions.x / 2,
        -1.7,
        rpib_pcb_dimensions.z
    ]
];

// Dimensions of the camera port
rpi4b_camera_port_dimensions = [2.5, 22, 5.5];

// Location of the bottom left corner of the display port
rpi4b_camera_port_position = [
    rpi4b_uhdmi_positions[1].x + rpi4b_uhdmi_dimensions.x / 2  + 7 - rpi4b_camera_port_dimensions.x / 2,
    11.5 - rpi4b_camera_port_dimensions.y / 2,
    rpib_pcb_dimensions.z
];

// Dimensions of the audio / composite video port
rpi4b_audio_dimensions = [7, 14.9, 6];

// Location of the bottom left corner of the audio / composite video port
rpi4b_audio_position = [
    rpi4b_camera_port_position.x + rpi4b_camera_port_dimensions.x / 2 + 7.5 - rpi4b_audio_dimenions.x / 2,
    -2.5,
    rpib_pcb_dimensions.z
];

// Dimensions of the SoC
rpi4b_soc_dimensions = [15, 15, 2.4];

// Location of the bottom left corner of the SoC
rpi4b_soc_position = [
    rpi_screw_hole_edge_distance + 25.75 - rpi4b_soc_dimensions.x / 2,
    32.5 - rpi4b_soc_dimensions.y / 2,
    rpib_pcb_dimensions.z
];

// Dimensions of the PoE header
rpi4b_poe_dimensions = [5, 4.8, 8.5];

// Location of the bottom left corner of the PoE header
rpi4b_poe_position = [
    rpi_screw_hole_edge_distance + rpib_screw_hole_spacing.x - rpi4b_poe_dimensions.x / 2,
    rpib_pcb_dimensions.y - rpi_screw_hole_edge_distance - 6.14 - rpi4b_poe_dimensions.y / 2,
    rpib_pcb_dimensions.z
];

// X distance that the Ethernet and USB ports extend past the PCB edge
rpi4b_ethernet_usb_pcb_overhang = 3;

// Dimensions of the USB ports
rpi4b_usb_dimensions = [17.5, 14.5, 16];

// Location of the bottom left corners of the USB ports
rpi4b_usb_positions = [
    for(y = [9, 27]) [
        rpib_pcb_dimensions.x + rpi4b_ethernet_usb_pcb_overhang - rpi4b_usb_dimensions.x,
        y - rpi4b_usb_dimensions.y / 2,
        rpib_pcb_dimensions.z
    ]
];

// Location of the bottom left corner of the Ethernet port
rpi4b_ethernet_position = [
    rpib_pcb_dimensions.x + rpi4b_ethernet_usb_pcb_overhang - rpib_ethernet_dimensions.x,
    45.75 - rpib_ethernet_dimensions.y / 2,
    rpib_pcb_dimensions.z
];


// Simple 3D model of the Raspberry Pi 4B
module Raspberry_Pi_4B() {
    components = [
        [rpi4b_usd_position, rpib_usd_dimensions, "Silver"],
        [rpi4b_display_port_position, rpi4b_display_port_dimensions, "Snow"],
        [rpi4b_pwr_position, rpi4b_pwr_dimensions, "Silver"],
        [rpib_gpio_position, rpi_gpio_dimensions, "Silver"],
        [rpi4b_soc_position, rpi4b_soc_dimensions, "Silver"],
        [rpi4b_uhdmi_positions[0], rpi4b_uhdmi_dimensions, "Silver"],
        [rpi4b_uhdmi_positions[1], rpi4b_uhdmi_dimensions, "Silver"],
        [rpi4b_camera_port_position, rpi4b_camera_port_dimensions, "Snow"],
        [rpi4b_audio_position, rpi4b_audio_dimenions, "DimGray"],
        [rpi4b_poe_position, rpi4b_poe_dimensions, "Silver"],
        [rpi4b_ethernet_position, rpib_ethernet_dimensions, "Silver"],
        [rpi4b_usb_positions[0], rpi4b_usb_dimensions, "Silver"],
        [rpi4b_usb_positions[1], rpi4b_usb_dimensions, "Silver"],
    ];

    _Raspberry_Pi_B(components);
}
