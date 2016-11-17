#!/bin/bash
useradd -m -g users -s /bin/bash archuser
passwd archuser
usermod -s /usr/bin/zsh archuser
cp -aT /etc/skel/ /home/archuser/
visudo
curl -L -O http://archibold.io/sh/archibold
chmod +x archibold
mv archibold /usr/bin
archibold login-background /home/archuser/.background.png
sudo -u archuser gsettings set org.gnome.desktop.background picture-uri /home/archuser/.background.png
sudo -u archuser gsettings set org.gnome.desktop.interface gtk-theme VimixDark
sudo -u archuser gsettings set org.gnome.desktop.interface icon-theme Paper
sudo -u archuser gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11'
sudo -u archuser gsettings set org.gnome.shell enabled-extensions "['activities-config@nls1729', 'arch-update@RaphaelRochet', 'CoverflowAltTab@dmo60.de', 'scroll-workspaces@gfxmonk.net', 'TopIcons@phocean.net', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'pixel-saver@deadalnix.me']"

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(zh_CN\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target
systemctl enable NetworkManager.service

passwd root
