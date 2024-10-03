# BlackParrot FPGA Example

This repository acts as a meta-repository for a BlackParrot FPGA design.
The design methodology is to package a BlackParrot processor as an IP block
that can be directly instantiated within a Vivado Block Design using the Vivado
IP Integrator methodology. An FPGA host block is similarly packaged for instantiation
in the design. The BlackParrot I/O ports are connected to the BlackParrot FPGA Host and
BlackParrot's memory interface is connected to an AXI network with a memory that acts
as BlackParrot's private DRAM. The other side of the host can be connected to the
a PCIe XDMA IP block that can be opened from a host PC to issue control commands to the
BlackParrot processor.

The provided design requires Vivado 2019.1 and targets a VCU128 (vu37p ES1) board.
However, the approach can be easily adopted to any FPGA device and board as all
interfaces to the BlackParrot IP blocks are AXI4.

## Getting Started

```
make checkout
make setup
```

Building tools, the SDK, and programs can be parallelized in `make setup` by setting the
`MAKE_CORES` flag on the command line. e.g.,:

```
make setup MAKE_CORES=32
```

-----

<p align="center">Copyright&copy; 2023-2024 University of Washington</p>
