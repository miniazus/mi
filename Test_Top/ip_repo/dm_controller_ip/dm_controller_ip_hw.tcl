package require -exact qsys 18.1

set_module_property NAME dm_controller
set_module_property VERSION 1.0
set_module_property DISPLAY_NAME "DM Controller"
set_module_property GROUP "Custom IP"
set_module_property TOP_LEVEL_HDL_ENTITY Dm_Controller
set_module_property HDL_FILES [list "dm_controller.vhd" "../common/inoutput_types.vhd"]
set_module_property SIMULATION_MODEL_INCLUDES_DEFAULT_SIM true

# Clock and reset
add_interface clk clock required
add_interface_port clk clk clk Input 1

add_interface rst reset required
set_interface_property rst associatedClock clk
add_interface_port rst rst reset Input 1

# One input bundle
add_interface DataIn conduit end
add_interface_port DataIn DataIn.valid valid Input 1
add_interface_port DataIn DataIn.Data  Data  Input 512
add_interface_port DataIn DataIn.Ready Ready Input 2

# One output bundle
add_interface DataOut conduit start
add_interface_port DataOut DataOut.valid valid Output 1
add_interface_port DataOut DataOut.Data  Data  Output 512
add_interface_port DataOut DataOut.Ready Ready Output 2