# clk => 10000000Hz
create_clock -period 100.0 -name clk_0 -waveform {0.000 5.000} [get_ports clk]
set_property PACKAGE_PIN N14 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property PACKAGE_PIN P6 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
set_property PACKAGE_PIN T8 [get_ports {max7219_load}]
set_property IOSTANDARD LVCMOS33 [get_ports {max7219_load}]
set_property PACKAGE_PIN T7 [get_ports {max7219_data}]
set_property IOSTANDARD LVCMOS33 [get_ports {max7219_data}]
set_property PACKAGE_PIN R8 [get_ports {max7219_clock}]
set_property IOSTANDARD LVCMOS33 [get_ports {max7219_clock}]
set_property PACKAGE_PIN C3 [get_ports {spi_channel[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_channel[0]}]
set_property PACKAGE_PIN C2 [get_ports {spi_channel[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_channel[1]}]
set_property PACKAGE_PIN B2 [get_ports {spi_channel[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_channel[2]}]
set_property PACKAGE_PIN A2 [get_ports {spi_channel[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_channel[3]}]
set_property PACKAGE_PIN C1 [get_ports {avr_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {avr_rx}]
set_property PACKAGE_PIN B1 [get_ports {spi_miso}]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_miso}]