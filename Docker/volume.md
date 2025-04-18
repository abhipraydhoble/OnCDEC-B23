## create new docker volume

````
docker volume create ebs
````

## create docker container and mount volume 
````
docker run -itd --name cont-zero --mount source=ebs,target=/storage ubuntu
````
## login to docker container
````
docker exec -it cont-zero /bin/bash
````
## go to storage dir and create files and exit

## now create new container and will attach same volume

````
docker run -itd --name cont-one --mount source=ebs,target=/drive ubuntu
````
## login and check 



## alternate command to mount volume

````
docker run -itd --name cont-two -v ebs:/data ubuntu
````
## stop and remove all containers

## delete volume

````
docker volume rm ebs
````
