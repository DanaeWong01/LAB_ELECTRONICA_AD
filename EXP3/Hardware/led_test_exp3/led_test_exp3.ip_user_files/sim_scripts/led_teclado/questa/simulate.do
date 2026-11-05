onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib led_teclado_opt

do {wave.do}

view wave
view structure
view signals

do {led_teclado.udo}

run -all

quit -force
