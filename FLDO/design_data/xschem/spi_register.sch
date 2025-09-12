v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {SPI configuration register

 - SPI chip-enable (spi_ce) low active
 - Data gets clocked in on falling edge of spi_clk} 300 -1200 0 0 0.4 0.4 {}
N 470 -1010 700 -1010 {lab=#net1}
C {sg13g2_stdcells/sg13g2_dfrbp_1.sym} 790 -990 0 0 {name=xshift[3..0] VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_nor2_1.sym} 410 -1010 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlhrq_1.sym} 790 -850 0 0 {name=xdata[3..0] VDD=VDD VSS=VSS prefix=sg13g2_ }
C {iopin.sym} 100 -1070 0 0 {name=p1 lab=VDD}
C {ipin.sym} 170 -1000 0 0 {name=p2 lab=spi_clk}
C {iopin.sym} 100 -1040 0 0 {name=p3 lab=VSS}
C {opin.sym} 100 -810 0 0 {name=p5 lab=data[3..0]}
C {ipin.sym} 170 -970 0 0 {name=p4 lab=spi_di}
C {ipin.sym} 170 -940 0 0 {name=p6 lab=spi_ce}
C {ipin.sym} 170 -880 0 0 {name=p7 lab=rst_b}
C {lab_pin.sym} 700 -990 0 0 {name=p9 lab="shiftreg[2..0], spi_di"}
C {lab_pin.sym} 700 -970 0 0 {name=p10 lab=rst_b}
C {lab_pin.sym} 880 -1010 0 1 {name=p11 lab=shiftreg[3..0]}
C {lab_pin.sym} 350 -1030 0 0 {name=p8 lab=spi_clk}
C {lab_pin.sym} 350 -990 0 0 {name=p13 lab=spi_ce}
C {lab_pin.sym} 700 -850 0 0 {name=p12 lab=shiftreg[3..0]}
C {lab_pin.sym} 700 -870 0 0 {name=p14 lab=spi_ce}
C {lab_pin.sym} 700 -830 0 0 {name=p15 lab=rst_b}
C {lab_pin.sym} 880 -870 0 1 {name=p16 lab=data[3..0]}
C {noconn.sym} 880 -990 0 1 {name=l1[3..0]}
