#!/bin/sh

#set up the user for the ftp service
mkdir -p /home/$FTP_USR/ftp/files && chown nobody:nogroup /home/$FTP_USR/ftp && chmod a-w /home/$FTP_USR/ftp && chown $FTP_USR:$FTP_USR /home/$FTP_USR/ftp/files

sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/g"  /etc/vsftpd.conf
sed -i "s/#local_enable=YES/local_enable=YES/g" /etc/vsftpd.conf
sed -i "s/#write_enable=YES/write_enable=YES/g"  /etc/vsftpd.conf
sed -i "s/#local_umask=022/local_umask=007/g"  /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "user_sub_token=$FTP_USR" >> /etc/vsftpd.conf

useradd -m $FTP_USR
echo "$FTP_USR:$FTP_PASS" | chpasswd
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf