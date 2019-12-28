#!/usr/bin/env bash

sudo a2enmod cgid
sudo systemctl restart apache2
sudo cp $1 /usr/lib/cgi-bin/$1
sudo chmod 705 /usr/lib/cgi-bin/$1
