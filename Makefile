VASM?=vasmarm_std
PYTHON?=python

.PHONY:all
all:
	@$(PYTHON) 2-build-files/convert-to-vasm.py

	rm -fr 5-compiled-game-discs/riscos/!ElScore/*

	$(VASM) -a2 -m2 -quiet -Fbin -L 3-assembled-output/compile.txt -o 3-assembled-output/Scoreboard.bin 3-assembled-output/Scoreboard.arm
	cp 1-source-files/other-sources/!Run,feb 5-compiled-game-discs/riscos/!ElScore/!Run,feb
	cp 1-source-files/other-sources/!Sprites,ff9 5-compiled-game-discs/riscos/!ElScore/!Sprites,ff9
	cp 1-source-files/other-sources/MemAlloc,ffa 5-compiled-game-discs/riscos/!ElScore/MemAlloc,ffa
	cp 3-assembled-output/Scoreboard.bin 5-compiled-game-discs/riscos/Scoreboard,ffa

	@$(PYTHON) 2-build-files/crc32.py 4-reference-binaries 3-assembled-output
