# !EliteNet: Elite over Econet for the Acorn Archimedes

[BBC Micro cassette Elite](https://github.com/markmoxon/elite-source-code-bbc-micro-cassette) | [BBC Micro disc Elite](https://github.com/markmoxon/elite-source-code-bbc-micro-disc) | [Acorn Electron Elite](https://github.com/markmoxon/elite-source-code-acorn-electron) | [6502 Second Processor Elite](https://github.com/markmoxon/elite-source-code-6502-second-processor) | [Commodore 64 Elite](https://github.com/markmoxon/elite-source-code-commodore-64) | [Apple II Elite](https://github.com/markmoxon/elite-source-code-apple-ii) | [BBC Master Elite](https://github.com/markmoxon/elite-source-code-bbc-master) | [NES Elite](https://github.com/markmoxon/elite-source-code-nes) | [Elite-A](https://github.com/markmoxon/elite-a-source-code-bbc-micro) | [Teletext Elite](https://github.com/markmoxon/teletext-elite) | [Elite Universe Editor](https://github.com/markmoxon/elite-universe-editor) | [Elite Compendium (BBC Master)](https://github.com/markmoxon/elite-compendium-bbc-master) | [Elite Compendium (BBC Micro)](https://github.com/markmoxon/elite-compendium-bbc-micro) | [Elite over Econet](https://github.com/markmoxon/elite-over-econet) | **!EliteNet** | [Flicker-free Commodore 64 Elite](https://github.com/markmoxon/c64-elite-flicker-free) | [BBC Micro Aviator](https://github.com/markmoxon/aviator-source-code-bbc-micro) | [BBC Micro Revs](https://github.com/markmoxon/revs-source-code-bbc-micro) | [Archimedes Lander](https://github.com/markmoxon/lander-source-code-acorn-archimedes)

![Screenshot of the !EliteNet application](https://elite.bbcelite.com/images/elite_over_econet/elitenet.png)

This repository contains source code for the !EliteNet application for the Acorn Archimedes, which allows players of Archimedes Elite to send scores to multiplayer scoreboards as part of Elite over Econet.

Elite over Econet enables you to load Elite over an Acorn network. It also provides multiplayer scoreboard support, so you can run live Elite competitions over the network. For more information, see the [bbcelite.com website](https://elite.bbcelite.com/hacks/elite_over_econet.html).

This repository contains the source code for the !EliteNet application. For instructions on how to use !EliteNet, click Menu on the application and choose Help from the App. '!EliteNet' submenu.

Note that the final build does not contain the !EliteNet.!RunImage or !EliteNet.WimpLib BASIC programs, as these need to be tokenised. The MakeBasic folder contains a script that can be run on an Archimedes to produce the final piece of the puzzle. MakeBasic also contains the BASIC source for the EliteScoreboard module, so that can also be built on an Archimedes if required.

## Acknowledgements

Archimedes Elite was written by Warren Burch and Clive Gringras and is copyright &copy; Hybrid Technology 1991.

The commentary is copyright &copy; Mark Moxon. Any misunderstandings or mistakes in the documentation are entirely my fault.

Huge thanks are due to the original authors for not only creating such an important piece of my childhood, but also for releasing the source code for us to play with; to Paul Brink for his annotated disassembly; and to Kieran Connell for his [BeebAsm version](https://github.com/kieranhj/elite-beebasm), which I forked as the original basis for this project. You can find more information about this project in the [accompanying website's project page](https://elite.bbcelite.com/about_site/about_this_project.html).

The following archives from Ian Bell's personal website form the basis for this project:

* [Archimedes Elite](http://www.elitehomepage.org/archive/a/b5052410.arc)

### A note on licences, copyright etc.

This repository is _not_ provided with a licence, and there is intentionally no `LICENSE` file provided.

According to [GitHub's licensing documentation](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/licensing-a-repository), this means that "the default copyright laws apply, meaning that you retain all rights to your source code and no one may reproduce, distribute, or create derivative works from your work".

The reason for this is that Elite over Econet is intertwined with the original Elite source code, and the original source code is copyright. The whole site is therefore covered by default copyright law, to ensure that this copyright is respected.

Under GitHub's rules, you have the right to read and fork this repository... but that's it. No other use is permitted, I'm afraid.

My hope is that the educational and non-profit intentions of this repository will enable it to stay hosted and available, but the original copyright holders do have the right to ask for it to be taken down, in which case I will comply without hesitation. I do hope, though, that along with the various other disassemblies and commentaries of this source, it will remain viable.

## Building !EliteNet from the source

Builds are supported for Windows and Mac/Linux systems. In all cases the build process is defined in the `Makefile` provided.

The build process also creates a version of the source that can be built on [Archimedes][#archimedes] machines.

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

will produce folders called `!EliteNet` and `MakeBasic` in the `5-compiled-game-discs` folder, which contain the !EliteNet application and BBC BASIC sources as test files. It also produces the `Max,c87` commander file, and a zip file called `EliteNet.zip` that contains everything in one archive. Note that these zips and folders do not contain RISC OS filetype metadata; filetypes are included as filename suffixes, so they will work with HostFS.

To complete the build, you will need to tokenise the BASIC files, as described in the Archimedes section below.

### Mac and Linux

The build process uses a standard GNU `Makefile`, so you just need to install `make` if your system doesn't already have it. If vasm or Python are not on your path, then you can either fix this, or you can edit the `Makefile` and change the `VASM` and `PYTHON` variables in the first two lines to point to their locations (you need the `vasmarm_std` executable). You also need to change directory to the repository folder (i.e. the same folder as `Makefile`).

All being well, entering the following into a terminal window:

```
make
```

will produce folders called `!EliteNet` and `MakeBasic` in the `5-compiled-game-discs` folder, which contain the !EliteNet application and BBC BASIC sources as test files. It also produces the `Max,c87` commander file, and a zip file called `EliteNet.zip` that contains everything in one archive. Note that these zips and folders do not contain RISC OS filetype metadata; filetypes are included as filename suffixes, so they will work with HostFS.

To complete the build, you will need to tokenise the BASIC files, as described in the Archimedes section below.

### Archimedes

The build process outlined above produces a RISC OS application called `!EliteNet` in the `5-compiled-game-discs` folder, and a folder called `MakeBasic`. The latter contains BBC BASIC sources that need to be tokenised on an Archimedes, and it also contains a version of the EliteOverEconet module source that can be built on an Archimedes.

To finish building the application, do the following:

* Copy the `!EliteNet` and `MakeBasic` folders to an Archimedes, along with the `Max,c87` commander file.

* Open the `MakeBasic` folder in RISC OS and double-click on the `!Convert` file. Press any key to close the window that pops up. The `MakeBasic` folder will now contain the following BBC BASIC files: `!RunImage`, `WimpLib` and `EliteNetSc`.

* Open the application folder by double-clicking on the `!EliteNet` folder while holding down Shift, and copy `!RunImage` and `WimpLib` in here.

The !EliteNet application is now complete and can be run. For instructions on how to use !EliteNet, click Menu on the application and choose Help from the App. '!EliteNet' submenu.

The `EliteNetSc` program contains the source for the EliteOverEconet module. The build process already builds the module using vasm, but the source is also provided as a BBC BASIC program that you can run on an Archimedes to produce the same module. Note that if you do build the module on an Archimedes, it will differ slightly from the vasm version, as vasm implements the ADRL directive differently to the macro in the BBC BASIC source code. The resulting module behaves identically, though.

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
