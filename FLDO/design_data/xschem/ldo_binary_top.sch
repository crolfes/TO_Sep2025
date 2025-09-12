v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 1090 -350 1090 -330 {lab=a[3..0]_hv}
N 1090 -350 1240 -350 {lab=a[3..0]_hv}
N 720 -380 720 -350 {lab=a[3..0]}
N 720 -350 830 -350 {lab=a[3..0]}
N 290 -570 340 -570 {lab=por}
N 290 -590 340 -590 {lab=Ibias_1u_2}
N 290 -610 340 -610 {lab=ref}
N 1050 -350 1090 -350 {lab=a[3..0]_hv}
N 650 -350 720 -350 {lab=a[3..0]}
N 1220 -330 1240 -330 {lab=#net1}
N 1220 -330 1220 -160 {lab=#net1}
N 1050 -160 1220 -160 {lab=#net1}
N 650 -330 650 -160 {lab=en_ldo_n}
N 650 -160 830 -160 {lab=en_ldo_n}
C {shifter.sym} 940 -350 0 0 {name=x_shift[3..0]}
C {lab_pin.sym} 1000 -420 0 1 {name=p12 lab=VCC}
C {lab_pin.sym} 880 -420 0 0 {name=p13 lab=VDD}
C {lab_pin.sym} 940 -280 0 1 {name=p14 lab=VSS}
C {lab_pin.sym} 720 -380 0 1 {name=p15 lab="a[3..0]"}
C {lab_pin.sym} 1090 -330 0 1 {name=p16 lab=a[3..0]_hv}
C {ldo_binary.sym} 1390 -370 0 0 {name=x1}
C {lab_pin.sym} 1390 -420 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 1390 -300 0 1 {name=p2 lab=VSS}
C {lab_pin.sym} 1240 -390 0 0 {name=p3 lab=ref}
C {lab_pin.sym} 1240 -370 0 0 {name=p5 lab=Ibias_1u_1}
C {lab_pin.sym} 500 -280 0 1 {name=p23 lab=VSS
}
C {lab_pin.sym} 500 -420 0 0 {name=p27 lab=VDD
}
C {lab_pin.sym} 350 -390 0 0 {name=p32 lab=spi_clk
}
C {ldo_1v2.sym} 490 -590 0 0 {name=x3}
C {lab_pin.sym} 640 -590 0 1 {name=p35 lab=VDD}
C {lab_pin.sym} 490 -540 0 1 {name=p36 lab=VSS}
C {lab_pin.sym} 490 -640 0 1 {name=p39 lab=VCC}
C {lab_pin.sym} 290 -610 0 0 {name=p41 lab=ref}
C {biasgen.sym} 990 -590 0 0 {name=x4}
C {lab_pin.sym} 990 -650 0 1 {name=p50 lab=VCC}
C {lab_pin.sym} 990 -530 0 1 {name=p51 lab=VSS}
C {lab_pin.sym} 1140 -610 0 1 {name=p52 lab=Ibias_1u_[1..3]}
C {lab_pin.sym} 290 -590 0 0 {name=p40 lab=Ibias_1u_2}
C {lab_pin.sym} 1140 -570 0 1 {name=p21 lab=por}
C {lab_pin.sym} 290 -570 0 0 {name=p33 lab=por}
C {ldo_control.sym} 500 -350 0 0 {name=x2}
C {lab_pin.sym} 350 -370 0 0 {name=p19 lab=spi_mosi}
C {lab_pin.sym} 350 -350 0 0 {name=p20 lab=spi_csb}
C {lab_pin.sym} 350 -330 0 0 {name=p43 lab=por}
C {lab_pin.sym} 350 -310 0 0 {name=p44 lab=en}
C {lab_pin.sym} 650 -330 0 1 {name=p45 lab=en_ldo_n}
C {lab_pin.sym} 1540 -370 0 1 {name=p4 lab=out}
C {shifter.sym} 940 -160 0 0 {name=x_shift_enable}
C {lab_pin.sym} 1000 -230 0 1 {name=p6 lab=VCC}
C {lab_pin.sym} 880 -230 0 0 {name=p7 lab=VDD}
C {lab_pin.sym} 940 -90 0 1 {name=p8 lab=VSS}
C {iopin.sym} 40 -530 0 0 {name=p9 lab=VCC}
C {ipin.sym} 110 -460 0 0 {name=p10 lab=spi_clk}
C {iopin.sym} 40 -500 0 0 {name=p11 lab=VSS}
C {opin.sym} 40 -270 0 0 {name=p17 lab=out}
C {ipin.sym} 110 -430 0 0 {name=p18 lab=spi_mosi}
C {ipin.sym} 110 -400 0 0 {name=p22 lab=spi_csb}
C {ipin.sym} 110 -340 0 0 {name=p24 lab=ref}
C {ipin.sym} 110 -310 0 0 {name=p25 lab=en}
C {opin.sym} 40 -240 0 0 {name=p26 lab=Ibias_1u_3}
C {opin.sym} 40 -210 0 0 {name=p28 lab=VDD}
