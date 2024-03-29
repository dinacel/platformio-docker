FROM python:3.9.2-slim

LABEL app.name="platformio-docker" \
    app.version="1.0.1" \
    maintainer="Dinacel <admin@dinacel.com>"

RUN apt-get update -qq && \
    apt-get install -y -qq git

RUN python3 -m pip install --upgrade pip setuptools
RUN python3 -m pip install -U platformio

RUN mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio && \
    platformio platform install espressif8266

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
