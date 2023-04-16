#!/bin/bash
file="$1"
dirname="$(dirname "${file}")" ;
out="${dirname}/$(basename "${file}" .mkv).mp4"

ffmpeg -hide_banner -loglevel error -i "${file}" -vcodec libx265 "${out}" &
