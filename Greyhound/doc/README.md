# Greyhound rev2

This is the second revision of [Greyhound](https://github.com/mole99/greyhound-ihp): A RISC-V SoC with tightly coupled eFPGA on IHP SG13G2.

The improvements are:

- Increased LUTs to 1024
- Decreased SRAMs to 4 (1024x32, 1rw port)
- Increased BRAMs to 4 (1024x16, 2rw ports)
- Increased DSPs to 8
- Increased register files to 16
- Separated custom instruction and peripheral interface
- No resizing in tiles, buffers on the output of each tile
- Process SystemVerilog using yosys-slang
- Hierarchical implementation of the SoC

Additional documentation can be found in the repository.
