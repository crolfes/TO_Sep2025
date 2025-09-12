v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 250 -240 250 -230 {lab=0}
N 250 -310 250 -300 {lab=VDD}
N 370 -310 370 -300 {lab=VCC}
N 370 -240 370 -230 {lab=0}
N 250 -110 250 -100 {lab=0}
N 250 -180 250 -170 {lab=in}
N 880 -230 990 -230 {lab=out}
C {code_shown.sym} 210 -750 0 0 {name=NGSPICE only_toplevel=false value=".option gmin=1e-15 method=gear trtol=1
.include CACE\{DUT_path\}
.temp CACE\{temp\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

.save all

.control
  tran 1n 40n

  let vin_mid=CACE\{vdd_1v2\}*0.5
  let vout_mid=CACE\{vdd_3v3\}*0.5
  let vout_low=CACE\{vdd_3v3\}*0.1
  let vout_high=CACE\{vdd_3v3\}*0.9

  meas tran t_rise TRIG v(out) VAL=vout_low  RISE=1 TARG v(out) VAL=vout_high RISE=1
  meas tran t_fall TRIG v(out) VAL=vout_high FALL=1 TARG v(out) VAL=vout_low  FALL=1

  meas tran t_prop TRIG v(in) VAL=vin_mid RISE=1 TARG v(out) VAL=vout_mid RISE=1

  echo $&t_rise $&t_fall $&t_prop > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {vsource.sym} 250 -270 0 0 {name=Vdd value=CACE\{vdd_1v2\} savecurrent=false}
C {lab_pin.sym} 660 -230 0 0 {name=p2 sig_type=std_logic lab=in}
C {lab_pin.sym} 250 -230 0 0 {name=p7 sig_type=std_logic lab=0}
C {lab_pin.sym} 250 -310 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {vsource.sym} 370 -270 0 0 {name=Vcc value=CACE\{vdd_3v3\} savecurrent=false}
C {lab_pin.sym} 370 -230 0 0 {name=p9 sig_type=std_logic lab=0}
C {lab_pin.sym} 370 -310 0 0 {name=p10 sig_type=std_logic lab=VCC}
C {vsource.sym} 250 -140 0 0 {name=Vin value="pulse(0 CACE\{vdd_1v2\} 10n 0.05n 0.05n 20n 40n)" savecurrent=false}
C {lab_pin.sym} 250 -100 0 0 {name=p11 sig_type=std_logic lab=0}
C {lab_pin.sym} 250 -180 0 0 {name=p12 sig_type=std_logic lab=in}
C {code_shown.sym} 210 -880 0 0 {
name=TT_MODELS
only_toplevel=true
value="
.lib cornerMOSlv.lib mos_CACE\{corner\}
.lib cornerMOShv.lib mos_CACE\{corner\}
"
spice_ignore=false
      }
C {shifter.sym} 770 -230 0 0 {name=x1}
C {lab_pin.sym} 830 -300 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 710 -300 0 1 {name=p3 lab=VDD}
C {lab_pin.sym} 770 -160 0 1 {name=p4 lab=0}
C {lab_pin.sym} 990 -230 0 1 {name=p5 lab=out}
C {capa.sym} 960 -200 0 0 {name=C1
m=1
value=CACE\{cload\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 960 -170 0 1 {name=p6 lab=0}
