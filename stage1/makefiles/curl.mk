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

NAME		:= curl
VERSION		:= 7.58.0
CONFIG_FLAGS	= --disable-debug --enable-optimize --disable-werror \
		  --enable-shared --disable-static --enable-pthreads \
		  --with-zlib=$(TARGET_DIR)/usr --with-ssl=$(TARGET_DIR)/usr
OBJDIR		:= __obj
CC		= gcc
CPPFLAGS	= -D_XOPEN_SOURCE=500

# pthread_create() declared as a macro on Tru64, so configure
# test fails.
ac_cv_func_pthread_create = yes
export ac_cv_func_pthread_create

include makefiles/pkgbuild.mk
