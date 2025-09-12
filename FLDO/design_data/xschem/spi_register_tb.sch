v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1270 -970 2070 -570 {flags=graph
y1=0
y2=1.2
ypos1=0
ypos2=1.2
divy=5
subdivy=1
unity=1
x1=0
x2=0.0001
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="rst_b
spi_ce
spi_clk
spi_di
data; data3, data2, data1, data0
x1.shiftreg; x1.shiftreg3, x1.shiftreg2, x1.shiftreg1, x1.shiftreg0"
color="4 4 4 4 5 6"
dataset=-1
unitx=1
logx=0
logy=0
digital=1}
C {spi_register.sym} 610 -980 0 0 {name=x1}
C {simulator_commands_shown.sym} 650 -510 0 0 {name=Simulator2
simulator=xyce
only_toplevel=false 
value="
.preprocess replaceground true
.option temp=27
.tran 250n 100u
.print tran format=raw file=spi_register_tb.raw V(*) I(*)
"
"}
C {simulator_commands.sym} 660 -710 0 0 {name=Libs_Xyce
simulator=xyce
only_toplevel=false 
value="tcleval(

.lib $::SG13G2_MODELS_XYCE/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerMOShv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerRES.lib res_typ
.lib $::SG13G2_MODELS_XYCE/cornerCAP.lib cap_typ

.include $::SG13G2_STDCELL/sg13g2_stdcell.spice
)"}
C {launcher.sym} 360 -120 0 0 {name=h2
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
C {simulator_commands.sym} 300 -710 0 0 {name=Libs_ngspice
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
C {simulator_commands_shown.sym} 290 -510 0 0 {name=Simulator1
simulator=ngspice
only_toplevel=false 
value=".option method=gear trtol=0.8
.option noinit warn=1 rshunt=1e12
.save all
*.include ldo_binary_tb.save
.control
  tran 250n 100u
  write spi_register_tb.raw

  rusage
  *quit
.endc
"
"}
C {launcher.sym} 730 -270 0 0 {name=h3
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
C {devices/launcher.sym} 1290 -340 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/spi_register_tb.raw tran"
}
C {lab_pin.sym} 760 -1010 0 1 {name=p1 lab=VDD}
C {lab_pin.sym} 760 -990 0 1 {name=p2 lab=0}
C {lab_pin.sym} 460 -1010 0 0 {name=p3 lab=spi_clk}
C {lab_pin.sym} 460 -990 0 0 {name=p4 lab=spi_di}
C {lab_pin.sym} 460 -970 0 0 {name=p5 lab=spi_ce}
C {lab_pin.sym} 460 -950 0 0 {name=p6 lab=rst_b}
C {lab_pin.sym} 760 -970 0 1 {name=p7 lab=data[3..0]}
C {vsource.sym} 80 -710 0 0 {name=V5 value=1.2 savecurrent=false}
C {lab_pin.sym} 80 -680 0 0 {name=p17 sig_type=std_logic lab=0}
C {lab_pin.sym} 80 -740 0 0 {name=p18 sig_type=std_logic lab=VDD}
C {vsource.sym} 920 -820 0 0 {name=V1 value="pulse(0 1.2 1u .1n .1n 1u 2u)" savecurrent=false}
C {lab_pin.sym} 920 -790 0 0 {name=p8 sig_type=std_logic lab=0}
C {lab_pin.sym} 920 -850 0 0 {name=p9 sig_type=std_logic lab=spi_clk}
C {vsource.sym} 920 -710 0 0 {name=V2 value="pulse(0 1.2 15u .1n .1n 4u 12u)" savecurrent=false}
C {lab_pin.sym} 920 -680 0 0 {name=p10 sig_type=std_logic lab=0}
C {lab_pin.sym} 920 -740 0 0 {name=p11 sig_type=std_logic lab=spi_di}
C {vsource.sym} 920 -610 0 0 {name=V3 value="pulse( 1.2 0 9.5u .1n .1n 15u 20u)" savecurrent=false}
C {lab_pin.sym} 920 -580 0 0 {name=p12 sig_type=std_logic lab=0}
C {lab_pin.sym} 920 -640 0 0 {name=p13 sig_type=std_logic lab=spi_ce}
C {vsource.sym} 80 -810 0 0 {name=V4 value="pulse(1.2 0 0 .1n .1n .5u 100u 1)" savecurrent=false}
C {lab_pin.sym} 80 -780 0 0 {name=p14 sig_type=std_logic lab=0}
C {lab_pin.sym} 80 -840 0 0 {name=p15 sig_type=std_logic lab=rst_b}
