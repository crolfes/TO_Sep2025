v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Basic level shifter, sized for shifting from 1.2 V to 3.3 V} 150 -450 0 0 0.4 0.4 {}
N 490 -120 710 -120 {lab=GND}
N 710 -170 710 -120 {lab=GND}
N 490 -170 490 -120 {lab=GND}
N 240 -120 490 -120 {lab=GND}
N 620 -320 670 -320 {lab=lvlsh}
N 580 -270 620 -320 {lab=lvlsh}
N 490 -270 580 -270 {lab=lvlsh}
N 490 -290 490 -270 {lab=lvlsh}
N 530 -320 580 -320 {lab=lvlsh_b}
N 580 -320 620 -270 {lab=lvlsh_b}
N 620 -270 710 -270 {lab=lvlsh_b}
N 710 -290 710 -270 {lab=lvlsh_b}
N 240 -170 240 -120 {lab=GND}
N 230 -120 240 -120 {lab=GND}
N 240 -210 240 -200 {lab=in_b}
N 240 -290 240 -240 {lab=VDD_1v2}
N 490 -370 490 -320 {lab=VDD_3v3}
N 490 -370 710 -370 {lab=VDD_3v3}
N 710 -370 710 -320 {lab=VDD_3v3}
N 200 -200 200 -170 {lab=in}
N 160 -200 200 -200 {lab=in}
N 200 -240 200 -200 {lab=in}
N 160 -200 160 -90 {lab=in}
N 110 -200 160 -200 {lab=in}
N 160 -90 640 -90 {lab=in}
N 640 -170 670 -170 {lab=in}
N 710 -230 710 -200 {lab=lvlsh_b}
N 490 -270 490 -200 {lab=lvlsh}
N 710 -120 910 -120 {lab=GND}
N 910 -170 910 -120 {lab=GND}
N 910 -250 910 -200 {lab=out}
N 910 -370 910 -320 {lab=VDD_3v3}
N 710 -370 910 -370 {lab=VDD_3v3}
N 910 -250 960 -250 {lab=out}
N 910 -290 910 -250 {lab=out}
N 870 -230 870 -170 {lab=lvlsh_b}
N 640 -170 640 -90 {lab=in}
N 390 -170 450 -170 {lab=in_b}
N 390 -210 390 -170 {lab=in_b}
N 240 -210 390 -210 {lab=in_b}
N 710 -230 870 -230 {lab=lvlsh_b}
N 710 -270 710 -230 {lab=lvlsh_b}
N 870 -320 870 -230 {lab=lvlsh_b}
C {sg13g2_pr/sg13_hv_nmos.sym} 470 -170 0 0 {name=M1
l=0.45u
w=2u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 690 -170 0 0 {name=M2
l=0.45u
w=2u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 510 -320 0 1 {name=M3
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 690 -320 0 0 {name=M4
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 220 -170 0 0 {name=M5
l=0.13u
w=0.74u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 220 -240 0 0 {name=M6
l=0.13u
w=1.12u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 230 -120 0 0 {name=p1 sig_type=std_logic lab=GND}
C {lab_pin.sym} 110 -200 0 0 {name=p2 sig_type=std_logic lab=in}
C {lab_pin.sym} 240 -290 0 0 {name=p3 sig_type=std_logic lab=VDD_1v2}
C {lab_pin.sym} 490 -370 0 0 {name=p4 sig_type=std_logic lab=VDD_3v3}
C {lab_pin.sym} 960 -250 0 1 {name=p5 sig_type=std_logic lab=out}
C {lab_pin.sym} 710 -250 0 1 {name=p6 sig_type=std_logic lab=lvlsh_b}
C {lab_pin.sym} 390 -170 0 0 {name=p13 sig_type=std_logic lab=in_b}
C {iopin.sym} 50 -420 0 0 {name=p7 lab=VDD_3v3}
C {iopin.sym} 50 -400 0 0 {name=p8 lab=VDD_1v2}
C {iopin.sym} 50 -380 0 0 {name=p9 lab=GND}
C {ipin.sym} 50 -360 0 0 {name=p10 lab=in}
C {opin.sym} 50 -340 0 0 {name=p11 lab=out}
C {sg13g2_pr/sg13_hv_nmos.sym} 890 -170 0 0 {name=M7
l=0.45u
w=2u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 890 -320 0 0 {name=M8
l=0.4u
w=2u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 490 -240 0 1 {name=p14 sig_type=std_logic lab=lvlsh}
