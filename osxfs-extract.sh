#!/bin/sh -e

SIZE_MB=2048
SECTORS=$((2048 * $SIZE_MB))
DISK_DEV=$(hdiutil attach -nomount ram://$SECTORS)
VOLUME=git-filter-branch
diskutil erasevolume hfsx $VOLUME $DISK_DEV
umount /Volumes/$VOLUME

mkdir -p .git-rewrite-ram
diskutil mount -mountPoint .git-rewrite-ram $DISK_DEV

echo "Beginning filter..."

git filter-branch \
    --msg-filter ~/Code/osxfs/osxfs-msg-filter.sh \
    -d .git-rewrite-ram -f

git filter-branch \
    --parent-filter ~/Code/osxfs/osxfs-parent-filter.sh \
    --index-filter ~/Code/osxfs/osxfs-index-filter.sh \
    --prune-empty -d .git-rewrite-ram -f

hdiutil detach $DISK_DEV
rmdir .git-rewrite-ram
