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

NAME		:= automake
VERSION		:= 1.16
CONFIG_FLAGS	=
CC		= gcc
PERL		= $(TARGET_DIR)/usr/bin/perl
EMACS		= $(TARGET_DIR)/usr/bin/emacs
AM_TEST_RUNNER_SHELL = $(TARGET_DIR)/usr/bin/bash

export EMACS AM_TEST_RUNNER_SHELL

include makefiles/pkgbuild.mk
