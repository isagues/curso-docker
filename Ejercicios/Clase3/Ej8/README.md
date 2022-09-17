# Ejercicio 8

Para ejecutarlo hay que correr `docker compose up -d`. `-d` permite que corra en background, podria sacarse.

Se necesita una version de Docker Engine igual o superior a `19.03.0`.

## Replicas

`compose-replicas.yml` es un segundo intento usando la directiva de `deploy:replicas`. La idea es poder escalar la cantidad de containers sin tener que repetir su configuracion.

Se puede correr con `docker compose -f compose-replicas.yml up -d --build`

En este caso links no me funciono bien, solo linkea una de las replicas. Por eso se usa el nombre de `backend` y no el de `app` que se asignaba en links.

En este caso, cuando se declara el upstream de nginx, como el dominio `backend` resuleve a muchas IPs, se generan multiples servers y se produce el balance. 