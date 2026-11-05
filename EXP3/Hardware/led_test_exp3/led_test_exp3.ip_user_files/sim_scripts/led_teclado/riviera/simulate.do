onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+led_teclado -L xpm -L xil_defaultlib -L blk_mem_gen_v8_4_4 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.led_teclado xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {led_teclado.udo}

run -all

endsim

quit -force
