v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 130 -1110 930 -710 {flags=graph
y1=0
y2=1.1e-06
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color="4 5 6"
node="ia; ibias_1u_1 100e3 /
ib; ibias_1u_2 1e6 /
ic; ibias_1u_3 10e3 /"
x2=3.3}
N 780 -520 780 -490 {lab=VCC}
N 310 -230 310 -200 {lab=Ibias_1u_1}
N 310 -140 310 -120 {lab=GND}
N 470 -230 470 -200 {lab=Ibias_1u_2}
N 470 -140 470 -120 {lab=GND}
N 640 -230 640 -200 {lab=Ibias_1u_3}
N 640 -140 640 -120 {lab=GND}
N 470 -430 640 -430 {lab=por}
C {vsource.sym} 780 -460 0 0 {name=V1 value="PWL(0 0 0.1u 3.3)" savecurrent=false}
C {lab_pin.sym} 780 -430 0 0 {name=p6 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 780 -520 0 1 {name=p7 sig_type=std_logic lab=VCC
}
C {simulator_commands_shown.sym} 1380 -380 0 0 {name=Simulator2
simulator=xyce
only_toplevel=false 
value="
.preprocess replaceground true
*.option temp=27
.step temp list -40 27 125
.tran 1n 1u
.print tran format=raw file=biasgen_tb.raw V(*) I(*)
"
"}
C {simulator_commands.sym} 1390 -580 0 0 {name=Libs_Xyce
simulator=xyce
only_toplevel=false 
value="tcleval(

.lib $::SG13G2_MODELS_XYCE/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerMOShv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerRES.lib res_typ
.lib $::SG13G2_MODELS_XYCE/cornerCAP.lib cap_typ

.include $::SG13G2_STDCELL/sg13g2_stdcell.spice
)"}
C {launcher.sym} 1080 -160 0 0 {name=h2
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
C {simulator_commands.sym} 1030 -580 0 0 {name=Libs_ngspice
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
C {simulator_commands_shown.sym} 1020 -380 0 0 {name=Simulator1
simulator=ngspice
only_toplevel=false 
value="
.save all
.include biasgen_tb.save
.control
  dc v1 0 3.3 0.1
  write biasgen_tb_dc.raw

  rusage
  *quit
.endc
"
"}
C {launcher.sym} 1450 -140 0 0 {name=h3
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
C {devices/launcher.sym} 1080 -90 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/biasgen_tb_dc.raw dc"
}
C {biasgen.sym} 320 -450 0 0 {name=x1}
C {lab_pin.sym} 320 -510 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 320 -390 0 1 {name=p2 lab=GND}
C {lab_pin.sym} 470 -470 0 1 {name=p3 lab=Ibias_1u_[1..3]}
C {res.sym} 310 -170 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 310 -230 0 1 {name=p5 lab=Ibias_1u_1}
C {lab_pin.sym} 310 -120 0 0 {name=p8 sig_type=std_logic lab=GND
}
C {res.sym} 470 -170 0 0 {name=R2
value=1MEG
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 470 -230 0 1 {name=p9 lab=Ibias_1u_2}
C {lab_pin.sym} 470 -120 0 0 {name=p10 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 640 -430 0 1 {name=p11 lab=por}
C {res.sym} 640 -170 0 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 640 -230 0 1 {name=p4 lab=Ibias_1u_3}
C {lab_pin.sym} 640 -120 0 0 {name=p12 sig_type=std_logic lab=GND
}
C {capa.sym} 560 -400 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 560 -370 0 0 {name=p13 sig_type=std_logic lab=GND
}
