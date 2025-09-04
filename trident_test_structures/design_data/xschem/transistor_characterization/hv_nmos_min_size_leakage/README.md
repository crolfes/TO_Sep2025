# HV NMOS minimum size W0u3_L0u3

## IHP Characterization

IHP has already made characterization for the minimum size HV NMOS.
The values of interest are the gate leakage and the drain to source leakage for Vd=0.1 and T=27°C

![Measured gate leakage](./images/W0u3_L0u3_Vd_0.1_T_27_Ig.png)
![Measured drain to source leakage](./images/W0u3_L0u3_Vd_0.1_T_27_Id.png)

## SPICE Models

Provided spice models do not seem to take into account either the gate leakage.
The drain to source leakage in deep subthreshold regime shows large difference
to the measurements.


![Simulated gate leakage](images/hv_nmos_min_size_gate_leakage.svg)
![Simulated drain to source leakage](images/hv_nmos_min_size_drain_to_source_leakage.svg)
