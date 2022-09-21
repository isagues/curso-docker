# Creacion de Imagenes

Imagen => binario que no cambia.

Customizar con:
- variables de entorno
- montando volumenes

`-v` shortcut de `mount`. Toma algunas configuracion defaults (usa bind). Docker maneja el concepto de volumenes tambien. Los puedo generar y agregar al container. Lo mismo con el manejo de red. 

## Creacion de imagen

Tag no crea imagen, solo metadata.

- Buildeando una image
- Commiteando una imagen => Util/necesario cuando hay un proceso interactivo de configuracion. Ej: instalar via una GUI que necesita que interactue.

CMD => ultimo comando

Unico CMD (o ENTRY POINT) por dockerfile. Unico From que le da la imagen de base

Podria no tener un CMD?
- SI quiero correr cosas distintas en cada run
- Si quiero que sea una imagen base para otras imagenes
- Que el CMD este definido en la imagen base. No tiene que ser la ultima instruccion.

Usar el CMD de la imagen base estandariza el comportamiento.

Comando `USER`. Con que comando se va a ejecutar el contenedor. Conviene explicitar con que usuario se desea correr. No deberian correr como root, deberian correr con los permisos correctos.

## Layers

modificaciones en el filesystem. Se aplican una sobre otras. Funcionan como los commits.
Mientras mas lo pueda reutilizar mejor.

Por lo tanto, conviene organizar las layers de forma que el contenido que menos cambia sea el que primeor se agrega a la imagen y luego el contenido que cambia mas seguido. Para reutilizar las layers anteriores.

## Multi stage

Tienen sentido en casos donde hay que compilar el codigo. Por ejemplo, generar el .jar de la aplicacion.

La idea es diferenciar todo lo que hay que descargar para compilar y buildear con todo lo que se necesita para la ejecucion.

`FROM <img> AS build` defino imagen para buildeo. 

Se generan containers distintos

## Extra

Se puede genear un dockerfile que parta de nada. Lo minimo que se puede tener es un kernell pelado.

Si hay ejecutables que corren sin muchas necesidades de sistema operativo, se puede usar el from "vacio".

## Recomendacion

- Elegir con cuidado las imagenes base. De quien son que hace.
- Hacer buen uso de las layers para reutilizar.
- Exponer los puertos que se usan.
- Definir usuarios explicitos que no sean root.
- Esta bueno tener replicadas en el registry local las imagenes que quiero (jdk, alpine, lo que sea).
- No es necesario requerir versiones con hashes cuando trabajas con tu propio registry, ahi ya estas fijando las versiones.