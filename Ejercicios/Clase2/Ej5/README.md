# Ej 5

## HEALTHCHECK

> The HEALTHCHECK instruction tells Docker how to test a container to check that it is still working. This can detect cases such as a web server that is stuck in an infinite loop and unable to handle new connections, even though the server process is still running.

No simepre alcanza con que el proceso este corriendo para saber que esta funcionando de manera correcta. Los healthcheck existen para probar con mas detalle el correcto funcionamiento y estado de una aplicacion. En el caso de las APIs suele ser un pedido HTTP que muestre que la app esta corriendo y que es capaz de acceder a la DB y hacer alguna otra tarea.

Args:
- `--interval=DURATION` (default: 30s)
- `--timeout=DURATION` (default: 30s)
- `--start-period`=DURATION (default: 0s)
- `--retries=N` (default: 3)

Como maximo **UN** healthcheck.

Ejemplo:
```
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
```

## VOLUME

Sirve para generar una conexion entre el filesystem del container con el del host.

TODO:es como expose? yo declaro puntos donde conectarse y la conexion se termina de realizar despues?

## ONBUILD

Sirve para correr comandos mas adelantes. En particular, es util para imagenes que van a ser usadas como imagenes base. Sirve para correr comandos de los cuales todavia no tenemos toda la informacion. Ej: necesitamos que el usuario copie su codigo en una carpeta y nosotros de ahi queremos moverla a otra.

## ADD vs COPY

COPY hace solo una parte de lo que puede hacer ADD. Conviene usar la herramienta que cumpla con la necesidad con lo minimo. Si alcanza con COPY, COPY.

`COPY --from` es para copiar entre containers en un multi-stage
copiar
ADD permite, ademas de copiar, clonar repositorios y copiar-y-extraer archivos tar.gz

https://stackoverflow.com/questions/24958140/what-is-the-difference-between-the-copy-and-add-commands-in-a-dockerfile

## ENTRYPOINT VS CMD

Van de la mano. Siempre estan en juego los dos. ENTRYPOINT es el comendo base y CMD el "argumento" de ENTRYPOINT. Por default ENTRYPOINT es `/bin/sh -c <cmd>`. El comando que se pase en el run o en CMD va a ser agregado en <cmd>. Redefinir el ENPOINT esta bueno cuando tengo un comando base que quiero repetir y modifico la forma de accederlo. Programas de CLI como redis.

https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile