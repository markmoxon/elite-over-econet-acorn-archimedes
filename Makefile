VASM?=vasmarm_std
PYTHON?=python

.PHONY:all
all:
	@$(PYTHON) 2-build-files/convert-to-vasm.py

	rm -fr 5-compiled-game-discs/!EliteNet/*

	$(VASM) -a2 -m2 -quiet -opt-adr -Fbin -L 3-assembled-output/compile.txt -o 3-assembled-output/EliteNet.bin 3-assembled-output/EliteOverEconet.arm
	cp 1-source-files/other-sources/!Run,feb 5-compiled-game-discs/!EliteNet/!Run,feb
	cp 1-source-files/other-sources/!Sprites,ff9 5-compiled-game-discs/!EliteNet/!Sprites,ff9
	cp 1-source-files/other-sources/MemAlloc,ffa 5-compiled-game-discs/!EliteNet/MemAlloc,ffa
	cp 3-assembled-output/EliteNet.bin 5-compiled-game-discs/EliteNet,ffa

	@$(PYTHON) 2-build-files/convert-to-basic.py
	cp 3-assembled-output/EliteNetSc,fff 5-compiled-game-discs/EliteNetSc,fff

	@$(PYTHON) 2-build-files/crc32.py 4-reference-binaries 3-assembled-output
