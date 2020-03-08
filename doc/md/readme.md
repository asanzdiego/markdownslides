% Markdown Slides [EN]
% Adolfo Sanz De Diego
% @asanzdiego

# About

## What is it?

- **MarkdownSlides** is a Reveal.js and PDF **slides** generator
**from MARKDOWN files**, that also generate HTML, EPUB and DOCX documents.

- The idea is that **from a same MARKDOWN file we can get slides and books**
without worrying about style, just worrying about content.

------------------

![](../img/markdownslides.png)

## Samples (I)

- From a [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
generate:
    - [reveal-slides](http://asanzdiego.github.io/markdownslides/doc/export/readme-slides.html)
    - [reveal-slides-pdf](http://asanzdiego.github.io/markdownslides/doc/export/readme-slides.pdf)
    - [epub-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.epub)
    - [html-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.html)
    - [docx-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.docx)
    - [pdf-book](http://asanzdiego.github.io/markdownslides/doc/export/readme-book.pdf)

## Samples (I)

- From this same [MARKDOWN](https://raw.github.com/asanzdiego/markdownslides/master/doc/md/readme.md) file
**"plus" files** can be generated:
    - [reveal-slides-plus](http://asanzdiego.github.io/markdownslides/doc/export/readme-slides-plus.html)
    - [reveal-slides-pdf-plus](http://asanzdiego.github.io/markdownslides/doc/export/readme-slides-plus.pdf)
    - [epub-book-plus](http://asanzdiego.github.io/markdownslides/doc/export/readme-book-plus.epub)
    - [html-book-plus](http://asanzdiego.github.io/markdownslides/doc/export/readme-book-plus.html)
    - [docx-book-plus](http://asanzdiego.github.io/markdownslides/doc/export/readme-book-plus.docx)
    - [pdf-book-plus](http://asanzdiego.github.io/markdownslides/doc/export/readme-book-plus.pdf)

## Contributors

@import import/contributors.md

## Licence

::: incremental
- **This work is licensed under a:**
    - [Creative Commons Attribution 3.0](http://creativecommons.org/licenses/by-sa/3.0//)
- **The program source code are licensed under a:**
    - [GPL 3.0](http://www.gnu.org/licenses/gpl.html)
:::

# Instalation

## Dependencies

- It needs to be installed:
@import import/dependencies-1.md

- It is automaticaly downloaded:
@import import/dependencies-2.md

## Requirements

- Now, only works in Linux (may be on MacOS)

- It can works with Docker, but is in beta.

## Download

<https://github.com/asanzdiego/markdownslides/archive/6.2.zip>

## Docker

- Your installation with docker is still **under testing**.

- Any feedback is welcome.

### Building docker image 

- It will be at dockerhub soon:

~~~
$ docker build -t asanzdiego/markdownslides .
~~~

### Launch the container

- Launch the container:

~~~
docker run -it -v "${PWD}":/home/markdownslides-master/"${PWD##*/}" \
    asanzdiego/markdownslides ./build.sh [clean] [mode] [folder]
~~~

# How to use

## Creation

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
which are nothing more than plain text files with extension md,
and a lightweight markup (we should know it but it is very simple).


## Imports (I)

- We can add a file with **@import import/NOMBRE_FICHERO [startLine=NUMERO] [endLine=NUMERO] [showNumberLines]**

Firt example: 

~~~
 @import import/import-2.md
~~~

@import import/import-2.md

## Imports (II)

Second example: 

~~~
 @import import/import-1.md endLine=4
~~~

@import import/import-1.md endLine=4

## Imports (III)

Third example: 

~~~
 @import import/import-1.md startLine=6
~~~

@import import/import-1.md startLine=6

## Imports (IV)

Fourth example: 

~~~
 @import import/import-1.md startLine=2 endLine=3 showNumberLines
~~~

~~~
@import import/import-1.md startLine=2 endLine=3 showNumberLines
~~~

## Notes

- We can add notes that will be visible in book mode or if **you press the letter 's' on the slides**
with **@start-notes** and **@end-notes**.

~~~
 @start-notes
 This is only visible in book mode or if you press 's' on the slides.
 @end-notes
~~~

@start-notes
This is only visible in book mode or if you press 's' on the slides.
@end-notes


## Plus notes

- We can create notes with **@plus** that will be only visible in "plus" files
as long as in the build.properties we have **GENERATE_PLUS_VERSION='yes'** 

~~~
 @plus the lines below will only be available in the plus version

 @plus @import import/import-2.md
~~~

@plus the lines below will only be available in the plus version

@plus @import import/import-2.md

## MathJax

- We can use the [MathJax](https://www.mathjax.org/) lib.

So this:

~~~
$$x = {-b \pm \sqrt{b^2-4ac}}.$$
~~~

Will be converted to:

$$x = {-b \pm \sqrt{b^2-4ac}}.$$

## Code

~~~{.javascript}
function helloWorld() {
    alert('Hello world');
}
~~~

## Levels

- You can have as many levels as you want. Example:

~~~
# Level 1 (on slides and book)

## Level 2 (on slides and book)

### Level 3 (in book but stays level 2 in slides)
~~~

But only in books. In slides you can only have 2 levels.

## Numbering

- You can name several slides with (I), (II), etc. But only the first one will be exported to the book. Example:

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
DEFAULT_GENERATION_MODE='min'
GENERATE_PLUS_VERSION='yes'
DEFAULT_BUILD='REVEAL_SLIDES_PDF'

BUILD_REVEAL_SLIDES='min'
BUILD_REVEAL_SLIDES_PDF='med'

BUILD_HTML_BOOK='min'
BUILD_PDF_BOOK='med'
BUILD_DOCX_BOOK='max'
BUILD_EPUB_BOOK='max'
~~~

## Configuration (II)

We can also configure some other stufs from the file **build.properties**

~~~{.bash}
CLEAN_LIB_FOLDER='no'
COPY_IMG_FOLDER='no'
ZIP_EXPORT_FOLDER='no'
NUMBER_SECTIONS='no'
NUMBER_OFFSET='no'
CURRENT_NUMBER_OFFSET=1
REMOVE_GENERATE_MD_FILES='yes'
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
REVEAL_JS_SHOW_CHALKBOARD='yes'
REVEAL_JS_ONLINE='no'
~~~

## Build

- In the root folder you have to execute:

~~~{.bash}
./build.sh [mode] [folder]
~~~

- [**mode**] can take the next values: **min, med o máx**.

- [**folder**] folder wher to find the md files. If no folder name, it will convert all md files of all the folders.

# Releases notes

## Release 1.0 (I)

- Export slides to:
    - reveal-slides
    - reveal-slides-pdf
    - beamer-slides
    - deck-slides

## Release 1.0 (II)

- Export books to:
    - html-book
    - docx-book
    - odt-book
    - pdf-book

## Release 1.0 (III)

- Added generation modes 'min', 'med' and 'max'.
- Automatic download the external libraries.
- Numbering (I), (II), (III) ...

## Release 2.0 (I)

- Export slides to:
    - reveal-slides
    - reveal-slides-pdf
    - reveal-slides-online

## Release 2.0 (II)

- Export books to:
    - html-book
    - docx-book
    - epub-book

## Release 2.0 (III)

- Deprecated:
    - beamer-slides
    - deck-slides
    - odt-book
    - pdf-book

## Release 2.0 (III)

- Added menu thanks to [Raul Jimenez Ortega](https://github.com/hhkaos).
- Added dockerfile thanks to [Rubén Gómez García](https://github.com/kaneproject).
- Clean zip files from libraries thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Added type 'online' thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Fixed bug HTTPS images thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Loading the online libraries with HTTPS thanks to [Cesar Seoane](https://github.com/cesarseoane).
- Configuration PDF resolution thanks to [Cesar Seoane](https://github.com/cesarseoane).

## Release 2.0 (IV)

- New format 'epub'.
- Added 'bash strict mode'.
- Added 'build.properties' to configure file generation.
- Added the command 'clean' to clean the lib folder.
- Download a specific version of external library.
- Added notes only visible in book mode or if you press 's' on the slides.
- Normalization of images in slides.

## Release 3.0

- Clean the code.
- Remove deprecated exportation files.
- Improve de configuration in build.properties file.
- Update [Reveal.js](http://lab.hakim.se/reveal-js/#/) dependencies.
- Export to PDF with [DeckTape](https://github.com/astefanutti/decktape).
- Book creation from some md files with enumeration.
- Possibility of adding a footer to the slides.

## Release 4.0

- Fix some bugs.
- Add bookmarks to the slides.
- Improve file names.
- Add [MathJax/](https://www.mathjax.org/) lib thanks to [Pablo J. Triviño](https://twitter.com/p_trivino).

## Release 5.0

- Clean the code.
- Fixed some bugs.
- Removed the command 'clean' to clean the lib folder because it can be done via properties file.
- Added again the option to export to PDF in book format.
- Added the possibility to import files or fragments from an external file.
- Added the plugin  [chalkboard](https://github.com/rajgoel/reveal.js-plugins/tree/master/chalkboard) thanks to [Marcos Chavarría](https://twitter.com/chavarria1991).
- Added the possibility to create a 'plus' version with extra information in slides and books.

## Release 6.0

- Added the possibility to export to PowerPoint.
- Updated all the libraries to the latest version.
- Updated the templates.
- Updated the Dockerfile.

## Release 6.1

- New image of MarkdownSlides.
- Added Bootstrap to the html template.

## Release 6.2

- Added the DEFAULT_BUILD property.

# ![Adolfo Sanz De Diego](../img/asanzdiego.png){style=box-shadow:none;vertical-align:middle;width:100px;} Author

## Adolfo Sanz De Diego

- **Old JEE web developer**.

- Now I'm **Tecnical Teacher Advaisor** in the TIC service of the General Direction of Infrastructure and Services of the Ministry of Education and Youth of the Community of Madrid.

- In addition I work as **trainer specialized in development technologies**.

## Some projects

- ![Hackathon Lovers](../img/hackathon-lovers-logo.png){height=30} [Hackathon Lovers](http://hackathonlovers.com): a group created for entrepreneurs and developers who loves hackathons.

- [Password Manager Generator](http://pasmangen.github.io): an online password manager.

- [MarkdownSlides](https://github.com/asanzdiego/markdownslides): a script to create slides from MD files.

## Where to find me?

- My nick: **asanzdiego**
    - Blog:       [asanzdiego.com](http://asanzdiego.com)
    - GitHub:     [github.com/asanzdiego](http://github.com/asanzdiego)
    - Twitter:    [twitter.com/asanzdiego](http://twitter.com/asanzdiego)
    - LinkedIn:   [linkedin.com/in/asanzdiego](http://www.linkedin.com/in/asanzdiego)
    - SlideShare: [slideshare.net/asanzdiego](http://www.slideshare.net/asanzdiego)
