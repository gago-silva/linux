#!/bin/bash
# Purpose - Script to add users to Linux OS including passsword generation
# ------------------------------------------------------------------

read -p "Create additional user(s) ? (yes/no) : " usercon

if [ $usercon = "no" ]; then
     exit
else
  while true; do   
    read -p "Enter username (empty will exit): " username  
    if [ ${#username} -eq 0 ]; then
      echo "No more usernames to add!"
      break 
    fi
    
    egrep "^$username:" /etc/passwd >/dev/null
    if [ $? -eq 0 ]; then
      echo "User $username already exists, skipping!"
    else
      userpass=$(openssl rand -base64 16)    
      pass=$(perl -e 'print crypt($ARGV[0], "password")' $userpass)
      echo useradd -m -p $pass $username

      if [ $? -eq 0 ]; then 
        echo "User $username has been added to system! Their password is $userpass" 
        echo passwd --expire $username
      fi
    fi
  done
fi
