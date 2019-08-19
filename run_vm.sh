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
		   -netdev tap,ifname=qtap0,id=mynet0,script=no,downscript=no\
		   -device virtio-net-pci,netdev=mynet0 \
	           -device vfio-pci,host=01:10.1,id=vfio_pci_nic -qmp unix:/tmp/qmp-socket,server,nowait
	#-netdev vhost-user,id=mynet0,hostfwd=tcp::10022-:22 -device virtio-net-pci,netdev=mynet0 \
	#-device vfio-pci,host=01:10.1\
	
#	-qmp unix:/tmp/qmp-socket,server,nowait
#-device virtio-net-pci,netdev=mynet0
#	-nographic \
#       -monitor none \
#       -parallel none \
#       -serial none \
#	-device virtio-net-pci,netdev=mynet0 -netdev tap,ifname=qtap0,id=mynet0,script=no,downscript=no
