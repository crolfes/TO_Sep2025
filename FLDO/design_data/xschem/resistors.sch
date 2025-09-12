v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 1520 -1020 2320 -620 {flags=graph
y1=2.3
y2=3.3
ypos1=0.1
ypos2=2.1
divy=5
subdivy=1
unity=1
x1=0
x2=4e-06
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
x2=4e-06
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
N 1150 -240 1150 -220 {lab=0}
N 1040 -220 1150 -220 {lab=0}
N 1150 -610 1150 -600 {lab=#net1}
N 1150 -310 1150 -300 {lab=fb}
N 1150 -340 1150 -310 {lab=fb}
N 1380 -710 1380 -690 {lab=#net2}
N 1380 -630 1380 -610 {lab=#net1}
N 1150 -630 1150 -610 {lab=#net1}
N 1320 -660 1380 -660 {lab=VCC}
N 1150 -710 1380 -710 {lab=#net2}
N 1380 -610 1380 -590 {lab=#net1}
N 1150 -510 1380 -510 {lab=#net3}
N 1320 -560 1380 -560 {lab=VCC}
N 1150 -610 1380 -610 {lab=#net1}
N 1380 -510 1380 -500 {lab=#net3}
N 1330 -310 1410 -310 {lab=fb}
N 1320 -470 1380 -470 {lab=VCC}
N 1150 -540 1150 -510 {lab=#net3}
N 1380 -530 1380 -510 {lab=#net3}
N 1320 -560 1320 -470 {lab=VCC}
N 1320 -660 1320 -560 {lab=VCC}
N 1040 -240 1040 -220 {lab=0}
N 1150 -220 1150 -200 {lab=0}
N 1150 -900 1150 -890 {lab=#net4}
N 1150 -710 1150 -690 {lab=#net2}
N 1150 -740 1150 -710 {lab=#net2}
N 1380 -1000 1380 -980 {lab=#net5}
N 1380 -920 1380 -900 {lab=#net4}
N 1150 -920 1150 -900 {lab=#net4}
N 1320 -950 1380 -950 {lab=VCC}
N 1150 -1000 1380 -1000 {lab=#net5}
N 1380 -900 1380 -880 {lab=#net4}
N 1150 -800 1380 -800 {lab=#net6}
N 1320 -850 1380 -850 {lab=VCC}
N 1150 -900 1380 -900 {lab=#net4}
N 1380 -800 1380 -790 {lab=#net6}
N 1380 -730 1380 -710 {lab=#net2}
N 1320 -760 1380 -760 {lab=VCC}
N 1150 -830 1150 -800 {lab=#net6}
N 1380 -820 1380 -800 {lab=#net6}
N 1320 -850 1320 -760 {lab=VCC}
N 1320 -760 1320 -660 {lab=VCC}
N 1150 -1100 1150 -1080 {lab=out}
N 1150 -1000 1150 -980 {lab=#net5}
N 1380 -1100 1380 -1080 {lab=out}
N 1380 -1020 1380 -1000 {lab=#net5}
N 1150 -1020 1150 -1000 {lab=#net5}
N 1320 -1050 1380 -1050 {lab=VCC}
N 1320 -1050 1320 -950 {lab=VCC}
N 1320 -950 1320 -850 {lab=VCC}
N 910 -290 910 -220 {lab=0}
N 910 -220 1040 -220 {lab=0}
N 910 -1100 910 -350 {lab=out}
N 910 -1100 1150 -1100 {lab=out}
N 1150 -220 1330 -220 {lab=0}
N 1330 -310 1330 -280 {lab=fb}
N 1150 -310 1330 -310 {lab=fb}
N 1150 -1100 1380 -1100 {lab=out}
N 1150 -420 1150 -400 {lab=#net7}
N 1380 -440 1380 -420 {lab=#net7}
N 1150 -420 1380 -420 {lab=#net7}
N 1150 -450 1150 -420 {lab=#net7}
N 1320 -1130 1320 -1050 {lab=VCC}
C {reshigh_chain.sym} 1150 -270 0 0 {name=R1
w=0.5e-6
l=10e-6
n=10
model=rhigh
spiceprefix=X
b=0
m=1
tclcommand="edit_file [abs_sym_path reshigh_chain.tcl]"
schematic="reshigh_chain.tcl( @n )"}
C {lab_pin.sym} 1150 -200 0 0 {name=p1 sig_type=std_logic lab=0}
C {vsource.sym} 1040 -270 0 0 {name=V1 value=1 savecurrent=false}
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
C {code_shown.sym} 2010 -380 0 0 {name=ngspice only_toplevel=false value=".option method=gear trtol=1
.save all
.tran 10n 4u
.control
  run
  write resistors.raw
  quit
.endc
"}
C {sg13g2_pr/rhigh.sym} 1150 -480 0 0 {name=R2
w=0.5e-6
l=10e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rhigh.sym} 1150 -570 0 0 {name=R3
w=0.5e-6
l=10e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rhigh.sym} 1150 -660 0 0 {name=R4
w=0.5e-6
l=10e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 1410 -310 0 1 {name=p2 sig_type=std_logic lab=fb}
C {sg13g2_pr/sg13_hv_pmos.sym} 1400 -660 0 1 {name=M1
l=0.4u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1400 -560 0 1 {name=M2
l=0.4u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1400 -470 0 1 {name=M3
l=0.4u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1420 -560 0 1 {name=p3 sig_type=std_logic lab=a1}
C {lab_pin.sym} 1420 -660 0 1 {name=p4 sig_type=std_logic lab=a2}
C {lab_pin.sym} 1420 -470 0 1 {name=p5 sig_type=std_logic lab=a2}
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
C {sg13g2_pr/rhigh.sym} 1150 -770 0 0 {name=R5
w=0.5e-6
l=10e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rhigh.sym} 1150 -860 0 0 {name=R6
w=0.5e-6
l=10e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rhigh.sym} 1150 -950 0 0 {name=R7
w=0.5e-6
l=10e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1400 -950 0 1 {name=M4
l=0.4u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1400 -850 0 1 {name=M5
l=0.4u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1400 -760 0 1 {name=M6
l=0.4u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1420 -850 0 1 {name=p22 sig_type=std_logic lab=a2}
C {lab_pin.sym} 1420 -950 0 1 {name=p23 sig_type=std_logic lab=a1}
C {lab_pin.sym} 1420 -760 0 1 {name=p24 sig_type=std_logic lab=a0}
C {sg13g2_pr/rhigh.sym} 1150 -1050 0 0 {name=R8
w=0.5e-6
l=10e-6
model=rhigh
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1400 -1050 0 1 {name=M7
l=0.4u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1420 -1050 0 1 {name=p21 sig_type=std_logic lab=a2}
C {reshigh_chain.sym} 1150 -370 0 0 {name=R9
w=0.5e-6
l=10e-6
n=14
model=rhigh
spiceprefix=X
b=0
m=1
tclcommand="edit_file [abs_sym_path reshigh_chain.tcl]"
schematic="reshigh_chain.tcl( @n )"}
C {lab_pin.sym} 1150 -1100 0 1 {name=p25 sig_type=std_logic lab=out}
C {lab_pin.sym} 1320 -1130 0 0 {name=p26 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 1040 -300 0 1 {name=p27 sig_type=std_logic lab=ref}
C {bsource.sym} 910 -320 0 0 {name=B1 VAR=V FUNC="'max(0, min(3.3, V(ref,fb)*1e3))'" m=1}
C {capa-2.sym} 1330 -250 0 0 {name=C1
m=1
value=10p
footprint=1206
device=polarized_capacitor}
