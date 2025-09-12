v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {Dummy devices for layout} 1150 -280 0 0 0.4 0.4 {}
T {Enable circuit, active low} 190 -380 0 0 0.4 0.4 {}
N 910 -170 910 -130 {lab=GND}
N 910 -240 910 -230 {lab=fb}
N 910 -700 910 -450 {lab=out}
N 910 -720 1420 -720 {lab=out}
N 760 -800 870 -800 {lab=vg}
N 910 -860 910 -800 {lab=#net1}
N 910 -770 910 -720 {lab=out}
N 760 -800 760 -700 {lab=vg}
N 840 -240 910 -240 {lab=fb}
N 610 -700 760 -700 {lab=vg}
N 820 -700 910 -700 {lab=out}
N 910 -720 910 -700 {lab=out}
N 910 -390 910 -240 {lab=fb}
N 760 -920 760 -890 {lab=VCC}
N 760 -860 760 -800 {lab=vg}
N 650 -170 650 -130 {lab=GND}
N 650 -230 650 -200 {lab=Ibias_1u}
N 340 -200 450 -200 {lab=en}
N 340 -170 340 -130 {lab=GND}
N 300 -200 300 -170 {lab=en_n}
N 230 -200 300 -200 {lab=en_n}
N 300 -230 300 -200 {lab=en_n}
N 340 -280 340 -230 {lab=VCC}
N 1280 -220 1280 -140 {lab=GND}
C {lab_pin.sym} 910 -130 0 0 {name=p1 sig_type=std_logic lab=GND}
C {lab_pin.sym} 840 -240 0 0 {name=p2 sig_type=std_logic lab=fb}
C {lab_pin.sym} 910 -920 0 0 {name=p26 sig_type=std_logic lab=VCC}
C {sg13g2_pr/sg13_hv_pmos.sym} 890 -800 0 0 {name=M4
l=0.4u
w=50u
ng=10
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 760 -800 0 0 {name=p21 sig_type=std_logic lab=vg}
C {ammeter.sym} 910 -890 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {sg13g2_pr/annotate_fet_params.sym} 1020 -950 0 0 {name=annot1 ref=M4}
C {lab_pin.sym} 400 -690 0 0 {name=p31 sig_type=std_logic lab=ref}
C {lab_pin.sym} 400 -710 0 0 {name=p32 sig_type=std_logic lab=fb}
C {cap_cmim.sym} 790 -700 1 0 {name=C1
model=cap_cmim
w=10.0e-6
l=10.0e-6
m=1
spiceprefix=X
}
C {lab_pin.sym} 650 -130 0 0 {name=p27 sig_type=std_logic lab=GND}
C {lab_pin.sym} 480 -640 0 0 {name=p39 sig_type=std_logic lab=Ibias_1u}
C {iopin.sym} 180 -870 0 0 {name=p4 lab=VCC}
C {iopin.sym} 180 -840 0 0 {name=p6 lab=GND}
C {ipin.sym} 180 -780 0 0 {name=p7 lab=ref}
C {ipin.sym} 180 -750 0 0 {name=p8 lab=Ibias_1u}
C {opin.sym} 180 -720 0 0 {name=p9 lab=out}
C {lab_pin.sym} 1420 -720 0 1 {name=p11 sig_type=std_logic lab=out}
C {sg13g2_pr/sg13_hv_nmos.sym} 630 -170 0 0 {name=M2
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 740 -890 0 0 {name=M3
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 760 -920 0 0 {name=p10 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 720 -890 0 0 {name=p12 sig_type=std_logic lab=en}
C {lab_pin.sym} 610 -170 0 0 {name=p3 sig_type=std_logic lab=en_n}
C {ipin.sym} 180 -680 0 0 {name=p5 lab=en_n}
C {sg13g2_pr/sg13_hv_nmos.sym} 320 -170 0 0 {name=M1
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 320 -230 0 0 {name=M11
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 230 -200 0 0 {name=p13 sig_type=std_logic lab=en_n}
C {lab_pin.sym} 450 -200 0 1 {name=p14 sig_type=std_logic lab=en}
C {lab_pin.sym} 340 -130 0 0 {name=p15 sig_type=std_logic lab=GND}
C {lab_pin.sym} 340 -280 0 0 {name=p16 sig_type=std_logic lab=VCC}
C {sg13g2_pr/rhigh.sym} 1280 -190 0 0 {name=Rdummy
w=0.5e-6
l=4e-6
model=rhigh
body=gnd
spiceprefix=X
m=2}
C {lab_pin.sym} 1280 -140 0 0 {name=p28 sig_type=std_logic lab=GND}
C {ldo_ota.sym} 500 -700 0 0 {name=x1}
C {lab_pin.sym} 480 -760 0 0 {name=p22 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 480 -610 0 0 {name=p23 sig_type=std_logic lab=GND}
C {lab_pin.sym} 650 -230 0 0 {name=p29 sig_type=std_logic lab=Ibias_1u}
C {rhigh.sym} 910 -420 0 0 {name=R2
w=0.5e-6
l=4*4e-6
model=rhigh
body=gnd
spiceprefix=X
m=1}
C {rhigh.sym} 910 -200 0 0 {name=R1
w=0.5e-6
l=20*4e-6
model=rhigh
body=gnd
spiceprefix=X
m=1}
