#! /bin/bash

clear
ORIGIN=`pwd`
echo -e $ORIGIN

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

function buildSlides() {

  downloadLib hakimel reveal.js

  echo -e "Exporting...                   ../export/$1-slides$2.html"

  pandoc -w revealjs --template $ORIGIN/templates/slides-template$2.html --number-sections --email-obfuscation=none -o ../export/$1-slides$2.html $1.md

  sed -i s/h1\>/h2\>/g ../export/$1-slides$2.html
  sed -i s/\>\<h2/\>\<h1/g ../export/$1-slides$2.html
  sed -i s/\\/h2\>\</\\/h1\>\</g ../export/$1-slides$2.html
}


function buildSlidesPdf() {

  echo -e "Exporting...                   ../export/$1-slides$2.pdf"

  phantomjs ../lib/reveal.js-master/plugin/print-pdf/print-pdf.js "../export/$1-slides$2.html?print-pdf" ../export/$1-slides$2.pdf > /dev/null
}

function buildHtml() {

  echo -e "Exporting...                   ../export/$1.html"

  pandoc -w html5 --template $ORIGIN/templates/html-template.html --number-sections --email-obfuscation=none --toc --highlight-style=tango -o ../export/$1.html $1.md
}

function exportMdFile() {

  buildSlides $1
  buildSlidesPdf $1
  buildSlides $1 -alternative
  buildSlidesPdf $1 -alternative
  buildHtml $1
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

if [ "x$1" != "x" ]; then
  processFolder $1
else
  processFolders
fi
