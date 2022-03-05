FROM python:3.9.10-slim-buster AS build
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp
RUN apt -qq update && apt -qq install curl -y && \
    curl -sL https://deb.nodesource.com/setup_17.x | bash && \
    apt -qq install --no-install-recommends nodejs -y && \
    apt remove curl -y && \
    apt autoremove -y && \
    apt clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/*
FROM python:3.9.10-slim-buster
COPY --from=build /usr/bin/node /usr/bin/node
COPY . /BOT
WORKDIR /BOT
RUN apt -qq update && \
    apt -qq install --no-install-recommends git ffmpeg -y && \
    git clone https://github.com/devillD/video-stream-bot.git && \
    pip3 install --upgrade --no-cache-dir pip setuptools wheel && \
    pip3 install --no-cache-dir --upgrade -r requirements.txt && \
    apt autoremove -y && apt clean all && rm -rf /var/lib/apt/lists/* /tmp/*
CMD ["python3", "main.py"]
