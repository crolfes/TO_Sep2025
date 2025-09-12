# NOTE: PDK_ROOT, PDK and CACE_ROOT are set in the local environment by CACE
#
# This is an example script to drive LVS; because this is a simple
# example, there is no specific benefit of using this instead of the
# default handling in CACE.

set PDK_ROOT $::env(PDK_ROOT)
set PDK $::env(PDK)
set CACE_ROOT $::env(CACE_ROOT)

set top "ldo_control"

set circuit1 [readnet spice $CACE_ROOT/netlist/layout/ldo_control.spice]

set circuit2 [readnet spice $PDK_ROOT/$PDK/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice]
readnet spice $CACE_ROOT/netlist/schematic/ldo_control.spice $circuit2

lvs "$circuit1 $top" "$circuit2 $top" $PDK_ROOT/$PDK/libs.tech/netgen/${PDK}_setup.tcl "${top}_comp.out" -json
