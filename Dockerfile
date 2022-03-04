FROM ghcr.io/devilld/py-node
RUN RUN apk add --no-cache --virtual .build-deps \
    gcc linux-headers make zlib-dev jpeg-dev \
    gnupg tar xz bluez-dev bzip2-dev dpkg-dev \
    dpkg expat-dev findutils gdbm-dev tcl-dev \
    libc-dev libffi-dev libnsl-dev libtirpc-dev \
    ncurses-dev openssl-dev sqlite-dev pax-utils \
    readline-dev tk tk-dev util-linux-dev xz-dev \
    && apk add --no-cache git ffmpeg \
    && pip install --upgrade \
    pip setuptools wheel \
    && git clone https://github.com/devillD/video-stream-bot.git \
    && mv video-stream-bot /BOT \
    && pip install --no-cache-dir \
    --upgrade -r /BOT/requirements.txt \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /tmp/*
WORKDIR /BOT
CMD ["python", "main.py"]
