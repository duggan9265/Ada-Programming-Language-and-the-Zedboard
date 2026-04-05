// Main function for controlling the LED's on the Zedboard.
// axi_gpio_s_axi is set up as output only
// Its master base address is (from address editor in Vivado) 0x4120_0000
// Its master high address is (from address editor in Vivado) 0x4120_FFFF

/*
    AXI GPIO Address Range Explanation

    Base address : 0x4120_0000
    High address : 0x4120_FFFF

    ------------------------------------------------------------
    Size calculation
    ------------------------------------------------------------

        0x4120_FFFF
      - 0x4120_0000
      ----------------
        0x0000_FFFF

    Since the address range is inclusive, add 1:

        0x0000_FFFF + 1 = 0x0001_0000

    0x0001_0000 (hex) = 65536 (decimal)

    ------------------------------------------------------------
    Why is this 64 KB?
    ------------------------------------------------------------

        1 KB = 1024 bytes  (1024 = 2^10)
        64 KB = 64 × 1024
              = 65536 bytes

    Also:

        65536 = 2^16
        0x10000 = 65536 decimal

    Therefore:

        AXI GPIO occupies 64 KB of address space.

    ------------------------------------------------------------
    Quick Hex Trick (Very Useful in Embedded Work)
    ------------------------------------------------------------

    When you see:

        0x10000

    Think:

        1 followed by four hex zeros

    Each hex digit represents 4 bits.
    Four hex zeros = 16 bits.

        0x10000 = 2^16 = 65536 bytes = 64 KB

    More quick mental shortcuts:

        0x400   = 1 KB   (2^10)
        0x1000  = 4 KB   (2^12)
        0x10000 = 64 KB  (2^16)
        0x100000 = 1 MB  (2^20)

    ------------------------------------------------------------
    Note
    ------------------------------------------------------------

    The AXI GPIO itself only uses a few bytes of registers
    (e.g., offset 0x00 and 0x04), but Vivado allocates
    a full 64 KB region for AXI-Lite peripherals for
    alignment and future expansion.

    ---------------------------------------------------------------
    AXI-GPIO regsiter mapping: https://docs.amd.com/v/u/1.01b-English/ds744_axi_gpio
    ----------------------------------------------------------------
    Base Address           Register         Access    Default                Description
    + Offset (Hex)         Name             Type      Value (hex)
    C_BASEADDR + 0x00    GPIO_DATA        Read/Write     0x0          Channel 1 AXI GPIO Data Register
    C_BASEADDR + 0x04    GPIO_TRI         Read/Write     0x0          Channel 1 AXI GPIO 3-state Register
    C_BASEADDR + 0x08    GPIO2_DATA       Read/Write     0x0          Channel 2 AXI GPIO Data Register
    C_BASEADDR + 0x0C    GPIO2_TRI        Read/Write     0x0          Channel 2 AXI GPIO 3-state Register
    */

 #define  AXI_GPIO_BASE         0x4120_0000

