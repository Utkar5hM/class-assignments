transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/assignment/decade_counter {C:/assignment/decade_counter/decade_counter.v}

vlog -vlog01compat -work work +incdir+C:/assignment/decade_counter {C:/assignment/decade_counter/testbench_1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench_1

add wave *
view structure
view signals
run -all
