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
ifeq ($(PKGSUFFIX),gz)
	@(cd $(BUILD_DIR); gunzip -c $(DOWNLOAD_DIR)/$(PKGSRC) | tar xf -)
else
  ifeq ($(PKGSUFFIX),bz2)
	@(cd $(BUILD_DIR); bunzip2 -c $(DOWNLOAD_DIR)/$(PKGSRC) | tar xf -)
  else
    ifeq ($(PKGSUFFIX),xz)
	@(cd $(BUILD_DIR); xzcat -c $(DOWNLOAD_DIR)/$(PKGSRC) | tar xf -)
    else
	@echo "Cannot extract $(PKGSRC)"
	@exit 1
    endif
  endif
endif
	@touch $@

$(PKGBUILDDIR)/.patched: $(PKGBUILDDIR)/.extracted
ifneq ($(PKGCUSTOM_PATCH),)
	# Custom patches used before we build the patch utility
	$(PKGCUSTOM_PATCH)
endif
	@if [ -n "$(PKGPATCHES)" ]; then \
		echo "Patching $(NAME)-$(VERSION)"; \
		cd $(PKGBUILDDIR); \
		for p in "$(PKGPATCHES)"; do \
			patch -p1 < $$p; \
		done; \
	fi
	@touch $@

$(PKGBUILDDIR)/.configured: $(PKGBUILDDIR)/.patched
	@echo "Configuring $(NAME)-$(VERSION)"
	@(cd $(PKGBUILDDIR); $(MKOBJDIR); $(CDOBJDIR); \
		../configure --prefix=$(TARGET_DIR)/usr \
			$(CONFIG_FLAGS))
	@touch $@

$(PKGBUILDDIR)/.built: $(PKGBUILDDIR)/.configured
	@echo "Building $(NAME)-$(VERSION)"
	@(cd $(PKGBUILDDIR); $(CDOBJDIR); make)
	@touch $@

$(PKGBUILDDIR)/.installed: $(PKGBUILDDIR)/.built
	@echo "Installing $(NAME)-$(VERSION)"
	@(cd $(PKGBUILDDIR); $(CDOBJDIR); make install)
	@touch $@

clean:
	@echo "Cleaning $(PKGBUILDDIR)"
	@(cd $(PKGBUILDDIR); $(CDOBJDIR); make $@)
	@rm -f $(PKGBUILDDIR)/.built

clobber:
	@echo "Removing $(PKGBUILDDIR)"
	@rm -rf $(PKGBUILDDIR)
