# Create a qcow2 file as the hurd disk image
#qemu-img create -f qcow2 hurd.img 20G

# Boot the disk image with the net install image
qemu-system-i386 -enable-kvm -m 2G -drive file=hurd.img,cache=writeback -cdrom debian-sid-hurd-i386-NETINST-1.iso -boot d
