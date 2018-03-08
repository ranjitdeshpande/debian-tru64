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

NAME		:= pcre2
VERSION		:= 10.31
CONFIG_FLAGS	:= --enable-unicode --enable-pcre2-16 --enable-pcre2-32 \
		   --enable-pcre2grep-libz --enable-pcre2grep-libbz2 \
		   --enable-pcre2test-libreadline --disable-static            
OBJDIR		:= __obj
CC		= gcc
CPPFLAGS	= -I$(TARGET_DIR)/usr/include
LDFLAGS		= -L$(TARGET_DIR)/usr/lib

include makefiles/pkgbuild.mk
