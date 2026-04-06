# Constraints file for bare_metal_programming project
# Follows the table: (pg 20 https://files.digilent.com/resources/programmable-logic/zedboard/ZedBoard_HW_UG_v2_2.pdf)
#       
#        LD0 PL T22 
#        LD1 PL T21
#        LD2 PL U22
#        LD3 PL U21
#        LD4 PL V22
#        LD5 PL W22
#        LD6 PL U19
#        LD7 PL U14 

set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {o_leds[0]}];
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports {o_leds[1]}];
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {o_leds[2]}];
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {o_leds[3]}];
set_property -dict {PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [get_ports {o_leds[4]}];
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [get_ports {o_leds[5]}];
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {o_leds[6]}];
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {o_leds[7]}];

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# # Set the bank voltage for IO Bank 35 to 1.8V by default.
# # set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# # set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# # Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard. 
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];


