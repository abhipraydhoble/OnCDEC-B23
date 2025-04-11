#### Que. diff vm and container
#### Que. diff monolithic vs microservices

## Docker Installation Steps on Amazon Linux:

````
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
newgrp docker
sudo chmod 777 /var/run/docker.sock
````

## Docker Basic Commands:

### pull docker image from dockerhub
````
docker pull nginx
````
### list docker images
````
docker images
````

### run docker container from image
````
docker run -itd --name myapp -p 80:80 nginx
````

### check running containers
````
docker ps
````
### check stopped containers
````
docker ps -a
````

### login into docker container

**syntax**: docker exec -it <containerID> or <container name> /bin/bash
- example:
````
docker exec -it myapp /bin/bash
````
````
exit
````

### stop running container
````
docker stop <cont-name>/id
````

