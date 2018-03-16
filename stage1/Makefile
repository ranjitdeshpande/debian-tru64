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

PKGS = patch sed gawk zlib gzip bzip2 xz unzip gmp mpfr mpc libiconv \
       tar binutils gcc emacs gettext perl texinfo Locale-gettext \
       help2man icu ncurses readline pcre pcre2 grep flex openssl curl \
       libxml2 expat libarchive cmake dpkg libxslt bison coreutils \
       libsigsegv diffutils bash autoconf automake file ExtUtils-MakeMaker \
       TimeDate inc-latest Module-Build Sub-Identify SUPER Test-MockModule \
       Archive-Zip Archive-Cpio strip-nondeterminism TermReadKey \
       Test-Simple Class-Accessor Class-Accessor-Chained File-Remove \
       YAML-Tiny Test-Requires Module-Depends Module-ScanDeps Module-Install \
       Encode-ISO2022 Encode-EUCJPASCII Encode-JISX0213 Encode-HanExtra \
       POD2-Base MIME-Charset Text-CharWidth Text-WrapI18N Unicode-LineBreak \
       SGMLSpm po4a debhelper

all clean clobber:
	@for pkg in $(PKGS); do \
		echo "*****************************************************"; \
		echo "*"; \
		echo "* $$pkg"; \
		echo "*"; \
		echo "*****************************************************"; \
		make -f makefiles/$$pkg.mk $@; \
		if [ $$? != "0" ]; then \
			exit 1; \
		fi; \
	done
