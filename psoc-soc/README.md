# System-on-Chip Lab (PSoC) SoC

The PSoC lab is a lab course at KIT dedicated to teaching RISCV SoC design.
Whereas students currently evaluate the design using simulation and FPGA-based emulation, this project contains a port to IHP SG13G2 technology.

All documentation is available from the [official github site](https://github.com/kit-kch/psoc-soc/tree/main).
The code version used for this tapeout was tagged and released as `ihp-0925`.
The commit ID can be found in the `REVISION` file.

# Sources

The source files are included in this repository to comply with the IHP tapeout process.
They have been obtained automatically using the `fetch_sources.sh` script.
To update the sources, change the desired revision in the `REVISION` file and run `fetch_sources.sh`.

# Building

The gds.zip file is being built with the `build.sh` file.
To get exactly the same results as we did here, you should use the same tool versions.
To make the build fully reproducible, we therefore use the [IIC-OSIC-TOOLS](https://github.com/iic-jku/iic-osic-tools) container using [distrobox](https://distrobox.it).

Currently used version: `iic-osic-tools:2025.05`
IHP PDK revision for the final submission DRC: `5a0769c1b0d0021136cd2917c8848361fe45b86b`.

For the first build, you initially have to set up distrobox once:
```bash
# log-driver is a workaround for https://github.com/89luca89/distrobox/issues/1803
distrobox create --additional-flags "--log-driver=k8s-file" -i docker.io/hpretl/iic-osic-tools:2025.05 asic
distrobox enter asic
sudo ln -s /headless/.bashrc /etc/profile.d/z99_iic_osic_env.sh
chsh -s /bin/bash
exit
```

Whenever you want to build a new GDS, the full build process then goes like this:
```bash
distrobox enter asic
./build.sh 2>&1 | tee build.log
```
