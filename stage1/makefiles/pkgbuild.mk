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

include makefiles/common.mk

all: check $(DOWNLOAD_DIR)/$(PKGSRC) $(PKGBUILDDIR)/.installed

check:
	@if [ -z "$(NAME)" ]; then \
		echo "Do not invoke this file directly"; \
		exit 1; \
	fi

$(DOWNLOAD_DIR)/$(PKGSRC): 
	wget -O $@ --no-check-certificate \
			$(filter %/$(lastword $(subst /, ,$(PKGSRC))),$(URLS))

$(PKGBUILDDIR)/.extracted:
	@echo "Extracting $(PKGSRC)"
ifeq ($(UNZIPCMD),)
	@echo "Cannot extract $(PKGSRC)"
	@exit 1
else
	@(cd $(BUILD_DIR); $(UNZIPCMD) $(DOWNLOAD_DIR)/$(PKGSRC) | tar xf -)
endif
	@touch $@

$(PKGBUILDDIR)/.patched: $(PKGBUILDDIR)/.extracted
ifneq ($(PKGCUSTOM_PATCH),)
	# Custom patches used before we build the patch utility
	$(PKGCUSTOM_PATCH)
endif
	@if [ "$(PKGPATCHES)" != "" ]; then \
		echo "Patching $(NAME)-$(VERSION)"; \
		cd $(PKGBUILDDIR); \
		for p in dummy $(PKGPATCHES); do \
			[ $$p != dummy ] && patch -p1 < $$p; \
		done; \
	fi
	@touch $@

$(PKGBUILDDIR)/.configured: $(PKGBUILDDIR)/.patched
	@echo "Configuring $(NAME)-$(VERSION)"
ifeq ($(NO_STD_CONFIG_FLAGS),)
	@(cd $(PKGBUILDDIR); $(MKOBJDIR); $(CDOBJDIR); \
		$(CONFIG_SHELL) $(CONFIGURE) \
			--prefix=$(TARGET_DIR)/usr \
			--sysconfdir=$(TARGET_DIR)/etc \
			--localstatedir=$(TARGET_DIR)/var \
			$(CONFIG_FLAGS))
else
	(cd $(PKGBUILDDIR); $(MKOBJDIR); $(CDOBJDIR); \
		$(CONFIG_SHELL) $(CONFIGURE) $(CONFIG_FLAGS))
endif
	@touch $@

$(PKGBUILDDIR)/.built: $(PKGBUILDDIR)/.configured
	@echo "Building $(NAME)-$(VERSION)"
	@(cd $(PKGBUILDDIR); $(CDOBJDIR); make $(MAKEVARS))
	@touch $@

$(PKGBUILDDIR)/.installed: $(PKGBUILDDIR)/.built
	@echo "Installing $(NAME)-$(VERSION)"
	@(cd $(PKGBUILDDIR); $(CDOBJDIR); make install)
	@$(INSTALL_CUSTOM_CMDS)
	@touch $@

clean:
	@echo "Cleaning $(PKGBUILDDIR)"
	@(cd $(PKGBUILDDIR); $(CDOBJDIR); make $@)
	@rm -f $(PKGBUILDDIR)/.built

clobber:
	@echo "Removing $(PKGBUILDDIR)"
	@rm -rf $(PKGBUILDDIR)
