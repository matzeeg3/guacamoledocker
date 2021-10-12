#!/bin/bash
cd /docker/config
sudo docker-compose pull
sudo chmod 777 /docker/config/
sudo rm docker-compose.yml
mv docker-compose_script.yml docker-compose.yml
sudo docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql
sudo chmod 755 /docker/config/
sudo mkdir /docker/guacamole
sudo mkdir /docker/guacamole/postgre
sudo mkdir /docker/guacamole/postgre/init
sudo cp initdb.sql /docker/guacamole/postgre/init/
echo Please enter a new password:
read -p 'Password: ' PW
echo Please enter default Mail adress
read -p 'E-Mail: ' mail
echo Please enter guacamole sub domain (eg: sub.domain.yours)
read -p "FQDN:" sub



# # guacamoledocker  
# 1. install Docker: https://docs.docker.com/engine/install/  
# 2. install Docker Compose https://docs.docker.com/compose/install/  
# 3. create directory: "sudo mkdir /docker"  
# 4. create directory "sudo mkdir /docker/config"  
# 5. enter directory "cd /docker/config"  
# 6. Clone Git Repository: "sudo git clone https://github.com/matzeeg3/guacamoledocker.git /docker/config/"  
# 7. Download Container: "sudo docker-compose pull"  
# 8. change directory permission "sudo chmod 777 /docker/config/"  
# 9. generate sql tamplate: "sudo docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql" 
# 10. change back directory permission "sudo chmod 755 /docker/config/"   
# 11. create directory: "sudo mkdir /docker/guacamole"  
# 12. create directory: "sudo mkdir /docker/guacamole/postgre"  
# 13. create directory: "sudo mkdir /docker/guacamole/postgre/init"  
# 14. copy initdb.sql to desternation direcotry: "sudo cp initdb.sql /docker/guacamole/postgre/init/"
# 15. edit the compose file: "sudo nano docker-compose.yml" -> change the Password fields, the Virtual_host, your email adress and the lets encrypt host  
# 16. Make sure your sub-domain points to the PublicIP of the docker host  
# 17. Make sure you have open port 80 and 443 to the docker host  
# 18. inside of the directory /docker/config now just run "sudo docker-compose up -d"  
# 19. wait approx 5 mins if you did anything right you should be able to access "https://sub.domain.yours/guacamole  
# 20. first login credentials are username and password "guacadmin"  
  
  
# i will provide a script witch did the manual stepps above in the future.  