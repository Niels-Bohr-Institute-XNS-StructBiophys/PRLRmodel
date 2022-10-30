### Contacts between JAK2-FERM-SH2 and/or PRLR-LID1 with lipids ###########################
# Script to measure the number of contacts between the BB beads of either JAK2-FERM-SH2   #
# or PRLR-LID1 and the lipids in the system.                                              #
# The examples below works for any of simulations performed in which a conformation of    #
# JAK2-FERM-SH2 or the JAK2-FERM-SH2 + PRLR-LID1 complex was placed near a lipid bilayer  #
# and it can be used for the simulations with PC:PS:POPS or PC:PS sby commenting with (#) #
# in the appropriate lines 																  #
###########################################################################################

## PLC JAK2-FERM-SH only ###

#C3#
mol new F0.pdb
mol addfile JAK_FERM_noLID_PCPSPIP2_C3_S1_PL_wrapped.dcd waitfor all 

set outputname "JAK_FERM_noLID_PCPSPIP2_C3"

set out1  [open JPC_$outputname.dat w]
set out2  [open JPS_$outputname.dat w]
set out3  [open JP2_$outputname.dat w]
set out13 [open allcont_$outputname.dat w]

	set nfpcps [molinfo top get numframes]

	for {set i 0} {$i <= $nfpcps} {incr i} {
	    set b 0
		# set BB - any lip-bead contact for freq. contact time est.
        set allcont [atomselect top "name BB and within 7 of resname POPC POPS POP2" frame $i]

		##Find contacts between JAK2-FERM-SH and Lipids -- HG
	 	set JPC [atomselect top "name BB and resid 1 to 478 and within 7 of resname POPC " frame $i]   
	 	set JPS [atomselect top "name BB and resid 1 to 478 and within 7 of resname POPS " frame $i]   
	 	set JP2 [atomselect top "name BB and resid 1 to 478 and within 7 of resname POP2 " frame $i]   	
	 	##Find contacts between PRLR-LID1 and Lipids --	
	 	
	    ##Print to file
		
		if {[$allcont num]>0 } {
                set b 1 
		}
        puts $out13 "$b"

	 	puts $out1 "[$JPC get resid]"
	 	puts $out2 "[$JPS get resid]"
	 	puts $out3 "[$JP2 get resid]"
	 	
	    
		$JPC delete
		$JPS delete
		$JP2 delete
		
		
		$allcont delete 
}	
close $out1
close $out2
close $out3
close $out13
mol delete all

### ## PLC JAK2-FERM-SH + PRLR-LID1 complex ###

#C6 ##
mol new F0_PL.pdb
mol addfile JAK2-fermsh2_C6_PCPSPIP2wbfi_run_wrap_PL.dcd waitfor all 

set outputname "JAK_FERM_noLID_PCPSPIP2_C6_S3"

set out1  [open JPC_$outputname.dat w]
set out2  [open JPS_$outputname.dat w]
set out3  [open JP2_$outputname.dat w]
set out13 [open allcont_$outputname.dat w]

	set nfpcps [molinfo top get numframes]

	for {set i 0} {$i <= $nfpcps} {incr i} {
	    set b 0
		# set BB - any lip-bead contact for freq. contact time est.
        set allcont [atomselect top "name BB and within 7 of resname POPC POPS POP2" frame $i]

		##Find contacts between JAK2-FERM-SH and Lipids -- HG
	 	set JPC [atomselect top "name BB and resid 1 to 478 and within 7 of resname POPC " frame $i]   
	 	set JPS [atomselect top "name BB and resid 1 to 478 and within 7 of resname POPS " frame $i]   
	 	set JP2 [atomselect top "name BB and resid 1 to 478 and within 7 of resname POP2 " frame $i]   	
	 	
		##Find contacts between PRLR-LID1 and Lipids --	
	 	set LPC [atomselect top "name BB and resid 479 to 528 and within 7 of resname POPC " frame $i] 
	 	set LPS [atomselect top "name BB and resid 479 to 528 and within 7 of resname POPS " frame $i]
	 	set LP2 [atomselect top "name BB and resid 479 to 528 and within 7 of resname POP2 " frame $i] 	
	
	    ##Print to file
		
		if {[$allcont num]>0 } {
                set b 1 
		}
        puts $out13 "$b"

	 	puts $out1 "[$JPC get resid]"
	 	puts $out2 "[$JPS get resid]"
	 	puts $out3 "[$JP2 get resid]"
	 	
		$JPC delete
		$JPS delete
		$JP2 delete
		
		$allcont delete 
	}	
close $out1
close $out2
close $out3
close $out13
mol delete all

quit


quit

