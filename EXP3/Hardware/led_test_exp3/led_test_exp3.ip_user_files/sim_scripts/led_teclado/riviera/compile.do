vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/blk_mem_gen_v8_4_4

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4

vlog -work xpm  -sv2k12 "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/1b7e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/122e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/b205/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/c968/hdl/verilog" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/1b7e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/122e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/b205/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/c968/hdl/verilog" \
"../../../bd/led_teclado/ip/led_teclado_PS2_RX_0_0/sim/led_teclado_PS2_RX_0_0.v" \
"../../../bd/led_teclado/ip/led_teclado_teclado_a_led_0_0/sim/led_teclado_teclado_a_led_0_0.v" \
"../../../bd/led_teclado/ip/led_teclado_led_enable_0_0/sim/led_teclado_led_enable_0_0.v" \
"../../../bd/led_teclado/ip/led_teclado_ila_0_0/sim/led_teclado_ila_0_0.v" \
"../../../bd/led_teclado/ip/led_teclado_DB_0_1/sim/led_teclado_DB_0_1.v" \
"../../../bd/led_teclado/ip/led_teclado_dec_notas_0_0/sim/led_teclado_dec_notas_0_0.v" \
"../../../bd/led_teclado/ip/led_teclado_gen_frecuencias_0_0/sim/led_teclado_gen_frecuencias_0_0.v" \
"../../../bd/led_teclado/ip/led_teclado_modular_clk_div_0_0/sim/led_teclado_modular_clk_div_0_0.v" \
"../../../bd/led_teclado/ip/led_teclado_sinusoide_0_0/sim/led_teclado_sinusoide_0_0.v" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/1b7e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/122e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/b205/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/c968/hdl/verilog" \
"../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/1b7e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/122e/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/b205/hdl/verilog" "+incdir+../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/c968/hdl/verilog" \
"../../../bd/led_teclado/ip/led_teclado_blk_mem_gen_0_0/sim/led_teclado_blk_mem_gen_0_0.v" \
"../../../bd/led_teclado/sim/led_teclado.v" \

vlog -work xil_defaultlib \
"glbl.v"

