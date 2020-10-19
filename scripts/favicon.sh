#!/bin/bash

# Prerequisites:
#     sudo apt install icoutils optipng

cd "$(dirname "$(readlink -f "$0")")/../img"

# SVG to PNG
PNGLIST=''
for SIZE in 16 32 64
do
    convert -resize ${SIZE}x${SIZE} sh.png favicon-${SIZE}.png
    optipng -o7 favicon-${SIZE}.png
    PNGLIST="$PNGLIST favicon-${SIZE}.png"
done

# PNG to ICO
icotool -o favicon.ico -c $PNGLIST

# Various sized PNG
for SIZE in 48 57 72 114 120 144 152 256 400 512 640
do
    convert -resize ${SIZE}x${SIZE} sh.png favicon-${SIZE}.png
    optipng -o7 favicon-${SIZE}.png
done
