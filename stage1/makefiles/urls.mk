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

URLS := http://mirrors.kernel.org/gnu/make/make-4.2.tar.gz \
        https://zlib.net/zlib-1.2.11.tar.gz \
	http://mirrors.kernel.org/gnu/sed/sed-4.2.tar.gz \
        http://mirrors.kernel.org/gnu/gzip/gzip-1.9.tar.gz \
        http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz \
        https://tukaani.org/xz/xz-5.2.3.tar.gz \
        http://mirrors.kernel.org/gnu/tar/tar-1.30.tar.gz \
        http://mirrors.kernel.org/gnu/gmp/gmp-6.1.2.tar.xz \
	http://mirrors.kernel.org/gnu/libiconv/libiconv-1.15.tar.gz \
	http://mirrors.kernel.org/gnu/gettext/gettext-0.19.8.tar.gz \
	http://mirrors.kernel.org/gnu/patch/patch-2.7.6.tar.gz \
	http://mirrors.kernel.org/gnu/mpfr/mpfr-3.1.6.tar.gz \
	http://mirrors.kernel.org/gnu/mpc/mpc-1.0.3.tar.gz \
	https://gcc.gnu.org/pub/gcc/infrastructure/isl-0.11.1.tar.bz2 \
	https://gcc.gnu.org/pub/gcc/infrastructure/cloog-0.18.1.tar.gz \
	ftp://ftp.cs.unipr.it/pub/ppl/releases/0.12.1/ppl-0.12.1.tar.xz \
	http://mirrors.kernel.org/gnu/binutils/binutils-2.24.tar.bz2 \
	http://mirrors.kernel.org/gnu/gcc/gcc-4.7.4/gcc-4.7.4.tar.bz2 \
	ftp://xmlsoft.org/libxml2/libxml2-2.9.7.tar.gz \
	ftp://xmlsoft.org/libxml2/libxslt-1.1.32.tar.gz \
	http://mirrors.kernel.org/gnu/gawk/gawk-3.1.8.tar.gz \
	http://mirrors.kernel.org/gnu/emacs/emacs-23.4.tar.bz2 \
	http://www.cpan.org/src/5.0/perl-5.26.1.tar.gz \
	http://mirrors.kernel.org/gnu/texinfo/texinfo-6.5.tar.xz \
	http://mirrors.kernel.org/gnu/m4/m4-1.4.18.tar.xz \
	ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
	https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz \
	http://mirrors.kernel.org/gnu/help2man/help2man-1.47.6.tar.xz \
	http://search.cpan.org/CPAN/authors/id/P/PV/PVANDRY/gettext-1.07.tar.gz \
	http://mirrors.kernel.org/gnu/grep/grep-3.1.tar.xz \
	ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre2-10.31.tar.bz2 \
	http://download.icu-project.org/files/icu4c/59.1/icu4c-59_1-src.tgz \
	http://mirrors.kernel.org/gnu/readline/readline-7.0.tar.gz \
	http://mirrors.kernel.org/gnu/ncurses/ncurses-6.1.tar.gz \
	ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.bz2 \
	https://www.openssl.org/source/openssl-1.0.2n.tar.gz \
	https://curl.haxx.se/download/curl-7.58.0.tar.xz \
	https://cmake.org/files/v3.7/cmake-3.7.2.tar.gz \
	http://http.debian.net/debian/pool/main/d/dpkg/dpkg_1.19.0.5.tar.xz \
	https://www.libarchive.org/downloads/libarchive-3.3.2.tar.gz \
	https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2 \
	http://mirrors.kernel.org/gnu/coreutils/coreutils-8.29.tar.xz \
	http://mirrors.kernel.org/gnu/bison/bison-3.0.4.tar.xz \
	http://mirrors.kernel.org/gnu/libsigsegv/libsigsegv-2.9.tar.gz \
	http://mirrors.kernel.org/gnu/diffutils/diffutils-3.6.tar.xz \
	http://mirrors.kernel.org/gnu/findutils/findutils-4.6.0.tar.gz \
	http://mirrors.kernel.org/gnu/bash/bash-4.4.18.tar.gz \
	http://mirrors.kernel.org/gnu/autoconf/autoconf-2.69.tar.xz \
	http://mirrors.kernel.org/gnu/automake/automake-1.16.tar.xz \
	ftp://ftp.astron.com/pub/file/file-5.32.tar.gz \
	http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-2.30.tar.gz \
	http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Archive-Zip-1.60.tar.gz \
	http://search.cpan.org/CPAN/authors/id/G/GF/GFRANKS/Test-MockModule-0.13.tar.gz \
	http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-0.4224.tar.gz \
	http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/inc-latest-0.500.tar.gz \
	http://search.cpan.org/CPAN/authors/id/C/CH/CHROMATIC/SUPER-1.20141117.tar.gz \
	http://search.cpan.org/CPAN/authors/id/R/RG/RGARCIA/Sub-Identify-0.14.tar.gz \
	http://search.cpan.org/CPAN/authors/id/P/PI/PIXEL/Archive-Cpio-0.10.tar.gz \
	http://http.debian.net/debian/pool/main/s/strip-nondeterminism/strip-nondeterminism_0.040.orig.tar.bz2 \
	http://http.debian.net/debian/pool/main/d/debhelper/debhelper_11.1.5.tar.xz \
	https://distfiles.macports.org/po4a/po4a-0.52.tar.gz \
	http://search.cpan.org/CPAN/authors/id/J/JS/JSTOWE/TermReadKey-2.37.tar.gz \
	http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Unicode-LineBreak-2017.004.tar.gz \
	http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-Simple-1.302133.tar.gz \
	http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/MIME-Charset-1.012.2.tar.gz \
	http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Encode-EUCJPASCII-0.03.tar.gz \
	http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Encode-JISX0213-0.04.tar.gz
