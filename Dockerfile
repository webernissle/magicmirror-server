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
# docker run -t -i --rm -p 8085:8080 --name mm mm
# docker run -d --rm -p 8080:8080 --name mm mm
# docker exec -t -i mm /bin/bash
# docker logs mm
# docker stop mm
#-------------------------------------------------------------------------------


FROM node:lts-slim

RUN set -e; \
    apt update; \
    apt install -y gettext; \
    rm -rf /var/lib/apt/lists/*

ARG branch=master

ENV NODE_ENV production
WORKDIR /opt/magic_mirror

RUN git clone --depth 1 -b ${branch} https://github.com/MichMich/MagicMirror.git .
RUN cp -R modules /opt/default_modules
RUN cp -R config /opt/default_config
RUN npm install --unsafe-perm --silent

COPY mm-docker-config.js docker-entrypoint.sh ./
RUN chmod +x ./docker-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["node", "serveronly"]