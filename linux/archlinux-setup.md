# [WIP] Archlinux installation guide for myself - Last Updated: 2024-02-20

[Installation guide](https://wiki.archlinux.org/title/Installation_guide)

| Fields                         | Details                                  |
| ------------------------------ | ---------------------------------------- |
| **Arch Linux Version Release** | 2024.01.01                               |
| **CPU**                        | AMD Ryzen 7 5800X                        |
| **GPU**                        | GIGABYTE Radeon RX 6700 XT GAMING OC 12G |
| **Memory (RAM)**               | 16GB                                     |
| **Storage**                    | 256GB                                    |
| **Motherboard**                | MSI MAG B550 TOMAHAWK                    |
| **Network Interface**          | Local Area Network(LAN)                  |
| **Date of Installation**       | 2024-02-19                               |

## Pre-installation

### Update the system clock

Refer [System_time](https://wiki.archlinux.org/title/System_time)

```sh
timedatectl set-ntp true
timedatectl set-timezone Asia/Kuala_Lumpur
timedatectl status
timedatect
```

### Partition the disks

```sh
fdisk -l #view the disk list
fdisk /dev/the_disk_to_be_partitioned #replace the_disk_to_be_partitioned
```

#### Example layout for UEFI with GPT

| Mount point | Partition                 | Partition type        | Suggested size                                                                                 |
| ----------- | ------------------------- | --------------------- | ---------------------------------------------------------------------------------------------- |
| /mnt/boot1  | /dev/efi_system_partition | EFI system partition  | At least 300 MiB. If multiple kernels will be installed, then no less than 1 GiB. (1GB for me) |
| [SWAP]      | /dev/swap_partition       | Linux swap            | More than 512 MiB. (10GB for me)                                                               |
| /mnt        | /dev/root_partition       | Linux x86-64 root (/) | Remainder of the device                                                                        |

### Format the partitions

```sh
mkfs.ext4 /dev/root_partition #replace root_partition
mkswap /dev/swap_partition #replace swap_partition
mkfs.fat -F 32 /dev/efi_system_partition #replace efi_system_partition
```

### Mount the file systems

```sh
mount /dev/root_partition /mnt #replace root_partition
mount --mkdir /dev/efi_system_partition /mnt/boot #replace efi_system_partition
swapon /dev/swap_partition #replace swap_partition
```

## Installation

### Install essential packages

```sh
pacstrap /mnt base linux linux-firmware vim
```

## Configure the system

### Fstab

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

### Chroot

```sh
arch-chroot /mnt
```

### Time zone

Refer [System_time](https://wiki.archlinux.org/title/System_time)

```sh
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime #replace Region and City
hwclock --systohc
```

### Localization

```sh
vim /etc/locale.gen
```

Uncomment `en_US.UTF-8 UTF-8` inside `locale.gen`

```sh
locale-gen
```

```.sh
vim /etc/locale.conf
```

Add `LANG=en_US.UTF-8` inside `locale.conf`

### Network configuration

```sh
vim /etc/hostname
```

Add *system_name* inside `hostname` file

### Initramfs

```sh
mkinitcpio -P
```

### Root password

```sh
passwd
```

## Boot loader

Refer [Arch_boot_process](https://wiki.archlinux.org/title/Arch_boot_process#Boot_loader)

### UEFI systems

```sh
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB #replace esp, /boot for this guide
grub-mkconfig -o /boot/grub/grub.cfg
```

## Before restart

### Install `dhcpcd` and enable it

```sh
pacman -S dhcpcd
systemctl enable dhcpcd
```

## `exit`

## `reboot`

## Post-installation

### Create admin user

Login `root` then run below

```sh
pacman -S sudo
user add -m new_user #replace new_user
passwd new_user
usermod -aG audio,floppy,lp,optical,storage,video,wheel,power new_user #replace new_user
```

```sh
EDITOR=vim visudo
```

Uncomment `%wheel ALL=(ALL:ALL) ALL` in `visudo` and add `new_user ALL=(ALL) NOPASSWD: ALL` if want to enable _new_user_ use `sudo` without password or `%new_group  ALL=(ALL) NOPASSWD:ALL` to allow user in _new_group_ use sudo without password

`exit` then login as `new_user`

### Install `yay`

[yay](https://github.com/Jguer/yay)

```sh
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Install `i3-wm` and other

```sh
yay -S \
i3-wm \
xorg-server \
xorg-xinit \ #to start X manually
dmenu \
i3blocks \
pavucontrol \
pulseaudio \
pasystray \
terminator \
firefox-developer-edition \
visual-studio-code-bin \
terminator \
pcmanfm \
ferdium \
thunderbird \
lxappearance \
dracula-gtk-theme \
papirus-icon-theme-git \
ttf-fira-code \
ttf-google-fonts-git \
noto-fonts-emoji \
nerd-fonts \ #https://www.nerdfonts.com/
deadd-notification-center \
flameshot \
i3lock-fancy-git \
lightdm \ #https://wiki.archlinux.org/title/LightDM
ligtdm-gtk-greeter \
lightdm-gtk-greeter-settings \
lightdm-slick-greeter \
lightdm-settings \

```

To start `i3-wm` manually, `sudo vim` into `/etc/X11/xinit/xinitrc` remove code containing `twm` and apps. Replace it with `exec i3`. Then run `startx` in terminal.

or refer [xinit](https://wiki.archlinux.org/title/xinit)

For `i3blocks`, `terminator` and other, Modify below in `~/.config/i3/config`

```config
...
bar {
  status_command i3blocks
}
...

...
bindsym $mod+Return exec terminator
focus_follows_mouse no
default_border pixel 1
default_floating_border pixel 1
bindsym $mod+F1 exec pcmanfm
bindsym $mod+F2 exec firefox-developer-edition
bindsym $mod+F3 exec code
bindsym $mod+F4 exec ferdium
bindsym $mod+F5 exec thunderbird
bindsym Print exec --no-startup-id flameshot gui
bindsym $mod+0 exec --no-startup-id i3lock-fancy
...
```

Run below to enable `lightdm` upon start up. Refer [lightdm](https://wiki.archlinux.org/title/LightDM#Greeter)

```sh
sudo systemctl enable lightdm
```

### Install GPU Drivers

[InstallingDrivers](https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives)

### Additional software

[ohmyzsh](https://ohmyz.sh/), refer [dotfiles](https://gist.githubusercontent.com/4mirul/06571e538a9046252412f88a26e28d4f/raw/e1fac120e26e7cd876a874b072c6014901b7d4d4/.zshrc)

[rEFInd](https://wiki.archlinux.org/title/REFInd)

[rEFInd theme Regular](https://github.com/bobafetthotmail/refind-theme-regular)

[Steam](https://wiki.archlinux.org/title/Steam)

[Discord](https://wiki.archlinux.org/title/Discord)

[Wireguard](https://wiki.archlinux.org/title/WireGuard)


### Reference

https://bbs.archlinux.org/viewtopic.php?id=274990

https://bbs.archlinux.org/viewtopic.php?id=243870