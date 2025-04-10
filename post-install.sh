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
