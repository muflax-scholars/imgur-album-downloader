#!/bin/bash

for gallery in $*; do
  mkdir -p $gallery

  for ((i = 0; i <= 100; i++)); do
    echo "grabbing page $i..."

    wget -q "http://imgur.com/r/${gallery}/page/$i" -O - | grep 'class="post"' | cut -d\" -f2 | while read id
    do
      echo "downloading $id.jpg..."
      wget -q -c "http://i.imgur.com/$id.jpg" -P $gallery
    done
  done
done
