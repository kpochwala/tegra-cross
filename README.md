# tegra-cross
Cross environment configuration scripts for Jetson TK1

# How-to:
First, you have to run `copy-rootfs.sh` script to make local copy of Jetson's headers, libraries etc. You'll find some variables in the top of script, which may need adjusting for your particular system. Script will ask several times for passwords - your local user, but also Jetson one. Local password is used to maintain file permissions. High capacity drive for rootfs and toolchain are recommended (TODO: how much exactly).
