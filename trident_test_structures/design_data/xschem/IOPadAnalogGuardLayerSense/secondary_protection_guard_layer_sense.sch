v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {dummies} 570 90 0 0 0.4 0.4 {}
N 70 170 70 200 {lab=#net1}
N -10 200 -10 230 {lab=pad_guard}
N -10 290 -10 320 {lab=#net2}
N 70 80 100 80 {lab=core}
N 70 80 70 110 {lab=core}
N 70 50 70 80 {lab=core}
N 40 -150 40 -120 {lab=pad_guard}
N 40 -240 40 -210 {lab=iovdd}
N -80 -120 40 -120 {lab=pad_guard}
N -80 -240 40 -240 {lab=iovdd}
N -130 200 -10 200 {lab=pad_guard}
N -130 320 -10 320 {lab=#net2}
N -80 -150 -80 -120 {lab=pad_guard}
N -270 -120 -80 -120 {lab=pad_guard}
N -80 -240 -80 -210 {lab=iovdd}
N -310 -240 -80 -240 {lab=iovdd}
N -130 200 -130 230 {lab=pad_guard}
N -130 290 -130 320 {lab=#net2}
N 260 -40 290 -40 {lab=core_sense}
N 260 -40 260 -10 {lab=core_sense}
N 260 -70 260 -40 {lab=core_sense}
N -180 80 -110 80 {lab=pad}
N -50 80 70 80 {lab=core}
N 40 -120 70 -120 {lab=pad_guard}
N -270 -120 -270 200 {lab=pad_guard}
N -180 -40 -120 -40 {lab=sense}
N 60 -50 60 -40 {lab=core_sense}
N 60 -50 80 -50 {lab=core_sense}
N 80 -50 80 -40 {lab=core_sense}
N 80 -40 260 -40 {lab=core_sense}
N 70 200 260 200 {lab=#net1}
N 350 -130 480 -130 {lab=pad_guard}
N 70 -120 70 -10 {lab=pad_guard}
N 70 -130 70 -120 {lab=pad_guard}
N 720 160 720 220 {lab=#net3}
N 160 -240 320 -240 {lab=iovdd}
N 160 -180 320 -180 {lab=iovdd}
N 160 -240 160 -180 {lab=iovdd}
N 40 -240 160 -240 {lab=iovdd}
N 100 260 300 260 {lab=iovss}
N -10 320 260 320 {lab=#net2}
N 260 200 380 200 {lab=#net1}
N 260 50 260 200 {lab=#net1}
N 350 -70 480 -70 {lab=pad_guard}
N 350 -130 350 -70 {lab=pad_guard}
N 70 -130 350 -130 {lab=pad_guard}
N 680 220 720 220 {lab=#net3}
N 680 160 720 160 {lab=#net3}
N 580 160 610 160 {lab=#net4}
N 610 160 610 220 {lab=#net4}
N 580 220 610 220 {lab=#net4}
N 60 200 70 200 {lab=#net1}
N -10 200 -0 200 {lab=pad_guard}
N -270 200 -130 200 {lab=pad_guard}
N -320 200 -270 200 {lab=pad_guard}
N -330 320 -320 320 {lab=iovss}
N -260 320 -130 320 {lab=#net2}
N -330 320 -330 380 {lab=iovss}
N -380 320 -330 320 {lab=iovss}
N -330 380 300 380 {lab=iovss}
N 300 260 300 380 {lab=iovss}
N -60 -40 60 -40 {lab=core_sense}
N 320 140 380 140 {lab=pad_guard}
C {iopin.sym} -380 320 2 0 {name=p1 lab=iovss
}
C {iopin.sym} -310 -240 2 0 {name=p2 lab=iovdd
}
C {iopin.sym} -180 80 2 0 {name=p3 lab=pad
}
C {iopin.sym} -290 200 2 0 {name=p4 lab=pad_guard
}
C {sg13g2_pr/rppd.sym} -80 80 1 0 {name=R1
w=1e-6
l=2e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {iopin.sym} 100 80 0 0 {name=p5 lab=core
}
C {sg13g2_pr/dantenna.sym} 70 140 0 0 {name=D7
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} -10 260 0 0 {name=D1
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 70 20 0 0 {name=D2
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
C {sg13g2_pr/ptap1.sym} -290 320 3 0 {name=R2
model=ptap1
spiceprefix=X
w=1e-6
l=1e-6}
C {iopin.sym} -180 -40 2 0 {name=p6 lab=sense
}
C {sg13g2_pr/dpantenna.sym} -80 -180 0 0 {name=D4
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} -130 260 0 0 {name=D5
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -90 -40 1 0 {name=R3
w=1e-6
l=2e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/dantenna.sym} 260 20 0 0 {name=D6
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 260 -100 0 0 {name=D8
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {iopin.sym} 290 -40 0 0 {name=p7 lab=core_sense
}
C {sg13g2_pr/rppd.sym} 580 190 2 0 {name=R4
w=1e-6
l=2e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 680 190 2 0 {name=R5
w=1e-6
l=2e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/dpantenna.sym} 220 -210 0 0 {name=D11
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 320 -210 0 0 {name=D12
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} 260 290 0 0 {name=D9
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} 140 290 0 0 {name=D10
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} 320 170 0 0 {name=D13
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dantenna.sym} 380 170 0 0 {name=D14
model=dantenna
l=3.1u
w=0.64u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 420 -100 0 0 {name=D15
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/dpantenna.sym} 480 -100 0 0 {name=D16
model=dpantenna
l=0.64u
w=4.98u
spiceprefix=X
}
C {sg13g2_pr/ptap1.sym} 30 200 3 0 {name=R6
model=ptap1
spiceprefix=X
w=1e-6
l=1e-6}
C {lab_pin.sym} 360 140 1 0 {name=p8 sig_type=std_logic lab=pad_guard}
