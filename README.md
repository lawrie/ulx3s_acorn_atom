# ulx3s_acorn_atom

Ulx3s port of Ice40Atom

Thanks to https://github.com/hoglet67 for the Ice40 version

To build and upload the bit file do:

```sh
cd ulx3s
make prog
```

The rom is read from flash memory at address 0x70000.

To create the rom do;

```sh
cd roms
./build.sh
```

The rom you need is then in roms/boot_c000_ffff_sddos/atom_roms.bin.


You should then copy that to flash memory, e.g by ftp to the esp32:

```sh
put atom_roms.bin flash@0x70000
```

The SD card image is at https://github.com/hoglet67/AtomSoftwareArchive/releases/download/V10BETA3/AtomSoftwareArchive_20170829_V10Beta3_SDDOS.zip

The SD card is in a raw SDDOS format and is read by 6502 software.

Using a PS/2 keyboard connected to us2, do Shift+F10 to start the StarDot software archive on the SD card.
You can do Ctrl+F10 to start Basic.

There is both HDMI output and VGA output via a Digilent VGA Pmod.

Currently only the 85F version is being built.

Sound is not yet working.

