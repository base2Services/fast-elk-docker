FROM elasticsearch

RUN mkdir -p /data/elasticsearch
RUN chown elasticsearch: /data/elasticsearch
RUN curl https://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_linux_386.zip > /usr/src/consul-template_0.15.0_linux_386.zip
RUN cd /usr/src && unzip consul-template_0.15.0_linux_386.zip  && mv consul-template /usr/bin/consul-template

COPY docker-entrypoint.sh /new-entrypoint.sh
COPY elasticsearch.yml.template /usr/share/elasticsearch/config/elasticsearch.yml.template

ENV CLUSTER_NAME elk

#ENV ES_HEAP_SIZE
#ENV ES_HEAP_NEWSIZE
#ENV ES_DIRECT_SIZE
#ENV ES_JAVA_OPTS
#ENV ES_GC_LOG_FILE

CMD ["/new-entrypoint.sh"]
