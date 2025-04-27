# !EliteNet: Elite over Econet for the Acorn Archimedes

[BBC Micro cassette Elite](https://github.com/markmoxon/elite-source-code-bbc-micro-cassette) | [BBC Micro disc Elite](https://github.com/markmoxon/elite-source-code-bbc-micro-disc) | [Acorn Electron Elite](https://github.com/markmoxon/elite-source-code-acorn-electron) | [6502 Second Processor Elite](https://github.com/markmoxon/elite-source-code-6502-second-processor) | [Commodore 64 Elite](https://github.com/markmoxon/elite-source-code-commodore-64) | [Apple II Elite](https://github.com/markmoxon/elite-source-code-apple-ii) | [BBC Master Elite](https://github.com/markmoxon/elite-source-code-bbc-master) | [NES Elite](https://github.com/markmoxon/elite-source-code-nes) | [Elite-A](https://github.com/markmoxon/elite-a-source-code-bbc-micro) | [Teletext Elite](https://github.com/markmoxon/teletext-elite) | [Elite Universe Editor](https://github.com/markmoxon/elite-universe-editor) | [Elite Compendium (BBC Master)](https://github.com/markmoxon/elite-compendium-bbc-master) | [Elite Compendium (BBC Micro)](https://github.com/markmoxon/elite-compendium-bbc-micro) | [Elite over Econet](https://github.com/markmoxon/elite-over-econet) | **!EliteNet** | [Flicker-free Commodore 64 Elite](https://github.com/markmoxon/c64-elite-flicker-free) | [BBC Micro Aviator](https://github.com/markmoxon/aviator-source-code-bbc-micro) | [BBC Micro Revs](https://github.com/markmoxon/revs-source-code-bbc-micro) | [Archimedes Lander](https://github.com/markmoxon/lander-source-code-acorn-archimedes)

![Screenshot of the !EliteNet application](https://elite.bbcelite.com/images/elite_over_econet/elitenet.png)

This repository contains source code for the !EliteNet application for the Acorn Archimedes, which allows players of Archimedes Elite to send scores to multiplayer scoreboards over Econet. It also contains the source code for the EliteOverEconet module that does the actual transmissions.

The [Elite over Econet](https://github.com/markmoxon/elite-over-econet) project enables you to load BBC Micro Elite over an Acorn network. It also provides multiplayer scoreboard support, so you can run live Elite competitions over the network. For more information see the [bbcelite.com website](https://elite.bbcelite.com/hacks/elite_over_econet.html), where you can also [download the fully built !EliteNet application](https://elite.bbcelite.com/hacks/elite_over_econet_installing.html).

Archimedes Elite already supports loading over Econet. The !EliteNet application provided here simply adds multiplayer scoreboard support; the game itself is completely untouched. For this to work you need to be running version 1.14 of Archimedes Elite, which you can [download from Ian Bell's personal website](http://www.elitehomepage.org/archive/a/b5052410.arc). For instructions on how to use !EliteNet, click Menu on the application in the Filer and choose `Help` from the `App. '!EliteNet'` submenu.

Note that the final build does not contain the `!EliteNet.!RunImage` or `!EliteNet.WimpLib` BASIC programs, as the sources are text files and need to be converted into tokenised BBC BASIC. The MakeBasic folder produced by the build process contains a script that can be run on an Archimedes to produce the final pieces of the puzzle. MakeBasic also contains the BASIC source for the EliteScoreboard module, so that can be built on an Archimedes if required.

## Acknowledgements

Archimedes Elite was written by Warren Burch and Clive Gringras and is copyright &copy; Hybrid Technology 1991.

!EliteNet is copyright &copy; Mark Moxon and has been released under the MIT licence.

## Building !EliteNet from the source

Builds are supported for Windows and Mac/Linux systems. In all cases the build process is defined in the `Makefile` provided.

The build process also creates a version of the module source that can be built on [Archimedes](#archimedes) machines.

### Requirements

You will need the following to build !EliteNet from the source:

* vasm, which can be downloaded from the [vasm homepage](http://sun.hasenbraten.de/vasm/).

* Python. The build process has only been tested on 3.x, but 2.7 might work.

* Mac and Linux users may need to install `make` if it isn't already present (for Windows users, `make.exe` is included in this repository).

Let's look at how to build !EliteNet from the source.

### Windows

For Windows users, there is a batch file called `make.bat` that builds the project. Before this will work, you should edit the batch file and change the values of the `VASM` and `PYTHON` variables to point to the locations of your `vasmarm_std.exe` and `python.exe` executables (you need the `vasmarm_std` executable). You also need to change directory to the repository folder (i.e. the same folder as `make.bat`).

All being well, entering the following into a command window:

```
make.bat
```

will produce folders called `!EliteNet` and `MakeBasic` in the `5-compiled-game-discs` folder, which contain the skeleton !EliteNet application and BBC BASIC sources as text files. It also produces the `Max,c87` commander file, and a zip file called `EliteNet.zip` that contains everything in one archive. Note that these zips and folders do not contain RISC OS filetype metadata; filetypes are included as filename suffixes, so they will work with HostFS.

To complete the build, you will need to tokenise the BASIC files, as described in the [Archimedes](#archimedes) section below.

### Mac and Linux

The build process uses a standard GNU `Makefile`, so you just need to install `make` if your system doesn't already have it. If vasm or Python are not on your path, then you can either fix this, or you can edit the `Makefile` and change the `VASM` and `PYTHON` variables in the first two lines to point to their locations (you need the `vasmarm_std` executable). You also need to change directory to the repository folder (i.e. the same folder as `Makefile`).

All being well, entering the following into a terminal window:

```
make
```

will produce folders called `!EliteNet` and `MakeBasic` in the `5-compiled-game-discs` folder, which contain the skeleton !EliteNet application and BBC BASIC sources as text files. It also produces the `Max,c87` commander file, and a zip file called `EliteNet.zip` that contains everything in one archive. Note that these zips and folders do not contain RISC OS filetype metadata; filetypes are included as filename suffixes, so they will work with HostFS.

To complete the build, you will need to tokenise the BASIC files, as described in the [Archimedes](#archimedes) section below.

### Archimedes

The build process outlined above produces a skeleton RISC OS application folder called `!EliteNet` in the `5-compiled-game-discs` folder, and another folder called `MakeBasic`. The latter contains text files containing the BBC BASIC sources that need to be tokenised on an Archimedes, and it also contains a version of the EliteOverEconet module source code that can be built on an Archimedes.

To finish building the application, do the following:

* Copy the `!EliteNet` and `MakeBasic` folders to an Archimedes, along with the `Max,c87` commander file. You can either copy the files individually or use the zip file. The filenames are designed to be copied using HostFS, and contain the filetypes as ,xxx suffixes.

* Open the `MakeBasic` folder in RISC OS and double-click on the `!Convert` file. Press any key to close the window that pops up. The `MakeBasic` folder will now contain the following BBC BASIC files: `!RunImage`, `WimpLib` and `EliteNetSc`.

* Open the application folder by double-clicking on the `!EliteNet` folder while holding down Shift, and copy `!RunImage` and `WimpLib` in here.

The !EliteNet application is now complete and can be run. For instructions on how to use !EliteNet, click Menu on the application in the Filer and choose `Help` from the `App. '!EliteNet'` submenu.

The `EliteNetSc` program contains the source for the EliteOverEconet module. The build process already builds the module using vasm, but the source is also provided as a BBC BASIC program that you can run on an Archimedes to produce the same module. Note that if you do build the module on an Archimedes, the resulting binary may differ slightly from the vasm version, as vasm implements the ADRL directive differently to the macro used in the BBC BASIC source code. The resulting module will behave identically, though.

### Verifying the output

The build process prints out checksums of all the generated files, along with the checksums of the files from the original sources.

The Python script `crc32.py` in the `2-build-files` folder does the actual verification, and shows the checksums and file sizes of both sets of files, alongside each other, and with a Match column that flags any discrepancies.

The binaries in the `4-reference-binaries` folder are those extracted from the released version of the game, while those in the `3-assembled-output` folder are produced by the build process. For example, if you don't make any changes to the code and build the project with `make`, then this is the output of the verification process:

```
[--originals--]  [---output----]
Checksum   Size  Checksum   Size  Match  Filename
-----------------------------------------------------------
343fe3d8   3656  343fe3d8   3656   Yes   EliteNet.bin
```

All the compiled binaries match the originals, so we know we are producing the same module as the released version.

### Log files

During compilation, details of every step are output in a file called `compile.txt` in the `3-assembled-output` folder. If you have problems, it might come in handy, and it's a great reference if you need to know the addresses of labels and variables for debugging (or just snooping around).

---

Right on, Commanders!

_Mark Moxon_
