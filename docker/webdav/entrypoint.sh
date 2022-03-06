#!/bin/bash

htpasswd -bc /etc/nginx/htpasswd $USERNAME $PASSWORD
mediaowner=$(ls -ld /media | awk '{print $3}')
echo "Current /media owner is $mediaowner"
if [ "$mediaowner" != "www-data" ]
then
    chown -R www-data:www-data /media
fi