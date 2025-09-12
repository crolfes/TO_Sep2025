v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 160 -260 190 -260 {lab=A}
N 190 -320 190 -260 {lab=A}
N 190 -320 200 -320 {lab=A}
N 190 -260 190 -200 {lab=A}
N 190 -200 200 -200 {lab=A}
N 240 -200 240 -130 {lab=VSS}
N 240 -260 240 -230 {lab=Y}
N 240 -260 330 -260 {lab=Y}
N 240 -290 240 -260 {lab=Y}
N 240 -380 240 -320 {lab=VDD}
C {sg13g2_pr/sg13_hv_nmos.sym} 220 -200 0 0 {name=M1
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 220 -320 0 0 {name=M2
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {opin.sym} 330 -260 0 0 {name=p2 lab=Y}
C {ipin.sym} 160 -260 0 0 {name=p4 lab=A}
C {lab_pin.sym} 240 -380 0 0 {name=p27 lab=VDD
}
C {lab_pin.sym} 240 -130 0 0 {name=p1 lab=VSS
}
