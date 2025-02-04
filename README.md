# fpga-serial-mem-tester-1

FPGA Serial Mem Tester Version 1
by Timothy Stotts

## Changes by Benjamin Mordaunt
This fork outputs information about the state of the Serial Flash using the Digilent Pmod OLED RGB instead of the 16x2 character LCD.

### Font
The `lcd_font_map_pkg.vhdl` package contains functions necessary for converting 4-bit vectors to pixel-map fonts. This package only implements those characters needed for this application.

## Description
A small FPGA project of different implementations for testing a N25Q Serial Flash.
The design targets the Digilent Inc. Arty-A7-100T FPGA development board containing a Xilinx Artix-7 FPGA.
Two peripherals are used: Digilent Inc. Pmod SF3, Digilent Inc. Pmod CLS.

The design is broken into two groupings.

The folder SF-Tester-Design-AXI contains a Xilinx Vivado IP Integrator plus
Xilinx Vitis design.
A microblaze soft CPU is instantiated to talk with board components,
a SPI Flash peripheral, and
a 16x2 character LCD peripheral.
Sources to be incorporated into a Xilinx Vitis project contain
a very small FreeRTOS program in C; drivers
for the peripherals, a real-time task to operate the flash chip,
two real-time tasks to display data, and a real-time task to color-mix RGB LEDs.
(None of the real-time tasks demonstrate executing with a precise timer, but only
demonstrate a best-effort execution; as such, calling these tasks real-time
may be a misnomer. Executing these tasks with a precise timer can be achieved
with FreeRTOS; but the benefit does not outweigh the added complexity for
this specific implementation.)

The folder SF-Tester-Design-VHDL contains a Xilinx Vivado project with sources
containing only VHDL-2002 and VHDL-2008 modules. Plain HDL without a soft CPU or C code is authored to
talk with board components, a N25Q SPI Flash 256Mbit, and a 16x2 character LCD peripheral.

These two groupings of design provide equivalent functionality, excepting that the HDL design provides
a much faster execution. Checkouts for the latest implementation should refer to tag
Serial_Mem_Tester_All_Release_A .

### Naming conventions notice
The Pmod peripherals used in this project connect via a standard bus technology design called SPI.
The use of MOSI/MISO terminology is considered obsolete. COPI/CIPO is now used. The MOSI signal on a
controller can be replaced with the title 'COPI'. Master and Slave terms are now Controller and Peripheral.
Additional information can be found [here](https://www.oshwa.org/a-resolution-to-redefine-spi-signal-names).
The choice to use COPI and CIPO instead of SDO and SDI for single-direction bus signals is simple.
On a single peripheral bus with two data lines of fixed direction, the usage of the signal name
"SDO" is dependent on whether the Controller or the Peripheral is the chip being discussed;
whereas COPI gives the exact direction regardless of which chip is being discussed. The author
of this website agrees with the open source community that the removal of offensive language from
standard terminology in engineering is a priority.

### Project information document:

./Serial Flash Sector Tester.pdf

[Serial Flash Sector Tester info](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/Serial%20Flash%20Sector%20Tester.pdf)

### Diagrams design document:

./SF-Tester-Design-Documents/SF-Tester-Design-Diagrams.pdf

[Serial Flash Sector Tester Design Diagrams info](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams.pdf)

#### Target device assembly: Arty-A7-100T with Pmod SF3, Pmod CLS on extension cable
![Target device assembly](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/img_serial-flash-tester-assembled-20200722.jpg)

#### Target device execution: Arty-A7-100T with Pmod SF3, Pmod CLS on extension cable
![Target device assembly executing](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/img_serial-flash-tester-executing-a_20210217.jpg)

#### Block diagram architecture of the HDL design:
![SF3 Tester Architecture Diagram](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-Architecture%201.svg)

#### Top Port diagram architecture of the HDL design:
![SF3 Tester Top Ports Diagram](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-Top-Ports.svg)

#### Tester FSM diagram of the HDL design:
![SF3 Tester FSM Diagram](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-Tester-FSM.svg)

#### LCD FSM diagram of the HDL design:
![LCD FSM Diagram](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-LCD-FSM.svg)

#### UART Feed FSM diagram of the HDL design:
![UART Feed FSM Diagram](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-UARTfeed.svg)

#### UART TX ONLY FSM diagram of the HDL design:
![UART Feed FSM Diagram](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-UART-Tx-FSM.svg)

#### 4-input Multi-Debouncer for 4 exclusve inputs, such as switches or buttons, of the HDL design:
![4-bit Multi-Debouncer](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-multi-debounce.svg)

#### SF3 Custom Driver External Ports diagram of the HDL design:
![SF3 Custom Driver Ports](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-SF3-ports.svg)

#### SF3 Custom Driver Internal Ports diagram of the HDL design:
![SF3 Custom Driver Ports, Internal](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-SF3-ports-internal.svg)

#### Pmod SF3 Extended SPI custom driver FSM for operating the QSPI Extended SPI driver to configure and operate the functions of the N25Q Flash chip of the Pmod SF3:
![SF3 Custom Driver FSM](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-SF3-QSPI-FSM.svg)

#### Generic QSPI Extended SPI Single Chip protocol bus driver, used by the SF3 driver
![Generic Standard SPI Single Chip bus driver](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-SPI-quad-FSM.svg)

#### CLS Custom Driver External Ports diagram of the HDL designs:
![CLS Custom Driver Ports](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-CLS-ports.svg)

#### CLS Custom Driver Internal Ports diagram of the HDL designs:
![CLS Custom Driver Ports, Internal](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-CLS-ports-internal.svg)

#### Pmod CLS Standard SPI custom driver FSM for operating the standard SPI driver to send text line refreshes to the ATmega48 microcontroller chip of the Pmod CLS:
![CLS Custom Driver readings driver FSM](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-CLS-driver-FSM.svg)

#### Generic Standard SPI Single Chip protocol bus driver, used by the the CLS driver
![Generic Standard SPI Single Slave bus driver](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-SPI-generic-FSM.svg)

#### Utility FSMs: synchonous pulse stretcher FSM
![Utility FSMs, one-shot, pulse stretcher](https://github.com/timothystotts/fpga-serial-mem-tester-1/blob/main/SF-Tester-Design-Documents/SF-Tester-Design-Diagrams-Utility-FSMs.svg)
