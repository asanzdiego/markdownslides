#! /bin/bash

clear
ORIGIN=`pwd`
echo -e $ORIGIN

#GENERATION_MODE='min|med|max'
GENERATION_MODE='med'

function downloadLib() {

  LIB_FOLDER="../lib"

  if [ -e $LIB_FOLDER ]; then
    if [ ! -d $LIB_FOLDER ]; then
      echo "ERROR: $LIB_FOLDER exists and is not a folder"
      exit -1
    fi
  else
    mkdir $LIB_FOLDER
  fi

  GIT_USER=$1
  GIT_PROJECT=$2
  DOWNLOAD_FOLDER="$LIB_FOLDER/$GIT_PROJECT-master"
  ZIP_FILE="$LIB_FOLDER/$GIT_PROJECT.zip"

  if [ -e $DOWNLOAD_FOLDER ]; then

    if [ ! -d $DOWNLOAD_FOLDER ]; then
      echo "ERROR: $DOWNLOAD_FOLDER exists and is not a folder"
      exit -1
    fi

  else

    echo -e "Downloading...                 from https://github.com/$GIT_USER/$GIT_PROJECT"
    wget -q -O $LIB_FOLDER/$GIT_PROJECT.zip https://github.com/$GIT_USER/$GIT_PROJECT/archive/master.zip

    echo -e "Extracting...                  $ZIP_FILE"
    unzip -q -d $LIB_FOLDER $ZIP_FILE
  fi
}

function initExportFolder() {

  FOLDER=$1"/export"

  if [ -e $FOLDER ]; then

    if [ -d $FOLDER ]; then

      if [ ! -w $FOLDER ]; then
          echo -e "ERROR: no write permision in $FOLDER"
          exit -1
      fi

      echo -e "Cleaning folder...             ../export"
      rm -R $FOLDER
      mkdir $FOLDER

    else
      echo -e "ERROR: $FOLDER exists and is not a folder"
      exit -1
    fi

  else

    echo -e "Creating folder...             ../export"
    mkdir $FOLDER
  fi

}

function centerImages() {

  # open div before ![
  sed -i 's/!\[/<div style="text-align:center">!\[/g' ../export/$1-to-$2.md

  # close div after .png)
  sed -i 's/.png)$/.png)<\/div>\n/g' ../export/$1-to-$2.md

  # close div after .jpg)
  sed -i 's/.jpg)$/.jpg)<\/div>\n/g' ../export/$1-to-$2.md

  # close div after .gif)
  sed -i 's/.gif)$/.gif)<\/div>\n/g' ../export/$1-to-$2.md
}

function convertMainListsIntoParagraphs() {

  # convert first list level into paragraphs
  # replace first - with new linew
  sed -i 's/^- /\n/g' ../export/$1-to-$2.md
  sed -i 's/^-/\n/g' ../export/$1-to-$2.md

  # up one level the others lists
  sed -i 's/    -/-/g' ../export/$1-to-$2.md
  sed -i 's/^- /\n- /g' ../export/$1-to-$2.md
  sed -i 's/^-/\n- /g' ../export/$1-to-$2.md

  # replace multiple empty lines with one empty line
  sed -i '/^$/N;/^\n$/D' ../export/$1-to-$2.md
}

function normalizeMd() {

  #echo -e "Normalizing...                 ../export/$1-to-$2.md"

  # remove blank lines
  sed -i '/^$/d' ../export/$1-to-$2.md

  # add new line before #
  sed -i ':a;N;$!ba;s/\n#/\n\n#/g' ../export/$1-to-$2.md
  sed -i ':a;N;$!ba;s/\n    #/\n\n    #/g' ../export/$1-to-$2.md

  # replace multiple empty lines with one empty line
  sed -i '/^$/N;/^\n$/D' ../export/$1-to-$2.md
}

function cleanMdToSlides() {

  cp $1.md ../export/$1-to-slides.md

  echo -e "Cleaning...                    ../export/$1-to-slides.md"

  # replace ### or #### with ##
  # only <h2> is allowed in slides
  sed -i 's/###*/##/g' ../export/$1-to-slides.md
  sed -i 's/##\\#/###/g' ../export/$1-to-slides.md

  # normalizeMd $1 slides
}

function cleanMdToBook() {

  cp $1.md ../export/$1-to-book.md

  echo -e "Cleaning...                    ../export/$1-to-book.md"

  # remove % if img
  sed -i 's/% !\[/!\[/g' ../export/$1-to-book.md

  # remove (I) from lines
  sed -i 's/ (I)//g' ../export/$1-to-book.md

  # remove all lines with (I) (II)...
  sed -i 's/.*(I.*//g' ../export/$1-to-book.md
  sed -i 's/.*(V.*//g' ../export/$1-to-book.md
  sed -i 's/.*(X.*//g' ../export/$1-to-book.md

  centerImages $1 book

  # normalizeMd $1 book

  # convertMainListsIntoParagraphs $1 book

}

function buildDeckSlides() {

  downloadLib imakewebthings deck.js
  downloadLib markahon deck.search.js
  downloadLib mikeharris100 deck.js-transition-cube

  echo -e "Exporting...                   ../export/$1-deck-slides$2.html"

  pandoc -w dzslides --template $ORIGIN/templates/deck-slides-template$2.html --number-sections --email-obfuscation=none -o ../export/$1-deck-slides$2.html ../export/$1-to-slides.md

  sed -i s/h1\>/h2\>/g ../export/$1-deck-slides$2.html
  sed -i s/\>\<h2/\>\<h1/g ../export/$1-deck-slides$2.html
  sed -i s/\\/h2\>\</\\/h1\>\</g ../export/$1-deck-slides$2.html
}

function buildRevealSlides() {

  downloadLib hakimel reveal.js
  downloadLib denehyg reveal.js-menu

  echo -e "Exporting...                   ../export/$1-reveal-slides$2.html"

  pandoc -w revealjs --template $ORIGIN/templates/reveal-slides-template$2.html --number-sections --email-obfuscation=none -o ../export/$1-reveal-slides$2.html ../export/$1-to-slides.md

  sed -i s/h1\>/h2\>/g ../export/$1-reveal-slides$2.html
  sed -i s/\>\<h2/\>\<h1/g ../export/$1-reveal-slides$2.html
  sed -i s/\\/h2\>\</\\/h1\>\</g ../export/$1-reveal-slides$2.html
}


function buildRevealSlidesPdf() {

  echo -e "Exporting...                   ../export/$1-reveal-slides$2.pdf"

  phantomjs ../lib/reveal.js-master/plugin/print-pdf/print-pdf.js "file://`pwd`/../export/$1-reveal-slides$2.html?print-pdf" ../export/$1-reveal-slides$2.pdf 800x450 > /dev/null
}

function buildBeamer() {

  echo -e "Exporting...                   ../export/$1-beamer.pdf"

  sed '/.gif/d' ../export/$1-to-slides.md | pandoc -w beamer --number-sections --table-of-contents --chapters -V fontsize=9pt -V theme=Warsaw -o ../export/$1-beamer.pdf
}

function buildHtml() {

  echo -e "Exporting...                   ../export/$1.html"

  pandoc -w html5 --template $ORIGIN/templates/html-template.html --number-sections --email-obfuscation=none --toc --highlight-style=tango -o ../export/$1.html ../export/$1-to-book.md
}

function buildDocx() {

  echo -e "Exporting...                   ../export/$1.docx"

  pandoc -w docx --number-sections --table-of-contents --chapters -o ../export/$1.docx ../export/$1-to-book.md
}

function buildOdt() {

  echo -e "Exporting...                   ../export/$1.odt"

  pandoc -w odt --number-sections --table-of-contents --chapters -o ../export/$1.odt ../export/$1-to-book.md
}

function buildPdf() {

  echo -e "Exporting...                   ../export/$1.pdf"

  sed '/.gif/d' ../export/$1-to-book.md | pandoc --number-sections --table-of-contents --chapters -o ../export/$1.pdf
}

function exportMdToSlides() {

  cleanMdToSlides $1

  buildDeckSlides $1

  if [ $GENERATION_MODE == "med" -o $GENERATION_MODE == "max" ]; then
    buildRevealSlides $1
    buildRevealSlidesPdf $1
  fi

  if [ $GENERATION_MODE == "max" ]; then
    buildDeckSlides $1 -alternative
    buildRevealSlides $1 -alternative
    buildRevealSlidesPdf $1 -alternative
    #buildBeamer $1
  fi
}

function exportMdToBook() {

  cleanMdToBook $1

  buildHtml $1

  if [ $GENERATION_MODE == "med" -o $GENERATION_MODE == "max" ]; then
    buildDocx $1
  fi

  if [ $GENERATION_MODE == "max" ]; then
    buildOdt $1
    #buildPdf $1
  fi

}

function exportMdFile() {

  exportMdToSlides $1
  echo -e "- - - - - - - - - - - - - - - -"
  exportMdToBook $1
}

function processFolder() {

  echo -e "Procesing folder...            ../"$1

  initExportFolder $1

  cd $1"/md"

  for FILE in *.md; do

    FILE_WITHOUT_EXTENSION=${FILE%%.*}
    if [ -e $FILE_WITHOUT_EXTENSION.md ]; then
      echo -e "-------------------------------"
      exportMdFile $FILE_WITHOUT_EXTENSION
    fi
  done

  cd - > /dev/null

  echo -e "==============================="
}

function processFolders() {

  for PROJECT in */; do

    if [ -d $PROJECT -a "$PROJECT" != "templates/" -a "$PROJECT" != "lib/" ]; then
      processFolder $PROJECT
    fi
  done
}

function process() {

  echo -e "Generation mode...             "$GENERATION_MODE

  if [ "x$1" != "x" ]; then
    processFolder $1
  else
    processFolders
  fi
}

case "$1" in
"max")
    GENERATION_MODE="max"
    process $2
    ;;
"med")
    GENERATION_MODE="med"
    process $2
    ;;
"min")
    GENERATION_MODE="min"
    process $2
    ;;
*)
    process $1
    ;;
esac
