FROM osgeo/gdal:ubuntu-small-latest

COPY docker-entrypoint.sh  /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENV WAIT_VERSION 2.9.0
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait
