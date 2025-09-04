v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 30 20 120 {lab=source}
N 20 -0 180 0 {lab=bulk}
N 20 -120 20 -30 {lab=drain}
N -140 0 -20 -0 {lab=gate}
N -220 -40 -220 40 {lab=guard}
N -220 40 -80 40 {lab=guard}
N -80 40 -80 160 {lab=guard}
N -80 160 60 160 {lab=guard}
N 60 40 60 160 {lab=guard}
N 60 40 260 40 {lab=guard}
N 260 -40 260 40 {lab=guard}
N 60 -40 260 -40 {lab=guard}
N 60 -160 60 -40 {lab=guard}
N -60 -160 60 -160 {lab=guard}
N -60 -160 -60 -40 {lab=guard}
N -220 -40 -60 -40 {lab=guard}
C {sg13g2_pr/sg13_hv_nmos.sym} 0 0 0 0 {name=M1
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {iopin.sym} -140 0 2 0 {name=p1 lab=gate}
C {iopin.sym} 20 -120 2 0 {name=p2 lab=drain}
C {iopin.sym} 20 120 2 0 {name=p3 lab=source}
C {iopin.sym} 180 0 0 0 {name=p4 lab=bulk}
C {iopin.sym} -220 -40 2 0 {name=p5 lab=guard}
