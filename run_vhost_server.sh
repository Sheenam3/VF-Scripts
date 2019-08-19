#!/bin/bash
#start VM

if [[ $# != 3 ]]; then
	echo "Usage: $0 <VCPU> <MEMORY> <VM IMAGE>"
	exit 1
fi
vcpu=$1
memory=$2
vm_image=$3

qemu-system-x86_64 -enable-kvm \
                   -cpu host \
                   -smp ${vcpu} \
                   -m   ${memory} \
                   -drive file=${vm_image},if=virtio \
		   -netdev tap,ifname=qtap1,id=mynet1,script=no,downscript=no,vhost=on\
	           -device virtio-net-pci,mac=00:22:33:EE:EE:EE,netdev=mynet1,id=vnic -qmp unix:/tmp/qmp-socket,server,nowait


#-nographic \
		   #-monitor none \
		   #-parallel none \
		   #-serial none\
		   #-vga none \
		   #-serial telnet:127.0.0.1:8888,server,nowait\
