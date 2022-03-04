# DEV
FROM ghcr.io/devilld/py-node
COPY . /app/
WORKDIR /app/
RUN apt -qq update \
    && apt -qq install \
    --no-install-recommends \
    git ffmpeg -y \
    && pip3 install --upgrade \
    pip setuptools wheel \
    && pip3 install --no-cache-dir \
    --upgrade -r requirements.txt \
    && apt autoremove -y \
    && apt clean all \
    && rm -rf /var/lib/apt/lists/* /tmp/*
CMD ["python3", "main.py"]
