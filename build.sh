#! /bin/bash

set -eo pipefail
IFS=$'\n\t'

clear
ORIGIN=$(pwd)
echo -e "$ORIGIN"

CURRENT_NUMBER_OFFSET=1

# shellcheck disable=SC1091
source ./build.properties

function downloadLib() {

  LIB_FOLDER="../lib"

  if [ -e "$LIB_FOLDER" ]; then
    if [ ! -d "$LIB_FOLDER" ]; then
      echo "ERROR: $LIB_FOLDER exists and is not a folder"
      exit -1
    else
      if [ "$CLEAN_LIB_FOLDER" == "yes" ]; then
        echo -e "Cleaning lib folder...         ../$LIB_FOLDER"
        rm -R "$LIB_FOLDER"
        mkdir "$LIB_FOLDER"
      fi
    fi
  else
    mkdir "$LIB_FOLDER"
  fi

  URL_DOWNLOAD="$1"
  FOLDER_NAME="$2"
  PROYECT_NAME="$3"

  DOWNLOAD_FOLDER="$LIB_FOLDER/$PROYECT_NAME"
  ZIP_FILE="$LIB_FOLDER/$FOLDER_NAME.zip"
  ZIP_FOLDER="$LIB_FOLDER/$FOLDER_NAME"

  if [ -e "$DOWNLOAD_FOLDER" ]; then

    if [ ! -d "$DOWNLOAD_FOLDER" ]; then
      echo "ERROR: $DOWNLOAD_FOLDER exists and is not a folder"
      exit -1
    fi

  else

    echo -e "Downloading...                 $ZIP_FILE from $URL_DOWNLOAD"
    wget -q -O "$ZIP_FILE" "$URL_DOWNLOAD"

    echo -e "Extracting...                  $ZIP_FILE"
    unzip -q -d "$LIB_FOLDER" "$ZIP_FILE"
    rm "$ZIP_FILE"
    mv "$ZIP_FOLDER" "$DOWNLOAD_FOLDER"
  fi
}

function downloadLibs() {

    downloadLib https://github.com/hakimel/reveal.js/archive/3.6.0.zip \
      reveal.js-3.6.0 reveal.js
    downloadLib https://github.com/denehyg/reveal.js-menu/archive/1.2.0.zip \
      reveal.js-menu-1.2.0 reveal.js-menu
    downloadLib https://github.com/e-gor/Reveal.js-Title-Footer/archive/master.zip \
      Reveal.js-Title-Footer-master reveal.js-title-footer
}

function initExportFolder() {

  EXPORT_FOLDER="$1/export"
  IMG_FOLDER_FROM="$1/img"

  if [ -e "$EXPORT_FOLDER" ]; then
    if [ -d "$EXPORT_FOLDER" ]; then
      if [ ! -w "$EXPORT_FOLDER" ]; then
          echo -e "ERROR: no write permision in $EXPORT_FOLDER"
          exit -1
      fi
      echo -e "Cleaning export folder...      ../export"
      rm -rf "${EXPORT_FOLDER:?}/"*
    else
      echo -e "ERROR: $EXPORT_FOLDER exists and is not a folder"
      exit -1
    fi
  else
    echo -e "Creating export folder...      ../export"
    mkdir "$EXPORT_FOLDER"
  fi

  if [ "$COPY_IMG_FOLDER" == "yes" ]; then
    echo -e "Coping img folder...           ../export/img"
    cp -r "$IMG_FOLDER_FROM" "$EXPORT_FOLDER"
  fi
}

function normalizeImages() {
  
  if [ "$2" == "slides" ]; then
    # close div after .png)
    sed -i 's/.png)$/.png){ width=80% class=center }\n/g' "../export/$1-to-$2.md"
    # close div after .jpg)
    sed -i 's/.jpg)$/.jpg){ width=80% class=center }\n/g' "../export/$1-to-$2.md"
    # close div after .gif)
    sed -i 's/.gif)$/.gif){ width=80% class=center }\n/g' "../export/$1-to-$2.md"
  else
    # close div after .png)
    sed -i 's/.png)$/.png){ width=50% class=center }\n/g' "../export/$1-to-$2.md"
    # close div after .jpg)
    sed -i 's/.jpg)$/.jpg){ width=50% class=center }\n/g' "../export/$1-to-$2.md"
    # close div after .gif)
    sed -i 's/.gif)$/.gif){ width=50% class=center }\n/g' "../export/$1-to-$2.md"
  fi

}

function convertMainListsIntoParagraphs() {

  # convert first list level into paragraphs
  # replace first - with new linew
  sed -i 's/^- /\n/g' "../export/$1-to-$2.md"
  sed -i 's/^-/\n/g' "../export/$1-to-$2.md"

  # up one level the others lists
  sed -i 's/    -/-/g' "../export/$1-to-$2.md"
  sed -i 's/^- /\n- /g' "../export/$1-to-$2.md"
  sed -i 's/^-/\n- /g' "../export/$1-to-$2.md"

  # replace multiple empty lines with one empty line
  sed -i '/^$/N;/^\n$/D' "../export/$1-to-$2.md"
}

function normalizeMd() {

  # replace multiple empty lines with one empty line
  sed -i '/^$/N;/^\n$/D' "../export/$1-to-$2.md"
}

function replaceNotes() {

  # replace @start-notes with <aside class="notes">
  sed -i 's/^@start-notes/<aside class="notes">/g' "../export/$1-to-$2.md"

  # replace @end-notes with </aside>
  sed -i 's/^@end-notes/<\/aside>/g' "../export/$1-to-$2.md"
}

function cleanMdToSlides() {

  cp "$1.md" "../export/$1-to-slides.md"

  echo -e "Cleaning md to slides...       ../export/$1-to-slides.md"

  # replace ### or #### with ##
  # only <h2> is allowed in slides
  sed -i 's/###*/##/g' "../export/$1-to-slides.md"
  sed -i 's/##\\#/###/g' "../export/$1-to-slides.md"

  normalizeImages "$1" slides

  replaceNotes "$1" slides

  normalizeMd "$1" slides
}

function cleanMdToBook() {

  cp "$1.md" "../export/$1-to-book.md"

  echo -e "Cleaning md to book...         ../export/$1-to-book.md"

  # remove % if img
  sed -i 's/% !\[/!\[/g' "../export/$1-to-book.md"

  # remove (I) from lines
  sed -i 's/ (I)//g' "../export/$1-to-book.md"

  # remove all lines with (II) (III)...
  sed -i 's/^#.*(I.*$/@delete/g' "../export/$1-to-book.md"
  sed -i 's/^#.*(V.*$/@delete/g' "../export/$1-to-book.md"
  sed -i 's/^#.*(X.*$/@delete/g' "../export/$1-to-book.md"

  sed -i ':a;N;$!ba;s/\n@delete\n\n//g' "../export/$1-to-book.md"

  # convertMainListsIntoParagraphs "$1" book

  normalizeImages "$1" book

  replaceNotes "$1" book

  # remove '> ' at the beginning of the line
  sed -i 's/^> //g' "../export/$1-to-book.md"

  # remove '--' at the beginning of the line
  sed -i 's/^-*$//g' "../export/$1-to-book.md"

  normalizeMd "$1" book
}

function buildRevealSlides() {

  if [ "$REVEAL_JS_ONLINE" == "yes" ]; then
    REVEAL_JS_URL=$REVEAL_JS_URL_ONLINE
    REVEAL_JS_MENU_URL=$REVEAL_JS_MENU_URL_ONLINE
    REVEAL_JS_TITLE_FOOTER_URL=$REVEAL_JS_TITLE_FOOTER_URL_ONLINE
  else
    downloadLibs
    REVEAL_JS_URL=$REVEAL_JS_URL_OFFLINE
    REVEAL_JS_MENU_URL=$REVEAL_JS_MENU_URL_OFFLINE
    REVEAL_JS_TITLE_FOOTER_URL=$REVEAL_JS_TITLE_FOOTER_URL_OFFLINE
  fi

  echo -e "Exporting...                   ../export/$1$2.html"
  
  if [ "$REVEAL_JS_SHOW_TITLE_FOOTER" == "yes" ]; then
    if [ "$REVEAL_JS_DEFAULT_TITLE_FOOTER" == "yes" ]; then
      REVEAL_JS_TITLE_FOOTER="null"
    fi
  else
    REVEAL_JS_TITLE_FOOTER=""
  fi

  if [ "$2" == "-pdf" ] || [ "$REVEAL_JS_SHOW_MENU" != "yes" ]; then
    REVEAL_JS_SHOW_MENU=""
  fi

  pandoc -w revealjs --template "$ORIGIN/templates/reveal-slides-template.html" \
    --variable "revealjs-title-footer=$REVEAL_JS_TITLE_FOOTER" \
    --variable "revealjs-show-menu=$REVEAL_JS_SHOW_MENU" \
    --variable "theme=$REVEAL_JS_THEME" \
    --variable "revealjs-url=$REVEAL_JS_URL" \
    --variable "revealjs-menu-url=$REVEAL_JS_MENU_URL" \
    --variable "revealjs-title-footer-url=$REVEAL_JS_TITLE_FOOTER_URL" \
    --variable "width=$REVEAL_JS_WIDTH" \
    --variable "height=$REVEAL_JS_HEIGHT" \
    --variable "margin=$REVEAL_JS_MARGIN" \
    --variable "transition=$REVEAL_JS_TRANSITION" \
    --variable "minScale=$REVEAL_JS_MIN_SCALE" \
    --variable "maxScale=$REVEAL_JS_MAX_SCALE" \
    "$NUMBERS" -o "../export/$1$2.html" "../export/$1-to-slides.md"

  sed -i s/h1\>/h2\>/g "../export/$1$2.html"
  sed -i s/\>\<h2/\>\<h1/g "../export/$1$2.html"
  sed -i s/\\/h2\>\</\\/h1\>\</g "../export/$1$2.html"
}

function buildRevealSlidesPdf() {

  buildRevealSlides $1 "-pdf"

  echo -e "Exporting...                   ../export/$1.pdf"

  decktape --size "$DECKTAPE_RESOLUTION" --pause "$DECKTAPE_PAUSE" reveal \
    "file://$(pwd)/../export/$1-pdf.html" "../export/$1.pdf" > /dev/null

  rm -f "../export/$1-pdf.html"
}

function buildHtmlBook() {

  echo -e "Exporting...                   ../export/$1-book.html"

  pandoc -w html5 --template "$ORIGIN/templates/html-book-template.html" \
    --table-of-contents --top-level-division=chapter --highlight-style=tango \
    "$NUMBERS" -o "../export/$1-book.html" "../export/$1-to-book.md"
}

function buildDocxBook() {

  echo -e "Exporting...                   ../export/$1.docx"

  pandoc -w docx --table-of-contents --top-level-division=chapter \
    "$NUMBERS" -o "../export/$1.docx" "../export/$1-to-book.md"
}

function buildEpubBook() {

  echo -e "Exporting...                   ../export/$1.epub"

  pandoc -w epub --table-of-contents --top-level-division=chapter \
    "$NUMBERS" -o "../export/$1.epub" "../export/$1-to-book.md"
}

function build() {

  FUNCTION_NAME="$1"

  if [ "$FUNCTION_NAME" == "min" ]; then
    echo "yes"
  fi
  if [ "$FUNCTION_NAME" == "med" ] && [ "$GENERATION_MODE" == "med" ]; then
    echo "yes"
  fi
  if [ "$FUNCTION_NAME" == "med" ] && [ "$GENERATION_MODE" == "max" ]; then
    echo "yes"
  fi
  if [ "$FUNCTION_NAME" == "max" ] && [ "$GENERATION_MODE" == "max" ]; then
    echo "yes"
  fi
}

function exportMdToSlides() {

  cleanMdToSlides "$1"

  if [ "$(build "$BUILD_REVEAL_SLIDES")" == "yes" ]; then
    buildRevealSlides "$1"
  fi
  if [ "$(build "$BUILD_REVEAL_SLIDES_PDF")" == "yes" ]; then
    buildRevealSlidesPdf "$1"
  fi

  if [ "$REMOVE_MD_TO_SLIDES" == "yes" ]; then
    rm "../export/$1-to-slides.md"
    echo -e "Removing md to slides...       ../export/$1-to-slides.md"
  fi
}

function exportMdToBook() {

  cleanMdToBook "$1"

  if [ "$(build "$BUILD_HTML_BOOK")" == "yes" ]; then
    buildHtmlBook "$1"
  fi
  if [ "$(build "$BUILD_DOCX_BOOK")" == "yes" ]; then
    buildDocxBook "$1"
  fi
  if [ "$(build "$BUILD_EPUB_BOOK")" == "yes" ]; then
    buildEpubBook "$1"
  fi

  if [ "$REMOVE_MD_TO_BOOK" == "yes" ]; then
    rm "../export/$1-to-book.md"
    echo -e "Removing md to book...         ../export/$1-to-book.md"
  fi
}

function exportMdFile() {
  
  if [ "$NUMBER_OFFSET" == "yes" ]; then
    echo -e "Current number offset...       .."$CURRENT_NUMBER_OFFSET
  fi

  exportMdToSlides "$1"
  echo -e "- - - - - - - - - - - - - - - -"
  exportMdToBook "$1"
  
  if [ "$NUMBER_OFFSET" == "yes" ]; then
    CURRENT_NUMBER_OFFSET=$((CURRENT_NUMBER_OFFSET+1))
  fi
}

function processFolder() {

  FOLDER=${1%/}

  echo -e "==============================="
  echo -e "ProceSsing folder...           ../$FOLDER"

  if [ -e "$FOLDER/build.properties" ]; then
    echo -e "Overwriting properties...      ../build.properties"
    # shellcheck source=/dev/null
    source "$FOLDER/build.properties"
  else
    echo -e "Overwriting properties...      no"
  fi

  if [ "$NUMBER_SECTIONS" == "yes" ]; then
    if [ "$NUMBER_OFFSET" == "yes" ]; then
      NUMBERS='--number-offset='"$CURRENT_NUMBER_OFFSET"
    else
      NUMBERS='--number-sections'
    fi
  else
    NUMBERS='--tab-stop=4' # hack to solve bash problem :-)
  fi

  initExportFolder "$FOLDER"

  if [ "x$GENERATION_MODE" == "x" ]; then
    GENERATION_MODE="$DEFAULT_GENERATION_MODE"
  fi

  if [ "x$GENERATION_MODE" == "x" ]; then
    GENERATION_MODE='med'
  fi

  echo -e "Generation mode...             ..$GENERATION_MODE"

  cd "$FOLDER/md"

  for FILE in *.md; do

    FILE_WITHOUT_EXTENSION=${FILE%.*}

    if [ -e "$FILE_WITHOUT_EXTENSION.md" ]; then
      echo -e "-------------------------------"
      exportMdFile "$FILE_WITHOUT_EXTENSION"
    fi
  done

  cd ../.. > /dev/null

  if [ "$ZIP_EXPORT_FOLDER" == "yes" ]; then
    echo -e "-------------------------------"
    echo -e "Ziping export folder...        ../export/$FOLDER.zip"
    cd "$FOLDER/export"
    zip -r "$FOLDER.zip" . > /dev/null
    cd ../.. > /dev/null
  fi

  chmod 755 "$FOLDER/export"
  chmod 666 "$FOLDER/export/"*
  if [ -e "$FOLDER/export/img" ]; then
    chmod 755 "$FOLDER/export/img"
  fi
}

function processFolders() {

  for PROJECT in */; do

    if [ -d "$PROJECT" ] && [ "$PROJECT" != "templates/" ] && [ "$PROJECT" != "doc/" ]; then
      processFolder "$PROJECT"
    fi
  done
}

function process() {

  if [ "x$1" != "x" ]; then
    processFolder "$1"
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
    process "$2"
    ;;
"med")
    GENERATION_MODE="med"
    process "$2"
    ;;
"min")
    GENERATION_MODE="min"
    process "$2"
    ;;
*)
    process "$1"
    ;;
esac