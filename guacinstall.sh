#!/bin/bash
cd /docker/config
sudo docker-compose pull
sudo chmod 777 /docker/config/
sudo rm docker-compose.yml
mv docker-compose_script.yml docker-compose.yml
sudo docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql
sudo mkdir /docker/guacamole
sudo mkdir /docker/guacamole/postgre
sudo mkdir /docker/guacamole/postgre/init
sudo cp initdb.sql /docker/guacamole/postgre/init/
#echo Please enter a new password:
#read -p 'Password: ' PW
PW=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
echo Please enter default Mail adress
read -p 'E-Mail: ' mail
echo "Please enter guacamole sub domain (eg: sub.domain.yours)"
read -p "FQDN:" sub
sudo echo mail=$mail > /docker/config/.env
sudo echo PW=$PW >> /docker/config/.env
sudo echo sub=$sub >> /docker/config/.env
sudo chmod 755 /docker/config/
sudo docker-compose up -d
echo install finisched
echo you can reach your guacamole setup here: https://${sub}/guacamole
echo Username and Password is: guacadmin