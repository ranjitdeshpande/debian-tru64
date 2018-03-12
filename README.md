# Debian Packages for Tru64

Port of debian packages to Tru64. Requires Tru64 5.1B with the latest
pactches.

Project builds in two stages:

Stage1: Creates a bootstrap environment using open source packages
        from the Tru64 distribution.

Stage2: Compiles everything with the bootstrapped toolchain.


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
