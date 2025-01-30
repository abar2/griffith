#!/bin/bash
nginx
ffmpeg -re -i "/mnt/media-9967c027/${PLAY_FILE}" -c:v libx264 -crf 26 -preset medium -c:a aac -b:a 192k -f flv rtmp://127.0.0.1/show/stream