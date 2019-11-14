FROM shokohsc/alpine-s6:3.9

ENV WORKDIR "/var/www"

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk update && \
 apk add --no-cache \
	git \
	libressl2.7-libssl \
	logrotate \
	openssl \
    npm \
    nodejs && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
ADD root/ /

# ports and volumes
EXPOSE 3000
VOLUME /var/www

WORKDIR ${WORKDIR}
