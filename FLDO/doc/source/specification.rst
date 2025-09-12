Specification
###################################

The FLDO is a set of building blocks for constructing a forming circuit for ReRAM cells.  It consists of a 4-bit programmable voltage regulator with an SPI interface and related support structures.  The output voltage can be pulsed through the enable pin.

Pinout Descriptions
---------------------------------

.. list-table:: Pin Descriptions
   :widths: 15 15 85
   :header-rows: 1

   * - Pin
     - Type
     - Description
   * - VDD
     - Power
     - Power supply (3.3V)
   * - GND (3 pins)
     - Power
     - Ground
   * - EN
     - Input
     - Enable pin for output voltage.  Active high.
   * - VOUT
     - Output
     - Output voltage pin.
   * - VREF
     - Input
     - Voltage reference input (1.0V)
   * - I_bias_1u
     - Test
     - Connected to an extra 1uA source output of the internal bias generator
   * - VDD_1v2
     - Test
     - Connected to the internally generated 1.2V logic supply
   * - SPI_CLK
     - Input
     - SPI clock input.
   * - SPI_MOSI
     - Input
     - SPI data input.
   * - SPI_CSB
     - Input
     - SPI chip select, active low.