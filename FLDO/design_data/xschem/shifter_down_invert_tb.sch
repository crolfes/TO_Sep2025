v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 70 -700 870 -300 {flags=graph
y1=-0.95
y2=2.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="out
in 3.3 /"
color="6 5"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 930 -700 1730 -300 {flags=graph
y1=-1.6e-05
y2=6.6e-06
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color=4
node=i(vdd)}
N 190 -150 190 -130 {lab=in}
N 190 -150 270 -150 {lab=in}
N 350 -150 380 -150 {lab=out}
C {shifter_down_invert.sym} 300 -150 0 0 {name=x1 VDD=VDD VSS=0}
C {vsource.sym} 90 -100 0 0 {name=Vdd value=1.2 savecurrent=false}
C {lab_pin.sym} 90 -70 0 0 {name=p17 sig_type=std_logic lab=0}
C {lab_pin.sym} 90 -130 0 0 {name=p18 sig_type=std_logic lab=VDD}
C {vsource.sym} 190 -100 0 0 {name=Vin value="pulse(0 3.3 1n 1n 1n 4n 8n)" savecurrent=false}
C {lab_pin.sym} 190 -70 0 0 {name=p1 sig_type=std_logic lab=0}
C {lab_pin.sym} 190 -130 0 0 {name=p2 sig_type=std_logic lab=in}
C {launcher.sym} 130 -230 0 0 {name=h2
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# run netlist and simulation
xschem netlist
simulate
"}
C {simulator_commands.sym} 1590 -200 0 0 {name=Libs_ngspice
simulator=ngspice
only_toplevel=false 
value="
** IHP models
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ

.include sg13g2_stdcell.spice

"}
C {simulator_commands_shown.sym} 520 -200 0 0 {name=Simulator1
simulator=ngspice
only_toplevel=false 
value=".save all
.control
  tran 0.01n 10n
  write shifter_down_invert_tb.raw

  rusage
  quit
.endc
"
"}
C {devices/launcher.sym} 130 -190 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/shifter_down_invert_tb.raw tran"
}
C {lab_pin.sym} 380 -150 0 1 {name=p3 sig_type=std_logic lab=out}
C {simulator_commands_shown.sym} 940 -210 0 0 {name=Simulator2
simulator=xyce
only_toplevel=false 
value="
.preprocess replaceground true
.option temp=27
.tran 0.01n 10n
.print tran format=raw file=shifter_down_invert_tb.raw V(*) I(*)
"
}
C {simulator_commands.sym} 1770 -200 0 0 {name=Libs_Xyce
simulator=xyce
only_toplevel=false 
value="tcleval(

.lib $::SG13G2_MODELS_XYCE/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerMOShv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerRES.lib res_typ
.lib $::SG13G2_MODELS_XYCE/cornerCAP.lib cap_typ

.include $::SG13G2_STDCELL/sg13g2_stdcell.spice
)"}
C {launcher.sym} 130 -270 0 0 {name=h3
descr=SimulateXyce
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,3,cmd) \{mpirun Xyce -plugin $env(PDK_ROOT)/$env(PDK)/libs.tech/xyce/plugins/Xyce_Plugin_PSP103_VA.so,$env(PDK_ROOT)/$env(PDK)/libs.tech/xyce/plugins/Xyce_Plugin_r3_cmc.so \\"$N\\"\}

# change the simulator to be used (Xyce)
set sim(spice,default) 3

# run netlist and simulation
xschem netlist
simulate
"}
