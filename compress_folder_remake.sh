#!/bin/bash
# NOTE : Quote it else use array to avoid problems #
FILES=("$1"/*.mkv) # "/path/to/*"
DIRNAME="$(dirname "${FILES[0]}")"
for file in "${FILES[@]}"
do
  echo "Processing: $file"
  # echo "DIRNAME ${DIRNAME}"
  # take action on each file. $file store current file name
  # ‘Dread/2021-11-09/*.mkv’
  nohup ffmpeg -hide_banner -loglevel error -i "${file}" -vcodec libx265 "${DIRNAME}/$(basename "${file}" .mkv).mp4" & > /dev/null 2>&1
  #ffmpeg -i "$file" -vcodec libx265 "${DIRNAME}/$(basename "$file" .mkv).mp4"

  #echo "Done "$(basename "$file" .mkv).mp4" file..."

  # cat "$f"
done
