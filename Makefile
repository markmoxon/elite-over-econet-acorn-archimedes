VASM?=vasmarm_std
PYTHON?=python

.PHONY:all
all:
	@$(PYTHON) 2-build-files/convert-to-vasm.py

	rm -fr 5-compiled-game-discs/!EliteNet/*
	rm -fr 5-compiled-game-discs/MakeBasic/*
	rm -fr 5-compiled-game-discs/*.zip

	$(VASM) -a2 -m2 -quiet -Fbin -L 3-assembled-output/compile.txt -o 3-assembled-output/EliteNet.bin 3-assembled-output/EliteOverEconet.arm
	cp 1-source-files/other-sources/!EliteNet/* 5-compiled-game-discs/!EliteNet
	cp 3-assembled-output/EliteNet.bin 5-compiled-game-discs/!EliteNet/EliteNet,ffa

	cp 1-source-files/other-sources/MakeBasic/* 5-compiled-game-discs/MakeBasic
	cp 1-source-files/main-sources/!RunImage.bas 5-compiled-game-discs/MakeBasic/!RunImageT,fff
	cp 1-source-files/main-sources/WimpLib.bas 5-compiled-game-discs/MakeBasic/WimpLib,fff

	@$(PYTHON) 2-build-files/convert-to-basic.py
	cp 3-assembled-output/EliteNetSc,fff 5-compiled-game-discs/MakeBasic/EliteNetT,fff

	cp 1-source-files/other-sources/Max,c87 5-compiled-game-discs/Max,c87

	cp -r 5-compiled-game-discs/!EliteNet .
	cp -r 5-compiled-game-discs/MakeBasic .
	cp -r 5-compiled-game-discs/Max,c87 .
	zip -r EliteNet.zip !EliteNet MakeBasic Max,c87 -x "*/.*"
	mv EliteNet.zip 5-compiled-game-discs
	rm -fr \!EliteNet
	rm -fr MakeBasic
	rm -fr Max,c87

	@$(PYTHON) 2-build-files/crc32.py 4-reference-binaries 3-assembled-output
