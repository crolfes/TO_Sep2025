v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {Dummy devices for layout} 190 -840 0 0 0.4 0.4 {}
N -450 -430 -450 -340 {lab=GND}
N -150 -430 -150 -340 {lab=GND}
N -450 -490 -450 -460 {lab=Ibias_1u}
N -450 -490 -390 -490 {lab=Ibias_1u}
N -450 -520 -450 -490 {lab=Ibias_1u}
N -390 -490 -390 -430 {lab=Ibias_1u}
N -410 -430 -390 -430 {lab=Ibias_1u}
N -240 -540 -240 -510 {lab=tail}
N -150 -510 -50 -510 {lab=tail}
N -50 -540 -50 -510 {lab=tail}
N -150 -510 -150 -460 {lab=tail}
N -240 -510 -150 -510 {lab=tail}
N -240 -900 -240 -600 {lab=vbp}
N -200 -930 -90 -930 {lab=vbp}
N -200 -930 -200 -900 {lab=vbp}
N -240 -900 -200 -900 {lab=vbp}
N -50 -900 -50 -600 {lab=out}
N -150 -960 -50 -960 {lab=VCC}
N -50 -960 -50 -930 {lab=VCC}
N -240 -960 -240 -930 {lab=VCC}
N -240 -570 -50 -570 {lab=GND}
N -320 -570 -280 -570 {lab=plus}
N -450 -340 -150 -340 {lab=GND}
N -390 -430 -190 -430 {lab=Ibias_1u}
N 320 -670 320 -590 {lab=GND}
N 320 -730 360 -730 {lab=tail}
N 360 -790 360 -730 {lab=tail}
N 320 -790 360 -790 {lab=tail}
N 320 -550 320 -480 {lab=VCC}
N -150 -1020 -150 -960 {lab=VCC}
N -240 -960 -150 -960 {lab=VCC}
C {sg13g2_pr/sg13_hv_nmos.sym} -260 -570 0 0 {name=M5
l=2u
w=3u
ng=3
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -30 -570 0 1 {name=M6
l=2u
w=3u
ng=3
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -170 -430 0 0 {name=M7
l=2u
w=1u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -430 -430 0 1 {name=M8
l=2u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -70 -930 0 0 {name=M9
l=2u
w=2u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -220 -930 0 1 {name=M10
l=2u
w=2u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -150 -1020 0 0 {name=p30 sig_type=std_logic lab=VCC}
C {lab_pin.sym} -320 -570 0 0 {name=p32 sig_type=std_logic lab=plus}
C {lab_pin.sym} -140 -570 1 0 {name=p34 sig_type=std_logic lab=GND}
C {lab_pin.sym} -450 -340 0 0 {name=p27 sig_type=std_logic lab=GND}
C {lab_pin.sym} -450 -520 0 1 {name=p39 sig_type=std_logic lab=Ibias_1u}
C {iopin.sym} -480 -970 0 0 {name=p4 lab=VCC}
C {iopin.sym} -480 -940 0 0 {name=p6 lab=GND}
C {ipin.sym} -480 -880 0 0 {name=p7 lab=plus}
C {ipin.sym} -480 -850 0 0 {name=p8 lab=min}
C {opin.sym} -480 -820 0 0 {name=p9 lab=out}
C {lab_pin.sym} -150 -490 0 1 {name=p22 sig_type=std_logic lab=tail}
C {lab_pin.sym} -240 -800 0 0 {name=p23 sig_type=std_logic lab=vbp}
C {sg13g2_pr/sg13_hv_nmos.sym} 340 -640 0 1 {name=Mdummy0
l=2u
w=1u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} 320 -590 0 0 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} 360 -640 0 1 {name=p18 sig_type=std_logic lab=Ibias_1u}
C {sg13g2_pr/sg13_hv_nmos.sym} 340 -760 0 1 {name=Mdummy1
l=2u
w=1u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} 320 -760 0 0 {name=p19 sig_type=std_logic lab=GND}
C {lab_pin.sym} 360 -760 0 1 {name=p20 sig_type=std_logic lab=tail}
C {sg13g2_pr/sg13_hv_pmos.sym} 340 -510 0 1 {name=MdummyP
l=2u
w=1u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 360 -510 0 1 {name=p24 sig_type=std_logic lab=vbp}
C {lab_pin.sym} 320 -550 0 0 {name=p25 sig_type=std_logic lab=VCC}
C {lab_pin.sym} -50 -790 0 1 {name=p1 sig_type=std_logic lab=out}
C {ipin.sym} -480 -910 0 0 {name=p2 lab=Ibias_1u}
C {lab_pin.sym} -10 -570 0 1 {name=p3 sig_type=std_logic lab=min}
