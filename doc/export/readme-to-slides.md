% Markdown Slides
% Adolfo Sanz De Diego
% January 2014

# About

## What is it? (I)

- **MarkdownSlides** is a Reveal.js, Deck.js and PDF **slides** generator
  **from MARKDOWN files**, that also generate HTML, ODT and DOCX documents.

## What is it? (II)

![](../img/markdownslides.png)

## Samples

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

## Download

- [https://github.com/asanzdiego/markdownslides/archive/master.zip](https://github.com/asanzdiego/markdownslides/archive/master.zip)

## Creation (I)

- First **copy the doc folder and rename it as you like**. This is not necessary but
  helps you organize your documents.

- **Create the md files** that you want to generate in the **md folder**.
  The md files are [Markdown](http://en.wikipedia.org/wiki/Markdown) files
  which are nothing more than plain text files with extension md,
  and a lightweight markup (we should know it but it is very simple).

## Creation (II)

- Once created the md files, **we can generate with an script**.

    - reveal-slides
    - reveal-pdf-slides
    - deck-slides
    - pdf-beamer
    - pdf
    - html
    - docx
    - odt

## Build

- In the root folder you have to execute:

~~~
./build.sh [mode] [folder]
~~~

- Where [**mode**] can take the next values:

    - "**min**": generate deck-slides and plain html.
    - "**med**": generate also reveal-slides, docx and odt (**default value**)
    - "**max**": generate all formats.

- And where [**folder**] is the name of the folder wher to find
  the md files. If no folder name, it will convert all md files of all the folders.

# Author

## Adolfo Sanz De Diego

![](../img/avatar-asanzdiego.png)

## My Resume

- **Old JEE web developer**

- Today:

    - **Computer teacher**:

        - Hardware, Operating Systems
        - Networking, Programming

    - **Freelance Trainer**:

        - Java, Android
        - JavaScript, jQuery
        - JSF, Spring, Hibernate
        - Groovy & Grails

    - **I like to develop**

## Hackalover

![](../img/hackathon-lovers-logo.png)

- **For hackathons lovers**

    - **Meetup**: [http://www.meetup.com/Hackathon-Lovers/](http://www.meetup.com/Hackathon-Lovers/)
    - **Twitter**: [http://twitter.com/HackathonLovers](http://twitter.com/HackathonLovers)
    - **Blog**: [http://hackathonlovers.tumblr.com/](http://hackathonlovers.tumblr.com/)
    - **LinkedIn**: [http://www.linkedin.com/groups/Hackathon-Lovers-6510465](http://www.linkedin.com/groups/Hackathon-Lovers-6510465)
    - **YouTube**: [http://www.youtube.com/channel/UCRwSe7jK-y62BMvIiNBV1qw](http://www.youtube.com/channel/UCRwSe7jK-y62BMvIiNBV1qw)

## Tweets Sentiment

![](../img/tweets-sentiment-logo.png)

- Is a **tweets analyzer** which extracts semantic information to know
if the general tweets feeling about a topic is positive or negative.

    - **Web**: [http://tweetssentiment.com/](http://tweetssentiment.com/)
    - **Twitter**: [http://twitter.com/TweetsSentiment](http://twitter.com/TweetsSentiment)

## Where to find me?

- My nick: **asanzdiego**

    - AboutMe:  [http://about.me/asanzdiego](http://about.me/asanzdiego)
    - GitHub:   [http://github.com/asanzdiego](http://github.com/asanzdiego)
    - Twitter:  [http://twitter.com/asanzdiego](http://twitter.com/asanzdiego)
    - Blog:     [http://asanzdiego.blogspot.com.es](http://asanzdiego.blogspot.com.es)
    - LinkedIn: [http://www.linkedin.com/in/asanzdiego](http://www.linkedin.com/in/asanzdiego)
    - Google+:  [http://plus.google.com/+AdolfoSanzDeDiego](http://plus.google.com/+AdolfoSanzDeDiego)
