v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {Startup circuit} 80 -690 0 0 0.4 0.4 {}
T {Power on reset signal generator} 1310 -700 0 0 0.4 0.4 {}
T {Main bias generator (4x 1uA nominal)} 520 -690 0 0 0.4 0.4 {}
N 860 -240 860 -190 {lab=#net1}
N 860 -130 860 -120 {lab=GND}
N 860 -270 910 -270 {lab=GND}
N 620 -270 670 -270 {lab=GND}
N 800 -460 820 -460 {lab=vp}
N 710 -460 800 -460 {lab=vp}
N 670 -430 670 -330 {lab=vn}
N 730 -270 820 -270 {lab=vn}
N 860 -400 860 -300 {lab=vp}
N 670 -520 670 -460 {lab=VCC}
N 770 -520 860 -520 {lab=VCC}
N 860 -520 860 -460 {lab=VCC}
N 770 -550 770 -520 {lab=VCC}
N 670 -520 770 -520 {lab=VCC}
N 670 -330 670 -300 {lab=vn}
N 670 -240 670 -120 {lab=GND}
N 670 -330 730 -330 {lab=vn}
N 730 -330 730 -270 {lab=vn}
N 710 -270 730 -270 {lab=vn}
N 800 -400 860 -400 {lab=vp}
N 860 -430 860 -400 {lab=vp}
N 800 -460 800 -400 {lab=vp}
N 990 -520 990 -460 {lab=VCC}
N 940 -460 940 -400 {lab=vp}
N 940 -460 950 -460 {lab=vp}
N 860 -520 990 -520 {lab=VCC}
N 860 -400 940 -400 {lab=vp}
N 1490 -200 1490 -160 {lab=GND}
N 1450 -280 1450 -200 {lab=Ibias_1u_0}
N 1320 -280 1450 -280 {lab=Ibias_1u_0}
N 1490 -250 1600 -250 {lab=por}
N 1320 -430 1320 -280 {lab=Ibias_1u_0}
N 1450 -310 1450 -280 {lab=Ibias_1u_0}
N 1490 -250 1490 -230 {lab=por}
N 990 -430 990 -370 {lab=Ibias_1u_[0..3]}
N 1320 -200 1320 -160 {lab=GND}
N 1320 -280 1320 -260 {lab=Ibias_1u_0}
N 1490 -280 1490 -250 {lab=por}
N 1490 -370 1490 -310 {lab=VCC}
N 110 -430 110 -310 {lab=vn}
N 150 -400 150 -340 {lab=vstart}
N 220 -340 230 -340 {lab=vstart}
N 230 -340 230 -310 {lab=vstart}
N 230 -310 250 -310 {lab=vstart}
N 150 -310 150 -260 {lab=GND}
N 290 -310 290 -260 {lab=GND}
N 290 -370 290 -340 {lab=vp}
N 150 -490 150 -460 {lab=#net2}
N 110 -530 110 -490 {lab=#net2}
N 110 -490 150 -490 {lab=#net2}
N 150 -500 150 -490 {lab=#net2}
N 150 -430 240 -430 {lab=VCC}
N 150 -650 150 -600 {lab=VCC}
N 110 -600 110 -560 {lab=#net3}
N 110 -560 150 -560 {lab=#net3}
N 150 -530 240 -530 {lab=VCC}
N 150 -570 150 -560 {lab=#net3}
N 220 -370 220 -340 {lab=vstart}
N 150 -340 220 -340 {lab=vstart}
C {sg13g2_pr/sg13_hv_nmos.sym} 840 -270 0 0 {name=M1
l=2u
w=2u
ng=1
m=3
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 690 -270 0 1 {name=M2
l=2u
w=2u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 690 -460 0 1 {name=M3
l=2u
w=0.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 840 -460 0 0 {name=M4
l=2u
w=0.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 670 -120 0 0 {name=p1 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 860 -120 0 0 {name=p2 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 910 -270 0 1 {name=p3 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 620 -270 0 0 {name=p4 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 770 -550 0 1 {name=p5 sig_type=std_logic lab=VCC
}
C {sg13g2_pr/annotate_fet_params.sym} 110 -210 0 0 {name=annot1 ref=M6}
C {lab_pin.sym} 860 -380 0 0 {name=p8 sig_type=std_logic lab=vp
}
C {lab_pin.sym} 670 -380 0 0 {name=p9 sig_type=std_logic lab=vn
}
C {sg13g2_pr/sg13_hv_pmos.sym} 970 -460 0 0 {name=Mout[0..3]
l=2u
w=0.5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 990 -370 0 1 {name=p49 lab=Ibias_1u_[0..3]
}
C {iopin.sym} 100 -920 0 0 {name=p7 lab=VCC}
C {iopin.sym} 100 -870 0 0 {name=p10 lab=GND}
C {iopin.sym} 100 -820 0 0 {name=p11 lab=Ibias_1u_[1..3]}
C {cap_cmim.sym} 1320 -230 0 0 {name=C1
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {lab_pin.sym} 1320 -160 0 1 {name=p13 lab=GND}
C {sg13g2_pr/sg13_hv_pmos.sym} 1470 -310 0 0 {name=M7
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 1470 -200 0 0 {name=M8
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} 1490 -160 0 1 {name=p15 lab=GND}
C {lab_pin.sym} 1490 -370 0 1 {name=p16 lab=VCC}
C {lab_pin.sym} 1600 -250 0 1 {name=p17 lab=por}
C {opin.sym} 100 -770 0 0 {name=p18 lab=por}
C {lab_pin.sym} 1320 -430 0 1 {name=p6 lab=Ibias_1u_0
}
C {sg13g2_pr/rppd.sym} 860 -160 0 0 {name=R1
w=0.5e-6
l=80e-6
model=rppd
body=GND
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/sg13_hv_nmos.sym} 270 -310 0 0 {name=M5
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 130 -310 0 0 {name=M6
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 130 -430 0 0 {name=M9
l=2u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 150 -260 0 1 {name=p14 lab=GND}
C {lab_pin.sym} 290 -260 0 1 {name=p19 lab=GND}
C {lab_pin.sym} 220 -370 0 0 {name=p20 sig_type=std_logic lab=vstart
}
C {lab_pin.sym} 290 -370 0 0 {name=p21 sig_type=std_logic lab=vp
}
C {sg13g2_pr/sg13_hv_pmos.sym} 130 -530 0 0 {name=M10
l=2u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 240 -530 0 1 {name=p22 lab=VCC}
C {lab_pin.sym} 240 -430 0 1 {name=p12 lab=VCC}
C {sg13g2_pr/sg13_hv_pmos.sym} 130 -600 0 0 {name=M11
l=2u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 150 -650 0 1 {name=p23 lab=VCC}
C {sg13g2_pr/annotate_fet_params.sym} 260 -210 0 0 {name=annot2 ref=M5}
C {lab_pin.sym} 110 -370 0 1 {name=p24 sig_type=std_logic lab=vn
}
