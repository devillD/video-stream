FROM ghcr.io/devilld/py-node
RUN apk add --no-cache git ffmpeg \
    && pip install --upgrade \
    pip setuptools wheel \
    && git clone https://github.com/devillD/video-stream-bot.git \
    && mv video-stream-bot /BOT \
    && pip install --no-cache-dir \
    --upgrade -r /BOT/requirements.txt \
    && rm -rf /var/cache/apk/* /tmp/*
WORKDIR /BOT
CMD ["python", "main.py"]
