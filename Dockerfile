FROM phusion/baseimage:latest

VOLUME /project

RUN add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y \
        git  \
        python-pip

RUN git clone --branch 2.4.1 --depth 1 https://github.com/esp8266/Arduino.git esp8266
WORKDIR /esp8266/tools
RUN python get.py

ENV PROJECT_DIR=/project \
    UPLOAD_PORT=/dev/ttyS0 \
    ESP_ROOT=/esp8266 \
    UPLOAD_RESET=nodemcu \
    VERBOSE=1

WORKDIR /project
CMD make