FROM tiangolo/nginx-rtmp

RUN apt update && apt upgrade -y && apt install -y ffmpeg

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./assets/index.html /tmp/html/index.html

COPY ./security/stream.key /tmp/html/stream.key

COPY ./security/key_info.txt /tmp/key_info.txt

COPY ./security/.htpasswd /etc/nginx/.htpasswd

COPY ./content/BigBuckBunny_320x180.mp4 /tmp/content.mp4

COPY ./entrypoint.sh /tmp

ENTRYPOINT ["/tmp/entrypoint.sh"]