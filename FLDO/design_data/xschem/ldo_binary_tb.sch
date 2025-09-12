v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1580 -540 2380 -140 {flags=graph
y1=-0.0031
y2=3.4
ypos1=0
ypos2=3.3
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="out @ 1G load; out % 1
out @ 3k load; out % 0
por
VDD
rst_b"
color="4 6 5 8 7"
dataset=-1
unitx=1
logx=0
logy=0
digital=0}
B 2 1580 -770 2380 -550 {flags=graph
y1=0
ypos1=0
ypos2=1.2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="\\"a[3..0]; a3, a2, a1, a0 % 1\\"
\\"a[3..0]; a3, a2, a1, a0 % 0\\"
a0
a1
a2
a3
rst_b"
color="4 6 4 4 4 4 4"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
y2=1.2}
B 2 1580 -1000 2380 -780 {flags=graph
y1=-1.1541238e-06
ypos1=0
ypos2=1.2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
digital=0
y2=8.8528377e-06
color="8 5 6"
node="i_vdd; i(vmeas3)
ibias_1u_A; i(vmeas5)
ibias_1u_B; i(vmeas6)"}
T {TODO
- shifter/inverter down from por to rst_b
- 1V reference generator
- shifter_down for clk input
- Enable on binary ldo?} 1120 -970 0 0 0.4 0.4 {}
N 1280 -620 1450 -620 {lab=out}
N 750 -600 750 -580 {lab=a[3..0]_hv}
N 750 -600 900 -600 {lab=a[3..0]_hv}
N 380 -600 490 -600 {lab=a[3..0]}
N 380 -600 380 -580 {lab=a[3..0]}
N 310 -600 380 -600 {lab=a[3..0]}
N 1200 -620 1220 -620 {lab=#net1}
N -50 -820 0 -820 {lab=por}
N -50 -840 -0 -840 {lab=Ibias_1u_2}
N -50 -860 -0 -860 {lab=ref}
N 860 -860 910 -860 {lab=Ibias_1u_[1..3]}
N 710 -600 750 -600 {lab=a[3..0]_hv}
N -90 -600 10 -600 {lab=rst_b}
C {vsource.sym} 100 -340 0 0 {name=V2 value="pulse(0 1.2 1u 1n 1n 2u 4u)" savecurrent=false
spice_ignore=true}
C {lab_pin.sym} 100 -310 0 0 {name=p6 sig_type=std_logic lab=0
spice_ignore=true}
C {lab_pin.sym} 100 -370 0 1 {name=p7 sig_type=std_logic lab=a2
spice_ignore=true}
C {vsource.sym} 100 -230 0 0 {name=V3 value="pulse(0 1.2 1u 1n 1n 1u 2u)" savecurrent=false
spice_ignore=true}
C {lab_pin.sym} 100 -200 0 0 {name=p8 sig_type=std_logic lab=0
spice_ignore=true}
C {lab_pin.sym} 100 -260 0 1 {name=p9 sig_type=std_logic lab=a1
spice_ignore=true}
C {vsource.sym} 100 -130 0 0 {name=V4 value="pulse(0 1.2 1u 1n 1n 500n 1u)" savecurrent=false
spice_ignore=true}
C {lab_pin.sym} 100 -100 0 0 {name=p10 sig_type=std_logic lab=0
spice_ignore=true}
C {lab_pin.sym} 100 -160 0 1 {name=p11 sig_type=std_logic lab=a0
spice_ignore=true}
C {shifter.sym} 600 -600 0 0 {name=x_shift[3..0]}
C {lab_pin.sym} 660 -670 0 1 {name=p12 lab=VCC}
C {lab_pin.sym} 540 -670 0 0 {name=p13 lab=VDD}
C {lab_pin.sym} 600 -530 0 1 {name=p14 lab=0}
C {lab_pin.sym} 380 -580 0 1 {name=p15 lab="a[3..0]"}
C {lab_pin.sym} 750 -580 0 1 {name=p16 lab=a[3..0]_hv}
C {vsource.sym} 520 -230 0 0 {name=V5 value="PWL(0 0 1u 3.3)" savecurrent=false}
C {lab_pin.sym} 520 -200 0 0 {name=p17 sig_type=std_logic lab=0}
C {lab_pin.sym} 520 -260 0 0 {name=p18 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 1450 -620 0 1 {name=p25 sig_type=std_logic lab=out}
C {capa-2.sym} 1280 -590 0 0 {name=Cload
m=1
value=500f
footprint=1206
device=polarized_capacitor
}
C {lab_pin.sym} 1280 -560 0 0 {name=p4 sig_type=std_logic lab=0}
C {lab_pin.sym} 1400 -560 0 0 {name=p22 sig_type=std_logic lab=0}
C {res.sym} 1400 -590 0 0 {name=Rload
value=12k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 100 -450 0 0 {name=V7 value="pulse(0 1.2 1u 1n 1n 4u 8u)" savecurrent=false
spice_ignore=true}
C {lab_pin.sym} 100 -420 0 0 {name=p37 sig_type=std_logic lab=0
spice_ignore=true}
C {lab_pin.sym} 100 -480 0 1 {name=p38 sig_type=std_logic lab=a3
spice_ignore=true}
C {ldo_binary.sym} 1050 -620 0 0 {name=x1}
C {lab_pin.sym} 1050 -730 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 1050 -550 0 1 {name=p2 lab=0}
C {lab_pin.sym} 900 -640 0 0 {name=p3 lab=ref}
C {lab_pin.sym} 900 -620 0 0 {name=p5 lab=Ibias_1u_1}
C {vsource.sym} 520 -340 0 0 {name=V1 value=1.0 savecurrent=false}
C {lab_pin.sym} 520 -310 0 0 {name=p24 sig_type=std_logic lab=0
value=1.0}
C {lab_pin.sym} 520 -370 0 0 {name=p26 sig_type=std_logic lab=ref}
C {lfsr4.sym} 160 -600 0 0 {name=x2
}
C {lab_pin.sym} 160 -550 0 1 {name=p23 lab=0
}
C {lab_pin.sym} 160 -650 0 0 {name=p27 lab=VDD
}
C {vsource.sym} -180 -450 0 0 {name=V8 value="1.2 pulse(1.2 0 2u 0.1n 0.1n 250n 500n)" savecurrent=false
}
C {lab_pin.sym} -180 -420 0 0 {name=p28 sig_type=std_logic lab=0
}
C {lab_pin.sym} -180 -480 0 1 {name=p29 sig_type=std_logic lab=clk
}
C {vsource.sym} -180 -320 0 0 {name=V9 value="1.2 pulse(1.2 0 0 1n 1n 1.9u 10u 1)" savecurrent=false
spice_ignore=true}
C {lab_pin.sym} -180 -290 0 0 {name=p30 sig_type=std_logic lab=0
spice_ignore=true}
C {lab_pin.sym} -180 -350 0 1 {name=p31 sig_type=std_logic lab=rst_b
spice_ignore=true}
C {lab_pin.sym} 10 -620 0 0 {name=p32 lab=clk
}
C {lab_pin.sym} 10 -600 0 0 {name=p34 lab=rst_b
}
C {ldo_1v2.sym} 150 -840 0 0 {name=x3}
C {lab_pin.sym} 360 -840 0 1 {name=p35 lab=VDD}
C {lab_pin.sym} 150 -790 0 1 {name=p36 lab=0}
C {lab_pin.sym} 150 -950 0 1 {name=p39 lab=VCC}
C {lab_pin.sym} -50 -860 0 0 {name=p41 lab=ref}
C {ammeter.sym} 150 -920 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {simulator_commands_shown.sym} 1010 -260 0 0 {name=Simulator2
simulator=xyce
only_toplevel=false 
value="
.preprocess replaceground true
.option temp=27
.step Rload list 3k 1G
.tran 10n 10u
.print tran format=raw file=ldo_binary_tb.raw V(*) I(*)
"
"}
C {simulator_commands.sym} 1020 -460 0 0 {name=Libs_Xyce
simulator=xyce
only_toplevel=false 
value="tcleval(

.lib $::SG13G2_MODELS_XYCE/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerMOShv.lib mos_tt
.lib $::SG13G2_MODELS_XYCE/cornerRES.lib res_typ
.lib $::SG13G2_MODELS_XYCE/cornerCAP.lib cap_typ

.include $::SG13G2_STDCELL/sg13g2_stdcell.spice
)"}
C {launcher.sym} 720 130 0 0 {name=h2
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
C {simulator_commands.sym} 660 -460 0 0 {name=Libs_ngspice
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
C {simulator_commands_shown.sym} 650 -260 0 0 {name=Simulator1
simulator=ngspice
only_toplevel=false 
value=".option gmin=1e-16 method=gear trtol=0.8
.option noinit warn=1 rshunt=1e12
.save all
.include ldo_binary_tb.save
.control
  * 1mA load
  alter Rload=3k
  tran 10n 10u
  write ldo_binary_tb.raw
  set appendwrite

  * no load
  alter Rload=1G
  tran 10n 10u
  write ldo_binary_tb.raw

  rusage
  *quit
.endc
"
"}
C {launcher.sym} 1090 -20 0 0 {name=h3
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
C {devices/launcher.sym} 1650 -90 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/ldo_binary_tb.raw tran"
}
C {ammeter.sym} 1050 -700 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {ammeter.sym} 1250 -620 3 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 330 -840 3 0 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {biasgen.sym} 650 -840 0 0 {name=x4}
C {lab_pin.sym} 650 -960 0 1 {name=p50 lab=VCC}
C {lab_pin.sym} 650 -780 0 1 {name=p51 lab=0}
C {lab_pin.sym} 910 -860 0 1 {name=p52 lab=Ibias_1u_[1..3]}
C {lab_pin.sym} -50 -840 0 0 {name=p40 lab=Ibias_1u_2}
C {ammeter.sym} 650 -930 0 0 {name=Vmeas4 savecurrent=true spice_ignore=0}
C {ammeter.sym} 830 -860 3 0 {name=Vmeas5_[0..2] savecurrent=true spice_ignore=0}
C {lab_pin.sym} 800 -820 0 1 {name=p21 lab=por}
C {lab_pin.sym} -50 -820 0 0 {name=p33 lab=por}
C {lab_pin.sym} 900 -580 0 0 {name=p42 lab=por}
C {shifter_down_invert.sym} -140 -600 0 0 {name=x5 VDD=VDD VSS=0}
C {lab_pin.sym} -170 -600 0 0 {name=p19 lab=por}
