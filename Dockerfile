FROM python:3.9.0-slim

LABEL app.name="platformio-docker" \
    app.version="1.0.0" \
    maintainer="Dinacel <admin@dinacel.com>"

RUN apt-get update -qq && \
    apt-get install -y -qq git

RUN pip install -U platformio && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio \
    pio platform install espressif8266

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
