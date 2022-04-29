# vivado -mode batch -source waittest.tcl

proc check_gen {} {

	while {![file exists sysgen_done.log]} {
		puts "Waiting for sygen netlist generation" ;
		puts "Check sysgen console" ;
		after 3000 ;
	}
	
	# open file
	set fp [open "sysgen_done.log" r]
	
	
	puts [gets $fp]
	
	gets $fp data
	
	# check whether the netlist generation is completed
	if {[string compare $data Passed!] != 0} {
		error {Sysgen Netlist Generation Error}
	} else {
		puts {Sysgen Netlist Generation Passed!}
	}	
	
	# close the file
	close $fp;
}

check_gen