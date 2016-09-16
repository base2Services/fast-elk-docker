FROM debian

RUN apt-get update &&\
   apt-get install --no-install-recommends -y \
     curl \
     git \
     wget \
     unzip

RUN echo "install ruby" && \
    apt-get install -y ruby-full && \
    gem update --system  && \
    gem install bundler

RUN echo "install node" && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    npm install npm -g

RUN npm install -g elasticdump

RUN mkdir -p /opt/base2/bin

COPY backup /opt/base2/bin/backup

RUN apt-get clean -y  && \
   apt-get autoclean -y  && \
   apt-get autoremove -y  && \
   rm -rf /usr/share/locale/*  && \
   rm -rf /var/cache/debconf/*-old  && \
   rm -rf /var/lib/apt/lists/*  && \
   rm -rf /usr/share/doc/*

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7

RUN echo "install gosu"
RUN set -x \
	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true

COPY app/ /app
WORKDIR /app
RUN bundle install

ENV PORT 4568
EXPOSE 4568

ENTRYPOINT ["gosu"]
CMD ["1000:1000", "ruby", "app.rb"]
