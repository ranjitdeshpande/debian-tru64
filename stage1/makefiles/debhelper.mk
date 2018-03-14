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

NAME		:= debhelper
VERSION		:= 11.1.5
CC		= gcc
PERL		= $(TARGET_DIR)/usr/bin/perl
CPPFLAGS	= -I$(TARGET_DIR)/usr/include -O3
LDFLAGS		= -L$(TARGET_DIR)/usr/lib
PERL_ESC	= $(subst /,\/,$(PERL))
BASH_ESC	= $(subst /,\/,$(TARGET_DIR)/usr/bin/bash)
PKGCUSTOM_PATCH = find $(PKGBUILDDIR) -type f -exec $(PERL) -p -i -e \
		  's/\#!\/usr\/bin\/perl/\#!$(PERL_ESC)/g' {} \; ; \
		  find $(PKGBUILDDIR) -type f -exec $(PERL) -p -i -e \
		  's/\#!\/bin\/sh/\#!$(BASH_ESC)/g' {} \;
CONFIGURE	= true
NO_STD_CONFIG_FLAGS = yes
MAKEVARS	= PREFIX=$(TARGET_DIR)/usr PERLLIBDIR=$(TARGET_DIR)/usr/lib/perl5/5.26.1

include makefiles/pkgbuild.mk

