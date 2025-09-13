v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 -20 60 50 {lab=#net1}
N 60 50 60 100 {lab=#net1}
N 310 -20 310 50 {lab=out}
N 310 50 310 100 {lab=out}
N 20 -50 20 10 {lab=vbias}
N 20 10 250 10 {lab=vbias}
N 250 -50 250 10 {lab=vbias}
N 250 -50 270 -50 {lab=vbias}
N 60 60 260 60 {lab=#net1}
N 260 60 260 130 {lab=#net1}
N 260 130 270 130 {lab=#net1}
N 60 160 60 180 {lab=GND}
N 60 180 310 180 {lab=GND}
N 310 160 310 180 {lab=GND}
N 310 50 440 50 {lab=out}
N 60 -100 60 -80 {lab=VDD}
N 60 -100 310 -100 {lab=VDD}
N 310 -100 310 -80 {lab=VDD}
N 180 -140 180 -100 {lab=VDD}
N 180 180 180 210 {lab=GND}
N -20 130 20 130 {lab=in}
N -20 -50 20 -50 {lab=vbias}
N 60 130 60 160 {lab=GND}
N 310 130 310 160 {lab=GND}
N 310 -80 310 -50 {lab=VDD}
N 60 -80 60 -50 {lab=VDD}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 40 130 0 0 {name=M1
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 40 -50 0 0 {name=M3
l=150.0n
w=1.7u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 290 130 0 0 {name=M2
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 290 -50 0 0 {name=M4
l=150.0n
w=1.7u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {ipin.sym} -20 -50 0 0 {name=p1 lab=vbias}
C {ipin.sym} -20 130 0 0 {name=p2 lab=in}
C {opin.sym} 440 50 0 0 {name=p3 lab=out
}
C {iopin.sym} 180 -140 0 0 {name=p4 lab=VDD}
C {iopin.sym} 180 210 0 0 {name=p5 lab=GND}
