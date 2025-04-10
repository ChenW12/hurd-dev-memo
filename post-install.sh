# Set up the network
settrans -fgap /servers/socket/2 /hurd/pfinet -i /dev/eth0 -a 10.0.2.15 -g 10.0.2.2 -m 255.255.255.0

# In /etc/apt/sources.list
deb [trusted=yes] https://deb.debian.org/debian-ports unstable main
deb-src [trusted=yes] https://deb.debian.org/debian unstable main
deb [trusted=yes] https://deb.debian.org/debian-ports unreleased main

# Upgrade debian-ports-archive-keyring
apt upgrade debian-ports-archive-keyring

# In /etc/apt/sources.list, remove [trusted=yes]
deb https://deb.debian.org/debian-ports unstable main
deb-src https://deb.debian.org/debian unstable main
deb https://deb.debian.org/debian-ports unreleased main

# Upgrade
apt update
apt upgrade

# Smart upgrade
apt-get dist-upgrade

# To have a better terminal only qemu output
GRUB_TERMINAL_OUTPUT="vga_text"

# To use rumpdisk, some modifications are needed and qemu needs to be
# booted with '-M q35'
# From https://darnassus.sceen.net/~hurd-web/hurd/rump/rumpdisk/

# In /etc/default/grub
# make sure you add this next line somewhere in the file
GRUB_CMDLINE_GNUMACH="noide"

# In /boot/grub/grub.cfg
# multiboot /boot/gnumach-1.8-486.gz root=part:2:device:hd0 console=com0
multiboot   /boot/gnumach-1.8-486.gz root=part:2:device:wd0 console=com0

# In /etc/fstab
#/dev/hd0s2      /               ext2    defaults        0       1
/dev/wd0s2      /               ext2    defaults        0       1
#/dev/hd0s1      none            swap    sw              0       0
/dev/wd0s1      none            swap    sw              0       0
#/dev/hd2        /media/cdrom0   iso9660 noauto          0       0
/dev/wd2        /media/cdrom0   iso9660 noauto          0       0

# To use ssh to access the virtual machine, openssh-server has to be installed
apt install openssh-server

# To have sudo, we need to install sudo package and add user 'demo' in
# visudo
apt install sudo
# Add 'demo  ALL=(ALL:ALL) ALL'
visudo
