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

NAME		:= fakeroot
VERSION		:= 1.22.orig
CONFIG_FLAGS	=
OBJDIR		:= __obj
CC		= gcc
PERL		= $(TARGET_DIR)/usr/bin/perl
CPPFLAGS	= -I$(TARGET_DIR)/usr/include -O3 -D_POSIX_C_SOURCE=1 \
		  -D_XOPEN_SOURCE=500 -DDEBPREFIX=\"$(TARGET_DIR)\" -pthread
LDFLAGS		= -L$(TARGET_DIR)/usr/lib
MAKEVARS	= SHELL=/bin/ksh
LDPRELOADVAR	= _RLD_LIST

export LDPRELOADVAR

include makefiles/pkgbuild.mk
