# types of docker network
1. Bridge (default)
2. Host
3. Macvlan
4. Overlay
5. None

## how to create docker network
````
docker network create skynet
````

## list docker networks
````
docker network ls
````
## how to create docker network with diff driver
````
docker network create --driver macvlan vnet
````
## create container in specific network
````
docker run -itd --name c1 --network skynet  ubuntu
````
````
docker run -itd --name c2 --network skynet  ubuntu
````
## list running containers
````
docker ps
````
## ping c1 from c2
- login to c1
````
docker exec -it c2  /bin/bash
````
- install ping command
````
apt update -y
apt install iputils-ping -y
````
- now check connectivity
````
ping c2
````
![image](https://github.com/user-attachments/assets/702de892-842d-4dd8-afee-14dee067d3cf)

## attach network to existing container
````
docker network connect skynet cont-3
````

## delete network
````
docker network rm skynet
````



