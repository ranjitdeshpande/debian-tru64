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

NAME		:= ppl
VERSION		:= 0.12.1
CONFIG_FLAGS	:= --enable-shared --with-gmp=$(TARGET_DIR)/usr \
		   --enable-interfaces=c --disable-static
OBJDIR		:= __obj

CPPFLAGS	= -I$(TARGET_DIR)/usr/include
LDFLAGS		= -L$(TARGET_DIR)/usr/lib

# There is no getopt_long() on Tru64, so tell configure not to use it
ac_cv_header_getopt_h=no

export ac_cv_header_getopt_h

include makefiles/pkgbuild.mk

