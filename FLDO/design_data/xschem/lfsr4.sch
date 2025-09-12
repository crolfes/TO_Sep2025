v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 250 -1090 1050 -690 {flags=graph
y1=0
y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="a[3..0]; a3,a2,a1,a0 % 1
a0
a1
a2
a3
rst_b
clk"
color="4 4 4 4 4 6 6"
dataset=-1
unitx=1
logx=0
logy=0
digital=1}
N 440 -560 570 -560 {lab=a3}
N 920 -560 960 -560 {lab=a2}
N 230 -540 230 -340 {lab=a0}
N 230 -540 260 -540 {lab=a0}
N 1330 -520 1330 -450 {lab=rst_b}
N 1030 -520 1030 -450 {lab=rst_b}
N 740 -520 740 -450 {lab=rst_b}
N 260 -520 260 -450 {lab=rst_b}
N 1030 -450 1330 -450 {lab=rst_b}
N 1330 -610 1330 -560 {lab=#net1}
N 1030 -610 1030 -560 {lab=#net1}
N 740 -610 740 -560 {lab=#net1}
N 260 -610 740 -610 {lab=#net1}
N 260 -610 260 -560 {lab=#net1}
N 180 -610 260 -610 {lab=#net1}
N 1510 -560 1540 -560 {lab=a0}
N 1210 -560 1260 -560 {lab=a1}
N 1260 -560 1260 -540 {lab=a1}
N 1260 -540 1330 -540 {lab=a1}
N 1030 -610 1330 -610 {lab=#net1}
N 690 -540 740 -540 {lab=d2}
N 740 -610 1030 -610 {lab=#net1}
N 740 -450 1030 -450 {lab=rst_b}
N 260 -450 740 -450 {lab=rst_b}
N 570 -340 1540 -340 {lab=a0}
N 570 -520 570 -340 {lab=a0}
N 230 -340 570 -340 {lab=a0}
N 180 -450 260 -450 {lab=rst_b}
N 1540 -560 1540 -340 {lab=a0}
N 960 -560 960 -540 {lab=a2}
N 960 -540 1030 -540 {lab=a2}
C {sg13g2_stdcells/sg13g2_xnor2_1.sym} 630 -540 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dfrbp_1.sym} 350 -540 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dfrbp_1.sym} 830 -540 0 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dfrbp_1.sym} 1120 -540 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dfrbp_1.sym} 1420 -540 0 0 {name=x5 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {iopin.sym} 30 -680 0 0 {name=p1 lab=VDD}
C {ipin.sym} 100 -610 0 0 {name=p2 lab=clk}
C {iopin.sym} 30 -650 0 0 {name=p3 lab=VSS}
C {ipin.sym} 180 -450 0 0 {name=p4 lab=rst_b}
C {opin.sym} 30 -420 0 0 {name=p5 lab=a[3..0]}
C {lab_wire.sym} 490 -560 0 0 {name=p6 sig_type=std_logic lab=a3}
C {lab_wire.sym} 960 -560 0 0 {name=p7 sig_type=std_logic lab=a2}
C {lab_wire.sym} 1260 -560 0 0 {name=p8 sig_type=std_logic lab=a1}
C {lab_wire.sym} 1540 -560 0 0 {name=p9 sig_type=std_logic lab=a0}
C {lab_wire.sym} 710 -540 0 0 {name=p11 sig_type=std_logic lab=d2}
C {sg13g2_stdcells/sg13g2_buf_4.sym} 140 -610 0 0 {name=x6 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_decap_8.sym} 1227.5 -690 0 0 {name=x7[0:3] VDD=VDD VSS=VSS prefix=sg13g2_ }
