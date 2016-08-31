#!/bin/bash

export PATH=/opt/logstash/bin:$PATH

/usr/local/bin/gosu gosu logstash logstash -f /etc/logstash/conf.d
