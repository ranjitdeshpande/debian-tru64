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

NAME		:= ncurses
VERSION		:= 6.1
CONFIG_FLAGS	:= --with-shared --without-debug --without-profile \
		   --with-cxx-shared --with-pthread --disable-lib-suffixes
OBJDIR		:= __obj
CC		= gcc
CONFIG_SHELL	= /bin/ksh
SHELL		= /bin/ksh

CPPFLAGS	= -pthread -D_XOPEN_SOURCE=500
LIBS		= -lpthread

include makefiles/pkgbuild.mk
