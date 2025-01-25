#!/bin/bash
nginx
ffmpeg -re -i /tmp/content.mp4 -vcodec libx264 -vprofile baseline -g 30 -acodec aac -hls_key_info_file /tmp/key_info.txt -strict -2 -f flv rtmp://127.0.0.1/show/stream