v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1820 -540 2620 -140 {flags=graph
y1=-0.033
y2=1.2
ypos1=-0.1563
ypos2=1.0767
divy=5
subdivy=1
unity=1
x1=0
x2=5e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="x1.por
VDD
spi_clk
spi_mosi
spi_csb
en"
color="4 6 5 8 4 7"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
hcursor1_y=0.078291277}
B 2 1820 -950 2620 -550 {flags=graph
y1=-1.9e-53
y2=3.2
ypos1=-0.033
ypos2=1.2
divy=5
subdivy=1
unity=1
x1=0
x2=5e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="out @ 1G load; out % 1
out @ 3k load; out % 0"
color="4 6"
dataset=-1
unitx=1
logx=0
logy=0
digital=0}
N 1360 -900 1670 -900 {lab=out}
C {ldo_binary_top.sym} 1210 -900 0 0 {name=x1
schematic=ldo_binary_top_rcx
spice_sym_def="tcleval(.include [abs_sym_path ../netlist/rcx/ldo_binary_top_rcx.spice])"
tclcommand="textwindow [abs_sym_path ../netlist/rcx/ldo_binary_top_rcx.spice]"}
C {simulator_commands_shown.sym} 1260 -490 0 0 {name=Simulator2
simulator=xyce
only_toplevel=false 
value="
.preprocess replaceground true
.include ldo_binary_top.stimuli.cir
.option temp=27
.step Rload list 3k 1G
.tran 10n 50u
.print tran format=raw file=ldo_binary_tb.raw V(*) I(*)
"
"}
C {simulator_commands.sym} 1270 -690 0 0 {name=Libs_Xyce
simulator=xyce
only_toplevel=false 
value="tcleval(

.lib $::SG13G2_MODELS_XYCE/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerMOShv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerRES.lib res_typ
.lib $::SG13G2_MODELS_XYCE/cornerCAP.lib cap_typ

.include $::SG13G2_STDCELL/sg13g2_stdcell.spice
)"}
C {launcher.sym} 940 -100 0 0 {name=h2
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
C {simulator_commands.sym} 870 -690 0 0 {name=Libs_ngspice
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
C {simulator_commands_shown.sym} 860 -490 0 0 {name=Simulator1
simulator=ngspice
only_toplevel=false 
value=".option gmin=1e-16 method=gear trtol=0.8
.option noinit warn=1 rshunt=1e12
.save all
.include ldo_binary_top_tb.save
.include ldo_binary_top.stimuli.cir
.control
  * 1mA load
  alter Rload=3k
  tran 10n 25u
  write ldo_binary_tb.raw
  set appendwrite

  * no load
  alter Rload=1G
  tran 10n 25u
  write ldo_binary_tb.raw

  rusage
  *quit
.endc
"
"}
C {launcher.sym} 1340 -250 0 0 {name=h3
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
C {devices/launcher.sym} 1890 -90 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/ldo_binary_tb.raw tran"
}
C {vsource.sym} 710 -390 0 0 {name=Vcc value="PWL(0 0 1u 3.3)" savecurrent=false}
C {lab_pin.sym} 710 -360 0 0 {name=p17 sig_type=std_logic lab=0}
C {lab_pin.sym} 710 -420 0 0 {name=p18 sig_type=std_logic lab=VCC}
C {vsource.sym} 710 -500 0 0 {name=Vref value=1.0 savecurrent=false}
C {lab_pin.sym} 710 -470 0 0 {name=p24 sig_type=std_logic lab=0
value=1.0}
C {lab_pin.sym} 710 -530 0 0 {name=p26 sig_type=std_logic lab=ref}
C {lab_pin.sym} 1670 -900 0 1 {name=p25 sig_type=std_logic lab=out}
C {capa-2.sym} 1500 -870 0 0 {name=Cload
m=1
value=500f
footprint=1206
device=polarized_capacitor
}
C {lab_pin.sym} 1500 -840 0 0 {name=p4 sig_type=std_logic lab=0}
C {lab_pin.sym} 1620 -840 0 0 {name=p22 sig_type=std_logic lab=0}
C {res.sym} 1620 -870 0 0 {name=Rload
value=12k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 1210 -970 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 1210 -820 0 1 {name=p2 lab=0}
C {lab_pin.sym} 1060 -900 0 0 {name=p3 lab=spi_clk}
C {lab_pin.sym} 1060 -880 0 0 {name=p5 lab=spi_mosi}
C {lab_pin.sym} 1060 -860 0 0 {name=p6 lab=spi_csb}
C {lab_pin.sym} 1060 -940 0 0 {name=p7 lab=ref}
C {lab_pin.sym} 1060 -920 0 0 {name=p8 lab=en}
C {lab_pin.sym} 1360 -860 0 1 {name=p10 lab=Ibias_1u}
C {lab_pin.sym} 1360 -940 0 1 {name=p11 lab=VDD}
C {vsource.sym} 710 -280 0 0 {name=Vbias value=1.0 savecurrent=false}
C {lab_pin.sym} 710 -250 0 0 {name=p13 sig_type=std_logic lab=0
value=1.0}
C {lab_pin.sym} 710 -310 0 0 {name=p14 sig_type=std_logic lab=Ibias_1u}
