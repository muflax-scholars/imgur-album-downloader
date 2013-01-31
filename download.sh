#!/bin/bash

for ((i = 0; i <= 100; i++)); do
    echo "Grabbing page $i"

    wget -q "http://imgur.com/r/wallpapers/page/$i" -O - | \
    grep 'class="post"' | cut -d\" -f2 | while read id
    do
        echo "Downloading $id.jpg"
        wget -q -c "http://i.imgur.com/$id.jpg"
    done
done

echo "Done"
