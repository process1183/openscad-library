# OpenSCAD Library #

Mechanical parameters for various components.

**Note:** All units are in millimeters unless otherwise noted.

## Raspberry Pi ##

Raspberry Pi PCBs.

| File | Description |
| :--- | :---------- |
| [rpi/rpi_common.scad](rpi/rpi_common.scad) | Common RPi mechanical parameters |
| [rpi/rpi_4b.scad](rpi/rpi_4b.scad) | RPi 4B mechanical parameters |
| [rpi/rpi_camera_hdmi_extension.scad](rpi/rpi_camera_hdmi_extension.scad) | Petit Studio's Pi Camera HDMI Cable Extension |


### `rpi/rpi_common.scad` ###

Usage:

    include <openscad-library/rpi/rpi_common.scad>;

#### Variables ####

| Variable | Type | Description |
| :------- | :--- | :---------- |
| `rpi_corner_radius` | `Number` | Radius of the rounded RPi PCB corners |
| `rpi_gpio_dimensions` | `Vector` | Dimensions of the 40 pin GPIO header |
| `rpi_screw_hole_diameter` | `Number` | Diameter of the RPi mounting screw holes |
| `rpi_screw_hole_edge_distance` | `Number` | Distance from the bottom, left, and top PCB edges to center of the mounting screw holes |
| `rpib_ethernet_dimensions` | `Vector` | Model B Ethernet port dimensions |
| `rpib_gpio_position` | `Vector` | Location of the bottom left corner of the model B GPIO header |
| `rpib_pcb_dimensions` | `Vector` | Dimensions of the bare RPi model B PCBs |
| `rpib_screw_hole_spacing` | `Vector` | Model B X and Y distance between the centers of the mounting screw holes |
| `rpib_screw_holes` | `Vector` | Positions of the 4 mounting screw holes on model Bs |
| `rpib_usd_dimensions` | `Vector` | Model B micro SD card slot dimensions |


### `rpi/rpi_4b.scad` ###

Usage:

    include <openscad-library/rpi/rpi_4b.scad>;

#### Variables ####

**Note:** `rpi/rpi_4b.scad` includes all variables from `rpi/rpi_common.scad`

| Variable | Type | Description |
| :------- | :--- | :---------- |
| `rpi4b_audio_dimensions` | `Vector` | Dimensions of the audio / composite video port |
| `rpi4b_audio_position` | `Vector` | Location of the bottom left corner of the audio / composite video port |
| `rpi4b_camera_port_dimensions` | `Vector` | Dimensions of the camera port |
| `rpi4b_camera_port_position` | `Vector` | Location of the bottom left corner of the display port |
| `rpi4b_display_port_dimensions` | `Vector` | Dimensions of the display port |
| `rpi4b_display_port_position` | `Vector` | Location of the bottom left corner of the display port |
| `rpi4b_ethernet_position` | `Vector` | Location of the bottom left corner of the Ethernet port |
| `rpi4b_ethernet_usb_pcb_overhang` | `Number` | X distance that the Ethernet and USB ports extend past the PCB edge |
| `rpi4b_poe_dimensions` | `Vector` | Dimensions of the PoE header |
| `rpi4b_poe_position` | `Vector` | Location of the bottom left corner of the PoE header |
| `rpi4b_pwr_dimensions` | `Vector` | Dimensions of the USB-C power port |
| `rpi4b_pwr_position` | `Vector` | Location of the bottom left corner of the USB-C port |
| `rpi4b_soc_dimensions` | `Vector` | Dimensions of the SoC |
| `rpi4b_soc_position` | `Vector` | Location of the bottom left corner of the SoC |
| `rpi4b_uhdmi_dimensions` | `Vector` | Dimensions of the micro HDMI ports (Includes the shrouds on each side of the port) |
| `rpi4b_uhdmi_positions` | `Vector` | Location of the bottom left corners of the micro HDMI ports (Includes the shrouds on each side of the port) |
| `rpi4b_usb_dimensions` | `Vector` | Dimensions of the USB ports |
| `rpi4b_usb_positions` | `Vector` | Locations of the bottom left corners of the USB ports |
| `rpi4b_usd_position` | `Vector` | Location of the bottom left corner of the Micro SD card slot |

#### Modules ####

| Module | Description |
| :----- | :---------- |
| `Raspberry_Pi_4B()` | Simple 3D model of the RPi 4B |


### `rpi/rpi_camera_hdmi_extension.scad` ###

Usage:

    include <openscad-library/rpi/rpi_camera_hdmi_extension.scad>;

#### Variables ####

| Variable | Type | Description |
| :------- | :--- | :---------- |
| `pchce_cam_connector_dimensions` | `Vector` | Dimensions of the camera ribbon cable connector |
| `pchce_cam_connector_position` | `Vector` | Location of the camera ribbon cable connector |
| `pchce_hdmi_dimensions` | `Vector` | Dimensions of the HDMI port |
| `pchce_hdmi_position` | `Vector` | Location of the bottom left corner of the HDMI port |
| `pchce_pcb_dimensions` | `Vector` | Dimensions of the bare PCB |
| `pchce_screw_hole_diameter` | `Number` | Diameter of the mounting screw holes |
| `pchce_screw_hole_edge_distance` | `Number` | Distance from the bottom, left, and top PCB edges to center of the mounting screw holes |
| `pchce_screw_hole_positions` | `Vector` | Positions of the 4 mounting screw holes |
| `pchce_screw_spacing` | `Vector` | X and Y distance between the centers of the screw holes |

#### Modules ####

| Module | Description |
| :----- | :---------- |
| `Pi_Cam_HDMI_Ext()` | Simple 3D model of the Pi Camera HDMI Cable Extension |


## Servos ##

| File | Description |
| :--- | :---------- |
| [servos/hitec_hs-85mg.scad](servos/hitec_hs-85mg.scad) | Hitec HS-85MG micro servo dimensions |

### `servos/hitec_hs-85mg.scad` ###

Usage:

    include <openscad-library/servos/hitec_hs-85mg.scad>;

#### Variables ####

| Variable | Type | Description |
| :------- | :--- | :---------- |
| `hs85mg_dah_center_width` | `Number` | Width of the center of the double arm horn |
| `hs85mg_dah_end_width` | `Number` | Width of the ends of the double arm horn |
| `hs85mg_dah_installed_z_center` | `Number` | Distance from bottom of servo (Z = 0) to center of double arm horn |
| `hs85mg_dah_length` | `Number` | Length of the double arm horn |
| `hs85mg_dah_screw_hole_diameter` | `Number` | Diameter of the six arm screw holes |
| `hs85mg_dah_screw_hole_distances` | `Vector` | Distance from center of horn to the three screw holes. Distances are the same for both sides of the arm. |
| `hs85mg_dah_screw_shroud_diameter` | `Number` | Diameter of the output shaft screw shroud |
| `hs85mg_dah_screw_shroud_height` | `Number` | Height of the output shaft screw shroud |
| `hs85mg_dah_thickness` | `Number` | Thickness of the arms of the double arm horn |
| `hs85mg_flange_dimensions` | `Vector` | Dimensions of the mounting flanges |
| `hs85mg_flange_location_z` | `Number` | Bottom of servo to mounting flanges |
| `hs85mg_flange_screw_hole_diameter` | `Number` | Diameter of the mounting flange screw holes |
| `hs85mg_flange_screw_hole_locations` | `Vector` | Locations of the two mounting screw holes, relative to `hs85mg_main_body_with_flanges` |
| `hs85mg_flange_wire_space` | `Number` | Distance between wire and mounting flange |
| `hs85mg_main_body_with_flanges` | `Vector` | Dimensions of the main body, including the mounting flanges |
| `hs85mg_main_body` | `Vector` | Dimensions of the main body (excluding the mounting flanges) |
| `hs85mg_output_shaft_diameter` | `Number` | Diameter of the output shaft |
| `hs85mg_output_shaft_height` | `Number` | Z height of the output shaft |
| `hs85mg_output_shaft_location` | `Vector` | Output shaft location does *not* include mounting flanges. Location is the center of the bottom of the output shaft |

#### Modules ####

| Module | Description |
| :----- | :---------- |
| `HS85MGFlangeSpacer(inner_diameter, od_allowance)` | Toroidal spacer for the flange screw holes. `inner_diameter` (`Number`): Diameter of the spacer hole. Default is `2.45`mm. `od_allowance` (`Number`): Outer diameter mechanical allowance between spacer and flange. Default is `0.05`mm. |


## Miscellaneous ##

| File | Description |
| :--- | :---------- |
| [cherry_mx_switch_plate.scad](cherry_mx_switch_plate.scad) | Cherry MX mechanical key switch mounting plate |

### `cherry_mx_switch_plate.scad` ###

Usage:

    include <openscad-library/cherry_mx_switch_plate.scad>;

#### Variables ####

| Variable | Type | Description |
| :------- | :--- | :---------- |
| `cherry_plate_dimensions` | `Vector` | Dimensions of the switch mounting plate |
| `cherry_plate_screw_hole_diameter` | `Number` | Diameter of the switch mounting plate screw holes |
| `cherry_plate_screw_locations` | `Vector` | Locations of the 4 mounting screw holes |
| `cherry_plate_switch_cutout_position` | `Vector` | Location of the Cherry MX switch cutout |
| `cherry_plate_switch_cutout` | `Vector` | Dimensions of the cutout for the Cherry MX switch |

#### Modules ####

| Module | Description |
| :----- | :---------- |
| `CherryMXSwitchPlate()` | 3D model of the Cherry MX switch plate using the above variables |
