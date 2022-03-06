FROM debian:stable-slim

ARG UID=${UID:-1000}
ARG GID=${GID:-1000}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    nginx \
                    nginx-extras \
                    apache2-utils && \
                    rm -rf /var/lib/apt/lists

RUN usermod -u $UID www-data && groupmod -g $GID www-data

VOLUME /media
EXPOSE 7000

COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

CMD /entrypoint.sh && nginx -g "daemon off;"

# FROM alpine:latest

# ENV USERNAME=webdav \
#     PASSWORD=webdav

# ARG UID=${UID:-1000}
# ARG GID=${GID:-1000}

# RUN apk update
# RUN apk upgrade
# RUN apk add nginx apache2-utils

# # RUN usermod -u $UID www-daa
# # RUN groupmod -g $GID www-data

# EXPOSE 7070

# COPY webdav.conf /etc/nginx/conf.d/default.conf
# # RUN rm /etc/nginx/sites-enabled/*

# COPY entrypoint.sh /
# RUN chmod +x entrypoint.sh

# CMD /entrypoint.sh && nginx -g "daemon off;"
