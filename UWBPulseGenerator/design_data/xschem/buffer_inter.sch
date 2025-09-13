v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 -30 20 40 {lab=#net1}
N 20 40 20 90 {lab=#net1}
N 270 -30 270 40 {lab=#net2}
N 270 40 270 90 {lab=#net2}
N -50 -60 -50 0 {lab=in}
N 210 -60 210 0 {lab=#net1}
N 210 -60 230 -60 {lab=#net1}
N 210 50 210 120 {lab=#net1}
N 220 120 230 120 {lab=#net1}
N 20 150 20 170 {lab=GND}
N 20 170 270 170 {lab=GND}
N 270 150 270 170 {lab=GND}
N 20 -110 20 -90 {lab=VDD}
N 20 -110 270 -110 {lab=VDD}
N 270 -110 270 -90 {lab=VDD}
N 140 -150 140 -110 {lab=VDD}
N 140 170 140 200 {lab=GND}
N -90 40 -50 40 {lab=in}
N -50 0 -50 120 {lab=in}
N -50 -60 -20 -60 {lab=in}
N -50 120 -20 120 {lab=in}
N 210 0 210 40 {lab=#net1}
N 210 120 220 120 {lab=#net1}
N 210 40 210 50 {lab=#net1}
N 20 40 210 40 {lab=#net1}
N 460 -30 460 40 {lab=#net3}
N 460 40 460 90 {lab=#net3}
N 710 -30 710 40 {lab=out}
N 710 40 710 90 {lab=out}
N 390 -60 390 0 {lab=#net2}
N 650 -60 650 0 {lab=#net3}
N 650 -60 670 -60 {lab=#net3}
N 650 50 650 120 {lab=#net3}
N 660 120 670 120 {lab=#net3}
N 460 150 460 170 {lab=GND}
N 460 170 710 170 {lab=GND}
N 710 150 710 170 {lab=GND}
N 460 -110 460 -90 {lab=VDD}
N 460 -110 710 -110 {lab=VDD}
N 710 -110 710 -90 {lab=VDD}
N 580 -150 580 -110 {lab=VDD}
N 580 170 580 200 {lab=GND}
N 390 0 390 120 {lab=#net2}
N 390 -60 420 -60 {lab=#net2}
N 390 120 420 120 {lab=#net2}
N 650 0 650 40 {lab=#net3}
N 650 120 660 120 {lab=#net3}
N 650 40 650 50 {lab=#net3}
N 460 40 650 40 {lab=#net3}
N 270 40 390 40 {lab=#net2}
N 710 40 830 40 {lab=out}
N 140 -150 580 -150 {lab=VDD}
N 140 -200 140 -150 {lab=VDD}
N 140 200 580 200 {lab=GND}
N 140 200 140 240 {lab=GND}
N 20 120 20 150 {lab=GND}
N 270 120 270 150 {lab=GND}
N 460 120 460 150 {lab=GND}
N 710 120 710 150 {lab=GND}
N 710 -90 710 -60 {lab=VDD}
N 460 -90 460 -60 {lab=VDD}
N 270 -90 270 -60 {lab=VDD}
N 20 -90 20 -60 {lab=VDD}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 0 120 0 0 {name=M1
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 0 -60 0 0 {name=M3
l=150.0n
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 250 120 0 0 {name=M2
l=150.0n
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 250 -60 0 0 {name=M4
l=150.0n
w=2.0u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {ipin.sym} -90 40 0 0 {name=p2 lab=in}
C {opin.sym} 830 40 0 0 {name=p3 lab=out
}
C {iopin.sym} 140 -200 0 0 {name=p4 lab=VDD}
C {iopin.sym} 140 240 0 0 {name=p5 lab=GND}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 440 120 0 0 {name=M5
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 440 -60 0 0 {name=M6
l=150.0n
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 690 120 0 0 {name=M7
l=150.0n
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 690 -60 0 0 {name=M8
l=150.0n
w=2.0u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
