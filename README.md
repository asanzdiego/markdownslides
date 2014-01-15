# MarkdownSlides

## English

### What is it?

![](./doc/img/readme.png)

- **MarkdownSlides** is a HTML and PDF **slides** generator
  **from MARKDOWN files**.


### Samples

- From a [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
  generate [Plain HTML](http://asanzdiego.github.io/markdownslides/doc/export/readme.html), 
  [HTML Slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-slides.html)
  and [PDF Slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-slides.pdf)

### Dependencies

- [Pandoc](http://johnmacfarlane.net/pandoc/) (needs to be installed)
- [Phantom.js](http://phantomjs.org) (needs to be installed)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (downloaded automaticaly)

### Creation

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
  The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
  which are nothing more than plain text files with extension md,
  and a lightweight markup (we should know it but it is very simple).

- Once created the md files, we can **generate html, html-slides y pdf-slides with a script**.

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

![](./doc/img/leeme.png)

- **MarkdownSlides** es un generador de **slides** HTML y PDF
  a **partir de ficheros MARKDOWN**.

### Ejemplos

- A partir de un fichero [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/leeme.md)
  genera [HTML plano](http://asanzdiego.github.io/markdownslides/doc/export/leeme.html),
  [Slides en HTML](http://asanzdiego.github.io/markdownslides/doc/export/leeme-slides.html)
  y [Slides en PDF](http://asanzdiego.github.io/markdownslides/doc/export/leeme-slides.pdf)

### Dependencias

- [Pandoc](http://johnmacfarlane.net/pandoc/) (necesita ser instalado)
- [Phantom.js](http://phantomjs.org) (necesita ser instalado)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (descargado automaticamente)

### Creación

- Primero **copia la carpeta doc y renombrala a tu gusto**. Esto no es necesario pero
  te ayuda a organizar tus documentos.

- **Crea los ficheros md** que quieras generar en la **carpeta md**.
  Los ficheros md son ficheros [Markdown](http://es.wikipedia.org/wiki/Markdown),
  que no son nada más que ficheros de texto plano, con extensión md,
  y con un marcado ligero (que hay que conocer pero que es muy sencillo).

- Una vez creado los md, puedes **generar html, html-slides y pdf-slides con un script**.

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
