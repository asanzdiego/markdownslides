% Markdown Slides [EN]
% Adolfo Sanz De Diego
% Septiembre 2019

# About

## What is it?

**MarkdownSlides** is a Reveal.js and PDF **slides** generator
**from MARKDOWN files**, that also generate HTML, EPUB and DOCX documents.

The idea is that **from a same MARKDOWN file we can get slides and books**
without worrying about style, just worrying about content.

------------------

![](../img/markdownslides.png)

## Samples

From a [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
generate:

  - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.html)
  - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.pdf)
  - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.epub)
  - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.html)
  - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.docx)

## Contributors

- Cesar Seoane: <https://github.com/cesarseoane>
- Rubén Gómez García: <https://github.com/kaneproject>
- Raul Jimenez Ortega: <https://github.com/hhkaos>

## ![Creative Commons Attribution 3.0](../img/cc-by-sa.png)

> - **This work is licensed under a:**
>       - [Creative Commons Attribution 3.0](http://creativecommons.org/licenses/by-sa/3.0//)
> - **The program source code are licensed under a:**
>       - [GPL 3.0](http://www.gnu.org/licenses/gpl.html)

# Instalation

## Dependencies

- It needs to be installed:
    - [Pandoc](http://johnmacfarlane.net/pandoc/)
    - [DeckTape](https://github.com/astefanutti/decktape)

 - It is automaticaly downloaded:
    - [Reveal.js](http://lab.hakim.se/reveal-js/#/)

## Requirements

Now, only works in Linux (may be on MacOS)

It can works with Docker, but is in beta.

## Download

[https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

## Docker

Your installation with docker is still **under testing**.

Any feedback is welcome.

### Building docker image 

It will be at dockerhub soon:

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

### Launch the container

Launch the container, product generated will be as **min** configuration 

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc \
    asanzdiego/markdownslides
~~~

Changing to **med** configuration

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc \
    asanzdiego/markdownslides ./build.sh med doc
~~~
     
Changing to **max** configuation

~~~
docker run -it -v ${PWD}/doc:/home/markdownslides/doc \
    asanzdiego/markdownslides ./build.sh max doc
~~~

# How to use

## Creation

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
  The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
  which are nothing more than plain text files with extension md,
  and a lightweight markup (we should know it but it is very simple).

## Notes

You can add notes that will be visible in book mode or if **you press the letter 's' on the slides**
with **@start-notes** and **@end-notes**.

~~~
@start-notes
This is only visible in book mode or if you press 's' on the slides.
@end-notes
~~~

@start-notes
This is only visible in book mode or if you press 's' on the slides.
@end-notes

## Levels

You can have as many levels as you want. Example:

~~~
# Level 1 (on slides and book)

## Level 2 (on slides and book)

### Level 3 (in book but stays level 2 in slides)
~~~

But only in books. In slides you can only have 2 levels.

## Numbering

You can name several slides with (I), (II), etc. But only the first one will be exported to the book. Example:

~~~
 ## Foo Bar (I)

 ## Foo Bar (II)
~~~

In the book will be:

~~~
 ## Foo Bar
~~~

## Configuration (I)

We can configure the files that we want to generate from the file **build.properties**

~~~{.bash}
BUILD_REVEAL_SLIDES='min'
BUILD_REVEAL_SLIDES_PDF='min'
BUILD_REVEAL_SLIDES_ALTERNATIVE='med'
BUILD_REVEAL_SLIDES_ALTERNATIVE_PDF='med'
BUILD_REVEAL_SLIDES_ONLINE='max'
BUILD_REVEAL_SLIDES_ONLINE_ALTERNATIVE='max'

BUILD_HTML_BOOK='min'
BUILD_DOCX_BOOK='med'
BUILD_EPUB_BOOK='max'
~~~

## Configuration (II)

We can also configure some other stufs from the file **build.properties**

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

We can also configure some other stufs aboout reveal.js from the file **build.properties**

~~~{.bash}
#THEME='black|white|league|sky|beige|simple|serif|blood|night|moon|solarized'
REVEAL_JS_THEME='beige'
REVEAL_JS_SHOW_TITLE_FOOTER='yes'
REVEAL_JS_DEFAULT_TITLE_FOOTER='yes'
REVEAL_JS_TITLE_FOOTER="'MarkdownSlides by @asanzdiego :-)'"
REVEAL_JS_SHOW_MENU='yes'
REVEAL_JS_ONLINE='yes'
~~~

## Build

In the root folder you have to execute:

~~~{.bash}
./build.sh [clean] [mode] [folder]
~~~

- [**clean**] clean the folder **lib** and download the dependencies again.

- [**mode**] can take the next values: **min, med o máx**.

- [**folder**] folder wher to find the md files. If no folder name, it will convert all md files of all the folders.

# Releases notes

## Relese 1.0 (I)

- Export slides to:
    - reveal-slides
    - reveal-slides-pdf
    - beamer-slides
    - deck-slides

## Relese 1.0 (II)

- Export books to:
    - html-book
    - docx-book
    - odt-book
    - pdf-book

## Relese 1.0 (III)

- Added generation modes 'min', 'med' and 'max'.
- Automatic download the external libraries.
- Numbering (I), (II), (III) ...

## Relese 2.0 (I)

- Export slides to:
    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-online

## Relese 2.0 (II)

- Export books to:
    - html-book
    - docx-book
    - epub-book

## Relese 2.0 (III)

- Deprecated:
    - beamer-slides
    - deck-slides
    - odt-book
    - pdf-book

## Relese 2.0 (III)

- Added menu thanks to [Raul Jimenez Ortega](https://github.com/hhkaos).
- Added dockerfile thanks to [Rubén Gómez García](https://github.com/kaneproject).
- Clean zip files from libraries thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Added type 'online' thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Fixed bug HTTPS images thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Loading the online libraries with HTTPS thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Configuration PDF resolution thanks to [Cesar Seoane](https://github.com/cesarseoane).

## Relese 2.0 (IV)

- New format 'epub'.
- Added 'bash strict mode'.
- Added 'build.properties' to configure file generation.
- Added command 'clean' to clean the lib folder.
- Download a specific version of external library.
- Added notes only visible in book mode or if you press 's' on the slides.
- Normalization of images in slides.

## Relese 3.0

- Clean the code.
- Remove deprecated exportation files.
- Improve de configuration in build.properties file.
- Update [Reveal.js](http://lab.hakim.se/reveal-js/#/) dependencies.
- Export to PDF with [DeckTape](https://github.com/astefanutti/decktape).
- Book creation from some md files with enumeration.
- Possibility of adding a footer to the slides.

# Author

## Adolfo Sanz De Diego

- **Old JEE web developer**.

- Now I'm **Tecnical Teacher Advaisor** in the TIC service of the General Direction of Infrastructure and Services of the Ministry of Education, Youth and Sports of the Community of Madrid.

- In addition I work as **trainer specialized in development technologies**.

## Algunos proyectos

- ![Hackathon Lovers](../img/hackathon-lovers-logo.png){height=30} [Hackathon Lovers](http://hackathonlovers.com): a group created for entrepreneurs and developers who loves hackathones.

- [Password Manager Generator](http://pasmangen.github.io): an online password manager.

- [MarkdownSlides](https://github.com/asanzdiego/markdownslides): a script to create slides from MD files.

## Where to find me?

- Mi nick: **asanzdiego**
    - Blog:       [asanzdiego.com](http://asanzdiego.com)
    - GitHub:     [github.com/asanzdiego](http://github.com/asanzdiego)
    - Twitter:    [twitter.com/asanzdiego](http://twitter.com/asanzdiego)
    - LinkedIn:   [linkedin.com/in/asanzdiego](http://www.linkedin.com/in/asanzdiego)
    - SlideShare: [slideshare.net/asanzdiego](http://www.slideshare.net/asanzdiego)