# b2sumARM
Modifications to Blake2 to support ARM CPUs (like Raspberry PI)
The only modifications are in the b2sum makefile to support using
the ARM NEON instructions instead of the Intel SSE instructions

This works fine with Ubuntu which uses the gcc 10.3 compiler but is
not working on gcc 8.3 (the default compiler for Raspberry Pi OS

I did try upgrading to gcc 10.1, but that failed as well.

