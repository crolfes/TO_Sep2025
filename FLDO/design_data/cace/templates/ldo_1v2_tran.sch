v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 1160 -220 1330 -220 {lab=out}
N 1080 -220 1100 -220 {lab=#net1}
C {ldo_1v2.sym} 930 -220 0 0 {name=x1}
C {lab_pin.sym} 930 -270 0 1 {name=p5 lab=VCC}
C {lab_pin.sym} 930 -170 0 1 {name=p6 lab=GND}
C {lab_pin.sym} 780 -240 0 0 {name=p7 lab=ref}
C {lab_pin.sym} 780 -220 0 0 {name=p8 lab=Ibias_1u_1}
C {vsource.sym} 90 -110 0 0 {name=Vcc value="PWL(0 0 1u CACE\{vcc\})" savecurrent=false}
C {lab_pin.sym} 90 -80 0 0 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} 90 -140 0 0 {name=p18 sig_type=std_logic lab=VCC}
C {vsource.sym} 90 -220 0 0 {name=V1 value=1.0 savecurrent=false}
C {lab_pin.sym} 90 -190 0 0 {name=p24 sig_type=std_logic lab=GND}
C {lab_pin.sym} 90 -250 0 0 {name=p26 sig_type=std_logic lab=ref}
C {lab_pin.sym} 1330 -220 0 1 {name=p25 sig_type=std_logic lab=out}
C {capa-2.sym} 1210 -190 0 0 {name=Cload
m=1
value=1n
footprint=1206
device=polarized_capacitor
}
C {lab_pin.sym} 1210 -160 0 0 {name=p10 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1280 -160 0 0 {name=p22 sig_type=std_logic lab=GND}
C {res.sym} 1280 -190 0 0 {name=Rload
value=12k
footprint=1206
device=resistor
m=1}
C {ammeter.sym} 1130 -220 3 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {lab_pin.sym} 440 -250 0 0 {name=p3 lab=enable_n}
C {simulator_commands_shown.sym} 60 -860 0 0 {name=Libs_ngspice1
simulator=ngspice
only_toplevel=false 
value="** IHP models
.lib cornerMOSlv.lib mos_CACE\{mos_corner\}
.lib cornerMOShv.lib mos_CACE\{mos_corner\}
.lib cornerRES.lib res_CACE\{passives_corner\}
.lib cornerCAP.lib cap_CACE\{passives_corner\}
"}
C {simulator_commands_shown.sym} 60 -680 0 0 {name=commands
simulator=ngspice
only_toplevel=false 
value=".include CACE\{DUT_path\}
.temp CACE\{temp\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

.save all
.control
  tran 100n 200u

  meas tran v_out AVG v(out) FROM=190u TO=200u
  meas tran v_max MAX v(out)
  meas tran i_source AVG i(vcc) FROM=190u TO=200u

  let i_out = v_out / 12k

  let i_supply =  - i_source - i_out

  echo $&v_out $&v_max $&i_supply > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {isource.sym} 300 -220 0 0 {name=I0 value=1u}
C {lab_pin.sym} 300 -190 0 0 {name=p9 lab=Ibias_1u_1}
C {lab_pin.sym} 300 -250 0 0 {name=p11 sig_type=std_logic lab=VCC}
C {vsource.sym} 440 -220 0 0 {name=V2 value="PWL(0 CACE\{vcc\} 1u CACE\{vcc\} 1.1u 0)" savecurrent=false}
C {lab_pin.sym} 440 -190 0 0 {name=p1 sig_type=std_logic lab=GND}
C {lab_pin.sym} 780 -200 0 0 {name=p2 lab=enable_n}
