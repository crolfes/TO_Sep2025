set clk_name  clk
set clk_port_name clk_pad
set clk_period 62.5
set clk_io_pct 0.2

set clk_port [get_ports $clk_port_name]

create_clock -name $clk_name -period $clk_period $clk_port

set non_clock_inputs [list]
foreach input [all_inputs] {
    if {$clk_port != $input} {
        lappend $non_clock_inputs $input
    }
}

set_input_delay  [expr $clk_period * $clk_io_pct] -clock $clk_name $non_clock_inputs 
set_output_delay [expr $clk_period * $clk_io_pct] -clock $clk_name [all_outputs]

set inout_ports [list spi_flash_io0_pad spi_flash_io1_pad spi_flash_io2_pad spi_flash_io3_pad gpio_1_pad gpio_2_pad]
foreach p $inout_ports {
    set_input_delay  [expr $clk_period * $clk_io_pct] -clock $clk_name [get_ports $p]
    set_output_delay [expr $clk_period * $clk_io_pct] -clock $clk_name [get_ports $p]
}

# Example: 0.1ns transition (adjust as per your IO library)
set_input_transition 0.1 [get_ports $non_clock_inputs]
set_input_transition 0.1 [get_ports $inout_ports]
#set_output_transition 0.1 [get_ports [all_outputs]]


# Example: 0.05 (unit=femtofarads or picofarads depending on library, check your .lib)
set_load 0.05 [get_ports [all_outputs]]
set_load 0.05 [get_ports $inout_ports]

# 0.1 is just an example, adjust based on system requirements
set_clock_uncertainty 0.1 [get_clocks $clk_name]

# (New!) False path on reset
set_false_path -from [get_ports resetn_pad]


#set_max_delay $clk_period -from [get_ports *] -to [get_ports *]
set_max_delay $clk_period -from [get_ports resetn_pad]