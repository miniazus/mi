package require -exact qsys 18.1

set_module_property NAME crossbar_ip
set_module_property VERSION 1.0
set_module_property DISPLAY_NAME "Cross Bar"
set_module_property GROUP "Custom IP"
set_module_property TOP_LEVEL_HDL_ENTITY Crossbar_Ip
set_module_property HDL_FILES [list "crossbar_ip.vhd" "../common/inoutput_types.vhd"]
set_module_property SIMULATION_MODEL_INCLUDES_DEFAULT_SIM true

# Clock and reset
add_interface clk clock required
add_interface_port clk clk clk Input 1

add_interface rst reset required
set_interface_property rst associatedClock clk
add_interface_port rst rst reset Input 1

# Input bundles
foreach i {1 2 3 4} {
    add_interface DataIn$i conduit end
    add_interface_port DataIn$i DataIn$i.valid valid Input 1
    add_interface_port DataIn$i DataIn$i.Data  Data  Input 512
    add_interface_port DataIn$i DataIn$i.Ready Ready Input 2
}

# Output bundles
foreach i {1 2 3 4} {
    add_interface DataOut$i conduit start
    add_interface_port DataOut$i DataOut$i.valid valid Output 1
    add_interface_port DataOut$i DataOut$i.Data  Data  Output 512
    add_interface_port DataOut$i DataOut$i.Ready Ready Output 2
}