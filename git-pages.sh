#! /bin/bash

echo "*****************************"
echo "* PUSH CHANGES TO GIT PAGES *"
echo "*****************************"

FROM=`cd`
FOLDERTO=$GIT_PAGES_FOLDER
TO="$GIT_PAGES_FOLDER/markdownslides"

echo "TO_GIT_PAGES_FOLDER=$TO"

DATE=`date +"%Y.%m.%d-%H:%M"`
TO_OLD=$TO'-OLD-'$DATE

mv $TO $TO_OLD && \
cp -r $FROM $FOLDERTO && \
rm -rf $TO'/.git' && \
cp -r $TO_OLD'/.git' $TO && \
cd $TO && \

git diff | grep +++

read -p "You want to continue? [y|*N*]: " OPTION

if [ "$OPTION" == "y" ]; then

  read -p "Write the commit message: " MESSAGE

  git add . && \
  git commit -m "$MESSAGE" && \
  git push origin gh-pages && \
  rm -rf $TO_OLD

else

  rm -rf $TO && \
  mv $TO_OLD $TO

fi

cd -
