FROM ghcr.io/devilld/py-node
ENV DEBIAN_FRONTEND=noninteractive
COPY . /BOT/
WORKDIR /BOT
RUN apt -qq update && \
    apt -qq install --no-install-recommends git ffmpeg -y && \
#    pip3 install --upgrade --no-cache-dir pip setuptools wheel && \
    pip3 install --no-cache-dir -r requirements.txt && \
    apt remove curl -y && \
    apt autoremove -y && \
    apt clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/*
CMD ["python3", "main.py"]
