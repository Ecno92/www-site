FROM ubuntu:xenial

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
    apt-get install -y python3 python3-pip libjpeg8-dev zlib1g-dev default-jre lftp && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/www-site
COPY requirements.txt /usr/src/www-site
WORKDIR /usr/src/www-site
RUN pip3 install --no-cache-dir -r requirements.txt
