#!/bin/bash

# gerardo ocampos

for username in $(cat /etc/sftp/users.conf | awk -F ":" '{print $1}'); do
  if [ -d "/home/ftp_home/$username/home" ];
  then
    echo 'chrootdir for $username exists'
  else 
    mkdir -p /home/ftp_home/$username/home
  fi

  # chroot directory:
  chown root:root "/home/ftp_home/$username"
  chmod 755 /home/ftp_home/$username

  # user's home directory:
  chown $username: "/home/ftp_home/$username/home"
  chmod 750 "/home/ftp_home/$username/home"
  usermod -d "/home/ftp_home/$username/home" $username

  # configuration for home:
  cd /home/ftp_home/$username
  ln -s . $username  
done;

sed -i "s/ChrootDirectory %h/ChrootDirectory \/home\/ftp_home\/%u/g" /etc/ssh/sshd_config
