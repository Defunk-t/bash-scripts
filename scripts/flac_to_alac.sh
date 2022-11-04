#!/bin/bash

# Encode a .flac file for every .alac file found in the current working directory (recursive)
find . -type f -name '*.flac' -exec ffmpeg -i {} -y -vn -c:a alac -vcodec copy {}.m4a \;
