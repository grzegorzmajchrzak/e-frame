#!/bin/bash
path_to_images="/home/pi/e-frame/img"
path_to_images_arch="/home/pi/e-frame/img-arch"
counter=`ls $path_to_images|wc -l`

if [ $counter -eq 0 ]; then
    mv $path_to_images_arch/* $path_to_images
fi


ls $path_to_images |shuf -n 1 |while read file; do
    fileName="$path_to_images/$file"
    echo $fileName
    /home/pi/e-frame/img.py "$fileName"
    mv "$fileName" "$path_to_images_arch"
done
