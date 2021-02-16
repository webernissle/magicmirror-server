#-------------------------------------------------------------------------------
#  Copyright 2021 Martin Weber Nisslé
#
#  Licensed under Apache License, Version 2.0 (the "License");
#-------------------------------------------------------------------------------
#
# @Description
# Dockerfile to run MM2 server
#
# docker build -t mm:latest .
# docker run -t -i --rm -p 8080:8080 --entrypoint /bin/bash --name mm mm
# docker run -d --rm -p 8080:8080 --name mm mm
# docker exec -t -i mm /bin/bash
# docker logs mm
# docker stop mm
# docker save -o ./mm.tar mm (export container image)
#-------------------------------------------------------------------------------
FROM node:lts-slim

RUN set -e; \
    apt update; \
    apt install -y gettext vim git; \
    rm -rf /var/lib/apt/lists/*

ARG branch=master

ENV NODE_ENV production
WORKDIR /opt/magic_mirror

RUN git clone --depth 1 -b ${branch} https://github.com/MichMich/MagicMirror.git .
RUN cp -R modules /opt/default_modules
RUN cp -R config /opt/default_config
RUN npm install --unsafe-perm --silent

COPY mm-docker-config.js ./
COPY calendar /root
RUN cp mm-docker-config.js config/config.js

# Install all modules (multi page with multiple info pannels)
RUN cd modules && git clone https://github.com/KirAsh4/calendar_monthly
RUN cd modules/calendar_monthly/css && cp -R /root/* .
RUN cd modules && git clone https://github.com/edward-shen/MMM-pages.git
RUN cd modules && git clone https://github.com/edward-shen/MMM-page-indicator.git
RUN cd modules && git clone https://github.com/NolanKingdon/MMM-MoonPhase && \
    cd MMM-MoonPhase && \
    npm install
RUN cd modules && git clone https://github.com/CFenner/MagicMirror-Netatmo-Module.git netatmo
RUN cd modules && git clone https://github.com/thess/MMM-MktIndex && \
    cd MMM-MktIndex && \
    npm install
RUN cd modules && git clone https://github.com/jalibu/MMM-Jast.git
RUN cd modules && git clone https://github.com/vanhoekd/MMM-SwissStationboard

EXPOSE 8080
ENTRYPOINT ["node"]
CMD ["serveronly"]