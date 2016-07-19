# Imágenes Docker

Repositorio

Mi recomendación es clonar este repositorio en la carpeta de usuario del sistema `~/`

**Ejemplo de uso**

Quiero construir una imagen para trabajar en un proyecto angular con node como herramienta de desarrollo que ejecutará testing usando karma

Para construir un docker:

- Acceder al directorio donde se encuentre el archivo Dockerfile deseado (en este ejemplo node/karma-testing)
- Ejecutar el comando `docker build -t frontendev-karma .`. Con esto creamos una imagen llamada `frontendev-karma`.
- Luego para crear un contenedor accedemos a la carpeta con el proyecto que queremos correr en nuestro docker (por ejemplo `~/projects/my_angular_project`) y ejecutamos el siguiente comando (asumiendo que clonamos este repositorio en `~/`): `sh ~/dockers/node/karma-testing/run-node-karma.sh`
- Respondemos a las preguntas de la consola "Ingrese el nombre de su imagen docker de node:", en este caso sería `frontendev-karma`. Presionar enter y responder la siguiente pregunta "Ingrese un nombre para el contenedor:", puede ser cualquier nombre, en este caso elijamos `my_angular_project_container`.
- Es muy importante que el script sh sea ejecutado en la carpeta de nuestro repositorio ya que el contenedor sera creado y "linkeado" al directorio en el cual ejecutamos el scripr.
- Una vez creado el contenedor accedemos a este ejecutando `docker start -ia my_angular_project_container`. Utilizamos -ia para poder acceder a la consola del contenedor. Si ejecutan `ls` verán que las carpetas que muestra son las mismas que tiene el repositorio donde ejecutamos el script sh la primera vez. Para acceder al container no es obligatorio estar en el directorio del proyecto.
