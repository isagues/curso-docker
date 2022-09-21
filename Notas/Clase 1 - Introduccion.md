# Introduccion

TODO: Por que docker y no otras?

https://opencontainers.org/

Contenedor utiliza recursos del sitema operativo. El contenedor usa el kernel del host. Permite ahorrarse replicar todo el sistema operativo, solo necesita incorporar las librerias y la aplicacion en si.

Un contenedor necesita un host basado en el mismo OS. Docker Desktop se encarga de crear la VM necesaria para correr imagenes que estan basadas en otro kernel. La idea de que Docker Desktop genere la VM es una solucion de desarrollo. Al momento de utilziarse se correran los containers sobre un host compatible.

Existen contenedores Windows.

Arquitectura
- Client (CLI)
- Daemon => servicio encargado de manejar los contenedores en si dentro del host
- Registry => repositorio de imagenes a ser utilizadas por el Daemon

Docker Hub es el registry default.

Alpine es la distribucion de Linux que se suele usar. Esta diseñada para contenedores. Tiene lo justo y necesario.

La sintaxis nueva de docker para la CLI es usar `docker <recurso> comando`. Por ejemplo, para ver las imagenes `docker image ls`. Para ver los contenedores que estan corrienod `docker container ps`.

`-P` => mapeo de puertos aleatorios.

Beneficios de docker:

- Aislacion
- Empaquetar

La imagen es inmutable