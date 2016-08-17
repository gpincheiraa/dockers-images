#karma-testing

**Caso de uso**

Quiero desarrollar un proyecto front end utilizando Angular como framework y node como herramienta de desarrollo para ejecutar testing a través del test runner karma y ejecutar tareas automatizadas utilizando grunt. Adicionalmente necesito bower para gestionar paquetes, phantomJS para correr mis test, y postcss y sass para trabajar mi CSS

**¿Qué contiene esta imagen?**

***Sistema operativo Debian wheezy***

Esta imagen contiene la siguiente configuración 

- contiene un usuario llamado `dev` a quien le asignamos su respectivo directorio `/home/dev`. (Esto elimina la dependencia del comando sudo que eventualmente podría generarse al instalar determinados paquetes como por ejemplo phantomJS)
- contiene un working directory en `/home/dev/app`
- contiene una consola bash como punto de entrada al contenedor docker
- La variable de ambiente `PHANTOMJS_BIN` necesaria para ejecutar phantomJS

***Node 0.12***

Trae trae los siguientes paquetes `npm` instalados:

- **bower** para gestionar paquetes front end.
- **grunt-cli** y **karma-cli** para ejecutar grunt y karma respectivamente.
- **postcss** y **es6-promise** para ejecutar postcss
- **phantomjs-prebuilt** para correr tests en karma a través de phatomjs 


**Ruby**

Trae Ruby para instalar la gema **compass** necesaria para transformar scss a css.




**Instrucciones para construir esta imagen localmente**

- Acceder al directorio `node/karma-testing`.
- Ejecutar el comando `docker build -t frontendev-karma .`
  Con esto creamos una imagen llamada `frontendev-karma`.

**Crear un contenedor con el directorio de nuestro proyecto montado como un volumen en el working directory del docker**

Aparte del archivo `Dockerfile` para la creación de la imagen docker, este repositorio trae un script sh que facilita el proceso de montar un repositorio en el working directory del docker que en este caso es `/home/dev/app`.

Para crear un contenedor accedemos a la carpeta con el proyecto que queremos montar en nuestro docker (por ejemplo `~/projects/my_angular_project`) y ejecutamos el siguiente comando (asumiendo que clonamos este repositorio en `~/`): `sh ~/dockers/node/karma-testing/run-node-karma.sh`

Respondemos a las preguntas de la consola "Ingrese el nombre de su imagen docker de node:", en este caso sería `frontendev-karma`. Presionar enter y responder la siguiente pregunta "Ingrese un nombre para el contenedor:", puede ser cualquier nombre, en este caso elijamos `my_angular_project_container`.

Una vez creado el contenedor accedemos a este ejecutando `docker start -ia my_angular_project_container`. Utilizamos -ia para poder acceder a la consola del contenedor.

Notas:

- Es muy importante que el script sh sea ejecutado mientras estamos en la carpeta del proyecto que desea ser montado como volumen ya que el contenedor sera creado y montado al directorio en el cual ejecutamos el script.

- Para cersiorarnos que hemos montado el volumen exitosamente a través del script sh, una vez al interior del contenedor, si se ejecuta el comando `ls`, debería desplegarse la misma misma estructura  de archivos del proyecto donde ejecutamos el script sh. 
