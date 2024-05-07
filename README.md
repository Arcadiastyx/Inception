# Inception
This project aims to familiarize you with Docker by creating and manipulating multiple Docker images within your own customized virtual machine. The goal is to enable you to develop practical expertise in using Docker for virtualizing development environments.

# Diagram expected project:
<img width="497" alt="Capture d’écran 2024-04-08 à 09 26 52" src="https://github.com/Arcadiastyx/Inception/assets/72890174/6d11a1da-aa2f-47b9-940d-530d322ea484">

# Start recomandation : 
1. Create the files structure has expected in the subject.
2. take care of the Server by implementing the NGINX contenair.
3. take care fo the Worldpress contenair.
4. take care of the MariaDB contenair.
....

### Tips : 
- When you build a container it is possible to walk around the container to view the files via your terminal and use shell cmds in order to navigate on the container

### COMMANDS ###
``` 
# docker build + "Path to the dockerfile"  ---> create the contenaire
# docker -it run "dockerfile"              ---> allow to use the docker terminal
# docker-compose up --build                ---> build and run the containers
# docker-compose up -d                     ---> run the containers in the background
# docker ps -a                             ---> list all containers
# docker images (-a)                       ---> list all images
# docker exec -it <nom du contenaire> bash ---> access to the container terminal
# docker-compose down                      ---> stop and remove all containers
# docker-compose down -v                   ---> stop and remove all containers and volumes
# docker-compose down --rmi all            ---> stop and remove all containers and images
``` 

### INFO ###
##Quand on build un contenaire il et possible de se balader dans le contenaire pour voir les fichiers via son terminal

## VOLUMES : dans un fichier Docker Compose est utilisée pour :
# 1.Stockage de données persistantes (bases de données, fichiers de configuration, etc.)
# 2.Partage de données entre les conteneurs
# 3.Montage de fichiers ou répertoires de l'hôte




