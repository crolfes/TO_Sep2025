v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {por en | en_ldo_n
-----------------
0   1  | 0
0   0  | 1
1   x  | 1} 900 -150 0 0 0.4 0.4 {}
T {Only enable the LDO output if
- POR is done (0, rst_b = 1), and
- enable input is high (1)} 850 -390 0 0 0.4 0.4 {}
T {por comes from HV domain} 320 -110 0 0 0.4 0.4 {}
T {TODO:
- Do we need extra delay on RST_B after POR?} 260 -400 0 0 0.4 0.4 {}
C {spi_register.sym} 480 -200 0 0 {name=x1}
C {iopin.sym} 30 -310 0 0 {name=p1 lab=VDD}
C {ipin.sym} 100 -240 0 0 {name=p2 lab=spi_clk}
C {iopin.sym} 30 -280 0 0 {name=p3 lab=VSS}
C {opin.sym} 30 -50 0 0 {name=p5 lab=data[3..0]}
C {ipin.sym} 100 -210 0 0 {name=p4 lab=spi_di}
C {ipin.sym} 100 -180 0 0 {name=p6 lab=spi_ce}
C {ipin.sym} 100 -120 0 0 {name=p7 lab=por}
C {ipin.sym} 100 -90 0 0 {name=p8 lab=en}
C {opin.sym} 30 -20 0 0 {name=p9 lab=en_ldo_n}
C {lab_pin.sym} 630 -230 0 1 {name=p10 lab=VDD}
C {lab_pin.sym} 630 -210 0 1 {name=p11 lab=VSS}
C {lab_pin.sym} 330 -230 0 0 {name=p12 lab=spi_clk}
C {lab_pin.sym} 330 -210 0 0 {name=p13 lab=spi_di}
C {lab_pin.sym} 330 -190 0 0 {name=p14 lab=spi_ce}
C {lab_pin.sym} 330 -170 0 0 {name=p15 lab=rst_b}
C {lab_pin.sym} 630 -190 0 1 {name=p16 lab=data[3..0]}
C {sg13g2_stdcells/sg13g2_nand2_1.sym} 960 -210 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_pin.sym} 900 -230 0 0 {name=p17 lab=rst_b}
C {lab_pin.sym} 900 -190 0 0 {name=p18 lab=en}
C {lab_pin.sym} 1020 -210 0 1 {name=p19 lab=en_ldo_n}
C {lab_pin.sym} 390 -40 0 0 {name=p20 lab=por}
C {lab_pin.sym} 470 -40 0 1 {name=p21 lab=rst_b}
C {shifter_down_invert.sym} 420 -40 0 0 {name=x3 VDD=VDD VSS=VSS}
C {sg13g2_stdcells/sg13g2_decap_4.sym} 1400 -300 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_decap_4.sym} 1400 -270 0 0 {name=x5 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_decap_8.sym} 1400 -240 0 0 {name=x6 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_decap_8.sym} 1400 -210 0 0 {name=x7 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_decap_8.sym} 1400 -180 0 0 {name=x8 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_fill_2.sym} 1400 -150 0 0 {name=x9 VDD=VDD VSS=VSS prefix=sg13g2_ }
