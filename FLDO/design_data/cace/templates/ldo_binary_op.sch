v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 1280 -620 1450 -620 {lab=out}
N 1200 -620 1220 -620 {lab=#net1}
C {vsource.sym} 760 -360 0 0 {name=V2 value="DC CACE[CACE\{a[2]\}*CACE\{vcc\}]" savecurrent=false
}
C {lab_pin.sym} 760 -330 0 0 {name=p6 sig_type=std_logic lab=0
}
C {lab_pin.sym} 760 -390 0 1 {name=p7 sig_type=std_logic lab=a2
}
C {vsource.sym} 760 -250 0 0 {name=V3 value="DC CACE[CACE\{a[1]\}*CACE\{vcc\}]" savecurrent=false
}
C {lab_pin.sym} 760 -220 0 0 {name=p8 sig_type=std_logic lab=0
}
C {lab_pin.sym} 760 -280 0 1 {name=p9 sig_type=std_logic lab=a1
}
C {vsource.sym} 760 -150 0 0 {name=V4 value="DC CACE[CACE\{a[0]\}*CACE\{vcc\}]" savecurrent=false
}
C {lab_pin.sym} 760 -120 0 0 {name=p10 sig_type=std_logic lab=0
}
C {lab_pin.sym} 760 -180 0 1 {name=p11 sig_type=std_logic lab=a0
}
C {lab_pin.sym} 900 -600 0 0 {name=p15 lab="a[3..0]"}
C {vsource.sym} 520 -250 0 0 {name=Vcc value="DC CACE\{vcc\}" savecurrent=false}
C {lab_pin.sym} 520 -220 0 0 {name=p17 sig_type=std_logic lab=0}
C {lab_pin.sym} 520 -280 0 0 {name=p18 sig_type=std_logic lab=VCC}
C {lab_pin.sym} 1450 -620 0 1 {name=p25 sig_type=std_logic lab=out}
C {capa-2.sym} 1280 -590 0 0 {name=Cload
m=1
value=500f
footprint=1206
device=polarized_capacitor
}
C {lab_pin.sym} 1280 -560 0 0 {name=p4 sig_type=std_logic lab=0}
C {lab_pin.sym} 1400 -560 0 0 {name=p22 sig_type=std_logic lab=0}
C {res.sym} 1400 -590 0 0 {name=Rload
value=12k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 760 -470 0 0 {name=V7 value="DC CACE[CACE\{a[3]\}*CACE\{vcc\}]" savecurrent=false
}
C {lab_pin.sym} 760 -440 0 0 {name=p37 sig_type=std_logic lab=0
}
C {lab_pin.sym} 760 -500 0 1 {name=p38 sig_type=std_logic lab=a3
}
C {ldo_binary.sym} 1050 -620 0 0 {name=x1}
C {lab_pin.sym} 1050 -670 0 1 {name=p1 lab=VCC}
C {lab_pin.sym} 1050 -550 0 1 {name=p2 lab=0}
C {lab_pin.sym} 900 -640 0 0 {name=p3 lab=ref}
C {lab_pin.sym} 900 -620 0 0 {name=p5 lab=Ibias_1u_1}
C {vsource.sym} 520 -360 0 0 {name=V1 value=1.0 savecurrent=false}
C {lab_pin.sym} 520 -330 0 0 {name=p24 sig_type=std_logic lab=0
value=1.0}
C {lab_pin.sym} 520 -390 0 0 {name=p26 sig_type=std_logic lab=ref}
C {ammeter.sym} 1250 -620 3 0 {name=Vload savecurrent=true spice_ignore=0}
C {lab_pin.sym} 520 -490 0 0 {name=p12 lab=enable_n}
C {isource.sym} 520 -150 0 0 {name=I0 value=1u}
C {lab_pin.sym} 520 -120 0 0 {name=p13 lab=Ibias_1u_1}
C {lab_pin.sym} 520 -180 0 0 {name=p14 sig_type=std_logic lab=VCC}
C {vsource.sym} 520 -460 0 0 {name=V6 value="DC CACE\{en_n\}" savecurrent=false}
C {lab_pin.sym} 520 -430 0 0 {name=p16 sig_type=std_logic lab=0}
C {lab_pin.sym} 900 -580 0 0 {name=p19 lab=enable_n}
C {simulator_commands_shown.sym} 1110 -400 0 0 {name=Libs_ngspice1
simulator=ngspice
only_toplevel=false 
value="** IHP models
.lib cornerMOSlv.lib mos_CACE\{mos_corner\}
.lib cornerMOShv.lib mos_CACE\{mos_corner\}
.lib cornerRES.lib res_CACE\{passives_corner\}
.lib cornerCAP.lib cap_CACE\{passives_corner\}
"}
C {simulator_commands_shown.sym} 1110 -220 0 0 {name=commands
simulator=ngspice
only_toplevel=false 
value=".include CACE\{DUT_path\}
.temp CACE\{temp\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

.save all
.control
  op

  let i_q = - i(vcc) - i(vload)
  echo $&out $&i_q > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
