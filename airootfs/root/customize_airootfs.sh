#!/bin/bash
useradd -m -g users -s /bin/bash archuser
passwd archuser
usermod -s /usr/bin/fish archuser
cp -aT /etc/skel/ /home/archuser/
echo "archuser ALL=(ALL) ALL" >> /etc/sudoers

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(zh_CN\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

usermod -s /usr/bin/fish root
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
sed -i 's/org.gnome.Nautilus/nemo/g' /usr/share/applications/org.gnome.Nautilus.desktop
ln -s /home/archuser/.vimrc /root/.vimrc
ln -s /home/archuser/.vim /root/.vim
ln -s /home/archuser/.vim /home/archuser/.config/nvim
ln -s /home/archuser/.vimrc /home/archuser/.config/nvim/init.vim
mkdir /root/.config
ln -s /home/archuser/.config/nvim /root/.config/nvim
ln -s /home/archuser/.config/fish /root/.config/fish
cp /home/archuser/.ericgnome.sh /usr/bin/ericgnome.sh
chmod +x /usr/bin/ericgnome.sh
/home/archuser/.vim/plugged/YouCompleteMe/install.py --clang-completer --system-libclang
mv /home/archuser/archibold /usr/bin/archibold
fish
