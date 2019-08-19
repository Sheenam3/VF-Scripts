#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <NUMBER OF VFS>"
  exit 1
fi

num_vf=$1

echo $num_vf > /sys/class/net/enp1s0f1/device/sriov_numvfs