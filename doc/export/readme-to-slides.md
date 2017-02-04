% Markdown Slides [EN]
% Adolfo Sanz De Diego
% September 2016

# About

## What is it? (I)

- **MarkdownSlides** is a Reveal.js, Deck.js and PDF **slides** generator
  **from MARKDOWN files**, that also generate HTML, EPUB and DOCX documents.

- The idea is that **from a same MARKDOWN file we can get slides and books**
  without worrying about style, just worrying about content.

## What is it? (II)

![](../img/markdownslides.png)

## Samples

- From a [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
  generate:

    - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.html)
    - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides.pdf)
    - [reveal-slides-online](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-online.html)
    - [reveal-slides-alternative](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-alternative.html)
    - [reveal-slides-alternative-pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-alternative.pdf)
    - [reveal-slides-alternative-online](http://asanzdiego.github.io/markdownslides/doc/export/readme-reveal-slides-online-alternative.html)
    - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.html)
    - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.docx)
    - [odt-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.odt)
    - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.epub)

## Licence

- **This work is licensed under a:**
    - [Creative Commons Attribution 3.0](http://creativecommons.org/licenses/by-sa/3.0//)

- **The program source code are licensed under a:**
    - [GPL 3.0](http://www.gnu.org/licenses/gpl.html)

# Instalation and how to use

## Dependencies

- [Pandoc](http://johnmacfarlane.net/pandoc/) (needs to be installed)
- [Phantom.js](http://phantomjs.org) (needs to be installed)
- [Reveal.js](http://lab.hakim.se/reveal-js/#/) (automaticaly downloaded)
- [Deck.js](http://imakewebthings.com/deck.js/) (automaticaly downloaded)
- Now, only works in Linux (may be on MacOS)
- It can works with Docker, but is in beta.

## Download

- [https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

## Creation (I)

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
  The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
  which are nothing more than plain text files with extension md,
  and a lightweight markup (we should know it but it is very simple).

## Configuration

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

## Build

- In the root folder you have to execute:

~~~
./build.sh [clean] [mode] [folder]
~~~

- If you add [**cleaN**] the folder **lib** will be cleaned and the dependencies will be downloaded again.

- [**mode**] can take the next values: **min, med o máx**.

- [**folder**] is the name of the folder wher to find
  the md files. If no folder name, it will convert all md files of all the folders.

# Author

## Adolfo Sanz De Diego

- **Old JEE web developer**.

- Now I'm **Tecnical Teacher Advaisor** in the TIC service of the General Direction of Infrastructure and Services of the Ministry of Education, Youth and Sports of the Community of Madrid.

- In addition I work as **trainer specialized in development technologies**.

## Algunos proyectos

- **Hackathon Lovers** <http://hackathonlovers.com>:  a group created for entrepreneurs and developers who loves hackathones.

- **Password Manager Generator** <http://pasmangen.github.io>: an online password manager.

- **MarkdownSlides** <https://github.com/asanzdiego/markdownslides>: a script to create slides from MD files.

## Where to find me?

- Mi nick: **asanzdiego**

    - AboutMe:    <http://about.me/asanzdiego>
    - GitHub:     <http://github.com/asanzdiego>
    - Twitter:    <http://twitter.com/asanzdiego>
    - Blog:       <http://asanzdiego.blogspot.com.es>
    - LinkedIn:   <http://www.linkedin.com/in/asanzdiego>
    - SlideShare: <http://www.slideshare.net/asanzdiego/>
    - Google+:    <http://plus.google.com/+AdolfoSanzDeDiego>