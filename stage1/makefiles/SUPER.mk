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

NAME		:= SUPER
PERLMODNAME	:= SUPER
VERSION		:= 1.20141117
CONFIG_FLAGS	:=

CC		= gcc
INC		= -I$(TARGET_DIR)/usr/include
OTHERLDFLAGS	= -L$(TARGET_DIR)/usr/lib
PERL		= $(TARGET_DIR)/usr/bin/perl
MAKEVARS	= OTHERLDFLAGS=$(OTHERLDFLAGS)

export INC OTHERLDFLAGS

include makefiles/perlmodbuild.mk
