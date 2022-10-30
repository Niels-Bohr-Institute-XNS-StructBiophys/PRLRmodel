### Contacts between PRLR TMD-LID1 and lipids ######
# Script to measure the number of contacts between the PRLR TMD-LID1 BB beads and the#
# headgroups or tails of the lipids in the system.                                   #
# The example below works for any of the POPS:POPC:PIP2 simulations performed        #
# and it can be used for the PC:PS simulations by commenting with (#) the            #
# lines thar refer to PIP2 (lines 13, 16, 27, 32, 36, 39, 45 and 48)                 #
######################################################################################
set gro ".gro"
set xtc ".xtc"
set output_name "PRLR_LID1_PCPSPIP2_m3pws10" 
set out1 [open PLcontact_PC_HG_$output_name.dat w]
set out2 [open PLcontact_PS_HG_$output_name.dat w]
set out3 [open PLcontact_PIP2_HG_$output_name.dat w]
set out4 [open PLcontact_PC_tail_$output_name.dat w]
set out5 [open PLcontact_PS_tail_$output_name.dat w]
set out6 [open PLcontact_PIP2_tail_$output_name.dat w]

mol new $gro
mol addfile $xtc waitfor all

set nfpcps [molinfo top get numframes]
for {set i 0} {$i <= $nfpcps} {incr i} {
    
    ##Find contacts between PRLR-LID1 and Lipids --hg	
    set LPChg [atomselect top "name BB and within 7 of resname POPC and not name PO4 GL1 GL2 C1A D2A C3A C4A C1B C2B C3B C4B" frame $i] 
	set LPShg [atomselect top "name BB and within 7 of resname POPS and not name  PO4 GL1 GL2 C1A D2A C3A C4A C1B C2B C3B C4B" frame $i]
    set LP2hg [atomselect top "name BB and within 7 of resname POP2 and not name  PO4 GL1 GL2 C1A D2A C3A C4A C1B C2B C3B C4B" frame $i]

    #Find contacts between PRLR-LID1 and Lipids -- tails
	set LPCt [atomselect top "name BB and within 7 of resname POPC and name C1A D2A C3A C4A C1B C2B C3B C4B" frame $i]
	set LPSt [atomselect top "name BB and within 7 of resname POPS and name C1A D2A C3A C4A C1B C2B C3B C4B" frame $i]
    set LP2t [atomselect top "name BB and within 7 of resname POP2 and name C1A D2A C3A C4A C1B C2B C3B C4B" frame $i]
    
    puts $out1 "$i [$LPChg get resid]"
	puts $out2 "$i [$LPShg get resid]"
	puts $out3 "$i [$LP2hg get resid]"
	puts $out4 "$i [$LPSt get resid]"
    puts $out5 "$i [$LPSt get resid]"
    puts $out6 "$i [$LP2t get resid]"

    $allcont delete
}
close $out1
close $out2
close $out3
close $out4
close $out5
close $out6
mol delete all 
quit