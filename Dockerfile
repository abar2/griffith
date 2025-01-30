FROM tiangolo/nginx-rtmp

RUN apt update && apt upgrade -y && apt install -y ffmpeg rclone

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./assets/index.html /tmp/html/index.html

COPY ./security/stream.key /tmp/html/stream.key

COPY ./security/key_info.txt /tmp/key_info.txt

COPY ./security/.htpasswd /etc/nginx/.htpasswd

COPY ./entrypoint.sh /tmp

COPY ./rclone.conf /root/.config/rclone/rclone.conf

RUN mkdir /mnt/media-9967c027

RUN rclone mount media-9967c027-crypt: /mnt/media-9967c027 --s3-no-check-bucket

ENTRYPOINT ["/tmp/entrypoint.sh"]