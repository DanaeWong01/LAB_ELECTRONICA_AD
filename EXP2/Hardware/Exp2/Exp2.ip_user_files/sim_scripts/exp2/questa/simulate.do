onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib exp2_opt

do {wave.do}

view wave
view structure
view signals

do {exp2.udo}

run -all

quit -force
