#!/bin/bash
FILENAME="/home/archuser/.gnome-settings"
USERCONFIG="/run/archiso/img_dev/Arch/autorun.sh"
if [[ -f "$FILENAME" ]]; then
    dconf load / < "$FILENAME"
    rm "$FILENAME"
fi
if [[ -f "$USERCONFIG" ]]; then
    sh "$USERCONFIG"
fi
