# Markdown Slides

* [English](#english)
* [Español](#español)

## English
      
* [About](#about)
  * [What is it?](#what-is-it)
  * [Samples](#samples)
  * [Contributors](#contributors)
  * [Licence](#licence)
* [Instalation](#instalation)
  * [Dependencies](#dependencies)
  * [Requirements](#requirements)
  * [Download](#download)
  * [Docker](#docker)
      * [Building docker image](#building-docker-image)
      * [Launch the container](#launch-the-container)
* [How to use](#how-to-use)
  * [Creation](#creation)
  * [Notes](#notes)
  * [Levels](#levels)
  * [Numbering](#numbering)
  * [Configuration](#configuration)
  * [Build](#build)
* [Releases notes](#releases-notes)
  * [Release 1.0](#release-10)
  * [Release 2.0](#release-20)
  * [Release 3.0](#release-30)

### About

#### What is it?

**MarkdownSlides** is a Reveal.js, Deck.js and PDF **slides** generator
**from MARKDOWN files**, that also generate HTML, EPUB and DOCX documents.

The idea is that **from a same MARKDOWN file we can get slides and books**
without worrying about style, just worrying about content.

![](./doc/img/markdownslides.png)

#### Samples

From a [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
generate:

  - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.html)
  - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.pdf)
  - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.epub)
  - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.html)
  - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.docx)

#### Contributors

- Cesar Seoane: <https://github.com/cesarseoane>
- Rubén Gómez García: <https://github.com/kaneproject>
- Raul Jimenez Ortega: <https://github.com/hhkaos>

#### Licence

- **This work is licensed under a:**
    - [Creative Commons Attribution 3.0](http://creativecommons.org/licenses/by-sa/3.0//)
- **The program source code are licensed under a:**
    - [GPL 3.0](http://www.gnu.org/licenses/gpl.html)

### Instalation

#### Dependencies

- It needs to be installed:
    - [Pandoc](http://johnmacfarlane.net/pandoc/)
    - [DeckTape](https://github.com/astefanutti/decktape)
- It is automaticaly downloaded:
    - [Reveal.js](http://lab.hakim.se/reveal-js/#/)

#### Requirements

Now, only works in Linux (may be on MacOS)

It can works with Docker, but is in beta.

#### Download

[github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

#### Docker

Your installation with docker is still **under testing**.

Any feedback is welcome.

##### Building docker image 

It will be at dockerhub soon:

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

##### Launch the container

Launch the container:

~~~
docker run -it -v "${PWD}":/home/markdownslides-master/"${PWD##*/}" asanzdiego/markdownslides ./build.sh [clean] [mode] [folder]
~~~

### How to use

#### Creation

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
  The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
  which are nothing more than plain text files with extension md,
  and a lightweight markup (we should know it but it is very simple).

#### Notes

You can add notes that will be visible in book mode or if **you press the letter 's' on the slides**
with **@start-notes** and **@end-notes**.

~~~
@start-notes
This is only visible in book mode or if you press 's' on the slides.
@end-notes
~~~

#### Levels

You can have as many levels as you want. Example:

~~~
# Level 1 (on slides and book)

## Level 2 (on slides and book)

### Level 3 (in book but stays level 2 in slides)
~~~

But only in books. In slides you can only have 2 levels.

#### Numbering

You can name several slides with (I), (II), etc. But only the first one will be exported to the book. Example:

~~~
## Foo Bar (I)

## Foo Bar (II)
~~~

In the book will be:

~~~
#### Foo Bar
~~~

#### Configuration

We can configure the files that we want to generate from the file **build.properties**

~~~{.bash}
#GENERATION_MODE='min|med|max'
DEFAULT_GENERATION_MODE='min'

BUILD_REVEAL_SLIDES='min'
BUILD_REVEAL_SLIDES_PDF='med'

BUILD_HTML_BOOK='max'
BUILD_DOCX_BOOK='max'
BUILD_EPUB_BOOK='max'
~~~

We can configure also some stufs from the file **build.properties**

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

We can configure also some stufs about reveal.js from the file **build.properties**

~~~{.bash}
#THEME='black|white|league|sky|beige|simple|serif|blood|night|moon|solarized'
REVEAL_JS_THEME='beige'
REVEAL_JS_SHOW_TITLE_FOOTER='yes'
REVEAL_JS_DEFAULT_TITLE_FOOTER='yes'
REVEAL_JS_TITLE_FOOTER="'MarkdownSlides by @asanzdiego :-)'"
REVEAL_JS_SHOW_MENU='yes'
REVEAL_JS_ONLINE='yes'
~~~

#### Build

- In the root folder you have to execute:

~~~
./build.sh [clean] [mode] [folder]
~~~

- [**clean**] clean the folder **lib** and download the dependencies again.

- [**mode**] can take the next values: **min, med o máx**.

- [**folder**] folder wher to find the md files. If no folder name, it will convert all md files of all the folders.

### Releases notes

#### Relese 1.0

- Export slides to:
    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-alternative
    - reveal-slides-alternative-pdf
    - beamer-slides
    - deck-slides
    - deck-slides-alternative
- Export books to:
    - html-book
    - docx-book
    - odt-book
    - pdf-book
- Added generation modes 'min', 'med' and 'max'.
- Automatic download the external libraries.
- Numbering (I), (II), (III) ...

#### Relese 2.0

- Export slides to:
    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-online
    - reveal-slides-alternative
    - reveal-slides-alternative-pdf
    - reveal-slides-alternative-online
- Export books to:
    - html-book
    - docx-book
    - epub-book
- Deprecated:
    - beamer-slides
    - deck-slides
    - deck-slides-alternative
    - odt-book
    - pdf-book
- Added menu thanks to [Raul Jimenez Ortega] (https://github.com/hhkaos).
- Added dockerfile thanks to [Rubén Gómez García] (https://github.com/kaneproject).
- Clean zip files from libraries thanks to [Cesar Seoane] (https://github.com/cesarseoane).
- Added type 'online' thanks to [Cesar Seoane] (https://github.com/cesarseoane).
- Fixed bug HTTPS images thanks to [Cesar Seoane] (https://github.com/cesarseoane).
- Loading the online libraries with HTTPS thanks to [Cesar Seoane] (https://github.com/cesarseoane).
- Configuration PDF resolution thanks to [Cesar Seoane] (https://github.com/cesarseoane).
- New format 'epub'.
- Added 'bash strict mode'.
- Added 'build.properties' to configure file generation.
- Added command 'clean' to clean the lib folder.
- Download a specific version of external library.
- Added notes only visible in book mode or if you press 's' on the slides.
- Normalization of images in slides (witdh = 50% and align = center).

#### Relese 3.0

- Clean the code.
- Remove deprecated exportation files.
- Improve de configuration in build.properties file.
- Update [Reveal.js](http://lab.hakim.se/reveal-js/#/) dependencies.
- Export to PDF with [DeckTape](https://github.com/astefanutti/decktape).
- New features.

## Español

* [Acerca de](#acerca-de)
  * [¿Qué es esto?](#qué-es-esto)
  * [Ejemplos](#ejemplos)
  * [Colaboradores](#colaboradores)
  * [Licencia](#licencia)
* [Instalación](#instalación)
  * [Dependencias](#dependencias)
  * [Requisitos](#requisitos)
  * [Descarga](#descarga)
  * [Docker](#docker-1)
      * [Construir la imagen](#construir-la-imagen)
      * [Lanzar el contenedor](#lanzar-el-contenedor)
* [Manejo](#manejo)
  * [Creación](#creación)
  * [Notas](#notas)
  * [Niveles](#niveles)
  * [Numeración](#numeración)
  * [Configuración](#configuración)
  * [Generación](#generación)
* [Notas de las versiones](#notas-de-las-versiones)
  * [version 1.0](#version-10)
  * [Versión 2.0](#version-20)
  * [Versión 3.0](#version-30)
  
### Acerca de

#### ¿Qué es esto?

**MarkdownSlides** es un generador de **slides** Reveal.js y PDF
a **partir de ficheros MARKDOWN**,  que también genera documentos HTML, EPUB y DOCX.

La idea es que **a partir de un mismo fichero MARKDOWN podamos obtener slides y libros**
sin preocuparnos por el estilo, solo por el contenido.

![](./doc/img/markdownslides.png)

#### Ejemplos

A partir de un fichero [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/leeme.md)
genera:

  - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.html)
  - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.pdf)
  - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.epub)
  - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.html)
  - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/leeme-book.docx)

#### Colaboradores

- Cesar Seoane: <https://github.com/cesarseoane>
- Rubén Gómez García: <https://github.com/kaneproject>
- Raul Jimenez Ortega: <https://github.com/hhkaos>

#### Licencia

- **Este obra está bajo una licencia:**
    - [Creative Commons Reconocimiento-CompartirIgual 3.0](http://creativecommons.org/licenses/by-sa/3.0/es/)
- **El código fuente de los programas están bajo una licencia:**
    - [GPL 3.0](http://www.viti.es/gnu/licenses/gpl.html)

### Instalación

#### Dependencias

- Necesita ser instalado:
    - [Pandoc](http://johnmacfarlane.net/pandoc/)
    - [DeckTape](https://github.com/astefanutti/decktape)
- Descargado automáticamente:
    - [Reveal.js](http://lab.hakim.se/reveal-js/#/)

#### Requisitos

Por ahora, solo funciona en Linux (y puede que en MacOS).

Puede funcionar con Docker, pero todavía está en pruebas.

#### Descarga

[github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

#### Docker

Su instalación con docker está todavía **en pruebas**.

Cualquier feedback es bienvenido.

##### Construir la imagen

Estará en Dockerhub pronto:

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

##### Lanzar el contenedor

Lanzamos el contenedor:

~~~
docker run -it -v ${PWD}:/home/master asanzdiego/markdownslides ./build.sh [clean] [mode] [folder]
~~~

### Manejo

#### Creación

Primero **copia la carpeta doc y renombrala a tu gusto**. Esto no es necesario pero
te ayuda a organizar tus documentos.

**Crea los ficheros md** que quieras generar en la **carpeta md**.
Los ficheros md son ficheros [Markdown](http://es.wikipedia.org/wiki/Markdown),
que no son nada más que ficheros de texto plano, con extensión md,
y con un marcado ligero (que hay que conocer pero que es muy sencillo).

#### Notas

Puedes añadir notas que serán visibles en modo libro o si **pulsas la letra 's' en las slides**
mediante **@start-notes** y **@end-notes**.

~~~
@start-notes
Esto solo es visible en modo libro o si pulsas 's' en las slides.
@end-notes 
~~~

#### Niveles

Puedes tener tantos niveles como quieras. Ejemplo:

~~~
### Nivel 1 (en slides y libro)

#### Nivel 2 (en slides y libro)

##### Nivel 3 (en libro pero se queda como nivel 2 en slides) 
~~~

Pero sólo en los libros. En las slides solo puedes tener 2 niveles.

#### Numeración

Puedes nombrar igual varias slides con (I), (II), etc. pero luego solo el primero será exportado al libro. Ejemplo:

~~~
#### Foo Bar (I)

#### Foo Bar (II)
~~~

En el libro quedará:

~~~
#### Foo Bar
~~~

#### Configuración

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

#### Generación

- Hay que posicionarse en la carpeta raiz, y ejecutar:

~~~
./build.sh [clean] [modo] [carpeta]
~~~

- [**clean**] limpia la carpeta **lib** y vuelve a a bajar las dependencias.

- [**modo**] puede tomar los valores: **min, med o máx**.

- [**carpeta**] donde va a buscar los ficheros md. Si no se indica nada convertirá todos los ficheros md de todas las carpetas.

### Releases notes

#### Relese 1.0

- Exporta slides a:
    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-alternative
    - reveal-slides-alternative-pdf
    - beamer-slides
    - deck-slides
    - deck-slides-alternative
- Exporta books a:
    - html-book
    - docx-book
    - odt-book
    - pdf-book
- Añadidos los modos de generación 'min', 'med' y 'max'.
- Descarga automática de librerías externas.
- Numeración (I), (II), (III)...

#### Relese 2.0

- Exporta slides a:
    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-online
    - reveal-slides-alternative
    - reveal-slides-alternative-pdf
    - reveal-slides-alternative-online
- Exporta books a:
    - html-book
    - docx-book
    - epub-book
- Deprecated:
    - beamer-slides
    - deck-slides
    - deck-slides-alternative
    - odt-book
    - pdf-book
- Añadido menú gracias a [Raul Jimenez Ortega](https://github.com/hhkaos).
- Añadido dockerfile gracías a [Rubén Gómez García](https://github.com/kaneproject).
- Limpieza de ficheros zip de las librerías gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Añadido tipo 'online' gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Arreglado fallo imágenes HTTPS gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Carga de librerias 'online' por HTTPS gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Configuración resolución PDF gracias a [Cesar Seoane](https://github.com/cesarseoane).
- Nuevo formato 'epub'.
- Añadido 'bash strict mode'.
- Añadido 'build.properties' para configurar la generación de ficheros.
- Añadido comando 'clean' para limpiar la carpeta lib.
- Descarga de una versión concreta de librería externa.
- Añadidas notas solo visibles en modo libro o si pulsas 's' en las slides.
- Normalización de imágenes en slides (witdh=50% y align=center).

#### Relese 3.0

- Limpieza de código.
- Eliminada la exportación de archivos "deprecated".
- Mejora de la configuración en el fichero build.properties.
- Actualización de las dependencias de [Reveal.js](http://lab.hakim.se/reveal-js/#/).
- Exportación a PDF con [DeckTape](https://github.com/astefanutti/decktape).
- Nuevas funcionalidades.