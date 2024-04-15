---
title: nixos install
tags:
  - nixos
  - install
  - tech
  - zfs
  - zfs-on-root
---

Probably some stupid stuff in here,
and it's far from complete,
but below is what I worked from for a ZFS-on-root install of NixOS.

```sh
export d0="/dev/nvme0n1"

wipefs $d0; sgdisk -z $d0; sgdisk -og $d0

sgdisk --new 1::+1G --typecode=1:EF00 --change-name=1:'ESP0' $d0
sgdisk --new 0:0:0 --typecode=2:BF01 --change-name=2:'rpvol0' $d0

partprobe
udevadm settle

mkfs.vfat -F32 -nESP1 /dev/disk/by-partlabel/ESP0

zpool create                  \
      -o autotrim=on          \
      -o acltype=posixacl     \
      -o compression=on       \
      -O dnodesize=auto       \
      -O normalization=formD  \
      -O relatime=on          \
      -O xattr=sa             \
      -O mountpoint=none      \
      rpool /dev/disk/by-partlabel/rpvol0

zfs create -o mountpoint=legacy -o rpool/local/root
zfs snapshot rpool/local/root@blank


mount -t zfs rpool/local/root /mnt
mkdir /mnt/boot
mount /dev/disk/by-partlabel/ESP0 /mnt/boot

zfs create -p -o mountpoint=legacy rpool/safe/nix
mkdir /mnt/nix
mount -t zfs rpool/safe/nix /mnt/nix

zfs create -p -o mountpoint=legacy rpool/safe/home
mkdir /mnt/home
mount -t zfs rpool/safe/home /mnt/home

zfs create -p -o mountpoint=legacy rpool/safe/persist
mkdir /mnt/persist
mount -t zfs rpool/safe/home /mnt/persist


# adding new disks
# here, zpool will be called "media", and the disk is /dev/sdd
# the disk is fresh out of the package, so no formatting/sgdisk --zap-all, etc.
# could do some integrity testing prior to this
sudo zpool create -o autotrim=on -O compression=on -O xattr=sa -O acltype=posixacl media /dev/sdd 
# make the datasets
sudo zfs create -o mountpoint=legacy media/music
sudo zfs create -o mountpoint=legacy media/movies
sudo zfs create -o mountpoint=legacy media/shows
sudo zfs create -o mountpoint=legacy media/data
# etc
# add all of these to the zfs.nix file, or wherever you declare the mountpoints
# nix switch into the new configuration to make the directories and mnt them
# then send all your data over, e.g.
cd /media
sudo rsync -avhHP --delete /music/ music
# -a = archive
# -v = verbose
# -h = human-readable filesizes
# -H = preserve hard links
# -P = progress
# --delete = delete files from the destination dir that aren't found on the src dir
# , 
# useful if you had a few goes at getting the rsync command right and now need to clean it up
```
