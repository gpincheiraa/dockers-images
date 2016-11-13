
Para correr este docker, se necesita el siguiente comando: 
```
docker run -it --privileged --rm --net=host -v /dev/shm:/dev/shm -v $(pwd):/home/dev/app [image_name] [protractor options]
```
