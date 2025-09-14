v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 400 30 400 90 {}
L 4 390 60 410 60 {}
L 4 400 50 410 60 {}
L 4 390 60 400 50 {}
L 4 390 50 410 50 {}
T {custom diode, not recongnized} 420 40 0 0 0.4 0.4 {}
N 120 0 120 30 {lab=pad}
N 120 90 120 120 {lab=pad_guard}
N -160 0 120 0 {lab=pad}
N 400 0 400 30 {lab=pad}
N 120 0 400 0 {lab=pad}
N 330 60 370 60 {lab=iovdd}
N 400 90 400 120 {lab=pad_guard}
N 120 120 400 120 {lab=pad_guard}
N 120 60 200 60 {lab=iovss}
N -340 90 -340 120 {lab=pad_guard}
N -420 60 -340 60 {lab=iovss}
N -340 120 120 120 {lab=pad_guard}
N -440 -0 -340 -0 {lab=sense}
N -340 -0 -340 30 {lab=sense}
N -440 120 -340 120 {lab=pad_guard}
N -300 60 80 60 {lab=#net1}
C {sg13g2_pr/sg13_hv_nmos.sym} 100 60 0 0 {name=M6
l=600n
w=88u
ng=40
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -50 90 0 0 {name=R9
w=0.5e-6
l=3.54e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {iopin.sym} -160 220 2 0 {name=p5 lab=iovss
}
C {iopin.sym} -440 120 2 0 {name=p8 lab=pad_guard}
C {iopin.sym} -170 -220 2 0 {name=p2 lab=iovdd}
C {iopin.sym} -160 0 2 0 {name=p1 lab=pad
}
C {lab_wire.sym} 200 60 2 0 {name=p3 sig_type=std_logic lab=iovss
}
C {lab_wire.sym} 330 60 0 0 {name=p6 sig_type=std_logic lab=iovdd
}
C {iopin.sym} -440 0 2 0 {name=p7 lab=sense
}
C {sg13g2_pr/sg13_hv_nmos.sym} -320 60 0 1 {name=M2
l=600n
w=88u
ng=40
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} -420 60 2 1 {name=p9 sig_type=std_logic lab=iovss
}
