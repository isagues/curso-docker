# Ejercicio 7

> ¿Cuántos contenedores se están ejecutando? (pueden verlo en el archivo docker-compose.yml y también ejecutando docker ps)

En el archivo se declaran **dos** servicios (contenedores) `web` y `db`.

Se puede verificar con `docker container ps` luego de correr `docker compose up`.

    CONTAINER ID   IMAGE                            COMMAND                  CREATED          STATUS          PORTS                    NAMES
    27503a6df2d0   nicopaez/jobvacancy-ruby:1.3.0   "/jobvacancy/start_a…"   36 seconds ago   Up 33 seconds   0.0.0.0:3000->3000/tcp   ej7-web-1
    b2da3c5d79d1   postgres:14.4-alpine             "docker-entrypoint.s…"   36 seconds ago   Up 35 seconds   5432/tcp                 ej7-db-1

> ¿Cuales son las imágenes en las que están basados los mencionados contenedores?

- `web`: basado en la imagen `nicopaez/jobvacancy-ruby` version `1.3.0`
- `db`: basado en la imagen `postgres` version `14.4-alpine`

> ¿Puedes leer el docker-compose.yml y describir lo que hace cada una de sus lineas?

Primero se declara la version del archivo, esto implica como se interpretara la configuracion delcarada, asi como que opciones estan disponibles.

Se declaran 2 servicios.

Primero el caso de `web`, la aplicacion principal.

- Se especifica una imagen ya generada a utilizar.
- Se establece una conexion por red con el otro contenedor (db). Teniendo en cuenta que es un compose version 2, se esta generando una red entre los contenedores del compose, por lo tanto esta opcion no tiene efecto de conectar los containers. La otra funcion que cumple es la de generar alias para los contenedores dentro de la red, pero en este caso tampoco se esta asociando un alias, por lo tanto esta linea no tiene efecto alguno.
- Se expone el puerto `3000` del contenedor al puerto `3000` del host
- Se definen las variables de entorno `PORT`, `RACK_ENV` y `DATABASE_URL`
- Se declara una dependencia entre servicios. En particular que el servicio en cuestion necesita que el servicio `db` se creado primero antes de que se pueda crear `web`. 

En el caso del servicio `db`.

- Se especifica una imagen ya generada a utilizar.
- Se definen la variable de entorno `POSTGRES_PASSWORD`

> Dado que cada contenedor corre en forma aislada ¿Cómo es posible que esos contenedores se vean entre sí?

A partir de la version 2 compose genera una red donde se encuentran todos los contenedores que se generen. Todos son visibles entre si.