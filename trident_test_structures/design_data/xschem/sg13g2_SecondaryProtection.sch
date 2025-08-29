v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 100 0 100 20 {lab=padres}
N 30 -0 100 0 {lab=padres}
N 100 -20 100 0 {lab=padres}
N 100 -120 100 -80 {lab=VDD}
N 100 80 100 120 {lab=VSS}
N -60 -0 -30 -0 {lab=pad}
N 100 0 200 -0 {lab=padres}
N 80 120 100 120 {lab=VSS}
N 80 -120 100 -120 {lab=VDD}
N -50 80 60 80 {lab=guard}
N 60 60 60 80 {lab=guard}
N -50 60 -50 80 {lab=guard}
N -60 80 -50 80 {lab=guard}
C {sg13g2_pr/rppd.sym} 0 0 1 0 {name=R1
w=0.5e-6
l=0.5e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/dantenna.sym} 100 -50 0 0 {name=D1
model=dantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} 100 50 0 0 {name=D2
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {ipin.sym} -60 0 0 0 {name=p1 lab=pad}
C {ipin.sym} 80 -120 0 0 {name=p2 lab=VDD}
C {ipin.sym} 80 120 0 0 {name=p3 lab=VSS}
C {opin.sym} 200 0 0 0 {name=p4 lab=padres}
C {ipin.sym} -60 80 0 0 {name=p5 lab=guard}
C {res.sym} 60 30 0 0 {name=R2
value=100G
footprint=1206
device=resistor
m=1}
C {res.sym} -50 30 0 0 {name=R3
value=100G
footprint=1206
device=resistor
m=1}
