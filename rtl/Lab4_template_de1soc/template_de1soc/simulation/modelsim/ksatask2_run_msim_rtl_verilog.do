transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Mahmoud/Desktop/CPEN311/Lab4/rtl/Lab4_template_de1soc/template_de1soc {C:/Users/Mahmoud/Desktop/CPEN311/Lab4/rtl/Lab4_template_de1soc/template_de1soc/s_memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/Mahmoud/Desktop/CPEN311/Lab4/rtl/Lab4_template_de1soc/template_de1soc {C:/Users/Mahmoud/Desktop/CPEN311/Lab4/rtl/Lab4_template_de1soc/template_de1soc/SevenSegmentDisplayDecoder.v}
vlog -sv -work work +incdir+C:/Users/Mahmoud/Desktop/CPEN311/Lab4/rtl/Lab4_template_de1soc/template_de1soc {C:/Users/Mahmoud/Desktop/CPEN311/Lab4/rtl/Lab4_template_de1soc/template_de1soc/ksatask2.sv}

