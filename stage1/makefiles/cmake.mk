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

NAME		:= cmake
VERSION		:= 3.7.2
CONFIG_FLAGS	= --system-libs --mandir=/share/man --no-system-jsoncpp \
		  --docdir=/share/doc/cmake-3.7.2 --no-server
CC		= gcc
CONFIGURE	= ./bootstrap
CFLAGS		= -D_XOPEN_SOURCE=500 -I$(TARGET_DIR)/usr/include
CXXFLAGS	= $(CFLAGS)
LDFLAGS		= -L$(TARGET_DIR)/usr/lib

include makefiles/pkgbuild.mk
