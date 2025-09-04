v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 90 40 120 {lab=guard}
N 40 120 40 150 {lab=guard}
N 40 210 40 240 {lab=VSS}
N -40 240 40 240 {lab=VSS}
N 40 0 200 -0 {lab=padres}
N 40 0 40 30 {lab=padres}
N -50 -0 40 0 {lab=padres}
N -180 -0 -110 0 {lab=pad}
N -270 -120 -270 120 {lab=guard}
N 40 -120 40 -90 {lab=guard}
N 40 -30 40 -0 {lab=padres}
N 40 -150 40 -120 {lab=guard}
N 40 -240 40 -210 {lab=VDD}
N -140 120 40 120 {lab=guard}
N -290 120 -270 120 {lab=guard}
N -110 -120 40 -120 {lab=guard}
N -50 -180 -10 -180 {lab=VDD}
N -280 -180 -150 -180 {lab=#net1}
N -110 -240 -110 -210 {lab=VDD}
N -50 -240 -50 -180 {lab=VDD}
N -110 -150 -110 -120 {lab=guard}
N -50 -240 40 -240 {lab=VDD}
N -270 -120 -110 -120 {lab=guard}
N -110 -240 -50 -240 {lab=VDD}
N -110 -180 -50 -180 {lab=VDD}
N -310 -240 -110 -240 {lab=VDD}
N -140 180 -40 180 {lab=VSS}
N -40 180 -40 240 {lab=VSS}
N -310 180 -180 180 {lab=#net2}
N -140 240 -40 240 {lab=VSS}
N -140 120 -140 150 {lab=guard}
N -270 120 -140 120 {lab=guard}
N -140 210 -140 240 {lab=VSS}
N -380 240 -140 240 {lab=VSS}
C {iopin.sym} -380 240 2 0 {name=p1 lab=VSS}
C {iopin.sym} -310 -240 2 0 {name=p2 lab=VDD}
C {iopin.sym} -180 0 2 0 {name=p3 lab=pad
}
C {iopin.sym} -290 120 2 0 {name=p4 lab=guard}
C {sg13g2_pr/rppd.sym} -80 0 1 0 {name=R1
w=1e-6
l=2e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {iopin.sym} 200 0 0 0 {name=p5 lab=padres
}
C {sg13g2_pr/dantenna.sym} 40 60 0 0 {name=D7
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} 40 180 0 0 {name=D1
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 40 -60 0 0 {name=D2
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 40 -180 0 0 {name=D3
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -130 -180 0 0 {name=M2
l=600n
w=1u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -280 -210 0 0 {name=R3
w=0.5e-6
l=3.54e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/sg13_hv_nmos.sym} -160 180 0 0 {name=M3
l=600n
w=1u
ng=20
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -310 210 0 0 {name=R2
w=0.5e-6
l=0.5e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
