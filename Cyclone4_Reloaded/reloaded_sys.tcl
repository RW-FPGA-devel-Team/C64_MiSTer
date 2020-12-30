set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE55F23C8
set_global_assignment -name PRE_FLOW_SCRIPT_FILE "quartus_sh:../sys/build_id.tcl"

set_global_assignment -name VERILOG_MACRO "CYCLONE=1"
set_global_assignment -name VERILOG_MACRO "JOYDC=1"