# How to Install Arch Linux: A Step-by-Step Guide

Arch Linux is an independently developed, x86-64 general-purpose GNU/Linux distribution that strives to provide the latest stable versions of most software by following a rolling-release model. The default installation is a minimal base system, configured by the user to only add what is purposely required.

In this article, we will go through the process of installing Arch Linux on the system. This guide will provide step-by-step explanation of how to install and set up Arch Linux.

## Prerequisites

- Bootable USB with the Arch Linux installation image.
- Internet connection.
- Back-up of any important data on the system (as this process may overwrite your existing data).
- Basic understanding of the Linux command line.

## Step 1: Create a Bootable USB

1. Download the latest Arch Linux ISO from the official website: https://www.archlinux.org/download/.
2. Create a bootable USB drive using a tool like Rufus, Etcher, or dd.

## Step 3: Set Up Networking

Arch Linux requires a working network connection for installation. By default, the live environment uses dhcpcd (Dynamic Host Configuration Protocol Client Daemon) to automatically configure your network.

Check if your internet is working by running:

```sh
ping -c 10 archlinux.org
```

If you’re using Wi-Fi, you can use `iwctl` to connect to a network:

1. Type `iwctl` to enter the interactive mode.
2. Type `station device scan` to scan for networks.
3. Type `station device connect SSID` (replace `device` with your wireless device name and `SSID` with your Wi-Fi network name).

## Step 4: Update the System Clock

To ensure accurate timekeeping, update the system clock using the following command:

```sh
timedatectl set-ntp true
```

This will synchronize your system clock with internet time servers.

## Step 5: Partition the Disk

Next, you need to partition your disk. For this guide, we’ll assume you’re using a single disk with GPT partitioning.

1. Use `fdisk` or `parted` to create partitions on your disk.

```sh
fdisk -l #view the disk list
fdisk /dev/the_disk_to_be_partitioned #replace the_disk_to_be_partitioned
```

Create a new GPT partition table.
Create at least two partitions: one for EFI (if using UEFI) and one for the Linux filesystem.

### Suggested layout for UEFI with GPT

| Mount point | Partition                 | Partition type        | Suggested size                                                                                 |
| ----------- | ------------------------- | --------------------- | ---------------------------------------------------------------------------------------------- |
| /mnt/boot1  | /dev/efi_system_partition | EFI system partition  | At least 300 MiB. If multiple kernels will be installed, then no less than 1 GiB. (1GB for me) |
| [SWAP]      | /dev/swap_partition       | Linux swap            | More than 512 MiB. (10GB for me)                                                               |
| /mnt        | /dev/root_partition       | Linux x86-64 root (/) | Remainder of the device                                                                        |

Make sure to format the partitions after creating them:

```sh
mkfs.ext4 /dev/root_partition #replace root_partition
mkswap /dev/swap_partition #replace swap_partition
mkfs.fat -F 32 /dev/efi_system_partition #replace efi_system_partition
```

## Step 6: Mount the file systems

Now, mount the partitions to the appropriate directories.

```sh
mount /dev/root_partition /mnt #replace root_partition
mount --mkdir /dev/efi_system_partition /mnt/boot #replace efi_system_partition
swapon /dev/swap_partition #replace swap_partition
```

## Step 7: Install the Base System

Arch Linux has a minimal installation by default, so you’ll need to install the base system using pacstrap:

```sh
pacstrap /mnt base linux linux-firmware
```

This will install the base system, including the Linux kernel and necessary firmware.

## Step 8: Configure the System

After installing the base system, it’s time to configure the system.

Generate fstab (filesystem table):

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

Chroot into the new system:

```sh
arch-chroot /mnt
```

Set the time zone:

Refer [System_time](https://wiki.archlinux.org/title/System_time)

```sh
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
```

Replace Region/City with your appropriate time zone (e.g., America/New_York).

Set the locale: Edit /etc/locale.gen and uncomment your locale (e.g., en_US.UTF-8 UTF-8).

```sh
nano /etc/locale.gen
locale-gen
```

Then set the locale:

```sh
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

Set the hostname:

```sh
echo myhostname > /etc/hostname
```

For LVM, system encryption or RAID, modify mkinitcpio.conf(5) and recreate the initramfs image:

```sh
mkinitcpio -P
```

Set the root password:

```sh
passwd
```

## Step 9: Install Bootloader

For systems with UEFI, you’ll need to install GRUB and configure it:

```sh
pacman -S grub efibootmgr
```

Install the bootloader:

```sh
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB #replace esp, /boot for example
```

Generate the GRUB configuration file:

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

Before reboot, Install `dhcpcd` and enable it

```sh
pacman -S dhcpcd
systemctl enable dhcpcd
```

## Step 10: Reboot and Enjoy Your Arch System

Exit the chroot environment and unmount the partitions:

```sh
exit
umount -R /mnt
```

Reboot your system:

```sh
reboot
```

Remove the installation media (USB stick) and boot into your new Arch Linux system.

## TLDR

```sh
timedatectl set-ntp true
timedatectl set-timezone Asia/Kuala_Lumpur
timedatectl status
timedatect
fdisk -l #view the disk list
fdisk /dev/the_disk_to_be_partitioned #replace the_disk_to_be_partitioned
mkfs.ext4 /dev/root_partition #replace root_partition
mkswap /dev/swap_partition #replace swap_partition
mkfs.fat -F 32 /dev/efi_system_partition #replace efi_system_partition
mount /dev/root_partition /mnt #replace root_partition
mount --mkdir /dev/efi_system_partition /mnt/boot #replace efi_system_partition
swapon /dev/swap_partition #replace swap_partition
pacstrap /mnt base linux linux-firmware vim
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime #replace Region and City
hwclock --systohc
vim /etc/locale.gen #Uncomment `en_US.UTF-8 UTF-8` inside `locale.gen`
locale-gen
vim /etc/locale.conf #Add `LANG=en_US.UTF-8` inside `locale.conf`
vim /etc/hostname #Add *system_name* inside `hostname` file
mkinitcpio -P
passwd
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB #replace esp, /boot for example
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S dhcpcd
systemctl enable dhcpcd
exit
reboot
```