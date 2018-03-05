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

NAME		:= gcc
VERSION		:= 4.7.4
CONFIG_FLAGS	= --enable-shared --enable-threads --enable-obsolete \
		   --with-gmp=$(TARGET_DIR)/usr --with-isl=$(TARGET_DIR)/usr \
		   --with-mpfr=$(TARGET_DIR)/usr --with-mpc=$(TARGET_DIR)/usr \
		   --with-system-zlib --with-cloog=no --with-ppl=no \
		   --disable-libgomp --enable-languages=c,c++
OBJDIR		:= __obj

CPPFLAGS	= -I$(TARGET_DIR)/usr/include
LDFLAGS		= -L$(TARGET_DIR)/usr/lib
CC		= cc
export CC

# GNU ar and ranlib need huge amounts of memory for libbackend.a. 
# Therefore the Tru64's versions are used when building gcc.
AR		= /usr/bin/ar
AR_FOR_TARGET	= /usr/bin/ar
RANLIB		= /usr/bin/ranlib
RANLIB_FOR_TARGET = /usr/bin/ranlib
export AR AR_FOR_TARGET RANLIB RANLIB_FOR_TARGET

include makefiles/pkgbuild.mk
