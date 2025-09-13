v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 100 -60 100 -30 {lab=#net1}
N 100 -190 100 -120 {lab=#net2}
N 310 -60 310 -30 {lab=#net3}
N 310 -190 310 -120 {lab=#net4}
N 500 -190 500 -120 {lab=out}
N 240 -220 270 -220 {lab=#net2}
N 240 -90 270 -90 {lab=#net2}
N 240 -220 240 -90 {lab=#net2}
N 420 -220 460 -220 {lab=#net4}
N 420 -90 460 -90 {lab=#net4}
N 420 -220 420 -90 {lab=#net4}
N 310 -150 420 -150 {lab=#net4}
N 100 -150 240 -150 {lab=#net2}
N 100 -280 100 -250 {lab=VDD}
N 500 -280 500 -250 {lab=VDD}
N 100 -280 500 -280 {lab=VDD}
N 310 -280 310 -250 {lab=VDD}
N 100 30 100 80 {lab=GND}
N 100 80 500 80 {lab=GND}
N 500 -60 500 80 {lab=GND}
N 310 30 310 80 {lab=GND}
N 240 -0 270 -0 {lab=in0}
N 240 -0 240 60 {lab=in0}
N 40 60 240 60 {lab=in0}
N 40 0 40 60 {lab=in0}
N 40 0 60 0 {lab=in0}
N -120 0 40 0 {lab=in0}
N -120 -220 -120 0 {lab=in0}
N -120 -220 60 -220 {lab=in0}
N 20 -90 60 -90 {lab=in1}
N 500 -150 650 -150 {lab=out}
N -160 -120 -120 -120 {lab=in0}
N 340 -310 340 -280 {lab=VDD}
N 340 -310 350 -310 {lab=VDD}
N 350 120 370 120 {lab=GND}
N 350 80 350 120 {lab=GND}
N 100 0 100 30 {lab=GND}
N 310 0 310 30 {lab=GND}
N 500 -90 500 -60 {lab=GND}
N 500 -250 500 -220 {lab=VDD}
N 310 -250 310 -220 {lab=VDD}
N 100 -250 100 -220 {lab=VDD}
N 100 -90 150 -90 {lab=GND}
N 150 -90 150 -0 {lab=GND}
N 100 -0 150 -0 {lab=GND}
N 310 -90 360 -90 {lab=GND}
N 360 -90 360 -0 {lab=GND}
N 310 0 360 -0 {lab=GND}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 80 0 0 0 {name=M2
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 80 -90 0 0 {name=M1
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 80 -220 0 0 {name=M3
l=150.0n
w=1.5u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 290 -220 0 0 {name=M4
l=150.0n
w=1.5u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 480 -220 0 0 {name=M5
l=150.0n
w=1.5u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 290 0 0 0 {name=M6
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 290 -90 0 0 {name=M7
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 480 -90 0 0 {name=M9
l=150.0n
w=500.0n
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
}
C {ipin.sym} -160 -120 0 0 {name=p2 lab=in0}
C {ipin.sym} 20 -90 0 0 {name=p3 lab=in1}
C {opin.sym} 650 -150 0 0 {name=p1 lab=out}
C {iopin.sym} 370 120 0 0 {name=p4 lab=GND}
C {iopin.sym} 350 -310 0 0 {name=p5 lab=VDD}
