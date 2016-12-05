FROM elasticsearch:2

RUN mkdir -p /data/elasticsearch
RUN chown elasticsearch: /data/elasticsearch

COPY build.properties /build.properties

#BUG: consul-template not working on aws linux due to go issue with kernel - will be fixed later
#RUN curl https://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_linux_386.zip > /usr/src/consul-template_0.15.0_linux_386.zip
#RUN cd /usr/src && unzip consul-template_0.15.0_linux_386.zip  && mv consul-template /usr/bin/consul-template

RUN apt-get update && apt-get -y install gettext-base
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /usr/share/locale/* && \
  rm -rf /var/cache/debconf/*-old && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/share/doc/*

COPY docker-entrypoint.sh /new-entrypoint.sh
COPY elasticsearch.yml.template /usr/share/elasticsearch/config/elasticsearch.yml.template

ENV CLUSTER_NAME elk
ENV DISCOVERY_TYPE ec2
ENV AWS_REGION ap-southeast-2
ENV TAG_ROLE Role
ENV TAG_ROLE_NAME search
ENV MULTICAST_ENABLED false
ENV RECOVER_AFTER_NODES 1
ENV RECOVER_AFTER_TIME 2m
ENV EXPECTED_NODES 1

ENV ES_HEAP_SIZE 1g
#ENV ES_HEAP_NEWSIZE
#ENV ES_DIRECT_SIZE
#ENV ES_JAVA_OPTS
#ENV ES_GC_LOG_FILE

CMD ["/new-entrypoint.sh"]
