FROM tiangolo/nginx-rtmp

RUN apt update && apt upgrade -y

RUN apt install -y ffmpeg

COPY ./config/nginx.conf /etc/nginx/nginx.conf

COPY ./assets/index.html /tmp/html/index.html

COPY ./security/stream.key /tmp/html/stream.key

COPY ./security/key_info.txt /tmp/key_info.txt

COPY ./security/.htpasswd /etc/nginx/.htpasswd

COPY ./entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]