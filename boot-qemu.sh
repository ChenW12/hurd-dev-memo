qemu-system-i386 -m 4G -enable-kvm -drive cache=writeback,file=hurd.img \
			-net user,hostfwd=tcp:127.0.0.1:2222-:22 \
			-net nic,model=e1000 \
			-display curses
