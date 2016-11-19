#!/bin/sh
mv ./mirrorlist /etc/pacman.d/
mv ./pacman.conf /etc/
echo "正在处理公钥，这将花费一些时间，请稍候。"
pacman-key --init
pacman-key -r 962DDE58
pacman-key --lsign-key 962DDE58
