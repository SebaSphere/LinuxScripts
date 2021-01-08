#!/bin/bash

username=$1;
password=$2;
group=$3;
publickey=$4;

cd /;



if [[ $# -eq 0 ]] ; then
    echo 'Please pass all arguments...';
    echo 'Usage: "username" + "password" + "group" + "publickey"';
    exit 0;
fi



EncryptedPassword=$(perl -e 'print crypt($ARGV[0], "SebaIsSexy69")' $password);

echo "$username";
echo "$password";
echo "$group";
echo "$publickey";


useradd -m -p $EncryptedPassword $username;
passwd --expire $username;
usermod -G $group $username;

cd /home/$username/.shh/;
cat $publickey >> authorized_keys;
systemctl restart shh;
