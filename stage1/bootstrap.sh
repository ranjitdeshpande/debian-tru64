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

# With a virgin, minimal Tru64 install, there is no GNU make. We build make
# via this shell script and then switch to the makefile infrastructure.

BUILDDIR=`pwd`/build
TARGETDIR=/usr/debian #`pwd`/target
DLDIR=`pwd`/../download

echo
echo
echo "Bootstrapping GNU make..."
echo
echo

if [ ! -f ${TARGETDIR}/usr/bin/makeinfo ]; then
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
fi

OLDPATH=${PATH}
PATH=${PATH}:${TARGETDIR}/usr/bin
export PATH

PKGBUILD=`echo ${BUILDDIR}/make*`

# Extract GNU make
TARGET=${PKGBUILD}/.extracted
if [ "x${PKGBUILD}" = "x" -o ! -f ${TARGET} ]; then
	echo "Extracting make..."
	OLDPWD=`pwd`
	mkdir -p $BUILDDIR
	cd ${BUILDDIR}
	gzcat ${DLDIR}/make*.tar.gz | tar xf -
	if [ $? != 0 ]; then
		echo "Failed to extract make source archive."
		exit 1
	fi
	PKGBUILD=`echo ${BUILDDIR}/make*`
	TARGET=${PKGBUILD}/.extracted
	touch ${TARGET}
	cd ${OLDPWD}
fi

# Patch configure
TARGET=${PKGBUILD}/.patched
if [ ! -f ${TARGET} ]; then
	echo "Patching make..."
	OLDPWD=`pwd`
	cd ${PKGBUILD}
	cat configure | sed -e 's/-rdynamic/-Wl,-rdynamic/g' > configure.new
	if [ $? != 0 ]; then
		echo "Failed to patch make source archive."
		exit 1
	fi
	mv configure.new configure
	touch ${TARGET}
	cd ${OLDPWD}
fi

# Run configure
TARGET=${PKGBUILD}/.configured
if [ ! -f ${TARGET} ]; then
	echo "Configuring make..."
	OLDPWD=`pwd`
	cd ${PKGBUILD}
	mkdir -p __obj
	cd __obj
	CC=cc /bin/ksh ../configure --prefix=${TARGETDIR}/usr --without-guile \
		--host=alpha-dec-osf5.1
	if [ $? != 0 ]; then
		exit 1
	fi
	touch ${TARGET}
	cd ${OLDPWD}
fi

# Make make :-)
TARGET=${PKGBUILD}/.built
if [ ! -f ${TARGET} ]; then
	echo "Building make..."
	OLDPWD=`pwd`
	cd ${PKGBUILD}/__obj
	make all || exit 1
	touch ${TARGET}
	cd ${OLDPWD}
fi

# Install make
TARGET=${PKGBUILD}/.installed
if [ ! -f ${TARGET} ]; then
	echo "Installing make..."
	OLDPWD=`pwd`
	cd ${PKGBUILD}/__obj
	make install || exit 1
	touch ${TARGET}
	cd ${OLDPWD}
fi

echo
echo
echo "Building Debian-Tru64 Stage1..."
echo
echo

PATH=${TARGETDIR}/usr/bin:${OLDPATH}
export PATH

exec make

