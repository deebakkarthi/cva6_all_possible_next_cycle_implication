clear -all
if {[file exists "database"]} {
	restore database
} else {
	set_task_compile_time_limit 1000
	set_property_compile_time_limit 1000
	analyze -sv -f cva6.f -bbox_m aes -bbox_m std_cache_subsystem
	elaborate -top ariane -optimize_implication_assert
	clock clk_i
	reset !rst_ni
	save database -light -include elaborated_design
}

exit
