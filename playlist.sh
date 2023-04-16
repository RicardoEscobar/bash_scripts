#!/bin/bash
playlist_id="$1"
playlist_start="$2"

youtube-dl -f bestvideo+bestaudio -q --no-warnings -o "%(playlist_title)s/%(playlist_index)s-%(title)s.%(ext)s" "$playlist_id" --playlist-start "$playlist_start" &