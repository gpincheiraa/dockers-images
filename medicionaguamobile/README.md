# Imágenes Docker

En este repositorio se encuentran los Dockerfiles, build.sh y run.sh para los proyectos de la empresa.
Estos proyectos, en general, deberían tener los siguientes archivos.

  - Dockerfile: Imagenes de docker en texto plano que especifican las instrucciones ejecutadas para la creación de una imágen.
  - Build.sh: Archivo script dedicado a la construcción de la imágen.
  - Run.sh: Archivo script destinado a correr por primera vez la imágen.

Posiblemente en un futuro se agregue la opción de push de una imágen al repositorio local de la empresa.

##
### Requisitos para crear imágenes

Se necesita:
 - Una instalacion funcional de docker (de preferencia sin la opcion sudo)
 - Modificar los archivos build y run para que se ajusten a los parametros deseados (en build.sh: nombre de la imagen, y en run.sh: el nombre del contenedor más directorio de trabajo)

Para correr build.sh
```sh
$ sh run.sh
```

Para correr run.sh
```sh
$ sh run.sh
```

##
### Requisitos para el uso de imágenes

Todas las imágenes que hayan sido pusheadas el repositorio local, pueden ser descargadas y usadas por los desarrolladores.
Se necesita:
 - Una instalacion funcional de docker (de preferencia sin la opcion sudo)
 - Modificar el archivo run.sh para que se ajuste a los parametros deseados (modificar el nombre del contenedor más directorio de trabajo)

Una vez que se ha creado el container localmente, con un nombre para esta instancia local, este se ha de ejecutar de la siguiente forma (-i nos indica que inicie el contenedor en modo interactivo, y -a en modo attach): 

```sh
$ docker start -i <nombre-elegido>
```
