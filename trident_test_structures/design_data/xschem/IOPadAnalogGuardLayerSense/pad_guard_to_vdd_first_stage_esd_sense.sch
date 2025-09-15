v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 390 -90 390 -30 {}
L 4 380 -60 400 -60 {}
L 4 390 -50 400 -60 {}
L 4 380 -60 390 -50 {}
L 4 380 -50 400 -50 {}
T {custom diode, not recongnized} 420 -70 0 0 0.4 0.4 {}
N 110 -30 110 0 {lab=pad}
N 110 -120 110 -90 {lab=pad_guard}
N -170 0 110 0 {lab=pad}
N 390 -30 390 0 {lab=pad}
N 110 0 390 0 {lab=pad}
N 320 -60 360 -60 {lab=iovss}
N 390 -120 390 -90 {lab=pad_guard}
N 110 -120 390 -120 {lab=pad_guard}
N 110 -60 190 -60 {lab=iovdd}
N -350 -120 -350 -90 {lab=pad_guard}
N -430 -60 -350 -60 {lab=iovdd}
N -350 -120 110 -120 {lab=pad_guard}
N -450 0 -350 0 {lab=sense}
N -350 -30 -350 0 {lab=sense}
N -450 -120 -350 -120 {lab=pad_guard}
N -310 -60 70 -60 {lab=#net1}
N 20 120 60 120 {lab=iovss}
N 20 60 20 120 {lab=iovss}
N 20 60 60 60 {lab=iovss}
C {sg13g2_pr/rppd.sym} -60 -90 2 1 {name=R9
w=0.5e-6
l=12.9e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {iopin.sym} -160 220 2 0 {name=p5 lab=iovss
}
C {iopin.sym} -450 -120 0 1 {name=p8 lab=pad_guard}
C {iopin.sym} -170 -220 2 0 {name=p2 lab=iovdd}
C {iopin.sym} -170 0 0 1 {name=p1 lab=pad
}
C {lab_wire.sym} 190 -60 0 1 {name=p3 sig_type=std_logic lab=iovdd
}
C {lab_wire.sym} 320 -60 2 1 {name=p6 sig_type=std_logic lab=iovss

}
C {iopin.sym} -450 0 0 1 {name=p7 lab=sense
}
C {lab_wire.sym} -430 -60 0 0 {name=p9 sig_type=std_logic lab=iovdd
}
C {sg13g2_pr/sg13_hv_pmos.sym} -330 -60 0 1 {name=M1
l=0.6u
w=266.4u
ng=20
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 90 -60 0 0 {name=M2
l=0.6u
w=266.4u
ng=20
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/ptap1.sym} 60 90 0 0 {name=R1
model=ptap1
spiceprefix=X
w=0.78e-6
l=0.78e-6
}
C {lab_wire.sym} 20 120 2 1 {name=p4 sig_type=std_logic lab=iovss

}
