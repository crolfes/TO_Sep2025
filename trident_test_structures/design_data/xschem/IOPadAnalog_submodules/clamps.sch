v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 -40 60 -0 {lab=pad}
N 60 -0 60 60 {lab=pad}
N 60 -160 60 -100 {lab=VDD}
N 60 -70 100 -70 {lab=VDD}
N 100 -160 100 -70 {lab=VDD}
N 60 -160 100 -160 {lab=VDD}
N -60 -90 -60 -70 {lab=#net1}
N -60 -70 20 -70 {lab=#net1}
N -60 -160 -60 -150 {lab=VDD}
N -60 -160 60 -160 {lab=VDD}
N 60 180 100 180 {lab=VSS}
N 60 90 100 90 {lab=VSS}
N -80 160 -80 180 {lab=VSS}
N 60 120 60 180 {lab=VSS}
N 100 90 100 180 {lab=VSS}
N -80 90 -80 100 {lab=#net2}
N -80 90 20 90 {lab=#net2}
N -20 0 60 -0 {lab=pad}
N -120 -160 -60 -160 {lab=VDD}
N -80 180 60 180 {lab=VSS}
N -120 180 -80 180 {lab=VSS}
N -40 40 -20 40 {lab=pad}
N -20 0 -20 40 {lab=pad}
N -100 -0 -20 0 {lab=pad}
C {sg13g2_pr/sg13_hv_nmos.sym} 40 90 0 0 {name=M1
l=0.6u
w=4.4u
ng=1
m=20
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -60 -120 0 0 {name=R1
w=0.5e-6
l=12.9e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/sg13_hv_pmos.sym} 40 -70 0 0 {name=M2
l=0.6u
w=6.66u
ng=1
m=40
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -80 130 0 0 {name=R2
w=0.5e-6
l=12.9e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {ipin.sym} -120 -160 0 0 {name=p1 lab=VDD}
C {ipin.sym} -120 180 0 0 {name=p2 lab=VSS}
C {ipin.sym} -100 0 0 0 {name=p3 lab=pad}
C {ipin.sym} -100 40 0 0 {name=p4 lab=guard
}
C {res.sym} -70 40 1 0 {name=R3
value=100G
footprint=1206
device=resistor
m=1}
