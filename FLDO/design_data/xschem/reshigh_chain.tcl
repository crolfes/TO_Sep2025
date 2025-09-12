#!/bin/sh
# the next line restarts using wish \
exec tclsh "$0" "$@"
set n [lindex $argv 0]
set i [expr {$n -1}]

# Figure out which model to use for the resistor based on the width
#
#set width [lindex $argv 1]
set model "rhigh"

puts "v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 300 -190 300 -170 {
lab=P,w\[$i..1\]}
N 300 -110 300 -80 {
lab=w\[$i..1\],M}
C {sg13g2_pr/$model.sym} 300 -140 0 0 {name=R\[1..$n\]
w=w
l=l
model=$model
body=body
spiceprefix=X
mult=mult}
C {lab_pin.sym} 300 -80 0 1 {name=p2 lab=w\[$i..1\],M}
C {lab_pin.sym} 300 -190 0 1 {name=p3 lab=P,w\[$i..1\]}
C {iopin.sym} 130 -190 0 0 {name=p4 lab=P}
C {iopin.sym} 130 0 0 0 {name=p5 lab=body}
C {iopin.sym} 130 -130 0 0 {name=p6 lab=M}"

