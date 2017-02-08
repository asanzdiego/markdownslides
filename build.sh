#! /bin/bash

set -eo pipefail
IFS=$'\n\t'

clear
ORIGIN=`pwd`
echo -e $ORIGIN

. ./build.properties

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

  URL_DOWNLOAD=$1
  FOLDER_NAME=$2
  PROYECT_NAME=$3

  DOWNLOAD_FOLDER="$LIB_FOLDER/$PROYECT_NAME"
  ZIP_FILE="$LIB_FOLDER/$FOLDER_NAME.zip"
  ZIP_FOLDER="$LIB_FOLDER/$FOLDER_NAME"

  if [ -e $DOWNLOAD_FOLDER ]; then

    if [ ! -d $DOWNLOAD_FOLDER ]; then
      echo "ERROR: $DOWNLOAD_FOLDER exists and is not a folder"
      exit -1
    fi

  else

    echo -e "Downloading...                 $ZIP_FILE from $URL_DOWNLOAD"
    wget -q -O $ZIP_FILE $URL_DOWNLOAD

    echo -e "Extracting...                  $ZIP_FILE"
    unzip -q -d $LIB_FOLDER $ZIP_FILE
    rm $ZIP_FILE
    mv $ZIP_FOLDER $DOWNLOAD_FOLDER
  fi
}

function initLibFolder() {

  LIB_FOLDER=$1"/lib"

  if [ -e $LIB_FOLDER ]; then
    if [ ! -d $LIB_FOLDER ]; then
      echo "ERROR: $LIB_FOLDER exists and is not a folder"
      exit -1
    else
      if [ "$CLEAN_LIB_FOLDER" == "yes" ]; then
        echo -e "Cleaning lib folder...         ../lib"
        rm -R $LIB_FOLDER
        mkdir $LIB_FOLDER
      fi
    fi
  else
    mkdir $LIB_FOLDER
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
      echo -e "Cleaning export folder...      ../export"
      rm -R $FOLDER
      mkdir $FOLDER
    else
      echo -e "ERROR: $FOLDER exists and is not a folder"
      exit -1
    fi
  else
    echo -e "Cleaning export folder...      ../export"
    mkdir $FOLDER
  fi

}

function normaliceImages() {

  # open div before ![
  sed -i 's/!\[/<div style="text-align:center">!\[/g' ../export/$1-to-$2.md
}

function normaliceImages() {

  # close div after .png)
  sed -i 's/.png)$/.png){ width=50% text-align=center }\n/g' ../export/$1-to-$2.md

  # close div after .jpg)
  sed -i 's/.jpg)$/.jpg){ width=50% text-align=center }\n/g' ../export/$1-to-$2.md

  # close div after .gif)
  sed -i 's/.gif)$/.gif){ width=50% text-align=center }\n/g' ../export/$1-to-$2.md
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

  echo -e "Cleaning md to slides...       ../export/$1-to-slides.md"

  # replace ### or #### with ##
  # only <h2> is allowed in slides
  sed -i 's/###*/##/g' ../export/$1-to-slides.md
  sed -i 's/##\\#/###/g' ../export/$1-to-slides.md

  # normalizeMd $1 slides

  normaliceImages $1 slides

  # replace @start-notes with <aside class="notes">
  sed -i 's/^@start-notes/<aside class="notes">/g' ../export/$1-to-slides.md

  # replace @end-notes with </aside>
  sed -i 's/^@end-notes/<\/aside>/g' ../export/$1-to-slides.md
}

function cleanMdToBook() {

  cp $1.md ../export/$1-to-book.md

  echo -e "Cleaning md to book...         ../export/$1-to-book.md"

  # remove % if img
  sed -i 's/% !\[/!\[/g' ../export/$1-to-book.md

  # remove (I) from lines
  sed -i 's/ (I)//g' ../export/$1-to-book.md

  # remove all lines with (I) (II)...
  sed -i 's/.*(I.*//g' ../export/$1-to-book.md
  sed -i 's/.*(V.*//g' ../export/$1-to-book.md
  sed -i 's/.*(X.*//g' ../export/$1-to-book.md

  # normalizeMd $1 book

  # convertMainListsIntoParagraphs $1 book

  normaliceImages $1 book

  # remove @start-notes
  sed -i 's/^@start-notes//g' ../export/$1-to-book.md

  # remove @end-notes
  sed -i 's/^@end-notes//g' ../export/$1-to-book.md
}

function buildDeckSlides() {

  downloadLib https://github.com/imakewebthings/deck.js/archive/1.1.0.zip \
    deck.js-1.1.0 deck.js
  downloadLib https://github.com/markahon/deck.search.js/archive/master.zip \
    deck.search.js-master deck.search.js
  downloadLib https://github.com/mikeharris100/deck.js-transition-cube/archive/master.zip \
    deck.js-transition-cube-master deck.js-transition-cube 

  echo -e "Exporting...                   ../export/$1-deck-slides$2.html DEPRECATED!!!"

  pandoc -w dzslides --template $ORIGIN/templates/deck-slides-template$2.html \
    --number-sections --email-obfuscation=none -o ../export/$1-deck-slides$2.html ../export/$1-to-slides.md

  sed -i s/h1\>/h2\>/g ../export/$1-deck-slides$2.html
  sed -i s/\>\<h2/\>\<h1/g ../export/$1-deck-slides$2.html
  sed -i s/\\/h2\>\</\\/h1\>\</g ../export/$1-deck-slides$2.html
}

function buildRevealSlides() {

  downloadLib https://github.com/hakimel/reveal.js/archive/3.3.0.zip \
    reveal.js-3.3.0 reveal.js
  downloadLib https://github.com/denehyg/reveal.js-menu/archive/0.7.2.zip \
    reveal.js-menu-0.7.2 reveal.js-menu

  echo -e "Exporting...                   ../export/$1-reveal-slides$2.html"

  pandoc -w revealjs --template $ORIGIN/templates/reveal-slides-template$2.html \
    --variable width=$WIDTH --variable height=$HEIGHT \
    --variable margin=$MARGIN --variable minScale=$MIN_SCALE --variable maxScale=$MAX_SCALE \
    --number-sections --email-obfuscation=none -o ../export/$1-reveal-slides$2.html ../export/$1-to-slides.md

  sed -i s/h1\>/h2\>/g ../export/$1-reveal-slides$2.html
  sed -i s/\>\<h2/\>\<h1/g ../export/$1-reveal-slides$2.html
  sed -i s/\\/h2\>\</\\/h1\>\</g ../export/$1-reveal-slides$2.html
}

function buildRevealSlidesOnline() {

  revealSrc=$REVEAL_JS_SRC_ONLINE
  revealMenuSrc=$REVEAL_JS_MENU_SRC_ONLINE

  echo -e "Exporting...                   ../export/$1-reveal-slides-online$2.html"

  pandoc -w revealjs --template $ORIGIN/templates/reveal-slides-online-template$2.html \
    --variable revealSrc="$revealSrc" --variable revealMenuSrc="$revealMenuSrc" \
    --variable width=$WIDTH --variable height=$HEIGHT \
    --variable margin=$MARGIN --variable minScale=$MIN_SCALE --variable maxScale=$MAX_SCALE \
    --number-sections --email-obfuscation=none -o ../export/$1-reveal-slides-online$2.html ../export/$1-to-slides.md

  sed -i s/h1\>/h2\>/g ../export/$1-reveal-slides-online$2.html
  sed -i s/\>\<h2/\>\<h1/g ../export/$1-reveal-slides-online$2.html
  sed -i s/\\/h2\>\</\\/h1\>\</g ../export/$1-reveal-slides-online$2.html
}

function buildRevealSlidesPdf() {

  echo -e "Exporting...                   ../export/$1-reveal-slides$2.pdf"

  phantomjs --ssl-protocol=any ../lib/reveal.js/plugin/print-pdf/print-pdf.js \
    "file://`pwd`/../export/$1-reveal-slides$2.html?print-pdf" \
    ../export/$1-reveal-slides$2.pdf $PHANTOMJS_RESOLUTION > /dev/null
}

function buildBeamerSlides() {

  echo -e "Exporting...                   ../export/$1-beamer-slides.pdf DEPRECATED!!!"

  sed '/.gif/d' ../export/$1-to-slides.md | pandoc -w beamer \
    --number-sections --table-of-contents --chapters -V fontsize=9pt -V theme=Warsaw -o ../export/$1-beamer-slides.pdf
}

function buildHtmlBook() {

  echo -e "Exporting...                   ../export/$1-book.html"

  pandoc -w html5 --template $ORIGIN/templates/html-book-template.html \
    --number-sections --email-obfuscation=none --table-of-contents --chapters \
    --highlight-style=tango -o ../export/$1-book.html ../export/$1-to-book.md
}

function buildDocxBook() {

  echo -e "Exporting...                   ../export/$1-book.docx"

  pandoc -w docx --number-sections --table-of-contents --chapters -o ../export/$1-book.docx ../export/$1-to-book.md
}

function buildOdtBook() {

  echo -e "Exporting...                   ../export/$1-book.odt"

  pandoc -w odt --number-sections --table-of-contents  --chapters -o ../export/$1-book.odt ../export/$1-to-book.md
}

function buildEpubBook() {

  echo -e "Exporting...                   ../export/$1-book.epub"

  pandoc -w epub --number-sections --table-of-contents  --chapters -o ../export/$1-book.epub ../export/$1-to-book.md
}

function buildPdfBook() {

  echo -e "Exporting...                   ../export/$1-book.pdf DEPRECATED!!!"

  sed '/.gif/d' ../export/$1-to-book.md | pandoc --number-sections --table-of-contents  --chapters -o ../export/$1-book.pdf
}

function build() {

  FUNCTION_NAME=$1

  if [ $FUNCTION_NAME == "min" ]; then
    echo "YES"
  fi
  if [ $FUNCTION_NAME == "med" -a $GENERATION_MODE == "med" ]; then
    echo "YES"
  fi
  if [ $FUNCTION_NAME == "med" -a $GENERATION_MODE == "max" ]; then
    echo "YES"
  fi
  if [ $FUNCTION_NAME == "max" -a $GENERATION_MODE == "max" ]; then
    echo "YES"
  fi
}

function exportMdToSlides() {

  cleanMdToSlides $1

  if [ "`build $BUILD_REVEAL_SLIDES`" == "YES" ]; then
    buildRevealSlides $1 ""
  fi
  if [ "`build $BUILD_REVEAL_SLIDES_PDF`" == "YES" ]; then
    buildRevealSlidesPdf $1 ""
  fi
  if [ "`build $BUILD_REVEAL_SLIDES_ONLINE`" == "YES" ]; then
    buildRevealSlidesOnline $1 ""
  fi
  if [ "`build $BUILD_REVEAL_SLIDES_ALTERNATIVE`" == "YES" ]; then
    buildRevealSlides $1 -alternative
  fi
  if [ "`build $BUILD_REVEAL_SLIDES_ALTERNATIVE_PDF`" == "YES" ]; then
    buildRevealSlidesPdf $1 -alternative
  fi
  if [ "`build $BUILD_REVEAL_SLIDES_ALTERNATIVE_ONLINE`" == "YES" ]; then
    buildRevealSlidesOnline $1 -alternative
  fi
  if [ "`build $BUILD_BEAMER_SLIDES`" == "YES" ]; then
    buildBeamerSlides $1
  fi
  if [ "`build $BUILD_DECK_SLIDES`" == "YES" ]; then
    buildDeckSlides $1 ""
  fi
  if [ "`build $BUILD_DECK_SLIDES_ALTERNATIVE`" == "YES" ]; then
    buildDeckSlides $1 -alternative
  fi

}

function exportMdToBook() {

  cleanMdToBook $1

  if [ "`build $BUILD_HTML_BOOK`" == "YES" ]; then
    buildHtmlBook $1
  fi
  if [ "`build $BUILD_DOCX_BOOK`" == "YES" ]; then
    buildDocxBook $1
  fi
  if [ "`build $BUILD_ODT_BOOK`" == "YES" ]; then
    buildOdtBook $1
  fi
  if [ "`build $BUILD_EPUB_BOOK`" == "YES" ]; then
    buildEpubBook $1
  fi
  if [ "`build $BUILD_PDF_BOOK`" == "YES" ]; then
    buildPdfBook $1
  fi
}

function exportMdFile() {

  exportMdToSlides $1
  echo -e "- - - - - - - - - - - - - - - -"
  exportMdToBook $1
}

function processFolder() {

  echo -e "==============================="
  echo -e "Procesing folder...            ../"$1

  initLibFolder $1
  initExportFolder $1

  cd $1"/md"

  for FILE in *.md; do

    FILE_WITHOUT_EXTENSION=${FILE%.*}

    if [ -e $FILE_WITHOUT_EXTENSION.md ]; then
      echo -e "-------------------------------"
      exportMdFile $FILE_WITHOUT_EXTENSION
    fi
  done

  cd - > /dev/null
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

if [ "x$1" == "xclean" ]; then
  CLEAN_LIB_FOLDER='yes'
  shift
fi

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
