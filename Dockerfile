FROM ghcr.io/devilld/py-node
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && \
    apt -qq install --no-install-recommends git ffmpeg -y && \
    git clone https://github.com/devillD/video-stream-bot.git && \
    mv video-stream-bot /BOT && \
    pip3 install --upgrade --no-cache-dir pip setuptools wheel && \
    pip3 install --no-cache-dir --upgrade -r /BOT/requirements.txt && \
    apt remove curl -y && \
    apt autoremove -y && \
    apt clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/*
WORKDIR /BOT
CMD ["python3", "main.py"]
