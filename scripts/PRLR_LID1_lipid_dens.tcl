### PRLR LID1 + Lipids --- Density ####
# Tcl script to calculate the average density of the lipids on each system using the Volmap plugin from VMD.
# Only the PO4 bead of each lipid type is considered on the calculation of the density reported as beads/cubic angstrom.
# The firs microsecond of each trajectory is excluded from the measurement.

### martini 2 FF ####

# ## PCPS 70:30 ##

set outputname "PRLR_LID1_PCPS_cgm2" 
set gro "PRLR_LID1_m2PCPS_s6.6_PL_pbcctmd.gro"
set xtc "PRLR_LID1_m2PCPS_10us_1ns_PL_pbcctmd.xtc"
mol new $gro 
mol addfile $xtc first 1000 waitfor all

set PSpo4 [atomselect top "resname POPS and name PO4"]

volmap density $PSpo4   -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PSdens_po4.dx 

mol delete all

# ## PCPSPIP2 80:10:10 ##

set outputname "PRLR_LID1_PCPSPI2_811_cgm2" 
set gro "PRLR_LID1_PCPSPIP2_PL_pbcctmd.gro"
set xtc "PRLR_LID1_PCPSPIP2_10us_1ns_PL_pbcctmd.xtc"
mol new $gro 
mol addfile $xtc first 1000 waitfor all

set PSpo4 [atomselect top "resname POPS and name PO4"]
set PIP2po4 [atomselect top "resname POP2 and name PO4"]

volmap density $PSpo4   -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PSdens_po4.dx 
volmap density $PIP2po4 -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PIP2dens_po4.dx  

mol delete all

# ## PCPSPIP2 90:5:5 ##

set outputname "PRLR_LID1_PCPSPI2_955_cgm2" 
set gro "PRLR_LID1_500lipids_PCPSPIP2_9055_m2cg_s6.6PLpbcc.gro"
set xtc "PRLR_LID1_500lipids_PCPSPIP2_9055_m2cg_1ns_10us_PLpbcctmd.xtc"
mol new $gro 
mol addfile $xtc first 1000 waitfor all

set PSpo4 [atomselect top "resname POPS and name PO4"]
set PIP2po4 [atomselect top "resname POP2 and name PO4"]

volmap density $PSpo4   -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PSdens_po4.dx 
volmap density $PIP2po4 -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PIP2dens_po4.dx  

mol delete all

#### martini 3 FF with 10% increase in protein-water interaction stenght (pws10) ###

## PCPS 70:30 ##
set outputname "PRLR_LID1_PCPS_cgm3pws10_10us" 
set gro "PRLR_LID1_PCPS_m3pws10_s6.6_PLpbcctmd.gro"
set xtc "PRLR_LID1_PCPS_m3pws10_10us_1ns_PLpbcctmd.xtc"
mol new $gro 
mol addfile $xtc first 1000 waitfor all

set PSpo4 [atomselect top "resname POPS and name PO4"]

volmap density $PSpo4   -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PSdens_po4.dx 

mol delete all

## PCPSPIP2 80:10:10 ##

set outputname "PRLR_LID1_PCPSPI2_811_cgm3pws10" 
set gro "PRLR_LID1_PCPSPIP2_811_m3pws10_s6.6_PL_pbcc.gro"
set xtc "PRLR_LID1_PCPSPIP2_811_m3pws10_11us_1ns_PL_pbcctmd.xtc"
mol new $gro 
mol addfile $xtc first 1000 waitfor all

set PSpo4 [atomselect top "resname POPS and name PO4"]
set PIP2po4 [atomselect top "resname POP2 and name PO4"]

volmap density $PSpo4   -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PSdens_po4.dx 
volmap density $PIP2po4 -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PIP2dens_po4.dx  

mol delete all

## PCPSPIP2 90:5:5 ##

set outputname "PRLR_LID1_PCPSPI2_955_cgm3pws10_10us" 
set gro "PRLR_LID1_PCPSPIP2_955_s6.6_m3pws10_PLpbcctmd.gro"
set xtc "PRLR_LID1_PCPSPIP2_955_1ns_10us_m3pws10_PLpbcctmd.xtc"
mol new $gro 
mol addfile $xtc first 1000 waitfor all

set PSpo4 [atomselect top "resname POPS and name PO4"]
set PIP2po4 [atomselect top "resname POP2 and name PO4"]

volmap density $PSpo4   -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PSdens_po4.dx 
volmap density $PIP2po4 -res 1.0 -allframes -combine avg -mol top -checkpoint 0 -o ${outputname}_1ns_m1us_PIP2dens_po4.dx  

mol delete all
quit










