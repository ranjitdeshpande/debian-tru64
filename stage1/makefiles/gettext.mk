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

NAME		:= gettext
VERSION		:= 0.19.8
CONFIG_FLAGS	= --disable-java --enable-threads=posix \
		  --disable-openmp --disable-curses --without-git \
		  --with-included-glib --without-emacs--with-included-libcroco \
		  --with-included-gettext --with-included-libxml \
		  --with-libiconv-prefix=$(TARGET_DIR)/usr
OBJDIR		:= __obj

LIBS		= -lpthread
export LIBS

include makefiles/pkgbuild.mk
