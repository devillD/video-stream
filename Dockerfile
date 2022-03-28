FROM ghcr.io/devilld/py-node
ENV DEBIAN_FRONTEND=noninteractive
COPY . /BOT/
WORKDIR /BOT
RUN apt -qq update && \
    apt -qq install --no-install-recommends git ffmpeg -y && \
    pip install --no-cache-dir -r requirements.txt && \
    apt remove curl -y && \
    apt autoremove -y && \
    apt clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/*
CMD ["python", "main.py"]
