#!/bin/bash
# NOTE : Quote it else use array to avoid problems #
FILES="$1/*.mkv" # "/path/to/*"
DIRNAME="$(dirname ${FILES})" ;
for file in "${FILES}"
do
  #echo "Processing $file file..."
  echo "DIRNAME ${DIRNAME}"
  # take action on each file. $f store current file name
  # ‘Dread/2021-11-09/*.mkv’
  ffmpeg -hide_banner -loglevel error -i "${file}" -vcodec libx265 "${DIRNAME}/$(basename ${file} .mkv).mp4" &
  #ffmpeg -i "$file" -vcodec libx265 "${DIRNAME}/$(basename "$file" .mkv).mp4"

  #echo "Done "$(basename "$file" .mkv).mp4" file..."

  # cat "$f"
done
