#!/bin/bash
pw=`cat /tmp/pw`
sub='cat /tmp/sub'
mail='cat /tmp/mail'
sudo echo mail=$mail > /docker/config/.env
sudo echo PW=$pw >> /docker/config/.env
sudo echo sub=$sub >> /docker/config/.env