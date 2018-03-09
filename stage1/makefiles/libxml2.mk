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

NAME		:= libxml2
VERSION		:= 2.9.7
CONFIG_FLAGS	= --enable-shared --disable-static --with-icu \
		  --with-zlib=$(TARGET_DIR)/usr --with-lzma=$(TARGET_DIR)/usr
OBJDIR		:= __obj
CC		= gcc
PERL		= $(TARGET_DIR)/usr/bin/perl

include makefiles/pkgbuild.mk
