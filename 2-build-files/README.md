# Build files for Elite over Econet on the Acorn Archimedes

This folder contains support scripts for building Elite over Econet on the Acorn Archimedes.

* [convert-to-vasm.py](convert-to-vasm.py) converts the main source files into vasm-compatible syntax so vasm can assemble the game

* [convert-to-basic.py](convert-to-basic.py) converts the main source files into a BBC BASIC-compatible syntax that will build on an Archimedes

* [crc32.py](crc32.py) calculates checksums during the verify stage and compares the results with the relevant binaries in the [4-reference-binaries](../4-reference-binaries) folder

It also contains the `make.exe` executable for Windows, plus the required DLL files.

---

_Mark Moxon_