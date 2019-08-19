#!/bin/bash
 
ps -T -o spid,psr,stat $(pgrep qemu)
