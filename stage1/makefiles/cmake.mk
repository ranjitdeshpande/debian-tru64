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
CONFIG_FLAGS	= --prefix=$(TARGET_DIR)/usr --mandir=/share/man \
		  --docdir=/share/doc/cmake-3.7.2 --no-server \
		  --system-libs --no-system-jsoncpp
CC		= gcc
CXX		= g++
CONFIGURE	= ./bootstrap
CFLAGS		= -D_XOPEN_SOURCE=500 -I$(TARGET_DIR)/usr/include
CXXFLAGS	= $(CFLAGS)
LDFLAGS		= -L$(TARGET_DIR)/usr/lib
NO_STD_CONFIG_FLAGS = yes

include makefiles/pkgbuild.mk
