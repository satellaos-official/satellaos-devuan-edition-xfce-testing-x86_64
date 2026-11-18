#!/bin/bash

sudo apt install --install-recommends -y seatd
sudo usermod -aG tty,video "$USER"
sudo rc-update add seatd default

echo ">> Detecting actual seatd group name..."
SEAT_GROUP=$(grep -i seat /etc/group | cut -d: -f1 | head -n1)

if [ -n "$SEAT_GROUP" ]; then
    echo ">> Adding user to group: $SEAT_GROUP..."
    sudo usermod -aG "$SEAT_GROUP" "$USER"
else
    echo "!! Warning: no seatd-related group found, please check manually: /etc/group"
fi