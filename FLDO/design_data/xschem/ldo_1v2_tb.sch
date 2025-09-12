v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1020 -1120 1820 -720 {flags=graph
y1=-1.3e-05
y2=3.4
ypos1=0
ypos2=3.3
divy=5
subdivy=1
unity=1
x1=-5e-07
x2=9.5e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="out @ 1G load; out % 1
out @ 1.2k load; out % 0
VCC
enable_n"
color="4 6 8 7"
dataset=-1
unitx=1
logx=0
logy=0
digital=0}
N 1160 -220 1330 -220 {lab=out}
N 1080 -220 1100 -220 {lab=#net1}
N 680 -200 780 -200 {lab=enable_n}
N 680 -200 680 -180 {lab=enable_n}
N 510 -200 680 -200 {lab=enable_n}
C {ldo_1v2.sym} 930 -220 0 0 {name=x1}
C {biasgen.sym} 360 -220 0 0 {name=x2}
C {lab_pin.sym} 360 -280 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 360 -160 0 1 {name=p2 lab=GND}
C {lab_pin.sym} 930 -270 0 1 {name=p5 lab=VCC}
C {lab_pin.sym} 930 -170 0 1 {name=p6 lab=GND}
C {lab_pin.sym} 780 -240 0 0 {name=p7 lab=ref}
C {lab_pin.sym} 780 -220 0 0 {name=p8 lab=Ibias_1u_1}
C {vsource.sym} 90 -110 0 0 {name=V5 value="PWL(0 0 1u 3.3)" savecurrent=false}
C {lab_pin.sym} 90 -80 0 0 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} 90 -140 0 0 {name=p18 sig_type=std_logic lab=VCC}
C {vsource.sym} 90 -220 0 0 {name=V1 value=1.0 savecurrent=false}
C {lab_pin.sym} 90 -190 0 0 {name=p24 sig_type=std_logic lab=GND}
C {lab_pin.sym} 90 -250 0 0 {name=p26 sig_type=std_logic lab=ref}
C {simulator_commands_shown.sym} 450 -840 0 0 {name=Simulator2
simulator=xyce
only_toplevel=false 
value="
.preprocess replaceground true
.option temp=27
.step Rload list 1.2k 1G
.tran 10n 10u
.print tran format=raw file=ldo_1v2_tb.raw V(*) I(*)
"
"}
C {simulator_commands.sym} 460 -1040 0 0 {name=Libs_Xyce
simulator=xyce
only_toplevel=false 
value="tcleval(

.lib $::SG13G2_MODELS_XYCE/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerMOShv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerRES.lib res_typ
.lib $::SG13G2_MODELS_XYCE/cornerCAP.lib cap_typ

.include $::SG13G2_STDCELL/sg13g2_stdcell.spice
)"}
C {launcher.sym} 160 -450 0 0 {name=h2
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
C {simulator_commands.sym} 100 -1040 0 0 {name=Libs_ngspice
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
C {simulator_commands_shown.sym} 90 -840 0 0 {name=Simulator1
simulator=ngspice
only_toplevel=false 
value="*.option method=gear trtol=0.8
.option noinit warn=1 rshunt=1e12
.save all
.include ldo_1v2_tb.save
.control
  * 1mA load
  alter Rload=1.2k
  tran 10n 10u
  write ldo_1v2_tb.raw
  set appendwrite

  * no load
  alter Rload=1G
  tran 10n 10u
  write ldo_1v2_tb.raw

  rusage
  *quit
.endc
"
"}
C {launcher.sym} 530 -600 0 0 {name=h3
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
C {devices/launcher.sym} 1090 -670 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/ldo_1v2_tb.raw tran"
}
C {lab_pin.sym} 1330 -220 0 1 {name=p25 sig_type=std_logic lab=out}
C {capa-2.sym} 1210 -190 0 0 {name=Cload
m=1
value=500f
footprint=1206
device=polarized_capacitor
}
C {lab_pin.sym} 1210 -160 0 0 {name=p10 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1280 -160 0 0 {name=p22 sig_type=std_logic lab=GND}
C {res.sym} 1280 -190 0 0 {name=Rload
value=12k
footprint=1206
device=resistor
m=1}
C {ammeter.sym} 1130 -220 3 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {lab_pin.sym} 680 -180 0 0 {name=p3 lab=enable_n}
C {lab_pin.sym} 510 -240 0 1 {name=p4 lab=Ibias_1u_[1..3]}
