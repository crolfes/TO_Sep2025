v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 1520 -1020 2320 -620 {flags=graph
y1=2.1
y2=3.2
ypos1=0.1
ypos2=2.1
divy=5
subdivy=1
unity=1
x1=0
x2=5e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=out
color=6
dataset=-1
unitx=1
logx=0
logy=0
digital=0}
B 2 1520 -1140 2320 -1030 {flags=graph
y1=0
ypos1=0.06431693
ypos2=0.64952693
divy=5
subdivy=1
unity=1
x1=0
x2=5e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="\\"a; a2_l, a1_l, a0_l\\"
a2_l
a1_l
a0_l"
color="4 4 4 4"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
y2=1.2}
N 910 -260 910 -240 {lab=0}
N 800 -240 910 -240 {lab=0}
N 910 -600 910 -590 {lab=#net1}
N 910 -330 910 -320 {lab=fb}
N 910 -360 910 -330 {lab=fb}
N 1140 -620 1140 -600 {lab=#net1}
N 910 -620 910 -600 {lab=#net1}
N 1080 -650 1140 -650 {lab=VCC}
N 1140 -600 1140 -580 {lab=#net1}
N 910 -500 1140 -500 {lab=#net2}
N 1080 -550 1140 -550 {lab=VCC}
N 910 -600 1140 -600 {lab=#net1}
N 1140 -500 1140 -490 {lab=#net2}
N 1080 -460 1140 -460 {lab=VCC}
N 910 -530 910 -500 {lab=#net2}
N 1140 -520 1140 -500 {lab=#net2}
N 800 -260 800 -240 {lab=0}
N 910 -240 910 -220 {lab=0}
N 910 -720 910 -680 {lab=out}
N 1140 -720 1140 -680 {lab=out}
N 910 -720 1140 -720 {lab=out}
N 670 -310 670 -240 {lab=0}
N 670 -240 800 -240 {lab=0}
N 910 -240 1090 -240 {lab=0}
N 1090 -330 1090 -300 {lab=fb}
N 1090 -330 1170 -330 {lab=fb}
N 910 -330 1090 -330 {lab=fb}
N 910 -440 910 -420 {lab=#net3}
N 910 -420 1140 -420 {lab=#net3}
N 1140 -430 1140 -420 {lab=#net3}
N 670 -800 870 -800 {lab=vg}
N 670 -800 670 -370 {lab=vg}
N 910 -860 910 -800 {lab=#net4}
N 1140 -720 1420 -720 {lab=out}
N 910 -770 910 -720 {lab=out}
C {reshigh_chain.sym} 910 -290 0 0 {name=R1
w=0.5e-6
l=5e-6
n=10
model=rhigh
spiceprefix=X
b=0
m=1
tclcommand="edit_file [abs_sym_path reshigh_chain.tcl]"
schematic="reshigh_chain.tcl( @n )"}
C {lab_pin.sym} 910 -220 0 0 {name=p1 sig_type=std_logic lab=0}
C {vsource.sym} 800 -290 0 0 {name=V1 value=1 savecurrent=false}
C {code.sym} 2000 -560 0 0 {
name=TT_MODELS
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"
spice_ignore=false
      }
C {code_shown.sym} 2010 -380 0 0 {name=ngspice only_toplevel=false value="*.option method=gear trtol=1
.save all
.tran 10n 5u
.control
  run
  write resistors-binary.raw
  quit
.endc
"}
C {sg13g2_pr/rhigh.sym} 910 -650 0 0 {name=R4
w=0.5e-6
l=5e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 1170 -330 0 1 {name=p2 sig_type=std_logic lab=fb}
C {sg13g2_pr/sg13_hv_pmos.sym} 1160 -650 0 1 {name=M1
l=0.4u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1160 -550 0 1 {name=M2
l=0.4u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1160 -460 0 1 {name=M3
l=0.4u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1180 -550 0 1 {name=p3 sig_type=std_logic lab=a1}
C {lab_pin.sym} 1180 -460 0 1 {name=p5 sig_type=std_logic lab=a2}
C {vsource.sym} 1590 -550 0 0 {name=V2 value="1.2 pulse(1.2 0 0n 1n 1n 2u 4u)" savecurrent=false}
C {lab_pin.sym} 1590 -520 0 0 {name=p6 sig_type=std_logic lab=0}
C {lab_pin.sym} 1590 -580 0 1 {name=p7 sig_type=std_logic lab=a2_l}
C {vsource.sym} 1590 -440 0 0 {name=V3 value="1.2 pulse(1.2 0 0n 1n 1n 1u 2u)" savecurrent=false}
C {lab_pin.sym} 1590 -410 0 0 {name=p8 sig_type=std_logic lab=0}
C {lab_pin.sym} 1590 -470 0 1 {name=p9 sig_type=std_logic lab=a1_l}
C {vsource.sym} 1590 -340 0 0 {name=V4 value="1.2 pulse(1.2 0 0n 1n 1n 500n 1u)" savecurrent=false}
C {lab_pin.sym} 1590 -310 0 0 {name=p10 sig_type=std_logic lab=0}
C {lab_pin.sym} 1590 -370 0 1 {name=p11 sig_type=std_logic lab=a0_l}
C {shifter.sym} 1630 -170 0 0 {name=x_shift[2..0]}
C {lab_pin.sym} 1690 -240 0 1 {name=p12 lab=VCC}
C {lab_pin.sym} 1570 -240 0 0 {name=p13 lab=VDD}
C {lab_pin.sym} 1630 -100 0 1 {name=p14 lab=0}
C {lab_pin.sym} 1520 -170 0 0 {name=p15 lab="a[2..0]_l"}
C {lab_pin.sym} 1740 -180 0 1 {name=p16 lab=a[2..0]}
C {vsource.sym} 1890 -540 0 0 {name=V5 value=3.3 savecurrent=false}
C {lab_pin.sym} 1890 -510 0 0 {name=p17 sig_type=std_logic lab=0}
C {lab_pin.sym} 1890 -570 0 0 {name=p18 sig_type=std_logic lab=VCC}
C {vsource.sym} 1890 -440 0 0 {name=V6 value=1.2 savecurrent=false}
C {lab_pin.sym} 1890 -410 0 0 {name=p19 sig_type=std_logic lab=0}
C {lab_pin.sym} 1890 -470 0 0 {name=p20 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1180 -650 0 1 {name=p24 sig_type=std_logic lab=a0}
C {reshigh_chain.sym} 910 -390 0 0 {name=R3
w=0.5e-6
l=5e-6
n=14
model=rhigh
spiceprefix=X
b=0
m=1
tclcommand="edit_file [abs_sym_path reshigh_chain.tcl]"
schematic="reshigh_chain.tcl( @n )"}
C {lab_pin.sym} 1420 -720 0 1 {name=p25 sig_type=std_logic lab=out}
C {lab_pin.sym} 910 -920 0 0 {name=p26 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 800 -320 0 1 {name=p27 sig_type=std_logic lab=ref}
C {bsource.sym} 670 -340 0 0 {name=B1 VAR=V FUNC="'max(0, min(3.3, -V(ref,fb)*1e2))'" m=1}
C {capa-2.sym} 1090 -270 0 0 {name=C1
m=1
value=100p
footprint=1206
device=polarized_capacitor
}
C {reshigh_chain.sym} 910 -470 0 0 {name=R10
w=0.5e-6
l=5e-6
n=4
model=rhigh
spiceprefix=X
b=0
m=1
tclcommand="edit_file [abs_sym_path reshigh_chain.tcl]"
schematic="reshigh_chain.tcl( @n )"}
C {reshigh_chain.sym} 910 -560 0 0 {name=R2
w=0.5e-6
l=5e-6
n=2
model=rhigh
spiceprefix=X
b=0
m=1
tclcommand="edit_file [abs_sym_path reshigh_chain.tcl]"
schematic="reshigh_chain.tcl( @n )"}
C {sg13g2_pr/sg13_hv_pmos.sym} 890 -800 0 0 {name=M4
l=0.4u
w=40u
ng=4
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {capa-2.sym} 1270 -690 0 0 {name=C2
m=1
value=200f
footprint=1206
device=polarized_capacitor
}
C {lab_pin.sym} 1270 -660 0 0 {name=p4 sig_type=std_logic lab=0}
C {lab_pin.sym} 670 -800 0 0 {name=p21 sig_type=std_logic lab=vg}
C {lab_pin.sym} 1330 -660 0 0 {name=p22 sig_type=std_logic lab=0}
C {lab_pin.sym} 1080 -650 0 0 {name=p23 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 1080 -550 0 0 {name=p28 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 1080 -460 0 0 {name=p29 sig_type=std_logic lab=VCC}
C {ammeter.sym} 910 -890 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {reshigh_chain.sym} 1330 -690 0 0 {name=Rload
w=0.5e-6
l=5e-6
n=20
model=rhigh
spiceprefix=X
b=0
m=1
tclcommand="edit_file [abs_sym_path reshigh_chain.tcl]"
schematic="reshigh_chain.tcl( @n )"}
