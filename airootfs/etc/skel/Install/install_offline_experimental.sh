#!/bin/bash
get_char()
{
    SAVEDSTTY=`stty -g`
    stty -echo
    stty raw
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}
if [[ ${EUID} -eq 0 ]];
then
    echo -e "\033[31;1m警告：请确认你将目标根目录挂载在/mnt\033[0m"
else
    echo -e "\033[31;1m请以root权限运行!\033[0m"
    exit
fi
echo "按任意键三次继续或按Control+C退出……"
get_char
get_char
get_char
time cp -ax / /mnt
cp -vaT /run/archiso/bootmnt/arch/boot/$(uname -m)/vmlinuz /mnt/boot/vmlinuz-linux
cp ./.install.dat.sh /mnt/bin/install_offline.sh
chmod +x /mnt/bin/install_offline.sh
echo "复制完成！现在，执行arch-root /mnt /bin/zsh，然后输入install_offline.sh执行。"
