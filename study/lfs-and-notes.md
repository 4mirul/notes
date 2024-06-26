# Linux From Scratch and Notes

[Linux From Scratch](https://www.linuxfromscratch.org/)

## Prerequisites

[Install Software from Source Code](https://itsfoss.com/install-software-from-source-code/)

[Building and Installing Software Packages for Linux](https://tldp.org/HOWTO/Software-Building-HOWTO.html)

[Beginner's Guide to Installing from Source](https://moi.vonos.net/linux/beginners-installing-from-source/)

## LFS and Standards

[POSIX.1-2008.](https://pubs.opengroup.org/onlinepubs/9699919799/)

[Filesystem Hierarchy Standard (FHS) Version 3.0](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)

[Linux Standard Base (LSB) Version 5.0 (2015)](https://refspecs.linuxfoundation.org/lsb.shtml) 

## Rationale for Packages in the Book 

- Acl: This package contains utilities to administer Access Control Lists, which are used to define fine-grained discretionary access rights for files and directories.

- Attr: This package contains programs for managing extended attributes on file system objects.

- Autoconf: This package supplies programs for producing shell scripts that can automatically configure source code from a developer's template. It is often needed to rebuild a package after the build procedure has been updated.

- Automake: This package contains programs for generating Make files from a template. It is often needed to rebuild a package after the build procedure has been updated.

- Bash: This package satisfies an LSB core requirement to provide a Bourne Shell interface to the system. It was chosen over other shell packages because of its common usage and extensive capabilities.

- Bc: This package provides an arbitrary precision numeric processing language. It satisfies a requirement for building the Linux kernel.

- Binutils: This package supplies a linker, an assembler, and other tools for handling object files. The programs in this package are needed to compile most of the packages in an LFS system.

- Bison: This package contains the GNU version of yacc (Yet Another Compiler Compiler) needed to build several of the LFS programs.

- Bzip2: This package contains programs for compressing and decompressing files. It is required to decompress many LFS packages.

- Check: This package provides a test harness for other programs.

- Coreutils: This package contains a number of essential programs for viewing and manipulating files and directories. These programs are needed for command line file management, and are necessary for the installation procedures of every package in LFS.

- DejaGNU: This package supplies a framework for testing other programs.

- Diffutils: This package contains programs that show the differences between files or directories. These programs can be used to create patches, and are also used in many packages' build procedures.

- E2fsprogs: This package supplies utilities for handling the ext2, ext3 and ext4 file systems. These are the most common and thoroughly tested file systems that Linux supports.

- Expat: This package yields a relatively small XML parsing library. It is required by the XML::Parser Perl module.

- Expect: This package contains a program for carrying out scripted dialogues with other interactive programs. It is commonly used for testing other packages.

- File: This package contains a utility for determining the type of a given file or files. A few packages need it in their build scripts.

- Findutils: This package provides programs to find files in a file system. It is used in many packages' build scripts.

- Flex: This package contains a utility for generating programs that recognize patterns in text. It is the GNU version of the lex (lexical analyzer) program. It is required to build several LFS packages.

- Gawk: This package supplies programs for manipulating text files. It is the GNU version of awk (Aho-Weinberg-Kernighan). It is used in many other packages' build scripts.

- GCC: This is the Gnu Compiler Collection. It contains the C and C++ compilers as well as several others not built by LFS.

- GDBM: This package contains the GNU Database Manager library. It is used by one other LFS package, Man-DB.

- Gettext: This package provides utilities and libraries for the internationalization and localization of many packages.

- Glibc: This package contains the main C library. Linux programs will not run without it.

- GMP: This package supplies math libraries that provide useful functions for arbitrary precision arithmetic. It is needed to build GCC.

- Gperf: This package produces a program that generates a perfect hash function from a set of keys. It is required by Udev.

- Grep: This package contains programs for searching through files. These programs are used by most packages' build scripts.

- Groff: This package contributes programs for processing and formatting text. One important function of these programs is to format man pages.

- GRUB: This is the Grand Unified Boot Loader. It is the most flexible of several boot loaders available.

- Gzip: This package contains programs for compressing and decompressing files. It is needed to decompress many packages in LFS.

- Iana-etc: This package provides data for network services and protocols. It is needed to enable proper networking capabilities.

- Inetutils: This package supplies programs for basic network administration.

- Intltool: This package contributes tools for extracting translatable strings from source files.

- IProute2: This package contains programs for basic and advanced IPv4 and IPv6 networking. It was chosen over the other common network tools package (net-tools) for its IPv6 capabilities.

- Kbd: This package produces key-table files, keyboard utilities for non-US keyboards, and a number of console fonts.

- Kmod: This package supplies programs needed to administer Linux kernel modules.

- Less: This package contains a very nice text file viewer that allows scrolling up or down when viewing a file. Many packages use it for paging the output.

- Libcap: This package implements the userspace interfaces to the POSIX 1003.1e capabilities available in Linux kernels.

- Libelf: The elfutils project provides libraries and tools for ELF files and DWARF data. Most utilities in this package are available in other packages, but the library is needed to build the Linux kernel using the default (and most efficient) configuration.

- Libffi: This package implements a portable, high level programming interface to various calling conventions. Some programs may not know at the time of compilation what arguments are to be passed to a function. For instance, an interpreter may be told at run-time about the number and types of arguments used to call a given function. Libffi can be used in such programs to provide a bridge from the interpreter program to compiled code.

- Libpipeline: The Libpipeline package supplies a library for manipulating pipelines of subprocesses in a flexible and convenient way. It is required by the Man-DB package.

- Libtool: This package contains the GNU generic library support script. It wraps the complexity of using shared libraries into a consistent, portable interface. It is needed by the test suites in other LFS packages.

- Libxcrypt: This package provides the libcrypt library needed by various packages (notably, Shadow) for hashing passwords. It replaces the obsolete libcrypt implementation in Glibc.

- Linux Kernel: This package is the Operating System. It is the Linux in the GNU/Linux environment.

- M4: This package provides a general text macro processor useful as a build tool for other programs.

- Make: This package contains a program for directing the building of packages. It is required by almost every package in LFS.

- Man-DB: This package contains programs for finding and viewing man pages. It was chosen instead of the man package because of its superior internationalization capabilities. It supplies the man program.

- Man-pages: This package provides the actual contents of the basic Linux man pages.

- Meson: This package provides a software tool for automating the building of software. The main goal of Meson is to minimize the amount of time that software developers need to spend configuring a build system. It's required to build Systemd, as well as many BLFS packages.

- MPC: This package supplies arithmetic functions for complex numbers. It is required by GCC.

- MPFR: This package contains functions for multiple precision arithmetic. It is required by GCC.

- Ninja: This package furnishes a small build system with a focus on speed. It is designed to have its input files generated by a higher-level build system, and to run builds as fast as possible. This package is required by Meson.

- Ncurses: This package contains libraries for terminal-independent handling of character screens. It is often used to provide cursor control for a menuing system. It is needed by a number of the packages in LFS.

- Openssl: This package provides management tools and libraries relating to cryptography. These supply cryptographic functions to other packages, including the Linux kernel.

- Patch: This package contains a program for modifying or creating files by applying a patch file typically created by the diff program. It is needed by the build procedure for several LFS packages.

- Perl: This package is an interpreter for the runtime language PERL. It is needed for the installation and test suites of several LFS packages.

- Pkgconf: This package contains a program which helps to configure compiler and linker flags for development libraries. The program can be used as a drop-in replacement of pkg-config, which is needed by the building system of many packages. It's maintained more actively and slightly faster than the original Pkg-config package.

- Procps-NG: This package contains programs for monitoring processes. These programs are useful for system administration, and are also used by the LFS Bootscripts.

- Psmisc: This package produces programs for displaying information about running processes. These programs are useful for system administration.

- Python 3: This package provides an interpreted language that has a design philosophy emphasizing code readability.

- Readline: This package is a set of libraries that offer command-line editing and history capabilities. It is used by Bash.

- Sed: This package allows editing of text without opening it in a text editor. It is also needed by many LFS packages' configure scripts.

- Shadow: This package contains programs for handling passwords securely.

- Sysklogd: This package supplies programs for logging system messages, such as those emitted by the kernel or daemon processes when unusual events occur.

- Sysvinit: This package provides the init program, the parent of all the other processes on a running Linux system.

- Udev: This package is a device manager. It dynamically controls the ownership, permissions, names, and symbolic links of device nodes in the /dev directory when devices are added to or removed from the system.

- Tar: This package provides archiving and extraction capabilities of virtually all the packages used in LFS.

- Tcl: This package contains the Tool Command Language used in many test suites.

- Texinfo: This package supplies programs for reading, writing, and converting info pages. It is used in the installation procedures of many LFS packages.

- Util-linux: This package contains miscellaneous utility programs. Among them are utilities for handling file systems, consoles, partitions, and messages.

- Vim: This package provides an editor. It was chosen because of its compatibility with the classic vi editor and its huge number of powerful capabilities. An editor is a very personal choice for many users. Any other editor can be substituted, if you wish.

- Wheel: This package supplies a Python module that is the reference implementation of the Python wheel packaging standard.

- XML::Parser: This package is a Perl module that interfaces with Expat.

- XZ Utils: This package contains programs for compressing and decompressing files. It provides the highest compression generally available and is useful for decompressing packages in XZ or LZMA format.

- Zlib: This package contains compression and decompression routines used by some programs.

- Zstd: This package supplies compression and decompression routines used by some programs. It provides high compression ratios and a very wide range of compression / speed trade-offs.
