v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 460 -470 1260 -70 {flags=graph
y1=-81
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=1
x2=8
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node="\\"PSRR @ 100k; vdd db20() % 0\\"
\\"PSRR @ 1k; vdd db20() % 1\\""
color="4 5"
dataset=-1
unitx=1
logx=1
logy=0
}
N 980 -570 1210 -570 {lab=VDD}
N 480 -550 680 -550 {lab=por}
C {ldo_1v2.sym} 830 -570 0 0 {name=x3}
C {lab_pin.sym} 1210 -570 0 1 {name=p35 lab=VDD}
C {lab_pin.sym} 830 -520 0 1 {name=p36 lab=0}
C {lab_pin.sym} 830 -680 0 1 {name=p39 lab=VCC}
C {lab_pin.sym} 680 -590 0 0 {name=p41 lab=ref}
C {ammeter.sym} 830 -650 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {vsource.sym} 220 -770 0 0 {name=V5 value="3.3 AC 1" savecurrent=false}
C {lab_pin.sym} 220 -740 0 0 {name=p17 sig_type=std_logic lab=0}
C {lab_pin.sym} 220 -800 0 0 {name=p18 sig_type=std_logic lab=VCC}
C {vsource.sym} 90 -770 0 0 {name=V1 value=1.0 savecurrent=false}
C {lab_pin.sym} 90 -740 0 0 {name=p24 sig_type=std_logic lab=0
value=1.0}
C {lab_pin.sym} 90 -800 0 0 {name=p26 sig_type=std_logic lab=ref}
C {capa-2.sym} 1080 -540 0 0 {name=Cload
m=1
value=500f
footprint=1206
device=polarized_capacitor
}
C {res.sym} 1150 -540 0 0 {name=Rload
value=10k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 1080 -510 0 1 {name=p1 lab=0}
C {lab_pin.sym} 1150 -510 0 1 {name=p2 lab=0}
C {code.sym} 70 -650 0 0 {
name=TT_MODELS
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ

.include sg13g2_stdcell.spice

"
spice_ignore=false
      }
C {code_shown.sym} 80 -460 0 0 {name=ngspice only_toplevel=false value="*.option method=gear trtol=1
.save all
.include ldo_1v2_tb_psrr.save
.control
  * no load
  alter Rload=100k
  ac dec 100 10 100MEG
  write ldo_1v2_tb_psrr.raw
  set appendwrite

  * 1 mA load
  alter Rload=1k
  ac dec 100 10 100MEG
  write ldo_1v2_tb_psrr.raw

  rusage
  *quit
.endc
"}
C {biasgen.sym} 330 -570 0 0 {name=x1}
C {lab_pin.sym} 330 -630 0 1 {name=p3 lab=VCC}
C {lab_pin.sym} 330 -510 0 1 {name=p4 lab=0}
C {lab_pin.sym} 480 -550 0 1 {name=p7 lab=por}
C {lab_pin.sym} 480 -590 0 1 {name=p5 lab=Ibias_1u_[1..3]}
C {lab_pin.sym} 680 -570 0 0 {name=p6 lab=Ibias_1u_1}
C {launcher.sym} 170 -110 0 0 {name=h2
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# run netlist and simulation
xschem netlist
simulate
"}
C {devices/launcher.sym} 165.3082312206713 -70 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/ldo_1v2_tb_psrr.raw ac"
}
