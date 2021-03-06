FROM debian

RUN apt-get update &&\
   apt-get install --no-install-recommends -y \
     curl \
     git \
     wget \
     unzip

RUN apt-get install -y ruby-full
RUN gem update --system
RUN gem install bundler

RUN apt-get clean -y  && \
   apt-get autoclean -y  && \
   apt-get autoremove -y  && \
   rm -rf /usr/share/locale/*  && \
   rm -rf /var/cache/debconf/*-old  && \
   rm -rf /var/lib/apt/lists/*  && \
   rm -rf /usr/share/doc/*

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
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

ENV PORT 4567
EXPOSE 4567

ENTRYPOINT ["gosu"]
CMD ["1000:1000", "ruby", "app.rb"]
