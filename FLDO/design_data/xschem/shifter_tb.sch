v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 210 -50 1010 350 {flags=graph
y1=-0.56
y2=3.6
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=4e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="in
out"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0
digital=0}
N 250 -240 250 -230 {lab=0}
N 250 -310 250 -300 {lab=VDD}
N 370 -310 370 -300 {lab=VCC}
N 370 -240 370 -230 {lab=0}
N 250 -110 250 -100 {lab=0}
N 250 -180 250 -170 {lab=in}
N 880 -230 1000 -230 {lab=out}
C {code_shown.sym} 220 -500 0 0 {name=s1 only_toplevel=false value="*.option gmin=1e-15 *method=gear trtol=1
.save all
.tran 1n 40n
.control
  run
  remzerovec
  write shifter_tb.raw
.endc
"}
C {vsource.sym} 250 -270 0 0 {name=Vdd value=1.2 savecurrent=false}
C {lab_pin.sym} 660 -230 0 0 {name=p2 sig_type=std_logic lab=in}
C {lab_pin.sym} 250 -230 0 0 {name=p7 sig_type=std_logic lab=0}
C {lab_pin.sym} 250 -310 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {vsource.sym} 370 -270 0 0 {name=Vcc value=3.3 savecurrent=false}
C {lab_pin.sym} 370 -230 0 0 {name=p9 sig_type=std_logic lab=0}
C {lab_pin.sym} 370 -310 0 0 {name=p10 sig_type=std_logic lab=VCC}
C {vsource.sym} 250 -140 0 0 {name=Vin value="pulse(0 1.2 10n 0.1n 0.1n 20n 40n)" savecurrent=false}
C {lab_pin.sym} 250 -100 0 0 {name=p11 sig_type=std_logic lab=0}
C {lab_pin.sym} 250 -180 0 0 {name=p12 sig_type=std_logic lab=in}
C {code.sym} 430 -340 0 0 {
name=TT_MODELS
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"
spice_ignore=false
      }
C {shifter.sym} 770 -230 0 0 {name=x1}
C {lab_pin.sym} 830 -300 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 710 -300 0 1 {name=p3 lab=VDD}
C {lab_pin.sym} 770 -160 0 1 {name=p4 lab=0}
C {lab_pin.sym} 1000 -230 0 1 {name=p5 lab=out}
C {capa.sym} 960 -200 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 960 -170 0 1 {name=p6 lab=0}
