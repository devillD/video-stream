# Alpine Image
FROM ghcr.io/devilld/py-node
COPY . /app/
WORKDIR /app/
RUN apk add --no-cache git ffmpeg \
    && pip3 install --upgrade \
    pip setuptools wheel \
    && pip3 install --no-cache-dir \
    --upgrade -r requirements.txt \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /tmp/*
CMD ["python3", "main.py"]
