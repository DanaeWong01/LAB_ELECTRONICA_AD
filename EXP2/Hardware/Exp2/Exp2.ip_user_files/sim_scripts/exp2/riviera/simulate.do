onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+exp2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.exp2 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {exp2.udo}

run -all

endsim

quit -force
