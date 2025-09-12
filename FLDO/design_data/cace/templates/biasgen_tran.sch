v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 780 -520 780 -490 {lab=VCC}
N 310 -230 310 -200 {lab=Ibias_1u_1}
N 310 -140 310 -120 {lab=GND}
N 470 -230 470 -200 {lab=Ibias_1u_2}
N 470 -140 470 -120 {lab=GND}
N 640 -230 640 -200 {lab=Ibias_1u_3}
N 640 -140 640 -120 {lab=GND}
N 470 -430 640 -430 {lab=por}
C {vsource.sym} 780 -460 0 0 {name=VCC value="PWL(0 0 1u CACE\{vcc\})" savecurrent=false}
C {lab_pin.sym} 780 -430 0 0 {name=p6 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 780 -520 0 1 {name=p7 sig_type=std_logic lab=VCC
}
C {simulator_commands_shown.sym} 1030 -590 0 0 {name=Libs_ngspice
simulator=ngspice
only_toplevel=false 
value="** IHP models
.lib cornerMOSlv.lib mos_CACE\{mos_corner\}
.lib cornerMOShv.lib mos_CACE\{mos_corner\}
.lib cornerRES.lib res_CACE\{passives_corner\}
.lib cornerCAP.lib cap_CACE\{passives_corner\}
"}
C {simulator_commands_shown.sym} 1020 -410 0 0 {name=commands
simulator=ngspice
only_toplevel=false 
value=".include CACE\{DUT_path\}
.temp CACE\{temp\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

.save all
.control
  tran 10n 3u

  meas tran t_startup WHEN v(por)=1 FALL=1
  meas tran v_out_1 AVG Ibias_1u_1 FROM=2u TO=3u
  meas tran v_out_2 AVG Ibias_1u_2 FROM=2u TO=3u
  meas tran v_out_3 AVG Ibias_1u_3 FROM=2u TO=3u
  meas tran i_source AVG i(vcc) FROM=2u TO=3u

  let i_out_1 = v_out_1 / 100k
  let i_out_2 = v_out_2 / 1MEG
  let i_out_3 = v_out_3 / 10k

  let i_supply =  - i_source - i_out_1 - i_out_2 - i_out_3

  echo $&i_out_1 $&i_out_2 $&i_out_3 $&i_supply $&t_startup > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {biasgen.sym} 320 -450 0 0 {name=x1}
C {lab_pin.sym} 320 -510 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 320 -390 0 1 {name=p2 lab=GND}
C {lab_pin.sym} 470 -470 0 1 {name=p3 lab=Ibias_1u_[1..3]}
C {res.sym} 310 -170 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 310 -230 0 1 {name=p5 lab=Ibias_1u_1}
C {lab_pin.sym} 310 -120 0 0 {name=p8 sig_type=std_logic lab=GND
}
C {res.sym} 470 -170 0 0 {name=R2
value=1MEG
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 470 -230 0 1 {name=p9 lab=Ibias_1u_2}
C {lab_pin.sym} 470 -120 0 0 {name=p10 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 640 -430 0 1 {name=p11 lab=por}
C {res.sym} 640 -170 0 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 640 -230 0 1 {name=p4 lab=Ibias_1u_3}
C {lab_pin.sym} 640 -120 0 0 {name=p12 sig_type=std_logic lab=GND
}
C {capa.sym} 560 -400 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 560 -370 0 0 {name=p13 sig_type=std_logic lab=GND
}
