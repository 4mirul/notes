# [WIP] Introduction to Linux - edx

[Linux Distributions Timeline](https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg)

---

## Linux Terminology

### Kernel

Connect the application to the hardware
Example: Linux Kernel

### Distribution/Distro

Collection of applicatons making up the OS
Example: RHEL, Fedora, Ubuntu, Arch

### Boot loader

Program that boot the OS
Example: GRUB, ISOLINUX

### Service

Program that runs as a background process
Example: httpd, nfsd, ntpd, ftpd, named, dhcpd

### Filesystem

Method storing and organizing files
Example: ext3, ext4, FAT, XFS, NTFS, Btrfs

### X Window System

Graphical subsystem

### Desktop Environment

Graphical user interface on top of the OS
Example: GNOME, KDE, Xfce, LXDE, Mate

### Command Line

Interface for typing commands on top of the OS

### Shell

Command line interpreter that interprets the command line input and instructs the OS to perform any tasks or commands
Example: Bash, tcsh, zsh

---

## Linux Basics and System Startup

## The boot process

![The Boot Process](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/b30efa6aaec0745af052a4507f062340/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/chapter03_flowchart_scr15_1.jpg)

### BIOS(Basic Input/Output System)

Initializes the screen and keyboard and test the main memory. This process also called POST(Power On Self Test). POST is a test a computer must complete to verify all hardware is working properly before starting the remainder of the boot process. POST checks RAM, hard drive, CDROM, keyboard, etc. Make sure all working properly.

BIOS software stored in motherboard. Remainder of the boot process is controlled by the OS.
Originally, stored in motherboard. In modern computer systems, stored in flash memory so it can be rewritten without removing the chip from mobo. Easy to updates the BIOS firmware, but creates possibility for the computer to become infected with BIOS rootkits. BIOS upgrade that fails can brick the mobo permanently, unless the system includes some form or backups.

Most OSs do not use the BIOS after loading, instead accessing the hardware components directly.

UEFI replaces the BIOS. UEFI firmware implementations providing legacy support for BIOS services.
UEFI can support remote diagnostics and repair of computers, even with no OS installed.

![BIOS](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/f02a193180acffca543bf8f69870cc79/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen16.jpg)

### Master Boot Record (MBR) and Boot Loader

POST completed, system control passes from the BIOS to the boot loader. Boot loaded stored on one of the hard disk, either in the boot sector(for traditional BIOS/MBR systems) or the EFI partition( for more recent EFI/UEFI systems). The machine does not access any storage. Then, information on date, time, and the most important peripherals are loaded from CMOS.

GRUB, ISOLINUX, DAS U-Boot. When booting Linux, boot loader is responsible for loading the kernel image and initial RAM disk or filesystem into the memory.

![Master Boot Record](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/b053b7b69e99a0c06ef0da7fd84236d7/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen20.jpg)

### Boot Loader

Boot loader has 2 stages.

First. For BIOS/MBR method, boot loader resides at the first sector of the hard disk, also known as the MBR. Size MBR is 512 bytes. In this stage, boot loader examines partition table and find bootable partition. Once it finds a bootable partition, then searches for the second stage boot loader, example GRUB, and loads it into RAM. For EFI/UEFI method, UEFI firmware reads its Boot Manager data to determine which UEFI application is to be launched from from where. The firmware then launches the UEFI application, example GRUB as defined in boot entry in firmware's boot manager.

Second. Resides under `/boot`. Splash screen displayed, allow us to choose OS to boot. After select OS, the boot loader loads kernel of the OS into RAM and passes control to it. Kernel always almost compressed , so its first job is to uncompress itself. Then, it will check and analyze the system hardware and initialize any hardware device drivers built into the kernel.

![Boot Loader](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/abd1fcc0cc9a6fe48d886efdd98711ef/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen18.jpg)

### Initial RAM disk

Initramfs filesystem image contains programs and binary files that perform all actions needed to mount the proper root filesystem, like providing kernel functionality for the needed filesystem and device drivers for mass storage controllers with a facility called udev, which responsible for figuring out which devices are present, locating device drivers they need to operate properly and loading them. After root filesystem has been found, it is checked for errors and mounted.

Mount program instructs the operating system that a filesystem is ready for use, and associates it with a particular point in the overall hierarchy of the filesystem(mount point). If successful, the initramfs is cleared from RAM and the init program on the root filesystem `/sbin/init` is executed.

Init handles the mounting and pivoting over to the final root filesystem. If special hardware drivers are needed before the mass storage can be accessed, they must be in the initramfs image.

![The Initial RAM Disk](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/13f8548b13ebe15a19aa1a6c3964fceb/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen22.jpg)

### Text-Mode Login

End of the boot process, init starts a number of text-mode login prompts. If running GUI, will not see these.

Can access command shells using alt key + functions key. Most distros start six text terminals and one GUI terminal F1 or F2. In GUI, CTRL + ALT + (F2 to F7) for text console.

Usually default command shell is bash. Shell prints a text prompt indicating it is ready to accept commands.

![Text-Mode Logins](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/e35bea5a8c6b9a41453a0e01c5ca3077/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen26.jpg)

## Kernel, init and Services

### Linux Kernel

Boot loader loads kernel and initramfs into memory, so it can be used directly by the kernel.

When kernel loaded in RAM, it immediately initialize and configure the computer's memory, also configures all the hardware attached to the system. Includes all processors, I/O subsystems, storage devices, etc.. Kernel also loads some necessary user space applications.

![Linux Kernel](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/b953394cd3145a1bd239673dc5c5a5b7/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen21.jpg)

### `/sbin/init` and Services

![/sbin/init and Services](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/640a31713f9fded06718cb06c468f685/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen24.jpg)

Once kernel has set up all its hardware and mounted root filesystem, kernel runs `/sbin/init`. This becomes initial process, which then starts other processes to get the system running. Most other processes on the system trace their origin ultimately to init; exceptions include the so called kernel processes. These are started by the kernel directly, and their job is to manage internal OS details.

Also, init responsible keeping the system running and shut down cleanly. One of its responsibilities is to act when necessary as a manager for all non-kernel processes; it cleans up after them upon completion, and restarts user login services as needed when users log in and out, and does the same for other background system services.

Traditionally is System V. This serial process has the system passing through a sequence of runlevels containing collections of scripts that start and stop services. Each runlevel supports a different mode of running the system. Within each runlevel, individual services can be set to run, or to be shut down if running.

All major distros moved away from this sequential runlevel method of system initialization.

### Startup Alternatives

SysVinit is old method. Two main alternatives developed to replace SysVinit.

- Upstart
  - Developed by Ubuntu and first included in 2006
  - Adopted in Fedora 9 (in 2008) and in RHEL 6 and its clones
- systemd
  - Adopted by Fedora first (in 2011)
  - Adopted by RHEL 7 and SUSE
  - Replaced Upstart in Ubuntu 16.04

### systemd Features

System with systemd start up faster than those with earlier init methods. Because it replaces a serialized set of steps with aggressive parallelization techniques, which permits multiple services to be initiated simultaneously.

Complicated startup shell scripts are replaces with simpler configuration files, which enumerate what has to be done before a service is started, how to execute service startup, and what conditions the service should indicate have been accomplished when startup is finished. `/sbin/init` now just points to `/lib/systemd/systemd`; i.e. systemd takes over the init process.

One most used command is `systemctl` for basic tasks.

- Starting, stopping, restarting a service (nfs as an example) on a currently running system:
  - `sudo systemctl start|stop|restart nfs.service`
- Enabling or disabling a system service from starting up at system boot:
  - `sudo systemctl enable|disable nfs.service`

In most cases, `.service` can be omitted.

## Linux Filesystems Basics

### Linux Filesystems

- Different types of filesystems supported by Linux:
  - Conventional dis filesystems: ext2, ext3, ext4, XFS, Btrfs, JFS, NTFS, etc.
  - Flash storage filesystems: ubifs, JFFS2, YAFFS, etc.
  - Database filesystems
  - Special purpose filesystems: procfs, sysfs, tmpfs, squashfs, debugfs, etc.

### Partitions and Filesystems

A partition is a physically contiguous section of a disk.

A filesystem is a method of storing/finding files on a hard disk/usually in a partition.

A partition as a container in which a filesystem resides, although in some circumstances, a filesystem can span more than one partition if one uses symbolic links.

Comparison between filesystems in Windows and Linux.

|                                  | Windows     | Linux                   |
| -------------------------------- | ----------- | ----------------------- |
| Partition                        | Disk1       | `/dev/sda1`             |
| Filesystem Type                  | NTFS/VFAT   | EXT3/EXT4/XFS/BTRFS.... |
| Mounting Parameters              | DriveLetter | MountPoint              |
| Base Folder (where OS is stored) | C:\         | /                       |

### The filesystem Hierarchy Standard

Linux systems store their important files according to a standard layout called the Filesystem Hierarchy Standard (FHS), maintained by The Linux Foundation. For more information, [Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf) created by LSB Workgroup. This standard is designed to ensure that users, administrators, and developers can move between distributions without having to re-learn how the system is organized.

Linux uses the '/' character to separate paths, Windows uses '\', and Linux does not have drive letters. Multiple drives and/or partitions are mounted as directories in the single filesystem. Removable media such as USB drives and CDs and DVDs will show up as mounted at `/run/media/yourusername/disklabel` for recent Linux systems, or under `/media` for older distros.

![The Filesystem Hierarchy Standard] (<https://prod-edxapp.edx-cdn.org/assets/courseware/v1/66def40e2774fd96011565107706da2d/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/dirtree.jpg>)

### More About the Filesystem Hierarchy Standard

All Linux filesystem names are case-sensitive, so `/boot`, `/Boot`, and `/BOOT` represent three different directories or folders. Many distros distinguish between core utilities needed for proper system operation s and other programs, and place the latter in directories under `/usr` (think user).

## Linux Distributions Installation

### Choosing a Linux Distribution

[LWN Distributions List](https://lwn.net/Distributions/)

![Choosing Linux Distribution](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/6eafa3b1170a0c208335ea46ac16945d/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/distros.png)

### Questions to Ask When Choosing a Distribution

- What is the main function of the system (server or desktop)?
- What types of packages are important to the organization? Example, web server, word processing, etc.
- How much hard disk is required and how much is available?
- How often are packages updated?
- How long is the support cycle for each release?
- Do you need kernel customization from the vendor or a third party?
- What hardware are you running on? Example, it might be X86, ARM, PPC, etc.
- Do you need long-tern stability?

### Linux Installation: Planning

Partition layout needs to be decided at the time of installation; it can be difficult to change later.

![Partitions in the Linux Hard Disk](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/ae8955c30e5b10b2fd1cab2c79673555/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen_34.jpg)

### Linux Installation: Software Choices

All installations include the bare minimum software for running a Linux distribution.

![Linux Installation Software Choices](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/10f3cbf30f540761b32e02764de07e5c/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen_35.jpg)

### Linux Installation: Install Source

Linux distros are provided on removable media such as USB drives and CDs or DVDs. Most Linux distros also support booting a small image and downloading the rest of the system over the network.

Many installers can do an installation completely automatically, using a configuration file to specify installation options. This file is called a Kickstart file for Red Hat-based systems, an AutoYAST profile for SUSE-based systems, and a Preseed file for Debian-based systems.

### Linux Installation: The Process

After booting installation media, the installer starts and asks questions about how the system should be set up. This skipped if an automatic installation file is provided.

### Linux Installation: The Warning

- Methods installation
  - Re-partitioning your hard disk to free up enough room to permit dual boot (side-by-side) installation of Linux, along with your present OS.
  - Using host machine hypervisor program (VMWare / Virtualbox)
  - Booting off of and using a Live CD or USB stick

[Preparing your computer for LFS101x.2](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/3fa6f8f7a7482a6344efeb7dd0d5bdf0/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/Preparing_Your_Computer_for_LFS101x.pdf)

---

## Graphical Interface

### Graphical Desktop

Linux can be GUI or CLI. For CLI, must remember which programs and commands.

### X Window System

Generally, in Linux system, X Window System is loaded as one of the final steps in the boot process.

A service called display manager keeps track of the displays being provided and loads the X server (so-called). DM also handles graphical logins and starts the appropriate desktop environment after a user logs in.

X Window System is rather old system; has certain deficiencies on modern systems (example, with security), as it has been stretched rather far from its original purposes. A newer system, known as Wayland, is gradually superseding it and was adopted as the default display system in Fedora 25.

![Display Manager](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/44717c86868ff7e9edc71c5747bb84ab/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen28.jpg)

A desktop environment consists of a session manager, which starts and maintains the components of the graphical session, and the window manager, which controls the placement and movement of windows, window title-bars, and controls.

These can be mixed, generally a set of utilities, session manager, and window manager are are used together as a unit, and together provide seamless de.

If dm is not started by default in the default runlevel, you can start X a different way, in text mode type `startx`. or start the display manager (gdm, lightdm, kdm, xdm, etc.) manually from command line.

![Desktop Environment](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/c4a2925d0a2d22c238c9f1d91f71635b/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch03_screen29.jpg)

### Gui Startup

X display manager starts at the end of the boot. Responsible for the graphic system, logging in the user starting de. Default dm for Gnome is gdm. kdm is for old KDE.

### Basic Operations

### File Manager

### Home Directories

### Viewing Files

## System Configuration from the Graphical Interface

### Screen Resolution

`xdpyinfo | grep dim`

### Installing and Updating Software

Package often depend on each other. For example, because Firefox can communicate using SSL/TLS, it will depend on a package which provides the ability to encrypt and decrypt SSL and TLS communication, and will not install unless that package is also installed at the same time.

One utility handles the low-levels details of unpacking a package and putting the pieces in the right places. Most of the time, you will be working with a higher-level utility which knows how to download packages from the internet and can manage dependencies and groups for you.

### Debian Packaging

**dpkg** is the underlying package manager for Debian. It can install, remove, and build packages. Unlike higher-level package management systems, it does not automatically download and install packages and satisfy their dependencies.

**apt** (Advanced Package Tool) is the higher-level package management system for Debian-based systems.

Generally, while each distribution within the Debian family uses apt, it creates its own user interface on top of it (for example, apt-get, aptitude, synaptic, Ubuntu Software Center, Update Manager, etc).

![Package Management in the Debian Family System](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/c3ddb34d7f243624f888143c74665a94/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch05_screen34.jpg)

### Red Hat Package Manager (RPM)

Developed by Red Hat, and adopted by a number of other distributions, including openSUSE, Mandriva, CentOS, Oracle Linux, others.

The high-level package manager differs between distributions: Red Hat family distributions have historically used the repository format used by **yum** (Yellowdog Updater, Modified), although recent Fedora uses a replacement, dnf, still using the same format. SUSE family distributions also use RPM, but the **zypper** interface. The GNOME also uses **PackageKit** as a unified interface.

![Red Hat Package Manager](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/d803cf81ee0659af701365b16aebcb3a/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch05_screen35.jpg)

### openSUSE's YaST Software Management

RPM-based application.

![openSUSE's Software Management](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/3daba44866ca7ac7880f9eb6e74bc467/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch05_screen36.jpg)

## Command Line Operations

### Command-Line Mode Options

### Introduction to the command line

GUI make easy tasks easier, command line make difficult tasks possible

Command line advantages:

- No GUI
- every task can be accomplished using command line
- can implement scripts for often-used tasks and series of procedures
- can sign into remote machines anywhere on the internet
- can run any apps using command line
- GUI vary among Linux distributions, command line does not.

### Basic Operations

![Basic Operations](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/678d889dcb1112024ef10815f9210a07/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch06_screen11.jpg)

### Rebooting and Shutting Down

`halt/poweroff` commands issue `shutdown -h` to halt the system

`reboot` issues `shutdown -r`

shutdown with msg and time; `sudo shutdown -h 10:00 "test shutdown"`

### Locating Applications

In general, executable programs and scripts should live in the **/bin**, **/usr/bin**, **/sbin**, **/usr/sbin** or **/opt**. Can also in **/usr/local/bin** and **/usr/local/sbin** or in user's space, **/home/yuu/bin**.

To locate it use `which`. if `which` cannot locate it, use `whereis`

![example](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/716532f91059bd5a66899f8ef6e07c31/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/whereis.png)

### Accessing Directories

Default directories should be Home directory. `echo $HOME` will print the exact path.

`pwd` = Display the present working directory

`cd ~` or `cd` = Change to home directory

`cd ..` = Change to parent directory

`cd -` = Change to previous directory

### Understanding Absolute and Relative Paths

Absolute pathname: begin with the root directory and follows the tree. start with `/`

Relative pathname: never start with `/`. start from present working directory.

Multiple slashes(/) between directories and files are allowed. But only one slash.

`////usr//bin` = `/usr/bin`

`.` = present directory

`..` = parent directory

`~` = home directory

Example:-

Absolute pathname method = `cd /usr/bin`

Relative pathname method = `cd ../../usr/bin`

![Understanding Absolute and Relative paths](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/c9a79bc0bfc23d476b1c89380ca90aad/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/LFS01_ch06_screen19.jpg)

### Exploring the Filesystem

`tree` command can check the directories and files. `man tree` for more information.

`cd /` change current directory to root directory.

`ls` list the content on current directory.

`ls -a` list the content on current directory including hidden files and directories.

### Hard Links

`ln` utility used to create hard links.
`ln -s` used to create soft links/symbolic links/symlinks.

Example:-

`ln file1 file2`

`ls -li` = **-i** option is for `ls` to print the inode number. For this, both file showing the same inode number, both files actually same thing but different name.

![Hard Links](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/aefe6c7fa6a198680e110ceae5c95c11/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/lnubuntu.png)

### Soft (Symbolic) Links

Example:-

`ln -s file1 file3`

Symbolic links take no extra space on the filesystem. can be modified to point to different places. easy way to create shortcut. Soft links can point to objects on different filesystems, partitions, and/or disks and other media, which may or may not be available. dangling link, if link to the unavailable object.

![Soft Links](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/cea407ef8cfd36b34ede2a154959a98f/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/lnsubuntu.png)

### Navigating the Directory History

`pushd .` to save current directory to the stack. `popd` to change directory to the last entry in the stack. `dirs` to list all directories in the stack.

![Navigating Through Directory History](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/8cda89b4595a6b8dde4ba73674b88261/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/pushdcentos.png)

### Working with files

Linux provides commands that help to renaming, removing, moving, create file, create empty file, create folder, changing timestamps, viewing files.

### Viewing files

`cat` = for viewing files but it does not provide any scroll-back

`tac` = for viewing files backwards, starting with the last line. does not provide any scroll-back.

`less` = has paging program to view larger files. provide scroll-back capabilities and search and navigate the file. press h to check the help page.

`tail` = print last 10(default) lines of the file. `tail -n 15` or `tail -15` for the 15 lines

`head` = print first 10(default) lines of the file.`head -n 15` or `head -15` for the 15 lines

### touch

touch often used to set or update the access, change, and modify times of files. Can create empty file with `touch` .

`touch` with option **-t** can set the time.

`touch -t 201912311200 testfile` = the time for this file is December 31, 2019 12:00

![touch](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/d29a554d4187aae729d4ed40e42a0146/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/touch.png)

### mkdir and rmdir

`mkdir` is used to create a directory.

`mkdir newdir`

`mkdir /usr/newdir`

Removing empty dir using `rmdir`.

to remove all files inside the target dir, use `rm -rf`.

![mkdir](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/72f578cd278d2bd6bd48d63efbfe589e/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/mkdir.png)

### Moving, Renaming or Removing a File

`mv` command can move and rename the file.

| Command   | Usage                       |
| --------- | --------------------------- |
| **mv**    | Rename a file               |
| **rm**    | Remove a file               |
| **rm -f** | Forcefully remove a file    |
| **rm -i** | Interactively remove a file |

### Renaming or Removing a Directory

`rmdir` only works on empty directories.

`rm -rf` fast to remove directories and its tree.

| Command    | Usage                                     |
| ---------- | ----------------------------------------- |
| **mv**     | Rename a directory                        |
| **rmdir**  | Remove an empty directory                 |
| **rm -rf** | Forcefully remove a directory recursively |

### Modifying the Command Line Prompt

**PS1** variable is the character string that is displayed as the prompt on the command line.

```.bashrc
echo $PS1
\$
PS1="\u@\h \$ "
coop@quad64 $ echo $PS1
\u@\h \$
coop@quad64 $
```

### Searching for Files

### Standard File Streams

When commands are executed, by default there are three standard file streams(or descriptors) always open for use: standard input(standard in or stdin), standard output(standard out or stdout) and standard error(or stderr).

| Name            | Symbolic Name | Value | Example  |
| --------------- | ------------- | ----- | -------- |
| standard input  | **stdin**     | 0     | keyboard |
| standard output | **stdout**    | 1     | terminal |
| standard error  | **stderr**    | 2     | log file |

Usually, stdin is your keyboard, and stdout and stderr are printed on your terminal. Stderr is often redirected to an error logging file, while stdin is supplied by directing input to come from a file or from the output of a previous command through a pipe. Stdout is also often redirected into a file. Since stderr is where error messages are written, usually nothing will go there.

In Linux, all open files are represented internally by what are called file descriptors. Simply put, these are represented by numbers starting at zero. stdin is file descriptor 0, stdout is file descriptor 1, and stderr is file descriptor 2. Typically, if other files are opened in addition to these three, which are opened by default, they will start at file descriptor 3 and increase from there.

### I/O Redirection

through command shell, we can redirect the three standard file streams so that we can get input from either a file or another command, instead of from our keyboard, and we can write out and errors to files or use them to provide input for subsequent commands.

for example, if we have a program called **do_something** that reads from stdin and writes to stdout and stderr, we can change its input source by using the less-than sign (<) followed by the name of the file to be consumed for input data:

`do_something < input-file`

if you want to send the output to a file, use the greater-than sign (>) as in:

`do_something > output-file`

because stderr is not the same as stdout, error messages will still be seen on the terminal windows in the above example.

if you want to redirect stderr to a separate file, you use stderr's file descriptor number(2), the greater-than sign (>), followed by the name of the file you want to hold everything the running command writes to stderr:

`do_something 2> error-file`

_Note: by the same logic, `do_something 1> output-file` is the same as `do_something > output-file`_

a special shorthand notation can send anything written to file descriptor 2 (stderr) to the same place as file descriptor 1 (stdout): 2>&1.

`do_something > all-output-file 2>&1`

bash permits an easier syntax for the above:

`do_something >& all-output-file`

### Pipes

unix/linux philosophy is to have many simple and short programs (or commands) cooperate together to produce quite complex results, rather that have one complex program with many possible options and modes of operation. in order to accomplish this, extensive use of pipes is made. you can pipe the output of one command or program into another as its input.

in order to do this, we use the vertical-bar, |, (pipe symbol) between commands as in:

`command1 | command2 | command3`

the above represents what we often call a pipeline, and allows Linux to combine the actions of several commands into one. This is extraordinarily efficient because **command2** and command3\*\* do not have to wait for the previous pipeline commands to complete before they can begin hacking at the data in their input streams; on multiple CPU or core system, the available computing power is much better utilized and things get done quicker.

furthermore, there is no need to save output in (temporary) files between the stages in the pipeline, which saves disk space and reduces reading and writing from disk, which is often the slowest bottleneck in getting something done.

![Pipeline](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/50bdd18ba2e7d4343c184f5e0e3e058a/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/pipeline.png)

### searching for files

main tools for doing the search are the `locate` and `find` utilities.

### locate

the **locate** utility program performs a search taking advantage of a previously constructed database of files and directories on your system, matching all entries that contain a specified character string. this can sometimes result in a very long list.

to get shorter and possibly more relevant list, we can use the **grep** program as a filter. **grep** will print only the lines that contain one or more specified strings, as in:

`locate zip | grep bin`

which will list all the files and directories with both **zip** and **bin** in their name.

**locate** utilizes a database created by a related utility, **updatedb**. most linux systems run this automatically once a day. however, you can update it at any time by just running **updatedb** from the command line as the root user.

![locate](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/db04248c7965e78a927a0fa8a42fc703/asset-v1:LinuxFoundationX+LFS101x+3T2018+type@asset+block/locatesuse.png)

### Wildcards and Matching File Names

| Wildcard   | Result                                                                                                                          |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **?**      | Matches any single character                                                                                                    |
| **\***     | Matches any string of characters                                                                                                |
| **[set]**  | Matches any character in the set of characters, for example **[adf]** will match any occurrence of **"a"**, **"d"**, or **"f"** |
| **[!set]** | Matches any character not in the set of characters                                                                              |
