#!/bin/bash

if [ $# -ne 2 ]; then
    echo "usage: select_horizontal_images.sh <folder_with_images> <output_folder>"
    exit 1
fi


if [ ! -d $1 ]; then
    echo "directory $1 does not exist"
    exit 1
fi

DIRECTORY_FROM=$1
DIRECTORY_TO=$2

if [ ! -d $DIRECTORY_TO ]; then
    mkdir $DIRECTORY_TO
fi

FILES=`find $DIRECTORY_FROM -type f -iname '*.jpg'`

for FILE in $FILES 
do
    DETAILS=`identify -format '%w %h %[EXIF:Orientation]' $FILE`
    WIDTH=`echo $DETAILS|cut -d' ' -f1`
    HEIGHT=`echo $DETAILS|cut -d' ' -f2`
    ORIENTATION=`echo $DETAILS|cut -d' ' -f3`
    
    if [ $ORIENTATION -eq 1 ] && [ $WIDTH -gt $HEIGHT ] && [ $WIDTH -gt 900 ]; then
        echo copy $FILE
        cp $FILE $DIRECTORY_TO/
    fi
done


