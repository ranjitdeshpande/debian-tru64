Debian Packages for Tru64
=========================

Port of debian packages to Tru64. Requires Tru64 5.1B with the latest
pactches.

Project builds in two stages:

Stage1: Creates a bootstrap environment using open source packages
        from the Tru64 distribution.
Stage2: Compiles everything with the bootstrapped toolchain.


Dpkg is used as the package manager for the packages built by this project.

*Why? Because, why not?*
