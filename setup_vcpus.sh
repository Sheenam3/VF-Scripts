#!/bin/bash

vcpus=($(./get_vcpu_thread_ids.sh /tmp/qmp-socket))

nvcpus=${#vcpus[@]}

for i in `seq 1 $nvcpus`; do
	j=$(($i - 1))
	taskset -cp $i ${vcpus[$j]}

done
