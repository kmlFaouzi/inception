#!/bin/sh

#set up the user for the ftp service
useradd -m $FTP_USR
echo "$FTP_USR:$FTP_PASS" | chpasswd

mkdir -p /home/$FTP_USR/ftp/files && chown nobody:nogroup /home/$FTP_USR/ftp && chmod a-w /home/$FTP_USR/ftp && chown $FTP_USR:$FTP_USR /home/$FTP_USR/ftp/files
mkdir -p /var/run/vsftpd/empty
sed -i "s/#write_enable=YES/write_enable=YES/g"  /etc/vsftpd.conf
sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/g"  /etc/vsftpd.conf

echo "user_sub_token=$FTP_USR" >> /etc/vsftpd.conf
echo "local_root=/home/$FTP_USR/ftp" >> /etc/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd.conf
echo "pasv_max_port=40005" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf

echo "$FTP_USR" | tee -a /etc/vsftpd.userlist

sed -i "s/#local_enable=YES/local_enable=YES/g" /etc/vsftpd.conf
sed -i "s/#local_umask=022/local_umask=007/g"  /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

/usr/sbin/vsftpd /etc/vsftpd.conf