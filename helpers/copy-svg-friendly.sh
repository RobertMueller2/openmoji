#!/bin/sh
IFS=$'\n\t'

# This script may be executed or sourced from any directory.
cd -- "$(dirname -- "${0}")"/..

echo "Copying svgs with friendly names"

IFS=,
cat data/openmoji.csv | tail -n +2 | 
    while read emoji hexcode group subgroups annotation rest ; do

        CURRENTEMOJI=color/svg/${hexcode}.svg

        if [ -f $CURRENTEMOJI ];then

            subgroups=$(echo $subgroups | sed s,-,/,g)
            targetdir="color-friendly/${group}"
            annotation=$(echo $annotation | sed 's,[ :],_,g')

            mkdir -p $targetdir 
            cp $CURRENTEMOJI $targetdir/$annotation.svg

        fi

    done 


