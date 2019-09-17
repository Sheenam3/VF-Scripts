#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <NUMBER OF VFS> <Interface Name>"
  exit 1
fi


num_vf=$1
int_name=$2

echo $num_vf > /sys/class/net/${int_name}/device/sriov_numvfs
