## Create Dockerfile to host httpd webserver
```Dockerfile
FROM amazonlinux:2023    
RUN yum update -y && yum install httpd -y 
COPY index.html /var/www/html 
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
````

## Create Dockerfile to host nginx webserver

```Dockerfile
FROM ubuntu
RUN apt-get update -yum
RUN apt install nginx -y 
COPY index.html /var/www/html/
CMD ["nginx", "-g", "daemon off;"]
```
