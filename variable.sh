#!/bin/bash
pw=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
sub=cat /tmp/sub
mail=cat /tmp/mail
sudo echo mail=$mail > /docker/config/.env
sudo echo PW=$pw >> /docker/config/.env
sudo echo sub=$sub >> /docker/config/.env