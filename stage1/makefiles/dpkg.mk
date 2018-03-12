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

NAME		:= dpkg
VERSION		:= 1.19.0.5
CONFIG_FLAGS	= --host=alpha-dec-osf1 --build=alpha-dec-osf1 \
		  --sysconfdir=$(TARGET_DIR)/etc \
		  --localstatedir=$(TARGET_DIR)/var \
		  --with-libiconv-prefix=$(TARGET_DIR)/usr \
		  --disable-start-stop-daemon --disable-dselect
OBJDIR		:= __obj
CC		= gcc
PERL		= $(TARGET_DIR)/usr/bin/perl
CPPFLAGS	= -I$(TARGET_DIR)/usr/include
LDFLAGS		= -L$(TARGET_DIR)/usr/lib
PATCH		= $(TARGET_DIR)/usr/bin/patch
TAR		= $(TARGET_DIR)/usr/bin/tar

export PATCH TAR

include makefiles/pkgbuild.mk
