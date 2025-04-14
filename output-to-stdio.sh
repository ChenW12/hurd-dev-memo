# Add console=com0 at the end of the multiboot command
# e.g. multiboot   /boot/gnumach-1.8-486.gz root=part:2:device:wd0 console=com0 noide
qemu-system-i386 -m 4G -enable-kvm -drive cache=writeback,file=hurd.img \
			-net user,hostfwd=tcp:127.0.0.1:2222-:22 \
			-net nic,model=e1000 \
			-serial stdio \
