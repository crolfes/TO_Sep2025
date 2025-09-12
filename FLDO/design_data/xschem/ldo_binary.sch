v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {Enable circuit, active low} 150 -350 0 0 0.4 0.4 {}
T {Dummy devices for layout} 1240 -270 0 0 0.4 0.4 {}
N 910 -170 910 -130 {lab=GND}
N 910 -600 910 -590 {lab=#net1}
N 910 -240 910 -230 {lab=fb}
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
N 910 -700 910 -680 {lab=out}
N 1140 -720 1140 -680 {lab=out}
N 910 -720 1140 -720 {lab=out}
N 910 -440 910 -420 {lab=#net3}
N 910 -420 1140 -420 {lab=#net3}
N 1140 -430 1140 -420 {lab=#net3}
N 760 -800 870 -800 {lab=vg}
N 910 -860 910 -800 {lab=#net4}
N 1140 -720 1420 -720 {lab=out}
N 910 -770 910 -720 {lab=out}
N 760 -800 760 -700 {lab=vg}
N 840 -240 910 -240 {lab=fb}
N 610 -700 760 -700 {lab=vg}
N 820 -700 910 -700 {lab=out}
N 910 -720 910 -700 {lab=out}
N 1080 -370 1140 -370 {lab=VCC}
N 910 -350 910 -330 {lab=#net5}
N 910 -420 910 -410 {lab=#net3}
N 1140 -420 1140 -400 {lab=#net3}
N 1140 -340 1140 -330 {lab=#net5}
N 910 -330 1140 -330 {lab=#net5}
N 910 -270 910 -240 {lab=fb}
N 760 -920 760 -870 {lab=VCC}
N 760 -840 760 -800 {lab=vg}
N 610 -180 610 -140 {lab=GND}
N 610 -240 610 -210 {lab=Ibias_1u}
N 300 -210 410 -210 {lab=en}
N 300 -180 300 -140 {lab=GND}
N 260 -210 260 -180 {lab=en_n}
N 190 -210 260 -210 {lab=en_n}
N 260 -240 260 -210 {lab=en_n}
N 300 -290 300 -240 {lab=VCC}
N 1370 -210 1370 -130 {lab=GND}
C {lab_pin.sym} 910 -130 0 0 {name=p1 sig_type=std_logic lab=GND}
C {rhigh.sym} 910 -650 0 0 {name=R4
w=0.5e-6
l=12e-6
model=rhigh
body=GND
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 840 -240 0 0 {name=p2 sig_type=std_logic lab=fb}
C {sg13g2_pr/sg13_hv_pmos.sym} 1160 -650 0 1 {name=M1
l=0.4u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1160 -550 0 1 {name=M2
l=0.4u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 1160 -460 0 1 {name=M3
l=0.4u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1180 -550 0 1 {name=p3 sig_type=std_logic lab=a1}
C {lab_pin.sym} 1180 -460 0 1 {name=p5 sig_type=std_logic lab=a2}
C {lab_pin.sym} 1180 -650 0 1 {name=p24 sig_type=std_logic lab=a0}
C {lab_pin.sym} 910 -920 0 0 {name=p26 sig_type=std_logic lab=VCC}
C {sg13g2_pr/sg13_hv_pmos.sym} 890 -800 0 0 {name=M4
l=0.4u
w=100u
ng=10
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 760 -800 0 0 {name=p21 sig_type=std_logic lab=vg}
C {lab_pin.sym} 1080 -650 0 0 {name=p23 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 1080 -550 0 0 {name=p28 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 1080 -460 0 0 {name=p29 sig_type=std_logic lab=VCC}
C {ammeter.sym} 910 -890 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {sg13g2_pr/annotate_fet_params.sym} 1020 -950 0 0 {name=annot1 ref=M4}
C {cap_cmim.sym} 790 -700 1 0 {name=C1
model=cap_cmim
w=10.0e-6
l=10.0e-6
m=1
spiceprefix=X}
C {sg13g2_pr/sg13_hv_pmos.sym} 1160 -370 0 1 {name=M11
l=0.4u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1180 -370 0 1 {name=p35 sig_type=std_logic lab=a3}
C {lab_pin.sym} 1080 -370 0 0 {name=p36 sig_type=std_logic lab=VCC}
C {iopin.sym} 180 -870 0 0 {name=p4 lab=VCC}
C {iopin.sym} 180 -840 0 0 {name=p6 lab=GND}
C {ipin.sym} 180 -780 0 0 {name=p7 lab=ref}
C {ipin.sym} 180 -750 0 0 {name=p8 lab=Ibias_1u}
C {opin.sym} 180 -720 0 0 {name=p9 lab=out}
C {ipin.sym} 180 -670 0 0 {name=p10 lab=a[3..0]}
C {lab_pin.sym} 1420 -720 0 1 {name=p11 sig_type=std_logic lab=out}
C {sg13g2_pr/sg13_hv_pmos.sym} 740 -870 0 0 {name=M15
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 760 -920 0 0 {name=p17 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 720 -870 0 0 {name=p18 sig_type=std_logic lab=en}
C {ipin.sym} 180 -630 0 0 {name=p19 lab=en_n}
C {lab_pin.sym} 400 -690 0 0 {name=p20 sig_type=std_logic lab=ref}
C {lab_pin.sym} 400 -710 0 0 {name=p22 sig_type=std_logic lab=fb}
C {lab_pin.sym} 480 -640 0 0 {name=p25 sig_type=std_logic lab=Ibias_1u}
C {ldo_ota.sym} 500 -700 0 0 {name=x1}
C {lab_pin.sym} 480 -760 0 0 {name=p33 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 480 -610 0 0 {name=p37 sig_type=std_logic lab=GND}
C {lab_pin.sym} 610 -140 0 0 {name=p27 sig_type=std_logic lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} 590 -180 0 0 {name=M5
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} 570 -180 0 0 {name=p12 sig_type=std_logic lab=en_n}
C {sg13g2_pr/sg13_hv_nmos.sym} 280 -180 0 0 {name=M6
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 280 -240 0 0 {name=M7
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 190 -210 0 0 {name=p16 sig_type=std_logic lab=en_n}
C {lab_pin.sym} 410 -210 0 1 {name=p30 sig_type=std_logic lab=en}
C {lab_pin.sym} 300 -140 0 0 {name=p31 sig_type=std_logic lab=GND}
C {lab_pin.sym} 300 -290 0 0 {name=p32 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 610 -240 0 0 {name=p34 sig_type=std_logic lab=Ibias_1u}
C {rhigh.sym} 1370 -180 0 0 {name=Rdummy
w=0.5e-6
l=12e-6
model=rhigh
body=gnd
spiceprefix=X
m=5}
C {lab_pin.sym} 1370 -130 0 0 {name=p13 sig_type=std_logic lab=GND}
C {rhigh.sym} 910 -560 0 0 {name=R2
w=0.5e-6
l=2*12e-6
model=rhigh
body=GND
spiceprefix=X
b=0
m=1
}
C {rhigh.sym} 910 -470 0 0 {name=R6
w=0.5e-6
l=4*12e-6
model=rhigh
body=GND
spiceprefix=X
b=0
m=1
}
C {rhigh.sym} 910 -380 0 0 {name=R5
w=0.5e-6
l=8*12e-6
model=rhigh
body=GND
spiceprefix=X
b=0
m=1
}
C {rhigh.sym} 910 -300 0 0 {name=R3
w=0.5e-6
l=6*12e-6
model=rhigh
body=GND
spiceprefix=X
b=0
m=1
}
C {rhigh.sym} 910 -200 0 0 {name=R1
w=0.5e-6
l=10*12e-6
model=rhigh
body=GND
spiceprefix=X
b=0
m=1
}
