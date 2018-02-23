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

DOWNLOAD_DIR	:= $(shell pwd)/download
BUILD_DIR	:= $(shell pwd)/build
TARGET_DIR	:= $(shell pwd)/target
PATCH_DIR	:= $(shell pwd)/patches
PATH 		:= $(TARGET_DIR)/usr/bin:$(TARGET_DIR)/usr/sbin:$(TARGET_DIR)/bin:$(PATH)
PKGPATCHES	:= $(shell ls $(PATCH_DIR)/$(NAME)-$(VERSION)-*.patch 2> /dev/null)

PKGSRC		= $(filter $(NAME)-$(VERSION)%,$(foreach url,$(URLS),$(lastword $(subst /, ,$(url)))))
PKGBUILDDIR	= $(BUILD_DIR)/$(NAME)-$(VERSION)
PKGSUFFIX	= $(lastword $(subst ., ,$(PKGSRC)))

ifneq ($(OBJDIR),)
MKOBJDIR	= mkdir -p $(OBJDIR)
CDOBJDIR	= cd $(OBJDIR)
CLEANOBJDIR	= rm -rf $(OBJDIR)
endif


