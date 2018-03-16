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

include makefiles/urls.mk

DOWNLOAD_DIR	:= $(shell pwd)/../download
BUILD_DIR	:= $(shell pwd)/build
TARGET_DIR	:= /usr/debian
#TARGET_DIR	:= $(shell pwd)/target
PATCH_DIR	:= $(shell pwd)/patches

LD_LIBRARY_PATH := $(LD_LIBRARY_PATH):$(TARGET_DIR)/usr/lib
PATH		:= $(TARGET_DIR)/usr/bin:$(PATH)

PKGPATCHES	:= $(shell ls $(PATCH_DIR)/$(NAME)-$(VERSION)-*.patch 2> /dev/null)

PKGSRC		= $(filter $(NAME)-$(VERSION)%,$(foreach url,$(URLS),$(lastword $(subst /, ,$(url)))))

# Some packages use an underscore to separate name and version
ifeq ($(PKGSRC),)
PKGSRC		= $(filter $(NAME)_$(VERSION)%,$(foreach url,$(URLS),$(lastword $(subst /, ,$(url)))))
endif

PKGSUFFIX	= $(lastword $(subst ., ,$(PKGSRC)))

# Shell command with LD_LIBRARY_PATH and PATH variables
myshell		= $(shell LD_LIBRARY_PATH=$(LD_LIBRARY_PATH) \
			PATH=$(PATH) $1)

IS_TAR		= $(findstring .tar.,$(PKGSRC))
ifeq ($(PKGSUFFIX),gz)
UNZIPCMD	= gunzip -c
endif
ifeq ($(PKGSUFFIX),tgz)
UNZIPCMD	= gunzip -c
IS_TAR		= yes
endif
ifeq ($(PKGSUFFIX),bz2)
UNZIPCMD	= bunzip2 -c
endif
ifeq ($(PKGSUFFIX),xz)
UNZIPCMD	= xzdec -c
endif
ifeq ($(PKGSUFFIX),zip)
UNZIPCMD	= unzip
extract		= $(call myshell,$(UNZIPCMD) $(1))
pkgdir		= $(call myshell,$(UNZIPCMD) -l $(1) | awk 'FNR == 4 {print $$4}')
endif

ifneq ($(IS_TAR),)
extract		= $(call myshell,$(UNZIPCMD) $(1) | tar xf -)
pkgdir		= $(call myshell,$(UNZIPCMD) $(1) | tar tf - | head -n 1)
endif

PKGBUILDDIR	= $(BUILD_DIR)/$(word 1,$(subst /, ,$(call pkgdir, $(DOWNLOAD_DIR)/$(PKGSRC))))

CONFIG_SHELL	?= /bin/ksh

ifneq ($(OBJDIR),)
MKOBJDIR	= mkdir -p $(OBJDIR)
CDOBJDIR	= cd $(OBJDIR)
CLEANOBJDIR	= rm -rf $(OBJDIR)
CONFIGURE	?= ../configure
else
MKOBJDIR	= /bin/true
CDOBJDIR	= /bin/true
CLEANOBJDIR	= /bin/true
CONFIGURE	?= ./configure
endif

INSTALL_CUSTOM_CMDS ?= /bin/true

export CC LIBS CFLAGS CPPFLAGS CXXFLAGS LDFLAGS PATH \
       LD_LIBRARY_PATH CONFIG_SHELL PERL
