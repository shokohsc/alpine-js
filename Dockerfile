ARG FROM_TAG='latest'
FROM shokohsc/alpine-s6:${FROM_TAG:-latest}

ENV WORKDIR "/app"

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk update && \
 apk add --no-cache \
    git \
    logrotate \
    npm \
    yarn \
    nodejs && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
ADD root/ /

# ports and volumes
EXPOSE 3000
VOLUME /app

WORKDIR ${WORKDIR}
