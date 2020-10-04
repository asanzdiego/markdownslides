#! /bin/bash

set -eo pipefail
IFS=$'\n\t'

function error() {
  if [ "$LOG_LEVEL" -ge "$WARNING" ]; then
    printf "\033[0;31m%s\033[0m\n" "$1"
  fi
}

function warning() {
  if [ "$LOG_LEVEL" -ge "$WARNING" ]; then
    printf "\033[1;33m%s\033[0m\n" "$1"
  fi
}

function success() {
  if [ "$LOG_LEVEL" -ge "$SUCCESS" ]; then
    printf "\033[0;32m%s\033[0m\n" "$1"
  fi
}

function info() {
  if [ "$LOG_LEVEL" -ge "$INFO" ]; then
    printf "%s\n" "$1"
  fi
}

function debug() {
  if [ "$LOG_LEVEL" -ge "$DEBUG" ]; then
    printf "\033[0;34m%s\033[0m\n" "$1"
  fi
}

function verbose() {
  if [ "$LOG_LEVEL" -ge "$VERBOSE" ]; then
    printf "\033[1;30m%s\033[0m\n" "$1"
  fi
}

function downloadLib() {

  local LIB_FOLDER="../lib"

  if [ -e "$LIB_FOLDER" ]; then
    if [ ! -d "$LIB_FOLDER" ]; then
      error "ERROR: $LIB_FOLDER exists and is not a folder"
      exit -1
    else
      if [ "$CLEAN_LIB_FOLDER" == "yes" ]; then
        info "Cleaning lib folder...         ../$LIB_FOLDER"
        rm -R "$LIB_FOLDER"
        mkdir "$LIB_FOLDER"
      fi
    fi
  else
    mkdir "$LIB_FOLDER"
  fi

  local URL_DOWNLOAD="$1"
  local FOLDER_NAME="$2"
  local PROYECT_NAME="$3"

  local DOWNLOAD_FOLDER="$LIB_FOLDER/$PROYECT_NAME"
  local ZIP_FILE="$LIB_FOLDER/$FOLDER_NAME.zip"
  local ZIP_FOLDER="$LIB_FOLDER/$FOLDER_NAME"

  if [ -e "$DOWNLOAD_FOLDER" ]; then

    if [ ! -d "$DOWNLOAD_FOLDER" ]; then
      error "ERROR: $DOWNLOAD_FOLDER exists and is not a folder"
      exit -1
    fi

  else

    info "Downloading...                 $ZIP_FILE from $URL_DOWNLOAD"
    wget -q -O "$ZIP_FILE" "$URL_DOWNLOAD"

    info "Extracting...                  $ZIP_FILE"
    unzip -q -d "$LIB_FOLDER" "$ZIP_FILE"
    rm "$ZIP_FILE"
    mv "$ZIP_FOLDER" "$DOWNLOAD_FOLDER"
  fi
}

function downloadLibs() {

    downloadLib https://github.com/hakimel/reveal.js/archive/3.9.2.zip \
      reveal.js-3.9.2 reveal.js
    downloadLib https://github.com/denehyg/reveal.js-menu/archive/1.2.0.zip \
      reveal.js-menu-1.2.0 reveal.js-menu
    downloadLib https://github.com/e-gor/Reveal.js-Title-Footer/archive/master.zip \
      Reveal.js-Title-Footer-master reveal.js-title-footer
    downloadLib https://github.com/rajgoel/reveal.js-plugins/archive/master.zip \
      reveal.js-plugins-master reveal.js-plugins
}

function downloadTemplates() {

  local TEMPLATES_FOLDER="$1/templates"

  if [ -e "$TEMPLATES_FOLDER" ]; then
    if [ ! -d "$TEMPLATES_FOLDER" ]; then
      error "ERROR: $TEMPLATES_FOLDER exists and is not a folder"
      exit -1
    fi
  else
    mkdir "$TEMPLATES_FOLDER"
    cp $ORIGIN/templates/* "$TEMPLATES_FOLDER"
    info "Templates folder created...    ../$TEMPLATES_FOLDER"
  fi
}

function initExportFolder() {

  local FOLDER_NAME="$1"

  EXPORT_FOLDER="$FOLDER_NAME/export"
  IMG_FOLDER_FROM="$FOLDER_NAME/img"

  if [ -e "$EXPORT_FOLDER" ]; then
    if [ -d "$EXPORT_FOLDER" ]; then
      if [ ! -w "$EXPORT_FOLDER" ]; then
          error "ERROR: no write permision in $EXPORT_FOLDER"
          exit -1
      fi
      info "Cleaning export folder...      ../export"
      rm -rf "${EXPORT_FOLDER:?}/"*
    else
      error "ERROR: $EXPORT_FOLDER exists and is not a folder"
      exit -1
    fi
  else
    info "Creating export folder...      ../export"
    mkdir "$EXPORT_FOLDER"
  fi

  if [ "$COPY_IMG_FOLDER" == "yes" ]; then
    info "Coping img folder...           ../export/img"
    cp -r "$IMG_FOLDER_FROM" "$EXPORT_FOLDER"
  fi
}

function normalizeImages() {
  
  local NAME="$1"
  local TYPE="$2"
  local PLUS="$3"

  if [ "$TYPE" == "slides" ]; then
    # close div after .png)
    sed -i 's/.png)$/.png){ width=80% class=center }\n/g' "../export/$NAME$TYPE$PLUS.md"
    # close div after .jpg)
    sed -i 's/.jpg)$/.jpg){ width=80% class=center }\n/g' "../export/$NAME$TYPE$PLUS.md"
    # close div after .gif)
    sed -i 's/.gif)$/.gif){ width=80% class=center }\n/g' "../export/$NAME$TYPE$PLUS.md"
  else
    # close div after .png)
    sed -i 's/.png)$/.png){ width=50% class=center }\n/g' "../export/$NAME$TYPE$PLUS.md"
    # close div after .jpg)
    sed -i 's/.jpg)$/.jpg){ width=50% class=center }\n/g' "../export/$NAME$TYPE$PLUS.md"
    # close div after .gif)
    sed -i 's/.gif)$/.gif){ width=50% class=center }\n/g' "../export/$NAME$TYPE$PLUS.md"
  fi

}

function convertMainListsIntoParagraphs() {
  
  local NAME="$1"
  local TYPE="$2"
  local PLUS="$3"

  # convert first list level into paragraphs
  # replace first - with new linew
  sed -i 's/^- /\n/g' "../export/$NAME$TYPE$PLUS.md"
  sed -i 's/^-/\n/g' "../export/$NAME$TYPE$PLUS.md"

  # up one level the others lists
  sed -i 's/    -/-/g' "../export/$NAME$TYPE$PLUS.md"
  sed -i 's/^- /\n- /g' "../export/$NAME$TYPE$PLUS.md"
  sed -i 's/^-/\n- /g' "../export/$NAME$TYPE$PLUS.md"

  # replace multiple empty lines with one empty line
  sed -i '/^$/N;/^\n$/D' "../export/$NAME$TYPE$PLUS.md"
}

function normalizeMd() {
  
  local NAME="$1"
  local TYPE="$2"
  local PLUS="$3"

  # replace multiple empty lines with one empty line
  sed -i '/^$/N;/^\n$/D' "../export/$NAME$TYPE$PLUS.md"
}

function replaceNotes() {
  
  local NAME="$1"
  local TYPE="$2"
  local PLUS="$3"

  if [ "$TYPE" == "-slides" ]; then

    # replace @start-notes with ::: notes
    sed -i 's/^@start-notes/::: notes/g' "../export/$NAME$TYPE$PLUS.md"

    # replace @end-notes with :::
    sed -i 's/^@end-notes/:::/g' "../export/$NAME$TYPE$PLUS.md"
  
  else

    # replace @start-notes with <aside class="notes">
    sed -i 's/^@start-notes/<aside class="notes">/g' "../export/$NAME$TYPE$PLUS.md"

    # replace @end-notes with </aside>
    sed -i 's/^@end-notes/<\/aside>/g' "../export/$NAME$TYPE$PLUS.md"
  fi

}

function cleanMdToSlides() {
  
  local NAME="$1"
  local PLUS="$2"

  cp "../export/$NAME-import$PLUS.md" "../export/$NAME-slides$PLUS.md"

  debug "Cleaning md to slides...       ../export/$NAME-slides$PLUS.md"

  # replace ### or #### with ##
  # only <h2> is allowed in slides
  sed -i 's/###*/##/g' "../export/$NAME-slides$PLUS.md"
  sed -i 's/##\\#/###/g' "../export/$NAME-slides$PLUS.md"

  normalizeImages "$NAME" -slides "$PLUS"

  replaceNotes "$NAME" -slides "$PLUS"

  normalizeMd "$NAME" -slides "$PLUS"
}

function cleanMdToBook() {
  
  local NAME="$1"
  local PLUS="$2"

  cp "../export/$NAME-import$PLUS.md" "../export/$NAME-book$PLUS.md"

  debug "Cleaning md to book...         ../export/$NAME-book$PLUS.md"

  # remove % if img
  sed -i 's/% !\[/!\[/g' "../export/$NAME-book$PLUS.md"

  # remove (I) from lines
  sed -i 's/ (I)//g' "../export/$NAME-book$PLUS.md"

  # remove all lines with (II) (III)...
  sed -i 's/^#.*(I.*$/@delete/g' "../export/$NAME-book$PLUS.md"
  sed -i 's/^#.*(V.*$/@delete/g' "../export/$NAME-book$PLUS.md"
  sed -i 's/^#.*(X.*$/@delete/g' "../export/$NAME-book$PLUS.md"

  sed -i ':a;N;$!ba;s/@delete\n\n//g' "../export/$NAME-book$PLUS.md"

  # convertMainListsIntoParagraphs "$NAME" -book "$PLUS"

  normalizeImages "$NAME" -book "$PLUS"

  replaceNotes "$NAME" -book "$PLUS"

  # remove '> ' at the beginning of the line
  sed -i 's/^> //g' "../export/$NAME-book$PLUS.md"

  # remove '--' at the beginning of the line
  sed -i 's/^-*$//g' "../export/$NAME-book$PLUS.md"

  normalizeMd "$NAME" -book "$PLUS"
}

function buildRevealSlides() {
  
  local NAME="$1"
  local PDF="$2"
  local PLUS="$3"

  if [ "$PDF" != "-pdf" ]; then
    PDF=""
    info "Exporting...                   ../export/$NAME-slides$PDF$PLUS.html"
  fi

  if [ "$REVEAL_JS_ONLINE" == "yes" ]; then
    REVEAL_JS_URL=$REVEAL_JS_URL_ONLINE
    REVEAL_JS_MENU_URL=$REVEAL_JS_MENU_URL_ONLINE
    REVEAL_JS_TITLE_FOOTER_URL=$REVEAL_JS_TITLE_FOOTER_URL_ONLINE
    REVEAL_JS_CHALKBOARD_URL=$REVEAL_JS_CHALKBOARD_URL_ONLINE
  else
    downloadLibs
    REVEAL_JS_URL=$REVEAL_JS_URL_OFFLINE
    REVEAL_JS_MENU_URL=$REVEAL_JS_MENU_URL_OFFLINE
    REVEAL_JS_TITLE_FOOTER_URL=$REVEAL_JS_TITLE_FOOTER_URL_OFFLINE
    REVEAL_JS_CHALKBOARD_URL=$REVEAL_JS_CHALKBOARD_URL_OFFLINE
  fi
  
  if [ "$REVEAL_JS_SHOW_TITLE_FOOTER" == "yes" ]; then
    if [ "$REVEAL_JS_DEFAULT_TITLE_FOOTER" == "yes" ]; then
      REVEAL_JS_TITLE_FOOTER="null"
    fi
  else
    REVEAL_JS_TITLE_FOOTER=""
  fi

  REVEAL_JS_SHOW_MENU_MD="$REVEAL_JS_SHOW_MENU" 
  if [ "$2" == "-pdf" ] || [ "$REVEAL_JS_SHOW_MENU" != "yes" ]; then
    REVEAL_JS_SHOW_MENU_MD=""
  fi
 
  REVEAL_JS_SHOW_CHALKBOARD_MD="$REVEAL_JS_SHOW_CHALKBOARD" 
  if [ "$2" == "-pdf" ] || [ "$REVEAL_JS_SHOW_CHALKBOARD" != "yes" ]; then
   REVEAL_JS_SHOW_CHALKBOARD_MD=""
  fi

  pandoc -w revealjs --template "../templates/reveal-slides-template.html" \
    --variable "revealjs-title-footer=$REVEAL_JS_TITLE_FOOTER" \
    --variable "revealjs-show-menu=$REVEAL_JS_SHOW_MENU_MD" \
    --variable "revealjs-show-chalkboard=$REVEAL_JS_SHOW_CHALKBOARD_MD" \
    --variable "theme=$REVEAL_JS_THEME" \
    --variable "revealjs-url=$REVEAL_JS_URL" \
    --variable "revealjs-menu-url=$REVEAL_JS_MENU_URL" \
    --variable "revealjs-title-footer-url=$REVEAL_JS_TITLE_FOOTER_URL" \
    --variable "revealjs-chalkboard-url=$REVEAL_JS_CHALKBOARD_URL" \
    --variable "width=$REVEAL_JS_WIDTH" \
    --variable "height=$REVEAL_JS_HEIGHT" \
    --variable "margin=$REVEAL_JS_MARGIN" \
    --variable "transition=$REVEAL_JS_TRANSITION" \
    --variable "minScale=$REVEAL_JS_MIN_SCALE" \
    --variable "maxScale=$REVEAL_JS_MAX_SCALE" \
    "$NUMBERS" --mathjax -o "../export/$NAME-slides$PDF$PLUS.html" "../export/$NAME-slides$PLUS.md"

  sed -i s/h1\>/h2\>/g "../export/$NAME-slides$PDF$PLUS.html"
  sed -i s/\>\<h2/\>\<h1/g "../export/$NAME-slides$PDF$PLUS.html"
  sed -i s/\\/h2\>\</\\/h1\>\</g "../export/$NAME-slides$PDF$PLUS.html"

  if [ "$DEFAULT_BUILD" == "REVEAL_SLIDES" ] && [ "$PDF" != "-pdf" ]; then
    info "Convert to default build...    ../export/$NAME$PLUS.html"
    mv "../export/$NAME-slides$PLUS.html" "../export/$NAME$PLUS.html"
  fi
}

function buildRevealSlidesPdf() {

  local NAME="$1"
  local PLUS="$2"

  buildRevealSlides "$NAME" "-pdf" "$PLUS"

  info "Exporting...                   ../export/$NAME-slides$PLUS.pdf"

  if [ "$LOG_LEVEL" -ge "$VERBOSE" ]; then
    decktape --chrome-arg=--no-sandbox \
      --size "$DECKTAPE_RESOLUTION" --pause "$DECKTAPE_PAUSE" reveal \
      "file://$(pwd)/../export/$NAME-slides-pdf$PLUS.html" "../export/$NAME-slides$PLUS.pdf"
  else
    decktape --chrome-arg=--no-sandbox \
      --size "$DECKTAPE_RESOLUTION" --pause "$DECKTAPE_PAUSE" reveal \
      "file://$(pwd)/../export/$NAME-slides-pdf$PLUS.html" "../export/$NAME-slides$PLUS.pdf" > /dev/null  
  fi

  rm -f "../export/$NAME-slides-pdf$PLUS.html"

  if [ "$DEFAULT_BUILD" == "REVEAL_SLIDES_PDF" ]; then
    info "Convert to default build...    ../export/$NAME$PLUS.pdf"
    mv "../export/$NAME-slides$PLUS.pdf" "../export/$NAME$PLUS.pdf"
  fi
}

function buildPowerPointSlides() {
  
  local NAME="$1"
  local PLUS="$2"
  
  info "Exporting...                   ../export/$NAME-slides$PLUS.pptx"

  pandoc -w pptx \
    "$NUMBERS" --mathjax -o "../export/$NAME-slides$PLUS.pptx" "../export/$NAME-slides$PLUS.md"

  if [ "$DEFAULT_BUILD" == "POWER_POINT_SLIDES" ]; then
    info "Convert to default build...    ../export/$NAME$PLUS.pptx"
    mv "../export/$NAME-slides$PLUS.pptx" "../$NAME.pptx"
  fi
}

function buildHtmlBook() {
  
  local NAME="$1"
  local PLUS="$2"

  info "Exporting...                   ../export/$NAME-book$PLUS.html"

  pandoc -w html5 --template "../templates/html-book-template.html" \
    --table-of-contents --top-level-division=chapter --highlight-style=tango \
    "$NUMBERS" --mathjax -o "../export/$NAME-book$PLUS.html" "../export/$NAME-book$PLUS.md"

  if [ "$DEFAULT_BUILD" == "HTML_BOOK" ]; then
    info "Convert to default build...    ../export/$NAME$PLUS.html"
    mv "../export/$NAME-book$PLUS.html" "../$NAME$PLUS.html"
  fi
}

function buildDocxBook() {
  
  local NAME="$1"
  local PLUS="$2"

  info "Exporting...                   ../export/$NAME-book$PLUS.docx"

  pandoc -w docx --table-of-contents --top-level-division=chapter \
    "$NUMBERS" --mathjax -o "../export/$NAME-book$PLUS.docx" "../export/$NAME-book$PLUS.md"

  if [ "$DEFAULT_BUILD" == "DOCX_BOOK" ]; then
    info "Convert to default build...    ../export/$NAME$PLUS.docx"
    mv "../export/$NAME-book$PLUS.docx" "../$NAME$PLUS.docx"
  fi
}

function buildEpubBook() {
  
  local NAME="$1"
  local PLUS="$2"

  info "Exporting...                   ../export/$NAME-book$PLUS.epub"

  pandoc -w epub --table-of-contents --top-level-division=chapter \
    "$NUMBERS" --mathjax -o "../export/$NAME-book$PLUS.epub" "../export/$NAME-book$PLUS.md"

  if [ "$DEFAULT_BUILD" == "EPUB_BOOK" ]; then
    info "Convert to default build...    ../export/$NAME$PLUS.epub"
    mv "../export/$NAME-book$PLUS.epub" "../$NAME$PLUS.epub"
  fi
}

function buildPdfBook() {

  local NAME="$1"
  local PLUS="$2"

  info "Exporting...                   ../export/$NAME-book$PLUS.pdf"

  sed '/.gif/d' "../export/$NAME-book$PLUS.md" | pandoc \
    --table-of-contents --top-level-division=chapter \
    "$NUMBERS" --mathjax -o "../export/$NAME-book$PLUS.pdf"

  if [ "$DEFAULT_BUILD" == "PDF_BOOK" ]; then
    info "Convert to default build...    ../export/$NAME$PLUS.pdf"
    mv "../export/$NAME-book$PLUS.pdf" "../$NAME$PLUS.pdf"
  fi
}

function build() {

  local FUNCTION_NAME="$1"

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
  
  local NAME="$1"
  local PLUS="$2"

  cleanMdToSlides "$NAME" "$PLUS"

  if [ "$(build "$BUILD_REVEAL_SLIDES")" == "yes" ]; then
    buildRevealSlides "$NAME" "-" "$PLUS"
  fi
  if [ "$(build "$BUILD_REVEAL_SLIDES_PDF")" == "yes" ]; then
    buildRevealSlidesPdf "$NAME" "$PLUS"
  fi
  if [ "$(build "$BUILD_POWER_POINT_SLIDES")" == "yes" ]; then
    buildPowerPointSlides "$NAME" "$PLUS"
  fi

  debug "- - - - - - - - - - - - - - - -"
}

function exportMdToBook() {
  
  local NAME="$1"
  local PLUS="$2"

  cleanMdToBook "$NAME" "$PLUS"

  if [ "$(build "$BUILD_HTML_BOOK")" == "yes" ]; then
    buildHtmlBook "$NAME" "$PLUS"
  fi
  if [ "$(build "$BUILD_DOCX_BOOK")" == "yes" ]; then
    buildDocxBook "$NAME" "$PLUS"
  fi
  if [ "$(build "$BUILD_EPUB_BOOK")" == "yes" ]; then
    buildEpubBook "$NAME" "$PLUS"
  fi
  if [ "$(build "$BUILD_PDF_BOOK")" == "yes" ]; then
    buildPdfBook "$NAME" "$PLUS"
  fi
  
  debug "- - - - - - - - - - - - - - - -"
}

function addImportToMD() {
  
  local NAME="$1"
  local IMPORT_PARAMS="$2"
  local PLUS="$3"

  local FILE_TO_IMPORT="-"
  local START_LINE=1
  local END_LINE=0
  local SHOW_NUMBER_LINES="false"
  local NUMBER_LINES=1

  for i in $(echo "$IMPORT_PARAMS" | tr " " "\n"); do
    if [ "${i:0:9}" == "startLine" ]; then
      START_LINE="${i:10}"
    elif [ "${i:0:7}" == "endLine" ]; then
      END_LINE="${i:8}"
    elif [ "${i:0:15}" == "showNumberLines" ]; then
      SHOW_NUMBER_LINES="true"
    else
      FILE_TO_IMPORT="$i"
    fi
  done

  local BASENAME_FILE_TO_IMPORT
  BASENAME_FILE_TO_IMPORT="$(basename "$FILE_TO_IMPORT")"

  debug "Importing file...              $FILE_TO_IMPORT"

  generatePlusAndNormalMD "$FILE_TO_IMPORT" "$BASENAME_FILE_TO_IMPORT"

  if [[ $END_LINE -eq 0 ]]; then
    END_LINE=$(wc -l "../export/$BASENAME_FILE_TO_IMPORT$PLUS.md" | cut -d " " -f 1)
    END_LINE=$((END_LINE+1))
  fi

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ $NUMBER_LINES -ge $START_LINE ]] && [[ $NUMBER_LINES -le $END_LINE ]]; then
      if [ "${line:0:7}" == "@import" ]; then
        addImportToMD "$NAME" "${line:7}" "$PLUS"
      else
        if [ "$SHOW_NUMBER_LINES" == "true" ]; then
          echo "$NUMBER_LINES $line" >> "../export/$NAME-import$PLUS.md"
        else
          echo "$line" >> "../export/$NAME-import$PLUS.md"
        fi
      fi
    fi
    NUMBER_LINES=$((NUMBER_LINES+1))
  done < "../export/$BASENAME_FILE_TO_IMPORT$PLUS.md"
}

function addImportsToMD() {
  
  local NAME="$1"
  local PLUS="$2"

  debug "Importing files...             ../export/$NAME-import$PLUS.md"
  echo -n > "../export/$NAME-import$PLUS.md"

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [ "${line:0:7}" == "@import" ]; then
      addImportToMD "$NAME" "${line:7}" "$PLUS"
    else
      echo "$line" >> "../export/$NAME-import$PLUS.md"
    fi
  done < "../export/$NAME$PLUS.md"

  debug "- - - - - - - - - - - - - - - -"
}

function generatePlusAndNormalMD() {
  
  local INPUT="$1"
  local OUTPUT="$2"

  debug "Generating file...             ../export/$OUTPUT.md"
  echo -n > "../export/$2.md"

  if [ "$GENERATE_PLUS_VERSION" == "yes" ]; then
    debug "Generating file...             ../export/$OUTPUT-plus.md"
    echo -n > "../export/$OUTPUT-plus.md"
  fi

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [ "${line:0:5}" == "@plus" ]; then
      if [ "$GENERATE_PLUS_VERSION" == "yes" ]; then
        echo "${line:6}" >>  "../export/$OUTPUT-plus.md"
      fi
    else
      echo "$line" >>  "../export/$OUTPUT.md"
      if [ "$GENERATE_PLUS_VERSION" == "yes" ]; then
        echo "$line" >>  "../export/$OUTPUT-plus.md"
      fi
    fi
  done < "$INPUT"

  debug "- - - - - - - - - - - - - - - -"
}

function exportMdFile() {
    
  local NAME="$1"

  if [ "$NUMBER_OFFSET" == "yes" ]; then
    info "Current number offset...       ..$CURRENT_NUMBER_OFFSET"
  fi

  generatePlusAndNormalMD "$NAME.md" "$NAME"
  if [ "$GENERATE_PLUS_VERSION" == "yes" ]; then
    addImportsToMD "$NAME" "-plus"
    exportMdToSlides "$NAME" "-plus"
    exportMdToBook "$NAME" "-plus"
  fi
  addImportsToMD "$NAME"
  exportMdToSlides "$NAME"
  exportMdToBook "$NAME"
  
  if [ "$REMOVE_GENERATE_MD_FILES" == "yes" ]; then
    debug "Removing generated md files... ../export/*.md"
    rm ../export/*.md
  fi

  if [ "$NUMBER_OFFSET" == "yes" ]; then
    CURRENT_NUMBER_OFFSET=$((CURRENT_NUMBER_OFFSET+1))
  fi
}

function processFolder() {

  FOLDER=${1%/}

  info "==============================="
  info "Processing folder...           ../$FOLDER"

  downloadTemplates "$FOLDER"

  if [ -e "$FOLDER/build.properties" ]; then
    info "Overwriting properties...      ../build.properties"
    # shellcheck source=/dev/null
    source "$FOLDER/build.properties"
  else
    info "Overwriting properties...      no"
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

  info "Generation mode...             $GENERATION_MODE"

  cd "$FOLDER/md"

  for FILE in *.md; do

    FILE_WITHOUT_EXTENSION=${FILE%.*}

    if [ -e "$FILE_WITHOUT_EXTENSION.md" ]; then
      info "-------------------------------"
      exportMdFile "$FILE_WITHOUT_EXTENSION"
    fi
  done

  if [ "$LOG_LEVEL" -ge "$VERBOSE" ]; then
    cd ../..
  else
    cd ../.. > /dev/null
  fi

  if [ "$ZIP_EXPORT_FOLDER" == "yes" ]; then
    info "-------------------------------"
    info "Ziping export folder...        ../export/$FOLDER.zip"
    cd "$FOLDER/export"
    
    if [ "$LOG_LEVEL" -ge "$VERBOSE" ]; then
      zip -r "$FOLDER.zip" .
      cd ../..
    else
      zip -r "$FOLDER.zip" . > /dev/null
      cd ../.. > /dev/null
    fi
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

  local FOLDER_NAME="$1"

  if [ "x$FOLDER_NAME" != "x" ]; then
    processFolder "$FOLDER_NAME"
  else
    processFolders
  fi
}

# shellcheck disable=SC1091
source ./build.properties

clear

ORIGIN=$(pwd)
info "$ORIGIN"

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
