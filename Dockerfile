FROM node
MAINTAINER "S M Y ALTAMASH" "smy.altamash@gmail.com"
WORKDIR /home/enc
COPY . /home/enc
RUN npm install -g npm@latest
RUN npm -v
RUN apt update \
    && apt install -y --force-yes zip python2 make g++ \
    && apt install -y python-is-python2 \
    && npm i \
    && apt remove --purge -y --force-yes python make g++ \
    && apt-get autoremove -y  \
    && rm -rf /var/lib/apt/lists/*
EXPOSE 8013
CMD sh entrypoint.sh
