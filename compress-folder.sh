#!/bin/bash

#: Title :compress-folder.sh
#: Date : 2023-04-14 15:35:29 CST
#: Author : "Jorge Ricardo Escobar Carrasco" <jorge.ricardo.escobar@gmail.com>
#: Version : 1.0
#: Description : Compress all MKV video files inside a folder as MP4 video files using FFMPEG.
# Given a folder path, compress all MKV video files inside that folder as MP4 video files using FFMPEG.
# The script will create a new folder called "compressed" inside the given folder and put the compressed files there.
# The script will also create a log file inside the given folder.
# The script will also create a file called "compressed.txt" inside the given folder and put the names of the compressed files there.
# The script will also create a file called "not_compressed.txt" inside the given folder and put the names of the files that were not compressed there.
# The script will also create a file called "not_found.txt" inside the given folder and put the names of the files that were not found there.
# The script will also create a file called "not_video.txt" inside the given folder and put the names of the files that were not video files there.
#: Options : None

# Get the folder path from the argument. Considering folder paths can have spaces, we need to use "$1" instead of $1.
folder_path="$1"
echo "Folder path: $folder_path"

# Create the compressed folder.
mkdir -p "$folder_path/compressed"

# Create the log file.
touch "$folder_path/compressed.log"

# Create the compressed.txt file.
touch "$folder_path/compressed.txt"

# Create the not_compressed.txt file.
touch "$folder_path/not_compressed.txt"

# Create the not_found.txt file.
touch "$folder_path/not_found.txt"

# Create the not_video.txt file.
touch "$folder_path/not_video.txt"

# Get the list of MKV files in the given folder.
mkv_files=$(find "$folder_path" -type f -name "*.mkv")
echo "mkv_files: $mkv_files"

# Loop through the MKV files.
for mkv_file in "$mkv_files"; do
    echo "Processing $mkv_file"
    # Get the file name.
    file_name=$(basename "$mkv_file")

    # Get the file name without the extension.
    file_name_no_ext="${file_name%.*}"

    # Get the file path.
    file_path=$(dirname "$mkv_file")

    # Compress the MKV file as MP4.
    ffmpeg -i "$mkv_file" -c:v libx264 -crf 23 -preset slow -c:a copy "$folder_path/compressed/$file_name_no_ext.mp4" >> "$folder_path/compressed.log" 2>&1

    # Check if the file was compressed.
    if [ -f "$folder_path/compressed/$file_name_no_ext.mp4" ]; then
        # The file was compressed.
        echo "$file_name_no_ext.mp4" >> "$folder_path/compressed.txt"
    else
        # The file was not compressed.
        echo "$file_name_no_ext.mp4" >> "$folder_path/not_compressed.txt"
    fi
done
