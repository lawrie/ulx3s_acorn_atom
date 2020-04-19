# ulx3s_acorn_atom

![Acorn Atom](https://upload.wikimedia.org/wikipedia/commons/2/29/Acorn_atom_zx1.jpg)

Ulx3s port of [Ice40Atom](https://github.com/hoglet67/Ice40Atom)

Thanks to [David Banks](https://github.com/hoglet67) for the Ice40 version

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

You can download the [SD card image](https://github.com/hoglet67/AtomSoftwareArchive/releases/download/V11BETA6/AtomSoftwareArchive_20190825_1442_V11Beta6_SDDOS2.zip), unzip it and write the raw img file to an SD card, e.g. by `dd if=archive.img of=/dev/sdxxx` on Linux.

The SD card is in a raw SDDOS format and is read by 6502 software.

Using a PS/2 keyboard connected to us2, do Shift+F10 to start the StarDot software archive on the SD card.
You can do Ctrl+F10 to start Basic.

There is both HDMI output and VGA output via a Digilent VGA Pmod.

The default build is for the 85f. You can build for other boards using the DEVICE parameter to the make file, e.g. `make DEVICE=12k`.

Sound is produced using an implementation of the Commodore Sid chip.

