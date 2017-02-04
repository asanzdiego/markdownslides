# Markdown Slides


## English

### About

#### What is it?

- **MarkdownSlides** is a Reveal.js, Deck.js and PDF **slides** generator
  **from MARKDOWN files**, that also generate HTML, EPUB and DOCX documents.

- The idea is that **from a same MARKDOWN file we can get slides and books**
  without worrying about style, just worrying about content.

![](./doc/img/markdownslides.png)

#### Samples

- From a [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
  generate:

    - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.html)
    - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.pdf)
    - [reveal-slides-online](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-online.html)
    - [reveal-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-alternative.html)
    - [reveal-slides-alternative-pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-alternative.pdf)
    - [reveal-slides-alternative-online](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-online-alternative.html)
    - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.epub)
    - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.html)
    - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.docx)

#### Licence

- **This work is licensed under a:**
    - [Creative Commons Attribution 3.0](http://creativecommons.org/licenses/by-sa/3.0//)

- **The program source code are licensed under a:**
    - [GPL 3.0](http://www.gnu.org/licenses/gpl.html)

### Instalation and how to use

#### Dependencies

- [Pandoc](http://johnmacfarlane.net/pandoc/) (needs to be installed)
- [Phantom.js](http://phantomjs.org) (needs to be installed)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (automaticaly downloaded)
- [Deck.js](http://imakewebthings.com/deck.js/) (automaticaly downloaded)
- Now, only works in Linux (may be on MacOS)
- It can works with Docker, but is in beta.

#### Download

- [https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

#### Docker (Under testing)!

- Building docker image (It will be at dockerhub soon!)

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

- Process to launch container
    
     - Need the directory template doc, or your personalized directory to generate your md files and to receive the exports as usual
     
- Launch the container, product generated will be as **min** configuration 

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides
~~~
     
- Changing to **med** configuration

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides ./build.sh med doc
~~~
     
- Changing to **max** configuation

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides ./build.sh max doc
~~~

#### Creation

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
  The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
  which are nothing more than plain text files with extension md,
  and a lightweight markup (we should know it but it is very simple).

#### Configuration

- We can configure the files that we want to generate from the file **build.properties**

~~~{.bash}
BUILD_REVEAL_SLIDES='min'
BUILD_REVEAL_SLIDES_PDF='med'
BUILD_REVEAL_SLIDES_ONLINE='med'
BUILD_REVEAL_SLIDES_ALTERNATIVE='max'
BUILD_REVEAL_SLIDES_ALTERNATIVE_PDF='max'
BUILD_REVEAL_SLIDES_ALTERNATIVE_ONLINE='max'

BUILD_HTML_BOOK='min'
BUILD_DOCX_BOOK='med'
BUILD_ODT_BOOK='max'
BUILD_EPUB_BOOK='max'
~~~

#### Build

- In the root folder you have to execute:

~~~
./build.sh [clean] [mode] [folder]
~~~

- If you add [**cleaN**] the folder **lib** will be cleaned and the dependencies will be downloaded again.

- [**mode**] can take the next values: **min, med o máx**.

- [**folder**] is the name of the folder wher to find
  the md files. If no folder name, it will convert all md files of all the folders.

## Español

### Acerca de

#### ¿Qué es esto?

- **MarkdownSlides** es un generador de **slides** Reveal.js y PDF
  a **partir de ficheros MARKDOWN**,  que también genera documentos HTML, EPUB y DOCX.

- La idea es que **a partir de un mismo fichero MARKDOWN podamos obtener slides y libros**
  sin preocuparnos por el estilo, solo por el contenido.

![](./doc/img/markdownslides.png)

#### Ejemplos

- A partir de un fichero [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/leeme.md)
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


#### Licencia

- **Este obra está bajo una licencia:**
    - [Creative Commons Reconocimiento-CompartirIgual 3.0](http://creativecommons.org/licenses/by-sa/3.0/es/)

- **El código fuente de los programas están bajo una licencia:**
    - [GPL 3.0](http://www.viti.es/gnu/licenses/gpl.html)

### Instalación y manejo

#### Dependencias

- [Pandoc](http://johnmacfarlane.net/pandoc/) (necesita ser instalado)
- [Phantom.js](http://phantomjs.org) (necesita ser instalado)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (bajado automáticamente)
- [Deck.js](http://imakewebthings.com/deck.js/) (bajado automáticamente)
- Por ahora, solo funciona en Linux (y puede que en MacOS)
- Puede funcionar con Docker, pero todavía está en beta.

#### Descarga

- [https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

##### Docker (En pruebas)!

- Construyendo la imagen (Estará en Dockerhub pronto)

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

- Proceso para lanzar el contenedor

     - Necesitamos el directorio plantilla doc, o tu directorio personalizado para generar los ficheros md y recibir los exports como siempre
     
- Lanzamos el contenedor, el producto generado sera como la configuración **min**

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides
~~~

- Cambiando a configuración **med**

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides ./build.sh med doc
~~~
     
- Cambiando a configuración **max**

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc asanzdiego/markdownslides ./build.sh max doc
~~~

#### Creación

- Primero **copia la carpeta doc y renombrala a tu gusto**. Esto no es necesario pero
  te ayuda a organizar tus documentos.

- **Crea los ficheros md** que quieras generar en la **carpeta md**.
  Los ficheros md son ficheros [Markdown](http://es.wikipedia.org/wiki/Markdown),
  que no son nada más que ficheros de texto plano, con extensión md,
  y con un marcado ligero (que hay que conocer pero que es muy sencillo).

#### Configuración

- Podemos configurar los ficheros que queremos generar desde el fichero **build.properties**

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

#### Generación

- Hay que posicionarse en la carpeta raiz, y ejecutar:

~~~
./build.sh [clean] [modo] [carpeta]
~~~

- Si añades [**clean**] se limpiará la carpeta **lib** y se volverán a bajar las dependencias.

- [**modo**] puede tomar los siguientes valores: **min, med o máx**.

- [**carpeta**] es la carpeta donde va a buscar los ficheros md.
  Si no se indica nada convertirá todos los ficheros md de todas las carpetas.