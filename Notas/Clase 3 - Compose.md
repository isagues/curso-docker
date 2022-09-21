# Compose

Todos los contenedores se levantan en una red default (bridge).

Puedo crear redes y generar conetenedores en redes especificas.

depends_on pemrite poner requisitos entre contenedores. Puede no ser suficiente. Puede prenderse el container de la db pero que todavia no este lista.

Docker compose crea una red para los containers. Toma el nombre del directorio.

el archivo compose tiene una seccion de servicios, una de redes y una de volumes.

Dentro de los servicios (contenedores), estos pueden ser a partir de una imagen o partir de buildear una imagen a partir de un Docker file.

links sirve para mapear otros containers dentro de la red. Para ponerle nombres convenientes.

Docker compose es lo mismo que usar docker, solamente es mas conveniente.

Casos de uso:
- Desarrollo
  - clone & run => empezar a usar la aplicacion rapido. Se clona y ya esta para funcionar
    - Puede ser con el runtime adentro o afuera
- Testing
  - Generar un ambiente de test y correr los tests todo junto.
  - Puede hacer todas las pruebas solas sin necesidad de que sea levante un ambiente fijo. Tiene mas sentido en pruebas end to end donde se necesita un browser por ejemplo.

stdin_o`pen y tty son para que el container quede activo.

> Agregar como arg y label el commit de git.

Se puede hace run multi stage donde primeor compilo con jdk y despues hago el package con jre. Ahi se genera cada imagen por separado.

> build X 

`docker compose` == compose v2.

## Extra

Dejar corriendo el container:
```conf
command: "/bin/bash"
stdin_open: true # docker run -i
tty: true        # docker run -t
```
