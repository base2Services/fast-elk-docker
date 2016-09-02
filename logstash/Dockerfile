FROM logstash

COPY build.properties /build.properties

COPY conf.d /etc/logstash/conf.d
COPY docker-entrypoint.sh /new-entrypoint.sh

EXPOSE 5000 3515 3516 3519 3520 3521 3522 3523 5140

CMD ["/new-entrypoint.sh"]


RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /usr/share/locale/* && \
  rm -rf /var/cache/debconf/*-old && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/share/doc/*
