-makelib ies_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/led_teclado/ip/led_teclado_PS2_RX_0_0/sim/led_teclado_PS2_RX_0_0.v" \
  "../../../bd/led_teclado/ip/led_teclado_teclado_a_led_0_0/sim/led_teclado_teclado_a_led_0_0.v" \
  "../../../bd/led_teclado/ip/led_teclado_led_enable_0_0/sim/led_teclado_led_enable_0_0.v" \
  "../../../bd/led_teclado/ip/led_teclado_ila_0_0/sim/led_teclado_ila_0_0.v" \
  "../../../bd/led_teclado/ip/led_teclado_DB_0_1/sim/led_teclado_DB_0_1.v" \
  "../../../bd/led_teclado/ip/led_teclado_dec_notas_0_0/sim/led_teclado_dec_notas_0_0.v" \
  "../../../bd/led_teclado/ip/led_teclado_gen_frecuencias_0_0/sim/led_teclado_gen_frecuencias_0_0.v" \
  "../../../bd/led_teclado/ip/led_teclado_modular_clk_div_0_0/sim/led_teclado_modular_clk_div_0_0.v" \
  "../../../bd/led_teclado/ip/led_teclado_sinusoide_0_0/sim/led_teclado_sinusoide_0_0.v" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_4 \
  "../../../../led_test_exp3.srcs/sources_1/bd/led_teclado/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/led_teclado/ip/led_teclado_blk_mem_gen_0_0/sim/led_teclado_blk_mem_gen_0_0.v" \
  "../../../bd/led_teclado/sim/led_teclado.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

