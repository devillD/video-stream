FROM ghcr.io/devilld/py-node
COPY . /home/unkusr/app/
WORKDIR /home/unkusr/app/
RUN sudo apt -qq update \
    && sudo apt -qq install \
    --no-install-recommends \
    git ffmpeg -y \
    && pip3 install --upgrade -U \
    pip setuptools wheel \
    && pip3 install --no-cache-dir \
    --upgrade -U -r requirements.txt \
    && sudo apt autoremove -y \
    && sudo apt clean all \
    && sudo rm -rf /var/lib/apt/lists/* /tmp/*
CMD ["python3", "main.py"]
