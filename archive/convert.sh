#!/bin/bash

# convert all ts files to mkv
for file in *.ts;
 do ffmpeg -i "$file" -map 0 -c copy "${file%.*}.mkv" && \
	rm "$file";
done
