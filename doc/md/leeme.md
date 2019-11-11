% Markdown Slides [ES]
% Adolfo Sanz De Diego
% @asanzdiego

# Acerca de

## ¿Qué es esto?

**MarkdownSlides** es un generador de **slides** Reveal.js y PDF
a **partir de ficheros MARKDOWN**,  que también genera documentos HTML, EPUB y DOCX.

La idea es que **a partir de un mismo fichero MARKDOWN podamos obtener slides y libros**
sin preocuparnos por el estilo, solo por el contenido.

------------------

![](../img/markdownslides.png)

## Ejemplos

A partir de un fichero [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/leeme.md)
genera:

  - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme.html)
  - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/leeme.pdf)
  - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.epub)
  - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.html)
  - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.docx)

## Colaboradores

- Cesar Seoane: <https://github.com/cesarseoane>
- Rubén Gómez García: <https://github.com/kaneproject>
- Raul Jimenez Ortega: <https://github.com/hhkaos>

## Licencia

> - **Este obra está bajo una licencia:**
>       - [Creative Commons Reconocimiento-CompartirIgual 3.0](http://creativecommons.org/licenses/by-sa/3.0/es/)
> - **El código fuente de los programas están bajo una licencia:**
>       - [GPL 3.0](http://www.viti.es/gnu/licenses/gpl.html)

# Instalación

## Dependencias

- Necesita ser instalado:
    - [Pandoc](http://johnmacfarlane.net/pandoc/)
    - [DeckTape](https://github.com/astefanutti/decktape)

- Descargado automáticamente:
    - [Reveal.js](http://lab.hakim.se/reveal-js/#/)

## Requisitos

Por ahora, solo funciona en Linux (y puede que en MacOS).

Puede funcionar con Docker, pero todavía está en pruebas.

## Descarga

[github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

## Docker

Su instalación con docker está todavía **en pruebas**.

Cualquier feedback es bienvenido.

### Construir la imagen

Estará en Dockerhub pronto:

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

### Lanzar el contenedor

Lanzamos el contenedor:

~~~
docker run -it -v "${PWD}":/home/markdownslides-master/"${PWD##*/}" \
    asanzdiego/markdownslides ./build.sh [clean] [mode] [folder]
~~~

# Manejo

## Creación

Primero **copia la carpeta doc y renombrala a tu gusto**. Esto no es necesario pero
te ayuda a organizar tus documentos.

**Crea los ficheros md** que quieras generar en la **carpeta md**.
Los ficheros md son ficheros [Markdown](http://es.wikipedia.org/wiki/Markdown),
que no son nada más que ficheros de texto plano, con extensión md,
y con un marcado ligero (que hay que conocer pero que es muy sencillo).

## Notas

Puedes añadir notas que serán visibles en modo libro o si **pulsas la letra 's' en las slides**
mediante **@start-notes** y **@end-notes**.

~~~
@start-notes
Esto solo es visible en modo libro o si pulsas 's' en las slides.
@end-notes 
~~~

@start-notes
Esto solo es visible en modo libro o si pulsas 's' en las slides.
@end-notes 

## Niveles

Puedes tener tantos niveles como quieras. Ejemplo:

~~~
# Nivel 1 (en slides y libro)

## Nivel 2 (en slides y libro)

### Nivel 3 (en libro pero se queda como nivel 2 en slides) 
~~~

Pero sólo en los libros. En las slides solo puedes tener 2 niveles.

## Numeración

Puedes nombrar igual varias slides con (I), (II), etc. pero luego solo el primero será exportado al libro. Ejemplo:

~~~
 ## Foo Bar (I)

 ## Foo Bar (II)
~~~

En el libro quedará:

~~~
 ## Foo Bar
~~~

## Configuración (I)

Podemos configurar los ficheros que queremos generar desde el fichero **build.properties**

~~~{.bash}
#GENERATION_MODE='min|med|max'
DEFAULT_GENERATION_MODE='min'

BUILD_REVEAL_SLIDES='min'
BUILD_REVEAL_SLIDES_PDF='med'

BUILD_HTML_BOOK='max'
BUILD_DOCX_BOOK='max'
BUILD_EPUB_BOOK='max'
~~~

## Configuración (II)

Podemos configurar también algunas cosas más desde el fichero **build.properties**

~~~{.bash}
CLEAN_LIB_FOLDER='no'
COPY_IMG_FOLDER='no'
ZIP_EXPORT_FOLDER='no'
NUMBER_SECTIONS='yes'
NUMBER_OFFSET='no'
CURRENT_NUMBER_OFFSET=1
REMOVE_MD_TO_BOOK='yes'
REMOVE_MD_TO_SLIDES='yes'
~~~

## Configuración (III)

Podemos configurar también algunas cosas más sobre reveal.js desde el fichero **build.properties**

~~~{.bash}
#THEME='black|white|league|sky|beige|simple|serif|blood|night|moon|solarized'
REVEAL_JS_THEME='beige'
REVEAL_JS_SHOW_TITLE_FOOTER='yes'
REVEAL_JS_DEFAULT_TITLE_FOOTER='yes'
REVEAL_JS_TITLE_FOOTER="'MarkdownSlides by @asanzdiego :-)'"
REVEAL_JS_SHOW_MENU='yes'
REVEAL_JS_ONLINE='yes'
~~~

## Generación

Hay que posicionarse en la carpeta raiz, y ejecutar:

~~~{.bash}
./build.sh [clean] [modo] [carpeta]
~~~

- [**clean**] limpia la carpeta **lib** y vuelve a a bajar las dependencias.

- [**modo**] puede tomar los valores: **min, med o máx**.

- [**carpeta**] donde va a buscar los ficheros md. Si no se indica nada convertirá todos los ficheros md de todas las carpetas.

# Releases notes

## Versión 1.0 (I)

- Exporta slides a:
    - reveal-slides
    - reveal-slides-pdf
    - beamer-slides
    - deck-slides

## Versión 1.0 (II)

- Exporta books a:
    - html-book
    - docx-book
    - odt-book
    - pdf-book

## Versión 1.0 (III)

- Añadidos los modos de generación 'min', 'med' y 'max'.
- Descarga automática de librerías externas.
- Numeración (I), (II), (III)...

## Versión 2.0 (I)

- Exporta slides a:
    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-online

## Versión 2.0 (II)

- Exporta books a:
    - html-book
    - docx-book
    - epub-book

## Versión 2.0 (III)

- Deprecated:
    - beamer-slides
    - deck-slides
    - odt-book
    - pdf-book

## Versión 2.0 (III)

- Añadido menú gracias a [Raúl Jimenez Ortega](https://github.com/hhkaos)
- Añadido dockerfile gracías a [Rubén Gómez García](https://github.com/kaneproject)
- Limpieza de ficheros zip de las librerías gracias a [Cesar Seoane](https://github.com/cesarseoane)
- Añadido tipo 'online' gracias a [Cesar Seoane](https://github.com/cesarseoane)
- Arreglado fallo imágenes HTTPS gracias a [Cesar Seoane](https://github.com/cesarseoane)
- Carga de librerias 'online' por HTTPS gracias a [Cesar Seoane](https://github.com/cesarseoane)
- Configuración resolución PDF gracias a [Cesar Seoane](https://github.com/cesarseoane)

## Versión 2.0 (IV)

- Nuevo formato 'epub'.
- Añadido 'bash strict mode'.
- Añadido 'build.properties' para configurar la generación de ficheros.
- Añadido comando 'clean' para limpiar la carpeta lib.
- Descarga de una versión concreta de librería externa.
- Añadidas notas solo visibles en modo libro o si pulsas 's' en las slides.
- Normalización de imágenes en slides.

## Versión 3.0

- Limpieza de código.
- Eliminada la exportación de archivos "deprecated".
- Actualización de las dependencias de [Reveal.js](http://lab.hakim.se/reveal-js/#/).
- Exportación a PDF con [DeckTape](https://github.com/astefanutti/decktape).
- Creación de libro de varios ficheros md con numeración.
- Posibilidad de añadir un footer a las slides.

## Versión 4.0

- Arreglados algunos fallos.
- Añadidos marcadores a las transparncias.
- Mejorado los nombre de ficheros.

# ![Adolfo Sanz De Diego](../img/asanzdiego.png){style=box-shadow:none;vertical-align:middle;width:100px;} Autor

## Adolfo Sanz De Diego

- Empecé **desarrollando aplicaciones web**, hasta que di el salto a la docencia.

- Actualmente soy **Asesor Técnico Docente** en el servicio TIC de la D.G de Infraestructuras y Servicios de la Consejería de Educación, Juventud y Deporte de la Comunidad de Madrid.

- Además colaboro como **formador especializado en tecnologías de desarrollo**.

## Algunos proyectos

- ![Hackathon Lovers](../img/hackathon-lovers-logo.png){height=30} [Hackathon Lovers](http://hackathonlovers.com): un grupo creado para emprendedores y desarrolladores amantes de los hackathones.

- [Password Manager Generator](http://pasmangen.github.io): un gestor de contraseñas online.

- [MarkdownSlides](https://github.com/asanzdiego/markdownslides): un script para crear slides a partir de ficheros MD.

## ¿Donde encontrarme?

- Mi nick: **asanzdiego**
    - Blog:       [asanzdiego.com](http://asanzdiego.com)
    - GitHub:     [github.com/asanzdiego](http://github.com/asanzdiego)
    - Twitter:    [twitter.com/asanzdiego](http://twitter.com/asanzdiego)
    - LinkedIn:   [linkedin.com/in/asanzdiego](http://www.linkedin.com/in/asanzdiego)
    - SlideShare: [slideshare.net/asanzdiego](http://www.slideshare.net/asanzdiego)