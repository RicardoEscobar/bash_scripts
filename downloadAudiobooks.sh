#!/bin/bash
#: Title :downloadAudiobooks
#: Date : 2021-07-15 14:25:19
#: Author : "Jorge Ricardo Escobar Carrasco" <jorge.ricardo.escobar@gmail.com>
#: Version : 1.0
#: Description : Download all videos as mp3 audio from a youtube channel.
#: Options : None
printf "%s\n" "Downloading YouTube Channel as mp3 audio"

youtube-dl -f "bestaudio/best" -ciw -o "/mnt/cloud/audiobooks/%(channel)s/%(title)s.%(ext)s" -v --extract-audio --audio-quality 0 --audio-format mp3 --min-sleep-interval 30 --max-sleep-interval 60 --playlist-start 1 $1