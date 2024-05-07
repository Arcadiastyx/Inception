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

## VOLUMES : in a Docker Compose file is used to
``` 
#1.Persistent data storage (databases, configuration files, etc.)
#2.Sharing data between containers
#3.Mounting Host Files or Directories
```

### ENTRYPOINT :
``` 
In a Dockerfile, an ENTRYPOINT is an optional definition for the first part of the command to be run. If you want your Dockerfile to be runnable without specifying additional arguments to the docker run command, you must specify either ENTRYPOINT, CMD, or both.

If ENTRYPOINT is specified, it is set to a single command. Most official Docker images have an ENTRYPOINT of /bin/sh or /bin/bash. Even if you do not specify ENTRYPOINT, you may inherit it from the base image that you specify using the FROM keyword in your Dockerfile. To override the ENTRYPOINT at runtime, you can use --entrypoint. The following example overrides the entrypoint to be /bin/ls and sets the CMD to -l /tmp.


$ docker run --entrypoint=/bin/ls ubuntu -l /tmp
CMD is appended to the ENTRYPOINT. The CMD can be any arbitrary string that is valid in terms of the ENTRYPOINT, which allows you to pass multiple commands or flags at once. To override the CMD at runtime, just add it after the container name or ID. In the following example, the CMD is overridden to be /bin/ls -l /tmp.


$ docker run ubuntu /bin/ls -l /tmp
In practice, ENTRYPOINT is not often overridden. However, specifying the ENTRYPOINT can make your images more flexible and easier to reuse.
```



### The Dockerfile supports the following instructions:
```
Instruction	Description
ADD	Add local or remote files and directories.
ARG	Use build-time variables.
CMD	Specify default commands.
COPY	Copy files and directories.
ENTRYPOINT	Specify default executable.
ENV	Set environment variables.
EXPOSE	Describe which ports your application is listening on.
FROM	Create a new build stage from a base image.
HEALTHCHECK	Check a container's health on startup.
LABEL	Add metadata to an image.
MAINTAINER	Specify the author of an image.
ONBUILD	Specify instructions for when the image is used in a build.
RUN	Execute build commands.
SHELL	Set the default shell of an image.
STOPSIGNAL	Specify the system call signal for exiting a container.
USER	Set user and group ID.
VOLUME	Create volume mounts.
WORKDIR	Change working directory.
```

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







