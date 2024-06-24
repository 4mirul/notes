# [WIP] How Linux Works, 3rd Edition by Brian Ward

## Chapter 5: How the Linux Kernel Boots

Boot process:

1. Machine's BIOS or boot firmware loads and runs a boot loader
2. Boot loader finds the kernel image on disk, loads it into memory, and starts it
3. Kernel initializes the devices and its drivers
4. Kernel mounts the root filesystem
5. Kernel starts a program called `init` with process ID of 1. This point is the `user space start`
6. Init sets the rest of the system processes in motion
7. At some point, init starts a process allowing you to log in, usually at the end or near the end of the boot sequence

### Startup messages

View kernel's boot and runtime diagnostic messages using `journalctl`, `journalctl -k` messages from the current boot, `journalctl -b` messages from the current boot.

If no `systemd`, can check for a logfile such as `/var/log/kern.log` or run `dmesg` command to view messages in the `kernel ring buffer`.

Startup scripts are designed to send messages to the console that are erased after the boot process finishes. However, `systemd` captures diagnostic messsages from startup and runtime that would normally go to the console.

### Kernel initialization and boot options

Linux kernel initializes in general order:

1. CPU inspection
2. Memory inspection
3. Device bus discovery
4. Device discovery
5. Auxiliary kernel subsystem setup (networking and the like)
6. Root filesystem mount
7. User space start

### Kernel parameters

Linux kernel starts with a set of text-based `kernel parameters` containing a few additional system details.

View the parameters passed to system currently running kernel by looking at the `/proc/cmdline`.

Many parameters are unimportant, but one that is critical is the `root` parameter. This is the location of the root filesystem.

`ro` parameter instructs the kernel to mount root filesystem in read-only mode upon user space start. This to ensures that `fsck` can check the root filesystem before anything. Then, bootup process remounts the root filesystem in read-write mode.

Upon encountering a parameter that it doesn't understand, the linux kernel saves that parameter, later passes the parameter to init when performing the user space start.

`man bootparam` for more information about basic boot parameters.

For specific, `kernel-params.txt` a reference file that comes with the Linux kernel

#### Commonly used kernel parameters

These parameters are typically passed through the bootloader configuration (like GRUB) in `/etc/default/grub` (or the configuration file specific to your bootloader) or by editing bootloader entries during the boot process. The actual list and availability of parameters can vary depending on the kernel version and specific distribution of Linux being used.

1. **Root Filesystem Parameters:**
   - `root=<device>`: Specifies the root filesystem. For example, `root=/dev/sda1` `root=UUID=17f12d53-c3d7-4ab3-943e-a0a72366c9fa`.
   - `ro`: Mounts the root filesystem as read-only.

2. **Boot Parameters:**
   - `quiet`: Suppresses most boot messages.
   - `splash`: Shows a graphical splash screen during boot (if supported).
   - `nomodeset`: Disables kernel mode setting (KMS) for graphical boot.

3. **Debugging and Logging Parameters:**
   - `debug`: Enables debugging information.
   - `loglevel=<level>`: Sets the kernel log level (0-7, higher numbers display more messages).

4. **Hardware and Architecture Parameters:**
   - `acpi=<off | strict | ...>`: Controls Advanced Configuration and Power Interface (ACPI) behavior.
   - `noapic`: Disables the Advanced Programmable Interrupt Controller (APIC).
   - `nolapic`: Disables the local APIC.

5. **Kernel Behavior Parameters:**
   - `init=<path>`: Specifies the initial userspace program. For example, `init=/bin/bash`.
   - `panic=<seconds>`: Sets the time (in seconds) before a kernel panic occurs.

6. **Memory Parameters:**
   - `mem=<amount>[K | M | G]`: Limits the amount of memory usable by the system.
   - `memmap=<exactmap | topdown | bottomup>[size]`: Defines a memory map for specific addresses.

7. **Processor and CPU Parameters:**
   - `noexec`: Disables CPU execution protection.
   - `maxcpus=<number>`: Limits the maximum number of CPUs used by the kernel.

8. **Network Parameters:**
   - `ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>`: Sets network configuration during boot (used in diskless systems).

9. **Security Parameters:**
   - `selinux=<0 | 1>`: Enables or disables SELinux (Security-Enhanced Linux).
   - `apparmor=<0 | 1>`: Enables or disables AppArmor security module.

### Boot loaders

**Skip**

## Chapter 6: How User Space Starts

