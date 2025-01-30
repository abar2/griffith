#!/bin/bash
nginx
ffmpeg -re -i /mnt/media-9967c027/${PLAY_FILE} -vcodec libx264 -b:v 4000k -vprofile baseline -g 30 -c:a aac -ac 6 -ab 384k -ar 48000 -hls_key_info_file /tmp/key_info.txt -f flv rtmp://127.0.0.1/show/stream