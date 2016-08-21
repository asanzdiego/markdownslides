% Markdown Slides [ES]
% Adolfo Sanz De Diego
% Septiembre 2016

# Acerca de

## ¿Qué es esto? (I)

- **MarkdownSlides** es un generador de **slides** Reveal.js, Deck.js y PDF
  a **partir de ficheros MARKDOWN**,  que también genera documentos HTML, ODT y DOCX.

## ¿Qué es esto? (II)

![](../img/markdownslides.png)

## Ejemplos

- A partir de un fichero [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/leeme.md)
  genera:

    - [deck-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-deck-slides.html)
    - [deck-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/leeme-deck-slides-alternative.html)
    - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.html)
    - [reveal-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-alternative.html)
    - [reveal-pdf-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.pdf)
    - [reveal-pdf-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-alternative.pdf)
    - [html](http://asanzdiego.github.io/markdownslides/doc/export/leeme.html)
    - [docx](http://asanzdiego.github.io/markdownslides/doc/export/leeme.docx)
    - [odt](http://asanzdiego.github.io/markdownslides/doc/export/leeme.odt)

## Licencia

- **Este obra está bajo una licencia:**
    - [Creative Commons Reconocimiento-CompartirIgual 3.0](http://creativecommons.org/licenses/by-sa/3.0/es/)

- **El código fuente de los programas están bajo una licencia:**
    - [GPL 3.0](http://www.viti.es/gnu/licenses/gpl.html)

# Instalación y manejo

## Dependencias

- [Pandoc](http://johnmacfarlane.net/pandoc/) (necesita ser instalado)
- [Phantom.js](http://phantomjs.org) (necesita ser instalado)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (bajado automáticamente)
- [Deck.js](http://imakewebthings.com/deck.js/) (bajado automáticamente)
- Por ahora, solo funciona en Linux (y puede que en MacOS)

## Descarga

- [https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

## Creación (I)

- Primero **copia la carpeta doc y renombrala a tu gusto**. Esto no es necesario pero
  te ayuda a organizar tus documentos.

- **Crea los ficheros md** que quieras generar en la **carpeta md**.
  Los ficheros md son ficheros [Markdown](http://es.wikipedia.org/wiki/Markdown),
  que no son nada más que ficheros de texto plano, con extensión md,
  y con un marcado ligero (que hay que conocer pero que es muy sencillo).

## Creación (II)

- Una vez creado los md, **podemos generar con un script**:

    - reveal-slides
    - reveal-pdf-slides
    - deck-slides
    - pdf-beamer
    - pdf
    - html
    - docx
    - odt

## Generación

- Hay que posicionarse en la carpeta raiz, y ejecutar:

~~~
./build.sh [modo] [carpeta]
~~~

- Donde [**modo**] puede tomar los siguientes valores:

    - "**min**": genera deck-slides y html plano.
    - "**med**": genera ademas reveal-slides, docx y odt (**valor por defecto**)
    - "**max**": genera todos los formatos.

- Y donde [**carpeta**] es la carpeta donde va a buscar
  los ficheros md. Si no se indica nada convertirá todos los ficheros md
  de todas las carpetas.

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

    - AboutMe:  <http://about.me/asanzdiego>
    - GitHub:   <http://github.com/asanzdiego>
    - Twitter:  <http://twitter.com/asanzdiego>
    - Blog:     <http://asanzdiego.blogspot.com.es>
    - LinkedIn: <http://www.linkedin.com/in/asanzdiego>
    - Google+:  <http://plus.google.com/+AdolfoSanzDeDiego>
