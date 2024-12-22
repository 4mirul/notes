# Post-Installation Tips and Configuration for Arch Linux

After installing Arch Linux, there are several important steps to configure the system to meet your needs. This guide covers creating an administrative user, installing essential software like yay and i3-wm, configuring system settings, and installing additional utilities for a better user experience.

## Step 1: Create an Admin User

The first step after installation is to create a regular user with administrative privileges. This user will be able to perform system tasks without using the root account directly.

### Create the Admin User

Login as `root` and run the following commands to create a new user and grant administrative privileges:

```sh
# Install sudo if it's not already installed
pacman -S sudo
# Create a new user (replace `new_user` with the desired username)
useradd -m new_user
# Set a password for the new user
passwd new_user
# Add the new user to important groups
usermod -aG audio,floppy,lp,optical,storage,video,wheel,power new_user
```

### Configure Sudo Access

Edit the sudoers file to allow your user to run commands with `sudo`. You can either require a password or configure it for passwordless sudo.

```sh
# Edit the sudoers file with your chosen editor (e.g., vim)
EDITOR=vim visudo
```

- Uncomment the line `%wheel ALL=(ALL:ALL) ALL` to allow members of the `wheel` group to use `sudo`.
- Add the following line to allow the user to run commands without a password prompt (optional):

```sh
new_user ALL=(ALL) NOPASSWD: ALL
```

After this, exit the root session and log in as `new_user` to start using the system with administrative privileges.

## Step 2: Install yay (AUR Helper)

yay is a popular AUR (Arch User Repository) helper that simplifies the process of installing packages from the AUR. Here's how to install it:

```sh
# Install base development tools and Git
pacman -S --needed git base-devel
# Clone the yay repository from AUR
git clone https://aur.archlinux.org/yay.git
# Navigate to the yay directory and build the package
cd yay
makepkg -si
```

Now, you can use yay to install packages from the AUR with ease!

## Step 3: Install i3-wm and Other Essential Software

Next, we'll install **i3-wm** (a lightweight tiling window manager) along with other essential utilities and software.

### Install i3-wm and Xorg

```sh
yay -S \
i3-wm \
vim \
xorg-server \
xorg-xinit \   # Allows manual start of Xorg (X server)
dmenu \        # Lightweight application launcher
i3blocks \     # Status bar for i3
pavucontrol \  # PulseAudio volume control
pulseaudio \   # Sound server
pasystray \    # PulseAudio tray icon
terminator \   # Terminal emulator
firefox-developer-edition \ # Browser
visual-studio-code-bin \  # Code editor
pcmanfm \      # File manager
ferdium \      # All-in-one messaging app
thunderbird \  # Email client
lxappearance \ # GTK theme switcher
dracula-gtk-theme \ # Dracula theme for GTK apps
papirus-icon-theme-git \ # Papirus icon theme
ttf-fira-code \ # Developer fonts
ttf-google-fonts-git \ # Google fonts
noto-fonts-emoji \ # Emoji fonts
nerd-fonts \    # Nerd fonts (for better terminal and app font rendering)
deadd-notification-center \ # Notification center for i3
flameshot \     # Screenshot tool
i3lock-fancy-git \ # Fancy screen locker for i3
lightdm \       # Display manager
lightdm-gtk-greeter \ # GTK greeter for LightDM
lightdm-gtk-greeter-settings \ # Settings for LightDM greeter
lightdm-slick-greeter \ # Slick greeter theme for LightDM
lightdm-settings \ # Configuration settings for LightDM
```

### Set Up i3wm

To start i3-wm manually, we need to modify the xinitrc file. This tells the system to use `i3` as the window manager when starting the X session.

```sh
# Edit the xinitrc file
sudo vim /etc/X11/xinit/xinitrc
# Remove the lines related to twm and replace with `exec i3`
exec i3
```

Now, you can start i3 with:

```sh
startx
```

### Configure i3 Blocks and Other Settings

Modify the i3 config to set up i3blocks, change keybindings, and configure default applications:

```sh
# Edit i3 configuration file
vim ~/.config/i3/config
# Example configuration for i3blocks, Terminator, and other apps
bar {
  status_command i3blocks
}
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
```

### Enable LightDM for Automatic Login

To have LightDM start on boot, enable the service:

```sh
sudo systemctl enable lightdm
```

Now, LightDM will manage the login screen, and it will automatically start the session.

## Step 4: Install GPU Drivers

To get your GPU working, you’ll need to install the appropriate drivers. You can follow the guide on the official [Installing Drivers](https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives) documentation.

### Install Popular GPU Drivers:

- For NVIDIA:

```sh
sudo pacman -S nvidia nvidia-utils
```

For AMD:

```sh
sudo pacman -S xf86-video-amdgpu
```

After installing the drivers, reboot the system for the changes to take effect.

## Step 5: Install Additional Software

Now that your system is set up, you can install some additional software that might be useful for daily tasks.

### Popular Software

- Oh My Zsh: A framework for managing your Zsh configuration.
    - Configure Zsh using this dotfile.
- rEFInd: A boot manager for systems with UEFI firmware.
- rEFInd theme Regular: A nice theme for rEFInd.
- Steam: Steam client for gaming on Linux.
- Discord: Popular voice and text chat app for gamers.
- WireGuard: A fast and secure VPN.

## Final Thoughts

By following this post-installation guide, you'll be able to set up a highly customizable and efficient Arch Linux environment using i3-wm and other essential tools. Arch Linux's flexibility means you can fine-tune your system to your exact specifications, and this guide is just the start of a great Linux experience.

For more help and to keep up with Arch-related updates, visit the Arch Wiki and Arch forums:

- [Arch Wiki](https://archlinux.org/)
- [Arch Linux Forums](https://bbs.archlinux.org/)

## References

- [Arch Linux Post-Installation Guide](https://wiki.archlinux.org/title/General_recommendations)
- [Arch Linux AUR Installation Guide](https://wiki.archlinux.org/title/Arch_User_Repository)