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

NAME		:= libarchive
VERSION		:= 3.3.2
CONFIG_FLAGS	= --disable-xattr --disable-static --enable-shared
OBJDIR		:= __obj
CC		= gcc
PERL		= $(TARGET_DIR)/usr/bin/perl
CPPFLAGS	= -I$(TARGET_DIR)/usr/include -pthread
LDFLAGS		= -L$(TARGET_DIR)/usr/lib
LIBXML2_PC_CFLAGS = $(CPPFLAGS) -I$(TARGET_DIR)/usr/include/libxml2
LIBXML2_PC_LIBS = $(LDFLAGS) -lxml2

export LIBXML2_PC_CFLAGS LIBXML2_PC_LIBS

include makefiles/pkgbuild.mk
