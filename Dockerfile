FROM jlesage/baseimage-gui:alpine-3.18-v4

ENV APP_NAME="Tartube"

RUN add-pkg \
    python3 \
    py3-pip \
    gtk+3.0-dev \
    py3-gobject3 \
    py3-cairo \
    git \
    ffmpeg \
    font-dejavu

RUN pip3 install --no-cache-dir \
    requests \
    feedparser \
    yt-dlp \
    PyGObject

RUN git clone https://github.com/axcore/tartube.git /opt/tartube

RUN echo '#!/bin/sh' > /startapp.sh && \
    echo 'cd /opt/tartube && python3 tartube/tartube' >> /startapp.sh && \
    chmod +x /startapp.sh

VOLUME ["/config"]
VOLUME ["/downloads"]
EXPOSE 7800 7900