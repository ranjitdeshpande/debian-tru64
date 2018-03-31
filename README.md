# Debian Packages for Tru64

Port of debian packages to Tru64. Requires Tru64 5.1B with the latest
pactches.

Project builds in two stages:

### Stage1
Creates a bootstrap environment using open source packages built with the
native Tru64 C compiler. Once GCC is built, the rest of the packages are
built using GCC. This means that the bootstrap packages will be built using
two different compilers. This doesn't matter because the native compiler is
used to build only the base utlities to bootstrap GCC.

On Tru64, the linker, assembler and other "binutils" are native, so there
is no conflict with libraries built using the native compiler vs GCC.

### Stage2
Compiles everything with the bootstrapped toolchain.


Dpkg is used as the package manager for the packages built by this project.

*Why? Because, why not?*

## Status

### March 5th 2018

GCC 4.7.4 compiled with the native Tru64 C compiler. Baseline is set to start
compiling packages with the newly built GCC. Perl will be the first test case.

### March 8th 2018

Perl 5.26.1 built. Now starting the long journey to building the base required
to start compiling Debian packages. Dpkg and debhelper will the first packages
to be built.

### March 12th 2018

Built CMake. This is a really annoying package which is pure bloatware. It
took forever to compile it on my PC164-based system. It is needed to build
many other packages so it was better to go through this in the beginning.
It has a lot of dependencies and they took their own time to build as well.

### March 14th 2018

Completed dpkg and debhelper build. Minimally hacked dpkg to handle COFF
files on Tru64. Now comes the interesting part. This is the overlap between
Stage 1 and Stage 2. Packages will need to be built in Stage 1 as and when
Stage 2 needs tools/libraries. Stage 2 needs to be self-hosting. In other
words, all of Stage 2's tools/libraries need to be referenced from their
final location in the filesystem. As of now, the install location is
/usr/debian since the /usr filesystem is usually larger on default Tru64
installs.

### March 15th 2018

Switched target to /usr/debian since final packages will all look for files
in their final resting place. This is true even while building packages.

### March 19th 2018

Lots of small things got missed in checkins so the re-build was a good
excercise to fix these bugs.

### March 31st 2018

Everything now builds. Removed cmake since it is not needed for this
phase. Docbook files installed locally. Mostly complete but everything
builds.
