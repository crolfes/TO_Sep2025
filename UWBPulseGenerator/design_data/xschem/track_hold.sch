v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 660 -310 660 -290 {lab=out}
N 580 -110 620 -110 {lab=#net1}
N 580 -430 660 -430 {lab=#net1}
N 660 -430 660 -390 {lab=#net1}
N 520 -260 660 -260 {lab=VSS}
N 660 -80 660 -20 {lab=VSS}
N 660 -630 660 -590 {lab=VDD}
N 660 -560 680 -560 {lab=VDD}
N 680 -630 680 -560 {lab=VDD}
N 660 -630 680 -630 {lab=VDD}
N 660 -110 720 -110 {lab=VSS}
N 440 -390 440 -360 {lab=#net2}
N 440 -630 440 -550 {lab=VDD}
N 660 -180 660 -140 {lab=#net3}
N 580 -430 580 -110 {lab=#net1}
N 660 -230 660 -180 {lab=#net3}
N 830 -630 830 -520 {lab=VDD}
N 680 -630 830 -630 {lab=VDD}
N 830 -310 860 -310 {lab=out}
N 660 -330 660 -310 {lab=out}
N 860 -310 940 -310 {lab=out}
N 660 -530 660 -430 {lab=#net1}
N 440 -490 440 -450 {lab=#net4}
N 100 -560 120 -560 {lab=VDD}
N 120 -630 120 -590 {lab=VDD}
N 470 -630 660 -630 {lab=VDD}
N 120 -530 120 -490 {lab=IREF}
N 120 -490 200 -490 {lab=IREF}
N 200 -560 200 -490 {lab=IREF}
N 160 -560 200 -560 {lab=IREF}
N 200 -560 620 -560 {lab=IREF}
N 100 -630 100 -560 {lab=VDD}
N 120 -630 440 -630 {lab=VDD}
N 100 -630 120 -630 {lab=VDD}
N 440 -360 440 -290 {lab=#net2}
N 440 -360 620 -360 {lab=#net2}
N 440 -230 440 -180 {lab=#net3}
N 370 -360 440 -360 {lab=#net2}
N 440 -180 660 -180 {lab=#net3}
N 120 -490 120 -430 {lab=IREF}
N 360 -260 400 -260 {lab=nCLK}
N 360 -420 400 -420 {lab=nCLK}
N 700 -260 740 -260 {lab=CLK}
N 800 -310 800 -250 {lab=out}
N 660 -310 800 -310 {lab=out}
N 860 -310 860 -250 {lab=out}
N 830 -210 830 -170 {lab=nCLK}
N 260 -360 310 -360 {lab=in}
N 440 -420 470 -420 {lab=VDD}
N 470 -630 470 -420 {lab=VDD}
N 440 -630 470 -630 {lab=VDD}
N 660 -360 720 -360 {lab=VSS}
N 720 -110 720 -20 {lab=VSS}
N 720 -360 720 -110 {lab=VSS}
N 520 -260 520 -20 {lab=VSS}
N 440 -260 520 -260 {lab=VSS}
N 660 -20 720 -20 {lab=VSS}
N 520 -20 660 -20 {lab=VSS}
N 70 -630 100 -630 {lab=VDD}
N 480 -20 520 -20 {lab=VSS}
N 830 -460 830 -310 {lab=out}
N 800 -310 830 -310 {lab=out}
C {sg13g2_pr/sg13_lv_pmos.sym} 640 -560 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 420 -260 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 680 -260 0 1 {name=M3
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 640 -360 0 0 {name=M4
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 640 -110 0 0 {name=M5
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 420 -420 0 0 {name=M6
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/cap_cmim.sym} 340 -360 1 0 {name=C1
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {sg13g2_pr/rppd.sym} 440 -520 0 0 {name=R1
w=0.5e-6
l=0.5e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/cap_cmim.sym} 830 -490 0 0 {name=C2
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {sg13g2_pr/sg13_lv_pmos.sym} 140 -560 0 1 {name=M7
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {ipin.sym} 120 -430 3 0 {name=p1 lab=IREF}
C {opin.sym} 940 -310 0 0 {name=p2 lab=out}
C {ipin.sym} 740 -260 0 1 {name=p3 lab=CLK}
C {ipin.sym} 360 -260 0 0 {name=p4 lab=nCLK}
C {ipin.sym} 360 -420 0 0 {name=p5 lab=nCLK}
C {sg13g2_pr/sg13_lv_nmos.sym} 830 -230 1 1 {name=M8
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {ipin.sym} 830 -170 1 1 {name=p6 lab=nCLK}
C {ipin.sym} 260 -360 0 0 {name=p7 lab=in}
C {ipin.sym} 70 -630 0 0 {name=p8 lab=VDD}
C {ipin.sym} 480 -20 0 0 {name=p9 lab=VSS}
