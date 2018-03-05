#!/bin/sh
#
# Copyright 2018 Ranjit Deshpande <ranjitdeshpande@hotmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# With a virgin, minimal Tru64 install, there is no GNU make or patch.
# We build these two utilities via this shell script and then switch to 
# the makefile infrastructure.

BUILDDIR=`pwd`/build
TARGETDIR=`pwd`/target
DLDIR=`pwd`/../download

echo
echo
echo "Bootstrapping GNU make..."
echo
echo

# Create a fake makeinfo shell script
mkdir -p ${TARGETDIR}/usr/bin
cat <<__EOF >${TARGETDIR}/usr/bin/makeinfo
#!/bin/sh

while [ -n \$1 ]; do
        if [ "\$1" = "-o" ]; then
                f="\$2"
                touch \$f
                exit 0
        fi
        shift
done

exit 1
__EOF

chmod +x ${TARGETDIR}/usr/bin/makeinfo
OLDPATH=${PATH}
PATH=${PATH}:${TARGETDIR}/usr/bin
export PATH

# Extract GNU make
mkdir -p $BUILDDIR
cd ${BUILDDIR}
gzcat ${DLDIR}/make*.tar.gz | tar xf -

# Patch configure
cd make-*
cat configure | sed -e 's/-rdynamic/-Wl,-rdynamic/g' > configure.new
mv configure.new configure

# Run configure
mkdir __obj
cd __obj
/bin/sh ../configure --prefix=${TARGETDIR}/usr --without-guile

# Make make :-)
make all install

echo
echo
echo "Building Debian-Tru64 Stage1..."
echo
echo

cd ../../..

PATH=${TARGETDIR}/usr/bin:${OLDPATH}
export PATH

exec make

