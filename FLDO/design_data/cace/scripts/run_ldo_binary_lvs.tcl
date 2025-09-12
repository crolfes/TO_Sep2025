# NOTE: PDK_ROOT, PDK and CACE_ROOT are set in the local environment by CACE
#
# This is an example script to drive LVS; because this is a simple
# example, there is no specific benefit of using this instead of the
# default handling in CACE.

set PDK_ROOT $::env(PDK_ROOT)
set PDK $::env(PDK)
set CACE_ROOT $::env(CACE_ROOT)

set circuit1 [readnet spice $CACE_ROOT/netlist/layout/ldo_binary.spice]
set circuit2 [readnet spice $CACE_ROOT/netlist/schematic/ldo_binary.spice]

lvs "$circuit1 ldo_binary" "$circuit2 ldo_binary" $PDK_ROOT/$PDK/libs.tech/netgen/${PDK}_setup.tcl ldo_binary_comp.out -json
