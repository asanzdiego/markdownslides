% Markdown Slides [ES]
% Adolfo Sanz De Diego
% Enero 2017

# Acerca de

## ¿Qué es esto? (I)

**MarkdownSlides** es un generador de **slides** Reveal.js y PDF
a **partir de ficheros MARKDOWN**,  que también genera documentos HTML, EPUB y DOCX.

La idea es que **a partir de un mismo fichero MARKDOWN podamos obtener slides y libros**
sin preocuparnos por el estilo, solo por el contenido.

## ¿Qué es esto? (II)

![](../img/markdownslides.png){ width=50% text-align=center }


## Ejemplos

A partir de un fichero [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/leeme.md)
genera:

  - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.html)
  - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.pdf)
  - [reveal-slides-online](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-online.html)
  - [reveal-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-alternative.html)
  - [reveal-slides-alternative-pdf](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-alternative.pdf)
  - [reveal-slides-alternative-online](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-online-alternative.html)
  - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.epub)
  - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.html)
  - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.docx)

## Colaboradores

- Cesar Seoane: <https://github.com/cesarseoane>
- Rubén Gómez García: <https://github.com/kaneproject>
- Raul Jimenez Ortega: <https://github.com/hhkaos>

## Licencia

- **Este obra está bajo una licencia:**

    - [Creative Commons Reconocimiento-CompartirIgual 3.0](http://creativecommons.org/licenses/by-sa/3.0/es/)

- **El código fuente de los programas están bajo una licencia:**

    - [GPL 3.0](http://www.viti.es/gnu/licenses/gpl.html)

# Instalación

## Dependencias

- Necesita ser instalado:

    - [Pandoc](http://johnmacfarlane.net/pandoc/)
    - [Phantom.js](http://phantomjs.org)

- Descargado automáticamente:

    - [Reveal.js](http://lab.hakim.se/reveal-js/#/)

## Requisitos

Por ahora, solo funciona en Linux (y puede que en MacOS).

Puede funcionar con Docker, pero todavía está en pruebas.

## Descarga

[https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

## Docker

Su instalación con docker está todavía **en pruebas**.

Cualquier feedback es bienvenido.

## Construir la imagen

Estará en Dockerhub pronto:

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

## Lanzar el contenedor

Lanzamos el contenedor con la configuración **min**

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides
~~~

Cambiando a configuración **med**

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides ./build.sh med doc
~~~
     
Cambiando a configuración **max**

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides ./build.sh max doc
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

<aside class="notes">
Esto solo es visible en modo libro o si pulsas 's' en las slides.
</aside> 

## Niveles

Puedes tener tantos niveles como quieras. Ejemplo:

~~~
# Nivel 1 (en slides y libro)

## Nivel 2 (en slides y libro)

## Nivel 3 (en libro pero se queda como nivel 2 en slides) 
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

## Configuración

Podemos configurar los ficheros que queremos generar desde el fichero **build.properties**

~~~{.bash}
BUILD_REVEAL_SLIDES='min'
BUILD_REVEAL_SLIDES_PDF='med'
BUILD_REVEAL_SLIDES_ONLINE='med'
BUILD_REVEAL_SLIDES_ALTERNATIVE='max'
BUILD_REVEAL_SLIDES_ALTERNATIVE_PDF='max'
BUILD_REVEAL_SLIDES_ALTERNATIVE_ONLINE='max'

BUILD_HTML_BOOK='min'
BUILD_DOCX_BOOK='med'
BUILD_EPUB_BOOK='max'
~~~

## Generación

- Hay que posicionarse en la carpeta raiz, y ejecutar:

~~~
./build.sh [clean] [modo] [carpeta]
~~~

    - Si añades [**clean**] se limpiará la carpeta **lib** y se volverán a bajar las dependencias.

    - [**modo**] puede tomar los siguientes valores: **min, med o máx**.

    - [**carpeta**] es la carpeta donde va a buscar los ficheros md. Si no se indica nada convertirá todos los ficheros md de todas las carpetas.

# Releases notes

## Relese 1.0 (I)

- Exporta slides a:

    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-alternative
    - reveal-slides-alternative-pdf
    - beamer-slides
    - deck-slides
    - deck-slides-alternative

## Relese 1.0 (II)

- Exporta books a:

    - html-book
    - docx-book
    - odt-book
    - pdf-book

## Relese 1.0 (III)

- Añadidos los modos de generación 'min', 'med' y 'max'.
- Descarga automática de librerías externas.
- Numeración (I), (II), (III)...

## Relese 2.0 (I)

- Exporta slides a:

    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-online
    - reveal-slides-alternative
    - reveal-slides-alternative-pdf
    - reveal-slides-alternative-online

## Relese 2.0 (II)

- Exporta books a:

    - html-book
    - docx-book
    - epub-book

## Relese 2.0 (III)

- Deprecated:

    - beamer-slides
    - deck-slides
    - deck-slides-alternative
    - odt-book
    - pdf-book

## Relese 2.0 (III)

- Añadido menú gracias a [Raul Jimenez Ortega](https://github.com/hhkaos).
- Añadido dockerfile gracías a [Rubén Gómez García](https://github.com/kaneproject).
- Limpieza de ficheros zip de las librerías gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Añadido tipo 'online' gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Arreglado fallo imágenes HTTPS gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Carga de librerias 'online' por HTTPS gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Configuración resolución PDF gracias a [Cesar Seoane](https://github.com/cesarseoane).

## Relese 2.0 (IV)

- Nuevo formato 'epub'.
- Añadido 'bash strict mode'.
- Añadido 'build.properties' para configurar la generación de ficheros.
- Añadido comando 'clean' para limpiar la carpeta lib.
- Descarga de una versión concreta de librería externa.
- Añadidas notas solo visibles en modo libro o si pulsas 's' en las slides.
- Normalización de imágenes en slides (witdh=50% y align=center).

# Autor

## Adolfo Sanz De Diego

- Empecé **desarrollando aplicaciones web**, hasta que di el salto a la docencia.

- Actualmente soy **Asesor Técnico Docente** en el servicio TIC de la D.G de Infraestructuras y Servicios de la Consejería de Educación, Juventud y Deporte de la Comunidad de Madrid.

- Además colaboro como **formador especializado en tecnologías de desarrollo**.

## Algunos proyectos

- **Hackathon Lovers** <http://hackathonlovers.com>: un grupo creado para emprendedores y desarrolladores amantes de los hackathones.

- **Password Manager Generator** <http://pasmangen.github.io>: un gestor de contraseñas online.

- **MarkdownSlides** <https://github.com/asanzdiego/markdownslides>: un script para crear slides a partir de ficheros MD.

## ¿Donde encontrarme?

- Mi nick: **asanzdiego**

    - AboutMe:    <http://about.me/asanzdiego>
    - GitHub:     <http://github.com/asanzdiego>
    - Twitter:    <http://twitter.com/asanzdiego>
    - Blog:       <http://asanzdiego.blogspot.com.es>
    - LinkedIn:   <http://www.linkedin.com/in/asanzdiego>
    - SlideShare: <http://www.slideshare.net/asanzdiego/>
    - Google+:    <http://plus.google.com/+AdolfoSanzDeDiego>