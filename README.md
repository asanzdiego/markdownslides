# Markdown Slides

## English

### What is it?

- **MarkdownSlides** is a Reveal.js, Deck.js and PDF **slides** generator
  **from MARKDOWN files**, that also generate HTML, ODT and DOCX documents.

![](./doc/img/markdownslides.png)

### Samples

- From a [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
  generate:

    - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.html)
    - [reveal-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-alternative.html)
    - [reveal-pdf-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.pdf)
    - [reveal-pdf-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-alternative.pdf)
    - [deck-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-deck-slides.html)
    - [deck-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/readme-deck-slides-alternative.html)
    - [pdf-beamer](http://asanzdiego.github.io/markdownslides/doc/export/readme-beamer.pdf)
    - [pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme.pdf)
    - [html](http://asanzdiego.github.io/markdownslides/doc/export/readme.html)
    - [docx](http://asanzdiego.github.io/markdownslides/doc/export/readme.docx)
    - [odt](http://asanzdiego.github.io/markdownslides/doc/export/readme.odt)

### Dependencies

- [Pandoc](http://johnmacfarlane.net/pandoc/) (needs to be installed)
- [Phantom.js](http://phantomjs.org) (needs to be installed)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (downloaded automaticaly)
- [Deck.js](http://imakewebthings.com/deck.js/) (automaticaly downloaded)
- Now, only works in Linux (may be on MacOS)

## Download

- [https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

### Creation

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
  The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
  which are nothing more than plain text files with extension md,
  and a lightweight markup (we should know it but it is very simple).

- Once created the md files, **we can generate with an script**.

    - reveal-slides
    - reveal-pdf-slides
    - deck-slides
    - pdf-beamer
    - pdf
    - html
    - docx
    - odt

### Build

- To **convert all md files of all the folders**
  go to the root folder and execute:

~~~
   ./build.sh
~~~

- To **convert all md files of one folder**
  go to the root folder and execute:

~~~
   ./build.sh [folder_name]
~~~

## Licence

- **This work is licensed under a:**
    - [Creative Commons Attribution 3.0](http://creativecommons.org/licenses/by-sa/3.0//)

- **The program source code are licensed under a:**
    - [GPL 3.0](http://www.gnu.org/licenses/gpl.html)

## Español

### ¿Qué es esto?

- **MarkdownSlides** es un generador de **slides** Reveal.js, Deck.js y PDF
  a **partir de ficheros MARKDOWN**,  que también genera documentos HTML, ODT y DOCX.

![](./doc/img/markdownslides.png)

### Ejemplos

- A partir de un fichero [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/leeme.md)
  genera:

    - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.html)
    - [reveal-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-alternative.html)
    - [reveal-pdf-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides.pdf)
    - [reveal-pdf-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/leeme-reveal-slides-alternative.pdf)
    - [deck-slides](http://asanzdiego.github.io/markdownslides/doc/export/leeme-deck-slides.html)
    - [deck-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/leeme-deck-slides-alternative.html)
    - [pdf-beamer](http://asanzdiego.github.io/markdownslides/doc/export/leeme-beamer.pdf)
    - [pdf](http://asanzdiego.github.io/markdownslides/doc/export/leeme.pdf)
    - [html](http://asanzdiego.github.io/markdownslides/doc/export/leeme.html)
    - [docx](http://asanzdiego.github.io/markdownslides/doc/export/leeme.docx)
    - [odt](http://asanzdiego.github.io/markdownslides/doc/export/leeme.odt)

### Dependencias

- [Pandoc](http://johnmacfarlane.net/pandoc/) (necesita ser instalado)
- [Phantom.js](http://phantomjs.org) (necesita ser instalado)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (descargado automaticamente)
- [Deck.js](http://imakewebthings.com/deck.js/) (bajado automáticamente)
- Por ahora, solo funciona en Linux (y puede que en MacOS)

## Download

- [https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

### Creación

- Primero **copia la carpeta doc y renombrala a tu gusto**. Esto no es necesario pero
  te ayuda a organizar tus documentos.

- **Crea los ficheros md** que quieras generar en la **carpeta md**.
  Los ficheros md son ficheros [Markdown](http://es.wikipedia.org/wiki/Markdown),
  que no son nada más que ficheros de texto plano, con extensión md,
  y con un marcado ligero (que hay que conocer pero que es muy sencillo).

- Una vez creado los md, **podemos generar con un script**: 

    - reveal-slides
    - reveal-pdf-slides
    - deck-slides
    - pdf-beamer
    - pdf
    - html
    - docx
    - odt

### Generación

- Para **convertir todos los ficheros md de todas las carpetas**
  hay que posicionarse en la carpeta raiz, y ejecutar:

~~~
   ./build.sh
~~~

- Para **convertir todos los ficheros md de una carpeta**
  hay que posicionarse en la carpeta raiz, y ejecutar:

~~~
   ./build.sh [nombre_de_carpeta]
~~~

### Licencia

- **Este obra está bajo una licencia:**
    - [Creative Commons Reconocimiento-CompartirIgual 3.0](http://creativecommons.org/licenses/by-sa/3.0/es/)

- **El código fuente de los programas están bajo una licencia:**
    - [GPL 3.0](http://www.viti.es/gnu/licenses/gpl.html)
