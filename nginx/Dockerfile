FROM nginx

COPY build.properties /build.properties
COPY default.conf /etc/nginx/conf.d/default.conf
COPY htpasswd.users /etc/nginx/htpasswd.users

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /usr/share/locale/* && \
  rm -rf /var/cache/debconf/*-old && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/share/doc/*
