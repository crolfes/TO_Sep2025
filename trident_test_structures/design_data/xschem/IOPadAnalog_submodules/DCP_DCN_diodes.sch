v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 0 0 0 {lab=#net1}
N 0 0 0 20 {lab=#net1}
N -80 80 -0 80 {lab=#net2}
N -80 -60 -0 -60 {lab=#net3}
C {sg13g2_pr/dantenna.sym} 0 50 0 0 {name=D1
model=dantenna
l=1.26u
w=27.78u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} 0 -30 0 0 {name=D2
model=dantenna
l=1.26u
w=27.78u
spiceprefix=X
}
C {ipin.sym} -80 -60 0 0 {name=p1 lab=VDD}
C {ipin.sym} -80 80 0 0 {name=p2 lab=VSS}
C {ipin.sym} -80 0 0 0 {name=p3 lab=pad}
C {ipin.sym} -80 140 0 0 {name=p4 lab=guard}
