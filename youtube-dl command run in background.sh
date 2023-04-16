#!/bin/bash


# Youtube playlist

nohup youtube-dl -q --no-warnings -f bestvideo+bestaudio --cookies "/mnt/cloud/ALMACEN WIN/cursos/udemy/youtube.com_cookies.txt" -o "/mnt/cloud/ALMACEN WIN/cursos/YouTube/%(playlist_title)s/%(playlist_index)s-%(title)s.%(ext)s" PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU --min-sleep-interval 30 --max-sleep-interval 60 --playlist-start 132 > dl.log &