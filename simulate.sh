#!/bin/sh

# Change to Your spike and pk path 
# For example: 
# SPIKE_PATH="/home/sys1-sp25/repo/build/spike/spike"
# PK_PATH="/home/sys1-sp25/repo/build/riscv-pk/pk"
SPIKE_PATH="/mnt/d/SPIKE/riscv-isa-sim/build/spike"
PK_PATH="/mnt/d/RISC-V_Proxy_Kernal/riscv-pk/build/pk"


$SPIKE_PATH $PK_PATH $*